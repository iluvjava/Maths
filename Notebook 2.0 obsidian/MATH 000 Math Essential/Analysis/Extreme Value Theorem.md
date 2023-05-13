- [Bozano Weierstrass](Bozano%20Weierstrass.md), we use this theorem directly. 
- [Real Analysis Basics](Real%20Analysis%20Basics.md) , we use the continuity of real functions. 

---
### **Intro**

This theorem is an application of the compact space in $\mathbb R$ and the Bozano Wierestrass theorem. There is a much generalized version using lower-semi-continuity to classify the existence of a minimizers for functions, see [Existence of a Minimizer](../../AMATH%20516%20Numerical%20Optimizations/Background/Existence%20of%20a%20Minimizer.md) for a generalization of this theorem in the realm of variational analysis. 

#### **Thm-1 | Extreme Value Theorem**

> Let $f$ be a continuous function in $\mathbb R$, then it's bounded and it attains a minimum and a maximum over the interval $[a, b]$. 

**Proof**

The function will be bounded. For contradiction if it's not, then there exists a value $f(x_0) = \infty$, then by continuity we have $f(x_0) = \lim_{x\rightarrow x_0}f(x)$, which would contradict continuity since $f(x) - \infty$ is never $\epsilon$ bounded. Therefore the range of the function, $\text{rng}_{[a, b]}(f)$ is a bounded set attaining $\sup\text{rng}_{[a, b]}(f)$, and $\inf\text{rng}_{[a, b]}(f)$. 

It suffice to show that the function has a minimizer on the domain $[a, b]$, the maximizer case is just the same function but upside down. By definition of $\sup$, we can make a sequence $(x_n)_{n\in \mathbb N}$ such that $\lim_{n\rightarrow \infty}f(x_n) = \inf \text{rng}_{[a, b]}(f) =: M$. Using B.W we summon a subsequence $(x_{n_k})_{n\in \mathbb N}$ such that it converges to some point $\bar x$, by the fact that the interval $[a, b]$ is closed, $\bar x \in [a, b]$. By the fact that the function is continuous, we have $f(x) = \lim_{k\rightarrow \infty}f(x_{n_k}) = f(\bar x)$, hence $\bar x$ is a number that actually makes the function attains the minimum value. 

**Remarks**

The hard part is about the use of continuity in the proof and the Bozano Weirestrass that allows us to take exactly one point in the interval that actually make the function attains the value of minimum value. 
