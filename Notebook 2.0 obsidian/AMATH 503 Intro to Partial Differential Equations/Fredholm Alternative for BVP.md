- [Adjoint BVPs Systems](Adjoint%20BVPs%20Systems.md)
- [Fredholm Alternative](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Fredholm%20Alternative.md)


---
### **Intro**

Given a inhomogeneous second order ODE , and it's adjoin operator, it's possible to tell whether there exists a solution for the RHS. We direct more involved examples to the textbook for the readers. 

**Reference**: 

11.4 of "Fundamentals of Differential Equations and Boundary Value Problems"


---
### **The Fredholm Alternative for BVP**

> Let $B[y] = 0, L[y] = h$ denote the BVP problem, let $L^*[y] = 0, B^*[y] = 0$ denotes the dual problem. Then there is a solution to the primal problem if and only if for all solution $z$ of the dual problem, we have $\langle h, z\rangle = 0$, where $\langle \cdot, \cdot\rangle$ denotes the functional inner products over $[a, b]$. 

**Observations**

Ignoring the potential complications of the boundary conditions, we want $h\in \text{rng}(L)$, which using linear algebra term it would mean $h\perp \text{null}(L^*)$, which is exactly fredholm alternatives for real matrices. 

