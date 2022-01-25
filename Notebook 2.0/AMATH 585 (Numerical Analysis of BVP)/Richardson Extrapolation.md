[wiki link](https://en.wikipedia.org/wiki/Richardson_extrapolation)

[[Finite Difference]]

---
### **Intro**

It's used for sequence accelerations, where we have information for the power series for the sequence, here we use for deriving finite difference formulas for derivatives. 

The goal is to accelerate the sequence: $A(h)$, where $\lim_{h\rightarrow 0}A(h) = 0$, and $A(h)$ commits a power series representation. We will use a linear combinations of $A(h_i)$ evaluated at some points to accelerate the convergence of the power series. 

### **General Formula**

Suppose that the exact function $A^{+}$ is approximated by a function $A(h)$. 
