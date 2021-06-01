Here we will continue from [[Greens Function 3]], with the wave equation as the example, but this case, we make the boundary conditions non-homogeneous too. 




---
### **Intro**

This is the PDE we are considering: 

$$
\begin{cases}
    (\partial_t^2 - c^2\partial_x^2)[u] = Q(x, t) & x \in \mathbb{R}, t \rightarrow 0
    \\
    u(x, 0) = f(x), \partial_t[u](x, 0)= g(x) & 
\end{cases}
$$

We make $u = v + w$, where $v$ satisfies $\partial_t^2[v] - c^2\partial_x^2[v] = 0$, $v(x, t) = f(x), \partial_t[v](x, 0) = g(x)$. 

And $w$ satisfies: $\partial_t^2[u] - c^2\partial_x^2[w] = Q(x,t)$ with $w(x, 0) = \partial_t[w](x, 0) = 0$

Basically one of the function takes care of the boundary conditions and the other one takes care of the non-homogeneous part. In this case, $v$ is the homogeous part that takes care of the boundary conditions and $w$ is the function that is taking care of the non-homogeneous part. 

It's not hard to verify that this solution format works in this case. We skipped that here. 

**Question**: 

Which one is easier to solve? $v$ or $w$? 

**Answer**: 

$v$ is easier becaue it's homogenous, and we can just use D'Alambert method in this case. And then for $w$, we are going to use the Green's function to solve it, decompse the $Q$ function into a collection $\delta$ over a region, and then we can reconstruct the non-homogeneous solution of the system. 

And from the last part, we have discovered that: 


