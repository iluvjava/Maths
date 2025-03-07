- [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md)


---
### **Intro**

Let $f:\R^n\rightarrow \R$ be a differentiable function with $\nabla f: \R^n \rightarrow \R^n$. 
There are sets of theorems and properties characterized for the function to prove the convergence of the algorithms. 
In this file, we fix, and improve previous writings in the same topics: [L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md). 
This file will derive some of the previous results under the convex assumptions. 


#### **Assumptions Set 1**
> 1. **(A1)**: $f: \R^n \rightarrow \R$ is a convex function. 
> 2. **(A2)**: $\nabla f: \R^n \rightarrow \R$ is $L$-Lipschitz continuous. 
> 3. **(A3)**: The norm $\Vert \cdot\Vert$ is the Euclidean norm. 

Define the Bregman Divergence $D_f:\R^n \times \R^n \rightarrow \R$ for all $x, y \in \R^n$: 

$$
\begin{aligned}
    D_f(x, y) := f(x) - f(y) - \langle \nabla f(y), x - y\rangle. 
\end{aligned}
$$

For **(A1)**, a function $f$ is a convex function and differentiable if and only if for all $x, y \in \R^n$: 

$$
\begin{aligned}
    0 \le D_f(x, y). 
\end{aligned}
\tag{A1}
$$

For **(A2)**, the definition of $L$-Lipschitz gradient if and only if for all $x, y$: 

$$
\begin{aligned}
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star \le L \Vert x - y\Vert. 
\end{aligned}
\tag{A2}
$$
See [Lipschitz Continuity](../Background/Lipschitz%20Continuity.md) for exciting results regarding mapping of this type. 
Using convexity alone, it gives the following lemma. 

#### **Lemma 1 | Equivalent characterizations of Convexity**
> Suppose $f:\R^n \rightarrow \R$. Then the following are equivalent. 
> 1. (**Convexity**) $f$ is a convex function. 
> 2. (**Gradient Inequalities**) $f(y)\geq f(x) + \langle \nabla f(x), y - x\rangle$ for all $x, y \in \R^n$
> 3. (**Monotonicity**) $\langle \nabla f(y) - \nabla f(x), y - x\rangle \geq 0$ for all $x, y\in \R^n$. 

**Proof**

See [Gradient, Hessian Characterization of Convex Functions](../CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convex%20Functions.md). 
The lemma above is a special case where the function's domain, and the domain of its gradient is the entire $\R^n$. 
Some edge cases are removed in this settings. 

---
### **Basic Implications**

The theorems follows describe conditions implied by **(A1), (A2)**. 
They are strictly weaker than **(A1)** and **(A2)**. 
The following theorem list one key implications that will become useful later on. 

#### **Lemma 2.1 | The Descent Lemma**
> Let $f: \R^n \rightarrow \R$ satisfies **(A2)**.
> Then for all $x, y \in \R^n$ it satisfies: 
> $$
> \begin{aligned}
>     |D_f(x, y)| &\le \frac{L}{2}\Vert x - y\Vert^2.
> \end{aligned}
> $$
> If in addition we assume **(A1)**, then it has for all $x, y \in R^n$: 
> $$
> \begin{aligned}
>     0 \le D_f(x, y) \le \frac{L}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

Take any $x, y \in \R^n$, then $z(t) = x - t(y - x) \in \R^n$ for $t \in [0, 1]$. 
Make the observation that $z'(t) = y - x = t^{-1}(z(t) - x)$
Using the fundamental theory of calculus, it has: 

$$
\begin{aligned}
    0\le |D_f(x, y)| &= 
    \left| 
        f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \right|
    \\
    &= \left|
        \int_{t = 0}^{1} \langle \nabla f(z(t)), z'(t)\rangle dt
        - \langle \nabla f(y), x - y\rangle dt
    \right|
    \\
    &= 
    \left|
        \int_{t = 0}^{1} t^{-1}
        \langle \nabla f(z(t)) - \nabla f(y), z(t) - x\rangle dt
    \right|
    \\
    &\le 
    \left|
        \int_{t = 0}^{1} t^{-1}
        \Vert \nabla f(z(t)) - \nabla f(y)\Vert_\star
        \Vert z(t) - x\Vert dt
    \right|
    \\
    &\le 
    \left|
        \int_{t = 0}^{1} t^{-1} L\Vert z(t) - x\Vert^2 dt
    \right|
    \\
    &= 
    \left|
        \int_{t = 0}^{1} t L\Vert y - x\Vert^2 dt
    \right|
    \\
    &=  \frac{L}{2}\Vert y - x\Vert^2. 
