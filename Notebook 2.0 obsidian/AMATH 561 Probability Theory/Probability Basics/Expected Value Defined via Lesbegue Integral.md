- [Random Variables as Measurable Functions](Random%20Variables%20as%20Measurable%20Functions.md), 
- Here we introduce some fancy integral that can help use figure out the expected value of some random variable, and it's complementary to [[Expectations of Random Variables without Sigma Algebra]]. 

---
### **Intro**
The expected value is a mapping that maps a random variable (a function) to the interval $[0, 1]$. We define the probability spaces $(\Omega, \mathcal F, P)$, then

> $$
> \mathbb{E}\left[X\right] = \int_{\Omega}^{} 
>     X
> dP. 
> $$

In this file, we progressively improve the definitions of the Lesbegue integral by removing more and more assumptions about the function at hand. 

**Indicator Function**

An indicator function $\mathbf 1_A$, or $\mathbb I_A$ describes an event in $\mathcal F$, the sigma algebra. If the random variable happens to satisfy the conditions for the event $A$, then the value $\mathbb I_A$ takes the value of $1$, else it takes the value of $0$. 

**Explanation:**

For all possible value that the random variable can take, we want to integrate it along with the measure of this pre-image of the random variable, multiplying by the value took by the random variable. The above indictor functions are the simply type of functions with measurable pre-image. 

**References**: 
\<Rick Durrett: Probability Theory and Applications\>


---
### **Lebesgue Integral**

The Lesbegue integral of a measurable function $f:\Omega \mapsto\mathbb{R}$, defined on a measurable space $(\Omega, \mathcal{F})$, with respect to the measure $\mu: \mathcal{F}\mapsto \mathbb{R}_0^+$. Which looks like this: 

> $$
> \int_{\Omega}^{} f d\mu
> $$

And this is the integral. Which is much general than Riemann integral because it can be applied to any type of measurable space, with all different type of topologies, not just the Real Number Line. And for all Riemann integrable function that is proper, it's going to be Lesbegue integrable. 

----
### **Simple Functions**

$\phi$ is simple when $\phi(\omega) = \sum_{i = 1}^{n}a_i \mathbb{I}_{A_i}$, Where $A_i$ are disjoint sets such that $\mu_{A_i} \le \infty$. 

**Explnation:** 

A simple function is a function that can be described by a finite linear combination of indicator function where each of the indictor function is on $A_i$, and all $A_i$ is discrete. This can be viewed as assigning discrete value for each of the discrete domain for the function, partitioning the output of the function using the partitioned domain. If the random variable $X$ is discrete, then it can be modeled using a simple function. 

**Simple Function Lesbegue Integral**

> $$
> \int_{\Omega}^{} \phi d\mu = \sum_{i = 1}^{n}a_i \mu(A_i)
> $$

The discrete sum of all the measure on the partitioned domain for the function. 

---
### **Bounded Functions**

Choose any sent $E$ with $\mu(E)\le \infty$, and let $f$ be a bounded function that vanishes on $E^{C}$. 

**Explanation**:

This is a function that has a domain which has a finite measure, and outside such a domain, the function takes on the value $0$. 

Then we define: 

> $$
> \int_{\Omega}^{}f d\mu = 
> \sup_{\phi \le f} \int_{\Omega} \phi d\mu = \inf_{\psi \ge f} \int_{\Omega}^{} \psi d\mu
> $$

Where, $\phi$ are all are simple functions such that $\phi(a) \le f(a)$ for all $a\in A_i$, and $\psi \ge f(a) \forall a \in A_i$, in this sense, by partitioning the simple function with finer and finer $A_i$ on the domain, one can take the $\sup, \inf$ and get the Lesbegue Integral. 

---
### **Non-Negative Function**

Assume that $f \ge 0$ then let: 

> $$
> \int_{\Omega}^{} 
> f
> d\mu = 
> \sup\left\lbrace
>     \int_{\Omega}^{} 
>         h
>     d\mu
>     : 
>     0 \le h \le f, \text{h is bounded and } \mu(\{x: h(x)\ge 0\}) < \infty
> \right\rbrace
> $$
>
> The General Non-negative function is approximated by bounded function that are on a domain which has a finite measure. 

*Take notice that*, this is much general and the non-negative function is not necessarily bounded. 

---
### **General Function**

Assuming that function $f$ is integrable, then we mean that $\int_{\Omega}|f|d\mu \le \infty$. Let: 

$$
f^+(x) = \max(f(x), 0) \quad f^{-}(x) = \max(-f(x), 0)
$$

Where we separate the positive and negative part of the function. Then clearly: 

$$
f(x) = f^+(x) - f^-(x) \quad |f(x)| = f^{+}(x) + f^{-}(x)
$$

Then the integral can be defined as: 

> $$
> \int_{\Omega}^{} fd\mu = \int_{\Omega} f^+ d\mu  - \int_{\Omega}^{} f^{-}d\mu
> $$

Where, both $f^+, f^-$ will be non-negative function, and we already defined integral for non-negative functions. 


---
### **Back to Expected Value of Random Variable**

To compute the expected value of a random variable we would need to compute it using the Lebesgue Integral, and we would like to make a change of variable and bring it to the Borel Space instead of the originally defined $\sigma$-algebra.

$$
\begin{aligned}
    \int_{\Omega}^{}X dP &= 
    \int_{\omega\in \Omega}^{}X(\omega) P(d\omega) = \int_{-\infty}^{\infty} xP(X^{-1}(dx))
\end{aligned}
$$

Where the substitution we made is $X(\omega) = x$. And notice that: 

$$
\int_{-\infty}^{\infty} xP(X^{-1}(dx)) = \int_{-\infty}^{\infty} 
    xd(F_X(x))
    = 
    \int_{-\infty}^{\infty}xf_X(x) dx
$$

Because the probability measure on the pre-image of $dx$ translate to a tiny change of the CDF function, which then gets us to the PDF function, if it exists. 

And this is the expected value of the function, however, this is really only doable for nice function, if it's not that nice we need to re-think and use the Lebesgue Integral definition. 

---
### **Final Note**

Lebesgue Integral are pretty similar to Riemann
's Integral, the difference is just the way it's being integrated over any type of domains. They have the same properties. 

Now, All proofs about the details are skipped. They are in the textbook(Probabiliy: Theory and Examples, Rick Durrett) with detailed proofs and discussions. 