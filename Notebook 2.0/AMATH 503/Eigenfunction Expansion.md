[[Sturm Liouville Theory]] is needed for this. 

This is a method that is for solving non homogeneous PDEs, in a finite domain. 

---
### **Intro**

Here is an example of a non-homogeneous PDE: 

$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = \sin(3\pi x)
$$

BC, IC: 

$$
u(0, t) = u(1, t) = 0 \quad u(x, 0) = \sin(\pi x)
$$

Under the domain: $x \in[0, 1]$

Take not, this thing even works when the non-homogeneous part is depending in time. 

Steps: 
1. Find the eigenfunctions for the homogeneous solution for the Homogeneous version of the PDE. 
2. 