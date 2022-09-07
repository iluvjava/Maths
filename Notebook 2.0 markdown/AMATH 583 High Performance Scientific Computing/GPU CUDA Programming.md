[GPU](GPU.md)
We need some basics from introduction of GPU computing. 

Relevant Resources: 

* Lecture notes on CUDA, Thrust and GPU architecture: [here](https://amath583.github.io/sp21/_static/pdf/L15.pdf)

* Vector summation, reduction using cuda: [here](https://developer.download.nvidia.com/assets/cuda/files/reduction.pdf) 

* Basic vector addition using thrad blocks and stencils operations on 1D array with CUDA:  [here](https://www.nvidia.com/docs/IO/116711/sc11-cuda-c-basics.pdf)

* Cuda Execution model, thread and memory hierachy from invidia: [here](https://developer.nvidia.com/blog/cuda-refresher-cuda-programming-model/) for more info. 

* A repo full of non-trivial CUDA programming examples [here](https://github.com/zchee/cuda-sample).


---
### **Intro**

Here, assuming that we know what GPU is and the high level process of launching a kernel. We will start writing the CUDA kernel. 

**Kernel**: it refers to the same computations completed by threads in GPU. This is usually a function compiled for the CUDA device. 

**Block**: It's a way of collecting threads. A block of threads are indexed by 3D indicies, and the shape of the block is declared for the kernel in advance of launching the kernel. 

* ThreadID for each thread in the block is accessed via `threadIdx.x`, `threadIdy.y` and `threadIdz.z`. 
* Each of the thread shares memory with threads within the same block. 
* Each block of threads are executed by SM(Stream multi-processor). It's the granularized execution unit, I will quote what invidia said in [invidia Cuda Programming Guide](http://developer.download.nvidia.com/compute/cuda/3_1/toolkit/docs/NVIDIA_CUDA_C_ProgrammingGuide_3.1.pdf): 

> The CUDA architecture is built around a scalable array of multithreaded Streaming Multiprocessors (SMs). When a CUDA program on the host CPU invokes a kernel grid, the blocks of the grid are enumerated and distributed to multiprocessors with available execution capacity. The threads of a thread block execute concurrently on one multiprocessor, and multiple thread blocks can execute concurrently on one multiprocessor. As thread blocks terminate, new blocks are launched on the vacated multiprocessors.

And check this [wiki](https://www.wikiwand.com/en/Thread_block_(CUDA_programming)) for more info about what a thread block is in CUDA programming. 

* A block is a 3D structure, hence, it has 3 dimension which can be accessed by the variable `blockDim.x, blockDim.y, BlockDim.z`
* And the shape of the grid can be gotten by: `gridDim.x, gridDim.y, gridDim.z`. 



**Grid**

A collection of blocks, where each blocks are indexed by 3D indices. 

* Under the context of the CUDA Kernel launch, the position of a particular block in the grid can be gotten by: `blockid.x, blockid.y, blockid.z`. 

---
### **CUDA Kernel** 

```cpp
dim3 block_dim(128,1,1);
dim3 grid_dim(10,1,1);
kernel<<<grid_dim,block_dim>>>(...);
```

This is a CUDA Kernel. 

For each kernel, there is one grid inside of the kernel. 

One grid is a 3D block. In this caes, it's a $128 \times 1 \times 1$ grid. 

And each element in the grid is a block, and the block has a dimension of $10 \times 1\times 1$. 

And each element in the block is a thread. 

Under the context of the kernel, to access information about the threads, the following variables are useful. 


---
### **Vector Addition Kernel**




---
### **Vector Summation Kernel**

Here we consider computing the L2 norm of a vector. 

**Approach 1: Grid Blocks Sum**

Here is the step: 
1. Thread in each block sum across different grids
2. Thread 0 in each block sum across the block for all blocks 
3. Get the result and sum across the results with GPU. 

```cpp
__global__
void dot0(int n, float* a, float* x, float* y) {

  extern __shared__ float sdata[]; 
  // share sdata cross all threads in this block, same size as the block size. 
  int tid    = threadIdx.x; 

  // offset by number of blocks that comes before current thread 
  int index  = blockIdx.x * blockDim.x + threadIdx.x; 
  
  // offset by all the threads in different bocks (a grid)
  int stride = blockDim.x * gridDim.x; 


  sdata[tid] = 0.0;
  // for this thread in this block across all grid
  // sum it up. 
  for (int i = index; i < n; i += stride)
    sdata[tid] += x[i] * y[i];
  // synch all threads in this block. 
  __syncthreads();

  // if this thread is the first block in this thread 
  if (tid == 0) {
    // prepare answer using block id 
    a[blockIdx.x] = 0.0; 
    // sum across the sdata, which contain the sum from each thread 
    // in the block acrosses different grids. 
    for (int i = 0; i < blockDim.x; ++i) {
      a[blockIdx.x] += sdata[i];
    }
  }
}
```

Summary: 

1. Share Memory across block
2. All threads in each blocks sums across the grid
3. Sync 
4. Assign head thread for each block (the first one)
5. Sum across each block to produce an array that has the same number of elements as the number of blocks used. 

**Some Key Things Here**




**PARAM Reduction:**

Steps: 
1. Stride across different grids
2. Sum across all blocks with $O(\log(n))$
3. Transfer results from each block to the vector: `a`

```cpp
__global__
void dot0(int n, float* a, float* x, float* y) {
  extern __shared__ float sdata[];

  int tid    = threadIdx.x;
  int index  = blockIdx.x * blockDim.x + threadIdx.x;
  int stride = blockDim.x * gridDim.x;

  // Sum across different grids, for each threads in each block 
  sdata[tid] = 0.0;
  for (int i = index; i < n; i += stride)
    sdata[tid] += x[i] * y[i];

  // Sync
  __syncthreads();
  
  // REduction on the same block
  for (size_t s = 1; s < blockDim.x; s *= 2) {
    if (tid % (2*s) == 0) {
      sdata[tid] += sdata[tid + s];
    }
    __syncthreads();
  }

  if (tid == 0) {
    a[blockIdx.x] = sdata[0];
  }
}
```

Note: Whenever threads of the same block is working on the same thing, we will need to sync them.

Let's take a look at the reduction block: 

* `s`: This partition the block in to chunks of 2, 4, 8... 
* `tid%(2*s) == 0`: 
  * (0, 2, 4...) + 1
  * (0, 4, 8...) + 2
  * (0, 8, 16 ...) + 4

Given a block size of 1024, the reduction can be completed in 10 steps, instead of 1024 compare to the previous case. 

Let's summarize the procedure: 

* Prepare a local block storage array `sdata`.
* Reduction across different grid into `sdata`.
* Sync threads.
* Reduction within the same block. 
* Sync threads. 
* Transfer `sdata` into `a`. 


**Problems**: 

* The modulo is slow 
* The if statement is branching divergence. 

For the following, I will be using simply vector sum instead of L2-Norm computation. 

And because this is from the lecture notes, it doesn't have grid reduction anymore. 


```cpp
__global__ void reduce0(int *g_idata, int *g_odata) 
{
    // Migrate data 
    extern __shared__ int sdata[];
    size_t tid = threadIdx.x;
    size_t i = blockIdx.x*blockDim.x + threadIdx.x;
    // Add code here if we want to do 2 norm
    sdata[tid] = g_idata[i]; 
    __syncthreads();

    // Reduction across the block
    for (size_t s = 1; s < blockDim.x; s *= 2) 
    {
        size_t index = 2 * s * tid;
        if (index < blockDim.x) 
        {
            // in block striding, memory bank confict
            sdata[index] += sdata[index + s]; 
        }
        __syncthreads();
    }

    if (tid == 0)
        g_odata[blockIdx.x] = sdata[0];
}
```

Let's keep track of the variables: 
* `s: ` 1, 2, 4, 8... 
  * `index: ` `2*tid`
  * `4*tid`
  * `8*tid`
  * ...

So the reduction will be like: 

```cpp
sdata[2*tid] += sdata[2*tid + 1]
sdata[4*tid] += sdata[4*tid + 2]
sdata[8*tid] += sdata[8*tid + 4]
... 
```

Like that. 

It does the same thing differently, it dialates the `tid` instead checking it using modulo. 

Which is pretty smart.

Question: 

What is a memory bank conflict??? 

Answer

See Stackoverflow here: [here](https://stackoverflow.com/questions/3841877/what-is-a-bank-conflict-doing-cuda-opencl-programming)

The memory for a warp is divided into chunks. Striding across the bank results in serialized access. 

```cpp
__global__ void reduce0(int *g_idata, int *g_odata) 
{
    extern __shared__ int sdata[];

    size_t tid = threadIdx.x;
    size_t i   = blockIdx.x*blockDim.x + threadIdx.x;
    // Add stuff here if we want to make L2 norm for the algorithm 
    
    sdata[tid] = g_idata[i];
    __syncthreads();

    // Reduction loop here. 
    for (size_t s = blockDim.x/2; s > 0; s>>=1) 
    {
        // When this runs, half the threads are idle.
        if (tid < s) 
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0)
    g_odata[blockIdx.x] = sdata[0];
}
```

Here, `s` starts with a half of the block size and then it's shrinked in half each time. Let's see how things changes in this case: 

Let's denote `blockdDim.x` as `bd` for simplicity.  

* `s`: `bd/2`, `bd/4`, `bd/8`... 
  * all `tid < bd/2`
  * all `tid < bd/4`
  * (...)

And the reduction part is like: 

```cpp
sdata[tid] += sdata[tid + bd/2];
sdata[tid] += sdata[tid + bd/4]; 
...

```

So each time, the left half of the array sum up all the right half of the array while the array is shrinking by a half. 


Problem: 

On the first run, only half of the threads in this block are actively trying to sum up the right half. So it's half the speed compare to before. 


**The Final Version: First add During Global Load** 


```cpp
__global__ void reduce0(int *g_idata, int *g_odata) 
{
    extern __shared__ int sdata[];
    size_t tid = threadIdx.x;
    size_t i   = blockIdx.x*(blockDim.x*2) + threadIdx.x;
    // Sum the adjacent block.
    sdata[tid] = g_idata[i] + g_idata[i + blockDim.x];
    __syncthreads();

    for (size_t s = blockDim.x/2; s > 0; s>>=1) 
    {
        if (tid < s) 
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0)
        g_odata[blockIdx.x] = sdata[0];
}
```

In this version, we are still going to keep the half reduction scheme from the previous on in the forloop, but this time we will be speed up the data transfer from the global memory to the local. 

This is done by letting one block to chug in twice the width of data from the global storage from the local storage right before the start of the log reduction. 

The read speed from the global memory is slow, therefore, merging half of the sum together with transferring the local storage will speed things up tremendously. 

**The L2-Norm CUDA Kernel**

```cpp



```


---
### **Matrix Multiplication Kenel**

    

