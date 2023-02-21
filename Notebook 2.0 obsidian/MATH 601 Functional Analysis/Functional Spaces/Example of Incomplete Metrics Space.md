[[Convergence in Metric Space]]
[[Topology of Metric Space]]

---
### **Intro**

In this section, we show some of the examples where a metric space is not a complete metric space. This is taken from Professor's Wang's Analysis class Homework. When doing real analysis, the examle proposed for incomplete spaces were quite limited. However, this time with functional analysis, a precise definition is created, and a metric can be proposed to make all different type of examples. 

#UNFINISHED

---
### **Example 1**

> Let $(X, d)$ be a metric space where $X$ is the set of reals, and $d$ is the metric: 
> $$
> \begin{aligned}
>     d(x, y) = \sup_{x\in \R} |\arctan(x) - \arctan(y)|,
> \end{aligned}
> $$
> is incomplete. 

**Proof Preparation**

To show that this is true, we would need to make use of the fact that $\arctan$ has horizontal asymptopes, for any sequence say $x_n = n$, we want to show that $d(x_n, x_m)$ with $m, n > N$ will get always make $d(x_n, x_m)\le \epsilon$. This is true because of the $\arctan$ converges to $\pi/2$. And most importantly we have $x_n\rightarrow \infty$ as $n\rightarrow \infty$, which means that the limit of $x_n\neq \mathbb R$.

**Proof**

Consider the sequence $x_n = n$. We know that the limit of $\arctan$ is $\lim_{n\rightarrow \infty} \arctan (n) = \frac{\pi}{2}$, hence, we propose the choose of an integers $N \ge \lceil \tan(\pi/2 - \epsilon)\rceil$ for $0 < \epsilon < \frac{\pi}{2}$. Since the function $\arctan$ is also monotonically increasing, we have: 

$$
\begin{aligned}
    \forall n > N: 
\end{aligned}
$$

