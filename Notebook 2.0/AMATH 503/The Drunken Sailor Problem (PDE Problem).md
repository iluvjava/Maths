Here, we will apply the Fourier Transform on solving a PDE problem, and this problem is derived in chapter 2 of the textbook. 

[[Solving PDE in Infinite Domain]]

---

### **Intro**

Here is the PDE formulation of the PDEs for the Drunken Sailor Problem: 

$$
\begin{cases}
    \partial_t u = \alpha^2\partial_x^2 u & x \in \mathbb{R} \quad t > 0
    \\
    \lim_{x\rightarrow \pm\infty} u = 0 & \forall t
    \\
    u(x, 0) = \delta (x)
\end{cases}
\tag{1}
$$

And the function $\delta(x)$ here is the Dirac Delta function. This is a pretty famous function here. And it's activated on $x = 0$. It has the property that: 

$$
\int_{-\infty}^{\infty}\delta(x)dx = 1 \quad 
\int_{\infty}^{\infty}\delta f(x)dx = F(0)
\tag{2}
$$

This function can be viewed as a limit of the square activation function. 

$$
\delta(x):=
\lim_{\epsilon \rightarrow 0}\begin{cases}
    \frac{1}{\epsilon} & x\in (\frac{\epsilon}{2}, \frac{\epsilon}{2})
    \\
    0 & \text{else}
\end{cases}
\tag{3}
$$

**Physical Scenario of the Drunken Sailor:** 

The sailor is drunken and he has equal probability of going to the right, or going to the left. In a continuous manner. 

**What does the function $u(x,t)$ represent?**

It represent the probability density of the location of the sailor. 

This is also called the: "Random Walk problem" and the delta function is literally modeling each of the partile in the heat conduction problem. 
