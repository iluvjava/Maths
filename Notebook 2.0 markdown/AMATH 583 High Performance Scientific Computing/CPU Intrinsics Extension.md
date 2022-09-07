Let's familiarize ourselves with some of the CPU extension intrinsic that are important for this class. 
[CPP Compiler Useful Flags](CPP%20Compiler%20Useful%20Flags.md)

---
### **Intro**

We will focus on CPU SIMD that speed up the computations of floating points in the context of scientific computing.


---
### **SIMID**

Single Instruction multiple data. 

A class of instructions for modern CPUs. It's the Single Instruction Multiple data scheme from the Flnny Taxonomy. 

It applies the same instructions to multiple pipelines of data. 

It's sequential and single core. 

Examples Instructions set: **AVX**, **SSE**. 

---
### **SSE**

Streaming SIMD Extension

It's the same as AVX which add all the data into the register of the CPU and then apply the same instruction on all of them. 

---
### **AVX**

It's just the newer version of SSE. 

Supports a larger register set. 
