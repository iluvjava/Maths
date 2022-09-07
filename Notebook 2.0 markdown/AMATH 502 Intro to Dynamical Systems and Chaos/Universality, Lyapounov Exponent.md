[Chaos](Chaos.md), [Periodic Orbit and Bifurcation, Logistic Map](Periodic%20Orbit%20and%20Bifurcation,%20Logistic%20Map.md)
1. Universality of the Feigenbaum constant
2. Use Lyapounov Exponent to predict Chaotic Behavior
	1. The lyaponouv exponent is the best indicator we have for this class as an indicator for chaos, it predicts the occurence for SDIC. 

The Lyaponouv exponent is one of the metrics that help use to determine whether a system has the potential for chaos dynamics. 

---
### **Last time**: 

When we have an unimodal map for the discrete system (In the case of the logistic map), and it has an unstable period 3 orbits, then we have chaos (On a compact set.)


The Bifurcation Ratio Constant: 

> $$ \delta = 4.6669 $$

This is called the **Feigenbaum Constant**. Let's assume that all of the values where periodic doubling happened can be ordered and align as a sequence like: $r_1 < r_2 < r_3< \cdots$, then, the Feigenbaum Constant can be described as: 

> $$
> \lim_{n\rightarrow \infty} \frac{r_{n + 2} - r_{n - 1}}{r_{n - 1} - r_n} = \frac{1}{4.6669}
> $$

Now, let's take a look at another chaos system that is similar to the Logistic Chaos: 

> $$ x_{n + 1} = r\sin(\pi x_n) $$

There are many such periodic doubling bifurcations, and the interesting things is that, this rate, the periodic doubling bifurcation will have this **Feigenbaum Constant**, for **Unimodal Map**. 

THis constant is considered to be a: **Unviersal Constant** and this is called: **Universality**. 

---
### **Lyapunov Exponent**

One trait of the chaotic system is sensitive dependence on initial condition (**SDIC**). 

We want to quantify the **SDIC**. How sensitive? 

Consider: 2 Initial Condition: $x_0, x_0 + \delta_0$, where $\delta_0$ is small. 

After one iteration, the distance between the orbits is: 

$$
|f(x_0 + \delta_0) - f(x_0)|
$$

2 Iterations: 

$$
|f^2(x_0 + \delta_0) - f^2(x_0)|
$$

After N iteration, we have: 
$$
|f^N(x_0 + \delta_0) - f^N(x_0)| \approx |\delta_0|\exp(\lambda N)
$$

Where, the $\approx$ is an assumption that we made, it's not a bad assumption, by thinking about the linearization near the fixed point. 

And it's not hard to see that the $\lambda$ is like: 

$$
\lambda  \approx 
\frac{1}{N} \ln |(f^N)'(x_0)|
$$

Now, we would need to take the derivative of the deep composite function, and, we can use the orbit information to simplify the nested function of derivative[^1], giving us: 

$$
\lambda \approx \frac{1}{N} \ln 
\left| 
\prod_{i = 0}^{N - 1} \left(
        f'(x_i)
    \right)
\right| = 
\frac{1}{N} \sum_{i=0}^{N - 1}\left(
        \ln |f'(x_i)|
    \right)
$$

Then, we consider the case that $N\rightarrow \infty$, then we have the limit: 

> $$
> \lambda = \lim_{N\rightarrow \infty} 
> \frac{1}{N}
> \sum_{i = 0}^{N - 1}\left(
>     \ln |f'(x_i)|
>     \right)
> $$

This is called the: "**Lyapunov Exponent**". 

Most of the time, we will need to estimate it with computers, when the differential are easy, we can find the Lyapunov Exponent analytically. 

And notice that, $\lambda$ depends on $x_0$, but $\lambda$ is the same on a periodic orbit, also it's the same in the basin of attraction of any F.P, or Periodic Orbit. 

When we are stable, the derivative at the orbit is going to be smaller than 1, which will give us $\ln(\le 1)$, which will give us the $\lambda < 0$, and if we have $\lambda > 0$, then this is an indicator for **chaos**. 

This is called: **SDIC**, Sensitive Dependent on Initial conditions. 

---
Foot Notes: 

[^1]: 2 periodic orbit stability is $[f(f(x_0))]' = f(f(x_0))f'(x_0) = f(x_1)f'(x_0)$. Similarly consider $[f(f^{n - 1}(x_0))]' = f^n(x_0)(f^{n-1})'(x_0) = f(x_{n - 1})(f^{n-1})'(x_0)$ which is inductive.