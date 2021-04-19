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
 
**What is the probability of presence given the location?**

$$
\mathbb{P}\left(\text{at }x, t\right) = 
\Delta x u(x, t)
$$

So that is the tiny integral on that little interval... So we need to take the limit as $\Delta t, \Delta x$ approaches $0$. In that case, the motion of the sailor will be continuous, and we will have PDF instead of CDF. 

---
### **Solving this**

**Important Notes**

> We will be avoiding the technique we introduced last time because it has a lot of mathematical subtleties to it, and we skipped those in the example, here we will be focusing on another way, a better way of solving PDEs on the fininite domain. **This new technique exposes some of the underlying assumptions for [[Solving PDE in Infinite Domain]]

Let's define solution under the fourier space like: 

$$
\hat{u} = \mathcal{F}[u](w, t) = \int_{-\infty}^{\infty} 
    u(x, t)\exp\left(
        iwx
    \right)
dx
\tag{4}
$$

There is no reason to believe that we can do this at all, because we can assert that the fourier foruier transform of the function is going to be converging to something.

However, using similar reasoning frothe last time we have: 

$$
\mathcal{F}[\partial_t u](w, t) = \partial_t[\hat{u}](w, t)
\tag{5}
$$

And if we were to apply the forier transform on $u(x, t)$, then we will have to use integration by parts, and that will give us some results like this: 

$$
\mathcal{F}[\partial_{x}^2[u]](w, t) = (iw)^2\hat{u}
$$

#### **Exposing Underlying Assumptions**

From (4) we know that function $u$ can be fourier transformed on the infinite domain, and hence it will be aboslutely integrable on all real, (very stric, and there are looser assumptions to be made here). 

Now, let's take a loot at what expression (5) is going to imply for the solution we get for the PDE, by taking the fourier Transform of the second spatial derivative: 





