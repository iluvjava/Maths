Hi, this is some Super basic high school maths. 

---
### **Taylor Theorem**
Taylor's theorem approximates some function around a point, using differential information of the function at the point, and a series (finite or not) of polynomials. In the case when the function is finitely differentiable, a reminder can be put at the end to model the error of the approximation. 

#### **Formula for Single Variable**

> Let $f$ k-th differentiable at a point $x_0$ ($f^{(k)}(x)$ is a continuous function $\delta$ region around $x_0$), then the Taylor's expansion is: 
> $$T_n(f|x_0)
> =\left(\sum_{k=0}^n \frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)+ \mathcal{O}((x - x_0)^{n + 1}),$$
> when the function is smooth enough to be infinitely differentiable, then we have: 
> $$
> f(x) = \sum_{k = 0}^\infty 
> \left(\frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)
> $$
> For some value of $x$ near $x_0$. 

**Note**: 

We won't be talking too much about the radius of convergence yet. This would requires some comlex analysis and knowledge of power series. 

**Def | The Big O**

> A function $f \in O(g)$, if there exists a constant $C < \infty$ such that $f(x) < g(x)$ for all $x$ in $\mathbb R$. 

---
### **The remainder of Taylor's Expansion**

Different mathematicians have different things to say about the remainder of Taylor's theorem. 

#### **Riemann Integral Remainder**:
> 
> $$
> \varphi(x) = \left(
>     \sum_{k = 0}^{n} \frac{f^{(k)}(a)(x - a)^k}{k!} 
> \right) + \int_{a}^{x} \frac{f^{(n + 1)}(t)(x - t)^n}{n!}dt,
> $$
> Which requires understanding in Lesbgue integrals to understand the proof for this one. 


#### **Lagrange Differential Remainder, Exact**:

> Let $f$ be $n + 1$ differentiable, i.e: $f^{(n + 1)}$ is continuous the open interval $(a, x)$, and $f^{(n)}$ is continuous on the closed interval $[a, x]$, then: 
> 
> $$
> \exists \; t \in (x, c) : f(x) = \left(
>     \sum_{k = 0}^{n} \frac{f^{(k)}(c)(x - c)^k}{k!}
> \right) + 
> \frac{f^{(n + 1)}(t)(x -c)^{n + 1}}{(n + 1)!}.
> $$

#### **Peano Remainder Form**

> Let $f(x)$  be a k-th differentiable function on a closed interval, $[a, b]$, then
> 
> $$
> \begin{aligned}
>     &f(x) = f(a) + f'(a)(x - a) + \frac{f''(a)(x - a)^2}{2} + \cdots + 
>     \frac{f^{(k)}(x)(x - a)^k}{k!} + h_k (x)(x - a)^k 
>     \\
>     & \text{Where: }
>     \lim_{x \rightarrow a} h_k(x) = 0, f^{(k)} \text{ is continuous}.
> \end{aligned}
> $$

It's saying that the coefficients of the $k^\text{th}$ remainder is going to zero as $x\rightarrow a$. Peano remainder can be expressed using the $\mathcal{o}(|x - a|^k)$, and in that case, the remainder is paramaterized by $k$, say $R_k(x)$, and it's a function such that $\lim_{x \rightarrow a} R_k(x)/(x - a)^k = 0$. 

**Upper Bound For the Remainder**

Assuming that the function is infinitely differentiable at every points in the real, then it's continuous for any of its derivative, which implies that given any point $x_0, x$, the following is true:

> $$\exists M =\left| \sup_{x \in [\min(x_0, x), \max(x_0, x)]} f^{(n + 1)}(x) \right| \le \infty$$

And this will give us an upper bound for the error of approximation by Taylor series: 
> $$|T_n(f| x_0) - f(x)| \le  \left| 
> \frac{M}{(n + 1)!}(x - x_0)^{n + 1}
> \right| \quad \forall x \in [\min(x_0, x), \max(x, x_0)]$$


---

### **Complex Analysis And Taylor Series**

[[Laurent Series]] For more info, and it needs a lot more to deal with than in the real case. 

---
### **Analysis Flavor of Taylor's Theorem**

