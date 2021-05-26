[[GPU]]
We need some basics from introduction of GPU computing. 

Relavent Resources: 

* Lecture notes on CUDA, Thrust and GPU architecture: [here](https://amath583.github.io/sp21/_static/pdf/L15.pdf)

* Vector summation using cuda: [here](https://developer.download.nvidia.com/assets/cuda/files/reduction.pdf) 

* Basic vector addition using thrad blocks and stencils operations on 1D array with CUDA:  [here](https://www.nvidia.com/docs/IO/116711/sc11-cuda-c-basics.pdf)

* Cuda Execution model, thread and memory hierachy from invidia: [here](https://developer.nvidia.com/blog/cuda-refresher-cuda-programming-model/) for more info. 

* A repo full of non-trivial CUDA programming examples[here](https://github.com/zchee/cuda-sample).


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

---
### **Matrix Multiplication Kenel**

