[Random Variables](Random%20Variables.md)
Here we introduce some fancy integral that can help use figure out the expected value of some random variable. 

---
### **Intro**

Firstly, we assume that we already know something basic about Lebesgue Integral. 

The Expected value of a random variable has the following definition: 

> $$
> \mathbb{E}\left[X\right] = \int_{\Omega}^{} 
>     X
> dP
> $$

**Explanation:**
For all possible value of the pre-images, we want to integral it along with the measure of this pre-image of the random variable, multiplying by the value took by the random variable. 


---
### **Lesbesgue Integral**

The Lebesgue integral of a measurable function $f:\Omega \mapsto\mathbb{R}$, defined on a measurable space $(\Omega, \mathcal{F})$, with respect to the measure $\mu: \mathcal{F}\mapsto \mathbb{R}_0^+$. Which looks like this: 

> $$
> \int_{\Omega}^{} f d\mu
> $$

And this is the integral. Which is much general than Riemann integral becaues it can be applied to any type of measurable space, with all different type of topologies, not just the Real Number Line. 

----
### **Simple Functions**

$\phi$ is simple when $\phi(\omega) = \sum_{i = 1}^{n}a_i \mathbb{I}_{A_i}$, Where $A_i$ are disjoint sets such that $\mu_{A_i} \le \infty$. 

**Explnation:** 

A simple function is a function that can be described by a finite linear combination of indicator function where each of the indictor function is on $A_i$, and all $A_i$ is discreate

This can be viewed as assigning discrete value for each of the discrete domain for the function, partitioning the output of the function using the partitioned domain. 

**Simple Function Lesbegue Integral**

> $$
> \int_{\Omega}^{} \phi d\mu = \sum_{i = 1}^{n}a_i \mu(A_i)
> $$

The discrete sume of all the measure on the partitioned domain for the function. 

### **Bounded Functions**

Choose any sent $E$ with $\mu(E)\le \infty$, and let $f$be a bounded function that vanishes on $E^{C}$. 

**Explanation**:

This is a function that has a domain which has a finite measure, and outside such a domain, the function takes on the value $0$. 

Then we define: 

> $$
> \int_{\Omega}^{}f d\mu = 
> \sup_{\phi \le f} \int_{\Omega} \phi d\mu = \inf_{\psi \ge f} \int_{\Omega}^{} \psi d\mu
> $$

Where, $\phi$ are all are simple functions such that $\phi(a) \le f(a)$ for all $a\in A_i$, and $\psi \ge f(a) \forall a \in A_i$, in this sense, by partitioning the simple function with finner and finner $A_i$ on the domain, one can take the $\sup, \inf$ and get the Lebesgue Integral. 

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
>     0 \le h \le f, \text{h is bounded and } \mu(\{x: h(x)\ge 0\}) \le \infty
> \right\rbrace
> $$

The General Non-negative function is approximated by bounded function that are on a domain that has a finite measure. 

**Take notice that**, this is much general and the non-negative function is not necessarily bounded. 

### **General Function**

Assuming that function $f$ is integrable, then we mean that $\int_{\Omega}|f|d\mu \le \infty$. Let: 

$$
f^+(x) = \max(f(x), 0) \quad f^{-}(x) = \max(-f(x), 0)
$$

Where we separate the positive and negative part of the function. Then clearly: 

$$
f(x) = f^+(x) - f^-(x) \quad |f(x)| = f^{+}(x) + f^{-}(x)
$$

Then the integal can be defined as: 

> $$
> \int_{\Omega}^{} fd\mu = \int_{\Omega} f^+ d\mu  - \int_{\Omega}^{} f^{-}d\mu
> $$

Where, both $f^+, f^-$ will be non-negative function, and we already defined integral for non-negative functions. 


---
### **Back to Expected Value of Random Variable**

To compute the expected value of a random variable over some weird topological spaces, we would need to compute it using the Lebesgue Integral, and we would like to make a change of varible and bring it to the Borel Space instead of the originally defined $\sigma$-algebra.

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

Lebesgue Integral are pretty similar to Riemman's Integral, the difference is just the way it's being integrated over any type of domains. They have the same properties. 

Now, All proofs about the details are skipped. They are in the textbook(Probabiliy: Theory and Examples, Rick Durrett) with detailed proofs and discussions. 