We are interested in looking for the different forms for the remainders of Taylor's Series. Wiki Link: [here](https://en.wikipedia.org/wiki/Taylor%27s_theorem)




#### **Taylor's Remainder Form:** 

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

Consider $P_n(x|x_0) =\sum_{k = 0}^{n}(f^{(k)}(x_0)(x - x_0))/k!$, then: 

$$
\begin{aligned}
    \partial_x[P_n(x|x_0)](x_0) &= f(x_0)
    \\
    \partial_x^2[P_n(x|x_0)](x_0) &= f''(x_0)
    \\
    & \hspace{0.5em}\vdots
    \\
    \partial_x^n[P_n(x|x_0)](x_0) &= f^{(n)}(x_0)
\end{aligned}
$$

Define $g(x):= f(x) - P_n(x|x_0) - M_{x, x_0}(x - x_0)^{n + 1}$. Fixing the value of $x$, then: 

$$
\exists M_{x, x_0}: 0 = f(x) - P_n(x|x_0) - M_{x, x_0}(x - x_0)^{n + 1}, 
$$

For the value of $x$. Take note that $M_{x, x_0}$ exists, but it's just not in the form that we like it, and it can be solved by solving the equation directly. Finally observe that using intermediate value theorem: 

$$
\begin{aligned}
    & g(x_0) = 0 = g(x) \implies \exists x_1 \in [x_0, x]: g'(x_1) = 0
    \\
    & g'(x_1) = 0 =g'(x_0) \implies \exists x_2\in[x_0, x_1]: g''(x_2) = 0
    \\
    & \quad \vdots 
    \\
    & g^{(n)}(x_{n}) = 0 = g^{(n)}(x_n) \implies \exists x_{n + 1}\in [x_0, x_{n}]: g^{(n + 1)}(x_{n + 1}) = 0,
\end{aligned}
$$

Letting $c = x_{n + 1}$, then $g^{(n + 1)}(c) = f^{(n + 1)}(c) - (n + 1)! M_{x, x_0}$ which means that $M_{x, x_0} = f^{(n + 1)}(c) (n + 1)!$, this is the remainder. The use of mean value theorem requires that, $f^{(n)}$ is differentiable on the closed interval $[x_0, x]$. 

**Remarks**
We can use the continuity of $g^{(n)}$ and Intermediate Value theorem instead to derive an error term on the scale of $(x - x_0)^n$. 

**Integral Form of the Remainder**

