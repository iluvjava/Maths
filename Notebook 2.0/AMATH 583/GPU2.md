[[GPU]]
We need some basics from introduction of GPU computing. 

Lecture notes on CUDA, Thrust and GPU: [here](https://amath583.github.io/sp21/_static/pdf/L15.pdf)

Similar stuff is also in invidia webniar: [here](https://developer.download.nvidia.com/assets/cuda/files/reduction.pdf)


---
### **Intro**

**Kernel**: it refers to the same computations completed by threads in GPU. This is usually a function compiled for the CUDA device. 

---
### **Partitioned Works with CUDA**

This is possible for adding 2 vector, because the task can be partitioned and the results are not accumulated. 


---
### **CUDA Accumulation**

Let's say we want to do 2-Norm computations on vectors. 

Computational Model: PRAM Sum 

This is how the computational graph looks like: 

![[Pram-Sum.png]]

Each time, we reduces the size of the array by a half, and the sum of the `[i]` th element is the sum from the element `[2*i]` and `[2*i + 1]`. 

One way achieving this is: 

```cpp
__global__ 

```

