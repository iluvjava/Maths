- [Mean Value Theorem](../Analysis/Mean%20Value%20Theorem.md)

---
### **Taylor Theorem**

Taylor's series approximates mapping $\R \rightarrow \R$ using polynomials: $1, x, x^2, x^3, \ldots$. 

#### **Theorem | Taylor series Formula for Single Variable**
> Let $f$ k-th differentiable at a point $x_0$ ($f^{(k)}(x)$ is a continuous function around $x_0$), then there exists constant $C$ such that: 
> $$
>   T_n(f|x_0)
>   =\left(\sum_{k=0}^n \frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)+ C(x - x_0)^{n + 1},
> $$
> when the function is smooth enough to be infinitely differentiable, then we have: 
> $$
> f(x) = \sum_{k = 0}^\infty 
> \left(\frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)
> $$
> For some value of $x$ near $x_0$. 



---

### **Complex Analysis And Taylor Series**

Read [[Laurent Series]] for more info, and it needs a lot more to deal with than in the real case. 

---
### **Analysis Flavor of Taylor's Theorem**

Different forms for the remainders of Taylor's Series are in: [here](https://en.wikipedia.org/wiki/Taylor%27s_theorem)


#### **Taylor's Remainder Form:** 

> Suppose $f:[a, b] \mapsto \mathbb{R}$ and $f^{(n + 1)}$ is differentiable in $(a, b)$ and $f^{(k)}$ is continuous and differentiable for $k \le n$, given $x, x_0 \in [a,b], x > x_0$. 
> Then there exists $c \in [x_0, x]$ such that: 
> 
> $$
> f(x) = 
>     \left(
>         \sum_{k = 0}^{n}
>         \frac{f^{(k)}(x_0)(x - x_0)^k}{k!}
>     \right) + \frac{f^{(n + 1)}(c)}{(n + 1)!}(x - x_0)^{n + 1}
> $$

**Proof**

Define $P_n(x|x_0) =\sum_{k = 0}^{n}(f^{(k)}(x_0)(x - x_0))/k!$, then: 

$$
\begin{aligned}
    (\forall k = 0, \ldots, n)\;[x\mapsto P_k(x|x_0)]'(x_0) &= f^{(k)}(x_0). 
\end{aligned}
$$

Note that for all $x > x_0, k = 1, \ldots, n$: 
$$
\begin{aligned}
    \left(
        \exists M_{x, x_0} = \frac{f(x) - P_n(x | x_0)}{(x - x_0)^{n + 1}}
    \right)
    :\;
    0 = f(x) - P_n(x|x_0) - M_{x, x_0}(x - x_0)^{n + 1}. 
\end{aligned}
$$

Define $g(z):= f(z) - P_n(z|x_0) - M_{x, x_0}(z - x_0)^{n + 1}$ for $z \in [x_0, x]$. 
The continuous differentiability of $f$ and remainder $M_{x, x_0}(z - x_0)^{n + 1}$ allows: 

$$
\begin{aligned}
    & g(x_0) = 0 = g(x) \implies \exists x_1 \in [x_0, x]: g'(x_1) = 0, 
    \\
    & g'(x_1) = 0 =g'(x_0) \implies \exists x_2\in[x_0, x_1]: g''(x_2) = 0, 
    \\
    & (\cdots)
    \\
    & g^{(n)}(x_{n}) = 0 = g^{(n)}(x_n) \implies \exists x_{n + 1}\in [x_0, x_{n}]: g^{(n + 1)}(x_{n + 1}) = 0.
\end{aligned}
$$

Letting $c = x_{n + 1}$, then $0 = g^{(n + 1)}(c) = f^{(n + 1)}(c) - (n + 1)! M_{x, x_0}$ which means that $M_{x, x_0} = f^{(n + 1)}(c) (n + 1)!$. 
The use of mean value theorem requires $f^{(n)}$ is differentiable on the closed interval $[x_0, x]$. 

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
(\partial_{x_1}^{k_1}\partial_{x_2}^{k_2}\cdots \partial_{x_m}^{k_m})[f(\vec{x})]_{\vec{x} = \vec{x}_0}
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

**Example | Recovering the Hessian Term from above Expression**


