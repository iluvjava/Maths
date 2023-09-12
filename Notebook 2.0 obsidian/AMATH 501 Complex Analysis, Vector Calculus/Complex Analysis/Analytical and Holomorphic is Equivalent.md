[Cauchy Integral](Cauchy%20Integral.md)

---
### **Intro**

We note that, if a function is differentiable around a open disc centered at $z_0$ in the domain of the function, then the function has a series expansion around the point $z_0$. 

### **Thm | Equivalency between Analyticity and Holomorphic**
> Let $f$ be holomorphic on $D\subseteq \Omega$, with $D = \{z : |z - z_0| \le R\}$, denoting an open disc in the domain of $f$ such that it's $R$ distance away from a point $z_0 \in \Omega$, then this is equivalent to that $f$ is analytical at $z_0$, admitting expansion: 
> $$
> \begin{aligned}
>     f(z) = \sum_{n = 0}^\infty \frac{f^{(n)}(z_0)}{n!}(z - z_0)^n, 
> \end{aligned}
> $$
> and the series converges with radius $R$. 

**References**

This is theorem 4.4 in the Stanford 3 books series, the "Princeton Lectures on Analysis". 