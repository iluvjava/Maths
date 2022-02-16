[[Finite Difference with Errors Term]]

---
### **Intro**

We introduct the basic concept of 2D finite different method using the example of an steady state solution for the non-homoegenous 2D poisson equation of the form: 

$$
\begin{cases}
    \Delta u = f & 
    \\
    u(x, y) = 0 & \forall (x, y) \in \text{Boundary}([0,1]\times[0, 1])
\end{cases}
$$

**Natural Ordering of 2D Grid Points**: 

> The natural ordering of the grid point in 2D for PDE is rowwise, going from the bottom of the grid to the top of the grid row by row.

For simplicity, we would assume that the grid points are $m\times m$, the same number of discritization of x,y direction give the grid point width $h$ for both the $x, y$ direction on the domain $[0, 1]\times[0, 1]$. 

The matrix is operating on the block vector of the form: 

$$
u = 
\begin{bmatrix}
    u^{[1]} \\ u^{[2]} \\ \vdots \\ u^{}
\end{bmatrix}
$$

