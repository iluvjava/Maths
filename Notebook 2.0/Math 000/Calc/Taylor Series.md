Super basic high school maths

---

#### **Proof of Taylor Theorem**

* The proof is an application of Rolle's Theorem

#### **Formula for Single Variable**

> $$T_n(f|x_0) + \sum_{k = n + 1}^\infty 
> \left(\frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)
> =\left(\sum_{k=0}^n \frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)+ \mathcal{O}((x - x_0)^{n + 1})$$

**The Big O**

The order of error is bounded by the Big O. It's a constant multiple of the term inside big O, assuming the function is at least $C^n$ smooth. 

**Remainder**
> $$\frac{f^{(n + 1)}(x_0)}{(n + 1)!}(x - x_0)^{n + 1}$$

**Exact Expression (Integral Remainder):**

> $$
> \varphi(x) = \left(
>     \sum_{k = 0}^{n} \frac{f^{(k)}(a)(x - a)^k}{k!} 
> \right) + \int_{a}^{x} \frac{f^{(n + 1)}(t)(x - t)^n}{n!}dt
> $$

Which can be verifeid by considering $\varphi^{(n + 1)}(x)$. 

**Exact Expression (Intermediate Value Theorem)**

Anod the representation would be using the intermediate value theorem, by assuming that the function is $C^n$ smooth. So that, the $n$ the deriative is at least continuous. In that sense we have the following Taylor Series: 

> $$
> \exist \; t \in (x, c) : f(x) = \left(
>     \sum_{k = 0}^{n} \frac{f^{(k)}(c)(x - c)^k}{k!}
> \right) + 
> \frac{f^{(n + 1)}(t)(x -c)^{n + 1}}{(n + 1)!}
> $$

Verified by taking the $n$ th derivative on the expression so that the remaining terms give arise to the IVT theorem for $f^{(n)}(x)$. 


**Upper Bound Description**

> $$M =\left| \sup_{x \in [\min(x_0, x), \max(x_0, x)]} f^{(n + 1)}(x) \right|$$

And this will give us 
> $$|T_n(f| x_0) - f(x)| =  \left| 
> \frac{M}{(n + 1)!}(x - x_0)^{n + 1}
> \right| \quad \forall x \in [\min(x_0, x), \max(x, x_0)]$$


---

### **Complex Analysis And Taylor Series**

[[Laurent Series]] For more info, and it needs a lot more to deal with than in the real case. 

---
### **Analysis Flavor of Taylor's Theorem**

We are interested in looking for the different forms for the remainders of Taylor's Series. 

Wiki Link: [here](https://en.wikipedia.org/wiki/Taylor%27s_theorem)

**Peano Remainder Form**

Stating the Form: 

$$
\begin{aligned}
    f(x) &= f(a) + f'(a)(x - a) + \frac{f''(a)(x - a)^2}{2} + \cdots + 
    \frac{f^{(k)}(x)(x - a)^k}{k!} + h_k (x)(x - a)^k 
    \\
    & \text{Where: }
    \lim_{x \rightarrow a} h_k(x) = 0
\end{aligned}
$$

It's saying that the coefficients of the $k^\text{th}$ remainder is going to zero as $x\rightarrow a$. Peano remainder can be expressed using the $\mathcal{o}(|x - a|^k)$, and in that case, the remainder is paramaterized by $k$, say $R_k(x)$, and it's a function such that $\lim_{x \rightarrow a} R_k(x)/(x - a)^k = 0$. 


**Taylor's Remainder Form:** 

> Suppose $f:[a, b] \mapsto \mathbb{R}$ and $f^{(n + 1)}$ is differentiable in $(a, b)$ and $f^{(k)}$ is continuous for $k \le n$, given $x\neq x_0 \in [a,b]$, $c \in [x_0, x]$ we have: 
> 
> $$
> f(x) = 
>     \left(
>         \sum_{k = 0}^{n}
>         \frac{f^{(k)}(x_0)(x - x0)^k}{k!}
>     \right) + \frac{f^{n + 1}(c)}{(n + 1)!}(x - x_0)^{n + 1}
> $$



