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

> Suppose $f:[a, b] \mapsto \mathbb{R}$ and $f^{(n + 1)}$ is differentiable in $(a, b)$ and $f^{(k)}$ is continuous and differentiable for $k \le n$, given $x\neq x_0 \in [a,b]$, $c \in [x_0, x]$ we have: 
> 
> $$
> f(x) = 
>     \left(
>         \sum_{k = 0}^{n}
>         \frac{f^{(k)}(x_0)(x - x_0)^k}{k!}
>     \right) + \frac{f^{n + 1}(c)}{(n + 1)!}(x - x_0)^{n + 1}
> $$

**Proof**

Consider $P_n(x|x_0)$ paramaterizing $\sum_{k = 0}^{n}(f^{(k)}(x_0)(x - x_0))/k!$, then: 

$$
\begin{aligned}
    \partial_x[P_n(x|x_0)]_{x = x_0} &= f(x_0)
    \\
    \partial_x^2[P_n(x|x_0)]_{x = x_0} &= f''(x_0)
    \\
    & \vdots
    \\
    \partial_x^n[P_n(x|x_0)]_{x = x_0} &= f^{(n)}(x_0)
\end{aligned}
$$

Define $g(s):= f(x) - P_n(x|x_0) - M_{x, x_0}(x - x_0)^{n + 1}$. Fixing the value of $x$, let's assume that: 

$$
\exists M_{x, x_0}: 0 = f(x) - P_n(x|x_0) - M_{x, x_0}(x - x_0)^{n + 1}
$$

Take note that $M_{x, x_0}$ exists, but it's just not in the form that we like it, and it can be solved by brute forcing on the equation. Finally observe that: 

$$
\begin{aligned}
    g(x_0) = 0 = g(x) &\implies \exists x_1 \in [x_0, x]: g'(x_1) = 0
    \\
    g'(x_1) = 0 =g'(x_0) \implies& \exists x_2\in[x_0, x_1]: g''(x_2) = 0
    \\
    \vdots &
    \\
    \exists x_{n + 1} : g^{n + 1}(x_{n + 1}) &= 0
\end{aligned}
$$

Letting $c = x_{n + 1}$, then $g^{(n + 1)}(c) = f^{(n + 1)}(c) - (n + 1)! M_{x, x_0}$ which means that $M_{x, x_0} = f^{(n + 1)}(c) (n + 1)!$

Take note that, as long as the function is differentiable, this is applicable, however, taylor's theorem would still apply for function that is not differentialble but continuous at some pont in the interval $[x_0, x]$, but that would mean that function is not infinitely differentiable. In that case, mean value theorem would not be applicable. However, a continuous function will be integrable. 

**Integral Form of the Remainder**

Let $f^{(k)}$ be [<u>absolutely continuous</u>](https://en.wikipedia.org/wiki/Absolute_continuity) on the closed interval between $a, x$, then the remainder for the tylor's theorem will be: 

> $$R_k(x|a) = \int_{a}^{x} \frac{f^{(k + 1)}(t)}{k!}(x - t)^kdt$$

Due to absolute continuity of f(k) on the closed interval between a and x, its derivative f(k+1) exists as an L1-function, and the result can be proven by a formal calculation using fundamental theorem of calculus and integration by parts.



---
### **Multi-Variable**

It's kinda complicated, but ways of analysis will change. We 