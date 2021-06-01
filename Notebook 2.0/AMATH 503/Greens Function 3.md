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

$$
\begin{cases}
    (\partial_t^2 - c^2 \partial_x^2)G = 0 & 
    \\
    G = ?, \quad \partial_t[G] = ? & 
\end{cases}
\tag{5}
$$

Take the integral on the DE satisfied by $G$ over $(\tau_, \tau_+)$. 

$$
\begin{aligned}
    \int_{\tau_-}^{\tau_+} 
        \partial_t^2 [G]
    dt - 
    c^2\partial_x^2\int_{\tau_-}^{\tau_+} dt
    & = 
    \int_{\tau_-}^{\tau_+} 
        \delta(x - \xi)\delta(t - \tau)
    dt 
    \\
    \left.\partial_t[G](t)\right|_{\tau_-}^{\tau_+}d
    - c^2\partial_x^2\int_{\tau_-}^{\tau_+} dt 
    &= \delta(x - \xi)
\end{aligned}
$$

Take notice that, at $\tau_-$, $G$ is zero, so we are really evaluating on $\tau_+$. 

What is $G$ at the point $\tau_+$? 

**Consider:** 

Is it a function that has discontinuity which makes it's derivative shoots to infinity? Like a delta function. 

Then $G$ has a singularity, and it's derivative is going to be giving us weirder singularity and it's not a delta function anymore, taking another derivative will give many more singularitys at the point of discontinuity[^1]

The differential equation has a delta function on the right hand side. **So, the function $G$ is "likely" to be a function that is smoothly decaying after the point $t = \tau$. In the time domain.**

Let's assume that this is true, then the integral of $G$ over $(\tau_-, \tau_+)$ is going to be zero. Because we are integrating on a function that is continuous on the domain, and the integrl bounds are shrinking. 

Then: 

$$
\partial_t[G](\tau_+) = \delta(x - \xi)
\tag{6}
$$

Boom! One of the initial conditions for (5) is sorted out! 

Let's consider the case when $G$ having a jump at $t = \tau$ and then smoothly decays. Then $\partial_t[G]$ is going to be a delta function. Then it means $\partial_t^2[G]$ is going to be having more singularity than delta function. Therefore, $G$ can't have a jump discontinuity. This means that $G$ has to be zero at $t = \tau$. So let's just assume that $G = 0$ at $t = \tau$. 

We have completed the boundary conditions using some really bad reasoning from the lectures so then we have: 

$$
\begin{cases}
    (\partial_t^2 - c^2 \partial_x^2)G = 0 & 
    \\
    G = 0, \partial_t[G] = \delta(x - \xi) & 
\end{cases}
\tag{7}
$$

This is just a wave equation. And we are going to solve using the D'Alembert method. 

---
### **D'Alembert's Method**






[^1]: Prof and the text book gives this explanation, but the behaviors are just too pathological, so we have to assume continuous function after that point $\tau$. But how the heck people can have multiple singularities at one point??? 
