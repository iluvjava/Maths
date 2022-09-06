[[Characterizing Functions for Optimizations]]


---
### **Intro**

We discuss the steepest gradient descend applied to non-smooth but still convex functions. Potentially easy to implement sometimes, but convergence and requirements for oracles make it less desirable. 

Unfortunately, the method quires the following:
1. Convex Function 
2. Full access to a strong subgradient oracle
	1. Able to perform sub optimizations problems that could potentially be nontrivial. 

