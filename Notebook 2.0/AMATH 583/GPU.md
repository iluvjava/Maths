Using GPU for computations. 


---
### **Overview**

This is how we use GPU: 

1. We need to compile the code for GPU. 
2. Send the program across PCIE Bus. 
3. Send the data to the GPU. 
4. And the compute in the GPU.
5. Get the results back from the GPU. 

The tool we are using is: CUDA. 

---
### **SIMD Branches** 

GPU has multiple cores that works on the data with the same instruction. 

Consider the case of taking the absolute value of number. 

```cpp
f(x < 0){
	x = -x;
}
```

Then in this case a vector will be flushed to with an instruction. 

And each of the core will receive their own element. 

The cores that receives negative number will work on it by flipping the sign, the other cores the receive positive number will just skip the instruction. 

Let's consider another case of branching. 

```cpp
f(x < 0) 
{
	x = -x;
}else  
{
	x = 0;
}

```


There will be 2 passes on the vector, the first pass will test `x < 0` and then the core that got `x_i < 0`, it will make changes to it, the cores that didn't, will just pass `x_i` unchanged. 

This is then repeated with the `else` clause for the whole vector. 

The more Branches there are, the slower the SIMD operations on GPU will be. 

---
### **Warp**

It's a way of dividing the threads into groups 

All threads in the same warp must execute the same instruction. 

---
### **Grids and Blocks**

Thread is distributed by CUDA runtime. 

**Block:**

A user predefined group of 1 to 512 threads. 

**Grid**

Groups of one or more blocks. 

**A group will be created for each CUDA kernel function call.**

---
### **Threads IDs In Grid** 

In CUDA, there are magic variables that is globally available for each thread to evoke. 

Thread IDs are unique to a block. To get the unique global ID for a given thread inside a blocks of grid, it's: 

$$
\text{GlobalThreadID} = \text{BloackID} \times \text{BlockDim} + \text{ThreadID}
$$

---
### **Hetergeneous Computing**

Writing code on the GPU, and CPU. 

Transfer data between the GPU and the CPU. 

The code also get transferred from the CPU to the GPU.

The Host: The CPU. 

The Device/Accelerator: The GPU. 


---


