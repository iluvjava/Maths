Lecture 15: 
Applying Green's Function Method to 1D non-homogeneous wave equation under the infinite domain. 


--- 
### **Intro**


Non Homogeneous 1D wave equation on $\mathbb{R}$, the PDE is: 

$$
\begin{cases}
    (\partial_t^2 + c^2\partial_x^2)[u](x) = Q(x, t) & x\in \mathbb{R}, t > 0
    \\
    u = 0, \partial_t[u] = 0 & t = 0
    \\
    \lim_{|x|\rightarrow \infty} u = 0 &
\end{cases}
$$

Notice that, we have Homogeneous initial conditions, but in the future, we will be looking at boundary conditions that is a function, instead of a constant. 

To start, let's define the Green's Function. 


---
### **Green's Function**
$$
\begin{cases}
    (\partial_t^2 + c^2\partial_x^2)[G](x) = \delta(x - \xi)\delta(t - \tau)& x\in \mathbb{R}, t > 0
    \\
    G = 0, \partial_t[G] = 0 & t = 0
    \\
    \lim_{|x|\rightarrow \infty} G = 0 &
\end{cases}
\tag{1}
$$

The delta function is representing the signal source at a point in time and space. $\tau, \xi$ are a scaler and a vector. $\tau > 0$. 

The reconstruction of the original solution using the Green's Function $u$ is given as: 

$$
\begin{aligned}
    u(x, t) &= \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            G(x, t, \xi, \tau)Q(\xi, \tau)
        d\xi
    d\tau 
    \\
    (\partial_t^2 - c^2\partial_x^2)[u](x, t) &= 
    (\partial_t^2 - c^2\partial_x^2)\left[
        \int_{0}^{\infty} 
            \int_{-\infty}^{\infty} 
                G(x, t, \xi, \tau)Q(\xi, \tau)
            d\xi
        d\tau
    \right]
    \\
    &= 
    \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            (\partial_t^2 - c^2\partial_x^2)
            [G(x, t, \xi, \tau)Q(\xi, \tau)]
        d\xi
    d\tau
    \\
    &= 
    \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            (\partial_t^2 - c^2\partial_x^2)
            [G](x, t, \xi, \tau)Q(\xi, \tau)
        d\xi
    d\tau
    \\
    &= 
    \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            \delta(x - \xi)\delta(t - \tau)Q(\xi, \tau)
        d\xi
    d\tau
    \\
    &= Q(x, t) 
\end{aligned}
\tag{2}
$$

* The differential operator can move in beacuse it's wrt to $x, t$, but the integral is wrt to $\xi, \tau$. 
* We use the property of the delta function on the last step to recover the RHS of the original PDE wrt $u$. 


---
### **Solving for G**

The PDE for G is expression (1). Ignoring the initial and the boundary conditions for this section. The approach we want to take is very similar to the heat equation. 

$$
(\partial_t^2 - c^2\partial_x^2)[G] = \delta(x - \xi)\delta(t - \tau)
\tag{3}
$$

**Consider the case when $t<\tau$:**

$$
\begin{aligned}
    (\partial_t^2 - c^2\partial_x^2)[G] &= 0    
\end{aligned}
\tag{4}
$$

Using initial conditions $G(x, 0, \xi, \tau) = 0$ and $\partial_t[G](x, 0, \xi, \tau) = 0$. This is telling us $G = 0$. There is nothing at the start before the point $t < \tau$. 


**Consider the case $t > \tau$**. 

We are way pass the point $t = 0$, we would need to create a new initial conditions at the point $t = \tau$, which is giving us a new PDE.