\end{aligned}
$$

With convexity, the above is always greater than zero without the absolute value and hence the claim is true trivially. 
$\blacksquare$


#### **Lemma 2.2 | Gradient nom error bound**
> Let $f: \R^n \rightarrow \R$ satisfies (A1), (A2).
> Then for any $x$, it satisfies: 
> $$
> \begin{aligned}
>     0 
>     &\le 
>     f(x) - \left(\inf_{x \in \R^n} f(x) \right) - (2L)^{-1}\Vert \nabla f(x)\Vert_\star^2. 
> \end{aligned}
> $$

**Proof**

Let $y \in \R^n$, then by convexity it has for all $x \in \R^n$: 

$$
\begin{aligned}
    0 &\le \frac{L}{2}\Vert x - y\Vert^2 -  D_f(x, y)
    \\
    &=
    \frac{L}{2}\Vert x - y\Vert^2 -  
    \left(
        f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \right)
    \\
    &= 
    \frac{L}{2}\Vert x - y\Vert^2 - f(x) + f(y) + \langle \nabla f(y), x - y\rangle
    \\
    &\le 
    f(y) - \left(
        \inf_{x \in \R^n} f(x) 
    \right)
    + \frac{L}{2}\Vert x - y\Vert^2
    + \langle \nabla f(y), x - y\rangle. 
\end{aligned}
$$

Since this statement is true for all $x \in \R^n$, it has 

$$
\begin{aligned}
    0 &\le 
    f(y) - \left(
        \inf_{x \in \R^n} f(x) 
    \right)
    + 
    \inf_{x \in \R^n}
    \left\lbrace
        \frac{L}{2}\Vert x - y\Vert^2
        + \langle \nabla f(y), x - y\rangle
    \right\rbrace
    \\
    &=  
    f(y) - \left(
        \inf_{x \in \R^n} f(x) 
    \right)
    - 
    \frac{1}{2L}\Vert \nabla f(y)\Vert_\star^2
\end{aligned}
$$

Because: 

$$
\begin{aligned}
    \inf_{v \in \R^n}
    \left\lbrace
        \frac{L}{2}\Vert v\Vert^2
        + \langle \nabla f(y), v\rangle
    \right\rbrace
    &= 
    \inf_{t \ge 0, v \in \R^n}
    \left\lbrace
        \left .
            \frac{t^2L}{2}
            + 
            t\langle \nabla f(y), v\rangle
        \right| \Vert v\Vert = 1
    \right\rbrace
    \\
    &= 
    \inf_{t \ge 0}
    \left\lbrace
            \frac{t^2L}{2}
            - 
            t\Vert \nabla f(y)\Vert_\star^2
    \right\rbrace
    \\
    &= 
    \inf_{t \ge 0}
    \left\lbrace
        \frac{t^2L}{2}
        - 
        t\Vert \nabla f(y)\Vert_\star^2
        + 
        \frac{1}{2L}\Vert \nabla f(y)\Vert_\star^2
    \right\rbrace
    - \frac{1}{2L}\Vert \nabla f(y)\Vert_\star^2
    \\
    &= 
    \inf_{t \ge 0}
    \left\lbrace
        \frac{1}{2L}\left(
            t^2
            - \frac{2t}{L}\Vert \nabla f(y)\Vert_\star^2
            + \frac{1}{L^2}\Vert \nabla f(y)\Vert_\star^2
        \right)
    \right\rbrace
    - \frac{2}{L}\Vert \nabla f(y)\Vert_\star^2
    \\
    &= 0 - \frac{1}{2L}\Vert \nabla f(y)\Vert_\star^2. 
\end{aligned}
$$

Which is just completing the square. 
$\blacksquare$

---
### **Second Level Implications**

The lemmas from previous section has further consequences that are not entire obvious. 