Let $f^{(k)}$ be [<u>absolutely continuous</u>](https://en.wikipedia.org/wiki/Absolute_continuity) on the closed interval between $a, x$, then the remainder for the tylor's theorem will be: 

> $$R_k(x|a) = \int_{a}^{x} \frac{f^{(k + 1)}(t)}{k!}(x - t)^kdt$$

Due to absolute continuity of f(k) on the closed interval between a and x, its derivative f(k+1) exists as an L1-function, and the result can be proven by a formal calculation using fundamental theorem of calculus and integration by parts.

**Reference**: 

Baby Rudin I believe. 


---
### **Multi-Variable: The first 2 Terms**

Consider the function $f: \mathbb{R}\mapsto\mathbb{R}^n$, then its first few terms in Taylor Series can be expressed as: 

$$
f(x + h) = 
f(x) + \langle\nabla [f(x)]_{x = x}, h\rangle + 
\langle h, \mathcal{H}[f(x)]_{x = x}h\rangle + \mathcal{O}(\Vert h\Vert^3)
$$

Sometimes $\mathcal{H}[f(x)]$, the Hessian of the function $f(x)$ evaluated at some point is written as $\nabla^2[f(x)]$, which can be mistaked by the Laplacian. 

Now assume that $f(x): \mathbb{R}^n \mapsto \mathbb{R}^m$, then the first 2 terms of the Taylor Series expansion will be given as: 

$$
f(x + h) = f(x) + \mathcal{J}[f(x)]_{x = x}^Th + \mathcal{O}(\Vert h\Vert^2)
$$

---
### **Infinite Multi-Varible Taylor Series**

If a given function $f(x,y)$ is infinitely differentiable, then it can be approximated with the following infinite polynomial with undetermined coefficients: 

$$
P(x, y) = \sum_{n = 0}^{\infty}
\sum_{k_1, k_2 \in S_n}^{\forall}
C(f,n, k_1, k_2)x^{k_1}y^{k_2} \quad \text{Where: } S_n:= \{k_1, k_2 \in \mathbb{Z}_{\ge 0}: k_1 + k_2 = n\}
$$

Where $C$ is some kind of function that produces the coefficients given the power for each variable (which also uniquely identifies a multi-nomial term for a fixed total power) the sum of power $n$, and the function $f$ that we wish to take the derivative of. To determine $C(f, n, k_1, k_2)$, we asserts the equality: 

$$
\partial_{y}^{d_1} \partial_x^{d_2} f(x, y) = 
\partial_{y}^{d_1} \partial_x^{d_2} p(x, y) \quad \forall (d_1, d_2) \in \; \mathbb{Z}_{\ge 0}^2
$$

The reader should realize that this is very easy to generalize into the multi-variable case, with $f(x): \mathbb{R} \mapsto \mathbb{R}^m$. For notational convenience and keep track of the polynomial terms in the multidimensional case, we denote: 

> $$
> S_n = 
>     \left\lbrace
>         \vec{k} \in \mathbb{Z}_{\ge 0}^m
>         :
>         \sum_{j = 1}^{m}k_i = n
> \right\rbrace
> $$

Where, $S_n$ will be a vector containing all the terms of the multi-nomial such that the sum of the power equals to a specific integer: $n$, which is paramaterized by the summation. 

Then the polynomial with undetermined coefficients can be written as: 

$$
P(\vec{x}) =
\sum_{n = 0}^{\infty}
\sum_{\vec{k}\in S_n}^{\forall}
C(f, n, k_1, k_2, \cdots, k_m)
\prod_{i = 1}^{m} x_i^{k_i} 
$$
 
For all possible way of taking derivative of total order $n$, the derivative of the function at the point $\mathbf{0}$ must match up with the polynomial defined above. Which in fact, implies that: 

$$
\begin{aligned}
    P(\vec{x}) &=
    \sum_{n = 0}^{\infty}
    \sum_{\vec{k}\in S_n}^{\forall}
        C(f, n, k_1, k_2, \cdots, k_m)
    \prod_{i = 1}^{m} x_i^{k_i} 
    \\
    &= 
    \sum_{n = 0}^{\infty}
    \sum_{\vec{k}\in S_n}^{\forall}
    \frac{
        (\partial_{x_1}^{k_1}\partial_{x_2}^{k_2}\cdots \partial_{x_m}^{k_m})[f(\vec{x})]_{\vec{x} = \mathbf{0}}
        }{
            \left(\prod_{j = 1}^{m} k_j!\right)
        }
    \prod_{i = 1}^{m} x_i^{k_i} 
\end{aligned}
$$

The expression for $C(f, n, k_1, k_2, \cdots k_m)$ is obtained simply by asserting the equality for all partial derivatives between the polynomial and the original function. Define the following notations for ease of reading and writing: 

$$
f^{(k_1, k_2, \cdots, k_m)}(\vec{x}_0) = 
(\partial_x^{k_1}\partial_x^{k_2}\cdots \partial_x^{k_m})[f(\vec{x})]_{\vec{x} = \vec{x}_0}
$$

Then one can simplify the expression and get the Taylor Series centered at any point, giving us: 

$$
\begin{aligned}
    T[f(\vec{x})|\vec{x}_0] &= 
    \sum_{n = 1}^{\infty}
    \sum_{\vec{k}\in S_n}^{\forall}
    \frac{
            f^{(k_1, k_2, \cdots, k_m)}(\vec{x}_0)
        }{
            \left(\prod_{j = 1}^{m} k_j!\right)
        }
    \prod_{i = 1}^{m} (x_i - (\vec{x_0})_i)^{k_i} 
\end{aligned}
$$

And that completes the Taylor Series in differential function that have countably many parameters. 

**Example: Recovering the Hessian Term from above Expression**


