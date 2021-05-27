[[GPU]]
We need some basics from introduction of GPU computing. 

Relevant Resources: 

* Lecture notes on CUDA, Thrust and GPU architecture: [here](https://amath583.github.io/sp21/_static/pdf/L15.pdf)

* Vector summation using cuda: [here](https://developer.download.nvidia.com/assets/cuda/files/reduction.pdf) 

* Basic vector addition using thrad blocks and stencils operations on 1D array with CUDA:  [here](https://www.nvidia.com/docs/IO/116711/sc11-cuda-c-basics.pdf)

* Cuda Execution model, thread and memory hierachy from invidia: [here](https://developer.nvidia.com/blog/cuda-refresher-cuda-programming-model/) for more info. 

* A repo full of non-trivial CUDA programming examples [here](https://github.com/zchee/cuda-sample).


---
### **Intro**

**Kernel**: it refers to the same computations completed by threads in GPU. This is usually a function compiled for the CUDA device. 

**Block**: It's a way of collecting threads. A block of threads are indexed by 3D indcies, and the shape of the block is declared for the kernel in advance of launching the kernel. 

* ThreadID for each thread in the block is accessed via `threadIdx.x`, `threadIdy.y` and `threadIdz.z`. 
* Each of the thread shares memory with threads within the same block. 
* Each block of threads are executed by SM(Stream multi-processor). It's the granularized execution unit, I will quote what invidia said in [invidia Cuda Programming Guide](http://developer.download.nvidia.com/compute/cuda/3_1/toolkit/docs/NVIDIA_CUDA_C_ProgrammingGuide_3.1.pdf): 

> The CUDA architecture is built around a scalable array of multithreaded Streaming Multiprocessors (SMs). When a CUDA program on the host CPU invokes a kernel grid, the blocks of the grid are enumerated and distributed to multiprocessors with available execution capacity. The threads of a thread block execute concurrently on one multiprocessor, and multiple thread blocks can execute concurrently on one multiprocessor. As thread blocks terminate, new blocks are launched on the vacated multiprocessors.

And check this [wiki](https://www.wikiwand.com/en/Thread_block_(CUDA_programming)) for more info about what a thread block is in CUDA programming. 

**Grid**

A collection of blocks, where each blocks are indexed by 3D indices. 

---
### **Vector Addition Kernel**

---
### **Vector Summation Kenel**

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

**PARAM Reduction:**

```cpp
__global__
void dot0(int n, float* a, float* x, float* y) {
  extern __shared__ float sdata[];

  int tid    = threadIdx.x;
  int index  = blockIdx.x * blockDim.x + threadIdx.x;
  int stride = blockDim.x * gridDim.x;

  sdata[tid] = 0.0;
  for (int i = index; i < n; i += stride)
    sdata[tid] += x[i] * y[i];

  __syncthreads();

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



---
### **Matrix Multiplication Kenel**

    

