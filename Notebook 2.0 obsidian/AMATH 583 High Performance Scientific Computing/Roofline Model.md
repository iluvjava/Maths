This is a theoretical upper bounds for the GFlops/s on a given CPU. 

---
### **Intro**

There are 2 limiting factors for the performance of a CPU. And it depends on the algorithm intensity. 

Algorithm Numerical Intensity is measure as "Flops/Bytes". 

It's the ratio between computations and the amount of data needed to carry out the computations. 

2 Limiting Factor: 

1. The limit of GFlops/s on the CPU. Depends on instructions per cycles, and the instruction set on the data. 
2. The storage medium of the data, is it in L1, L2, L3, or Memory, or Hardrive? 


The formula is given by: 

$$
\text{Performance} = \min \left(
    \text{CPU Peak}, 
    \text{Bandwidth \times Numerical Intensity}
\right)
$$

So, increasing the numerical intensity will speed up the algorithm because of the memory bandwidth will increase as compiler optimization becomes available and all the data are stored in the CPU cache. 

The other way out of it is to just, decrease the numerical intensity by increasing the memory locality of the algorithm, at a low level. 

**Usually, the numerical intensity of the algorithm cannot be changed easily.**

**The dark Magic**: 

* Better memory locality at an algorithmic level.

* Use Compiler optimization.
  
* Use SIMDs from C++ intrinsic if compiler is too stupid to optimize the speed for it. 
  
* Bruh please don't buffer things in the memory when dealing with numerical intense part of the algorithm. 


