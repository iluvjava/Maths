- [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md)


---
### **Intro**

Let $f:\R^n\rightarrow \R$ be a differentiable function with $\nabla f: \R^n \rightarrow \R^n$. 
There are sets of theorems and properties characterized for the function to prove the convergence of the algorithms. 
In this file, we fix, and improve previous writings in the same topics: [L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md). 
This file will derive some of the previous results under the convex assumptions. 
Most contents of this file can be found in chapter 2 "Lectures in Convex Optimizations" by Yurri Nesterov. 

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

With convexity, the above is always greater than zero without the absolute value because of Lemma 1. 
Therefore, the claim is true trivially. 
$\blacksquare$

**Remarks**

The converse of the statement is true and it will be explained later. 

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
    \frac{1}{2L}\Vert \nabla f(y)\Vert_\star^2. 
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
### **Groups of Equivalences**

The lemmas from previous section has further consequences that are not obvious. 
Suppose that $f: \R^n \rightarrow \R^n$. 

#### **Definition 1 | Conditions**
For all $x, y$, we define the first group of inequalities that characterizes $f: \R^n \rightarrow \R$ are called the **Smoothness Group**. 
Let $L > 0$. 
Let $x, y \in \R^n$. 
1. **(C1 | Descent Lemma)**: $0 \le L/2 \Vert x - y\Vert^2 - D_f(x, y)$. 
2. **(C2):** $0 \le L\Vert x - y\Vert^2 - D_f(x, y) - D_f(y, x)$. 
3. **(C3)**: $\alpha f(x) + (1 - \alpha) f(y) - f(\alpha x + (1 - \alpha)y) - \alpha(1 - \alpha)L/2 \Vert x - y\Vert^2 \le 0$ for all $\alpha \in (0, 1)$. 
4. **(C4 | L-Smoothness)**: $L\Vert \cdot\Vert^2/2 - f$ is a convex function. 

The second group of inequaliteis are called the **Co-Coerisive Group**. 
1. **(C5 | Bregman Co-coersiveness)**: $1/(2L)\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 \le D_f(x, y)$.
2. **(C6 | Firmly non-expansive)**: $L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 \le D_f(x, y) + D_f(y, x)$.
3. **(C7)**: $\alpha(1 - \alpha)/(2L)\Vert \nabla f(x) - \nabla f(y)\Vert^2_\star \le \alpha f(x) + (1 - \alpha) f(y) - f(\alpha x + (1 - \alpha)y)$ for all $\alpha \in [0, 1]$. 

Take note that it has: 
$$
\begin{aligned}
    D_f(x, y) + D_f(y, x) = \langle \nabla f(x) - \nabla f(y), x - y\rangle . 
\end{aligned}
$$

#### **Theorem 3.0 | the first key connection**
> Conditions **(C6)** is sufficient for **(A1), (A2)**. 

**Proof**

**(C3)** directly asserts that: 

$$
\begin{aligned}
    D_f(x, y) + D_f(y, x) &= 
    \langle \nabla f(x) - \nabla f(y), x - y\rangle
    \ge 
    L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert^2
    \ge 0. 
\end{aligned}
$$

Therefore it's convex by $\ge 0$ and Lemma 1. 
The gradient would be Lipschitz continuous because 

$$
\begin{aligned}
    0 
    &\le \langle 
        \nabla f(x) - \nabla f(y), x - y
    \rangle - 
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star^2
    \\
    &\le
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star \Vert x - y\Vert
    - 
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star^2
    \\
    &= \Vert \nabla f(x) - \nabla f(y)\Vert
    \left(
        \Vert x - y\Vert - \Vert \nabla f(x) - \nabla f(y)\Vert_\star
    \right)
    \\
    \implies
    0&\le 
    \Vert x - y\Vert - 
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star. 
\end{aligned}
$$


#### **Theorem 3.1 | smoothness group is equivalent**
> **(C1), (C2), (C3), (C4)** are equivalent. 

**Proof**

We can show that all conditions (C1), (C2), (C3) are equivalent to (C4). 
Define $\phi = L\Vert \cdot\Vert^2/2 - f$. 
Define $\omega = L/2\Vert \cdot\Vert^2$. 

**We now show $(C1) \iff (C4)$.**
By Lemma 1, $\phi$ is convex is equivalent to for all $x, y \in \R^n$: 

$$
\begin{aligned}
    0 &\le D_{\phi}(x, y)
    \\
    &=
    \phi(x) - \phi(y) - \langle \nabla \phi(y), x - y\rangle
    \\
    &= \left(
        \frac{L\Vert x\Vert^2}{2} - f(x)
    \right) - 
    \left(
        \frac{L \Vert y\Vert^2}{2} - f(y)
    \right)
    - 
    \langle Ly - \nabla f(y), x - y\rangle
    \\
    &= \left(
        f(y) - f(x) - \langle \nabla f(y), y - x\rangle
    \right) + 
    \frac{L\Vert x\Vert^2}{2}
    - 
    \frac{L\Vert y\Vert^2}{2}
    - \langle Ly, x - y\rangle
    \\
    &= - D_f(x, y) + \frac{L}{2}\Vert x - y \Vert^2. 
    \\
    \iff 
    0 &\le L/2 \Vert x - y\Vert^2 - D_f(x, y). 
\end{aligned}
$$

We essentially verified the Bregman Divergence equality that: 

$$
\begin{aligned}
    (\forall x, y \in \R^n)\quad 0 \le D_\phi(x, y) = D_{\omega}(x, y) - D_f(x, y). 
\end{aligned}
$$

This is not at all exciting, or crazy. 

**We now show $(C2)\iff (C4)$**. 

$\phi$ is convex and by Lemma 1 it's equivalent to $\forall x, y \in \R^n$: 
$$
\begin{aligned}
    0 &\le 
    \langle \nabla \phi(x) - \nabla \phi(y), x- y\rangle
    \\
    &= D_\phi(x, y) + D_\phi(y, x)
    \\
    &= D_\omega(x, y) - D_f(x, y) + D_\omega(y, x) - D_f(y, x)
    \\
    &= L\Vert x - y\Vert^2 - \left(
        D_f(x, y) + D_f(y, x)
    \right)
    \\
    &= L\Vert x - y\Vert^2 - \langle \nabla f(x) - \nabla f(y), x - y\rangle. 
\end{aligned}
$$

**We now show $(C3) \iff (C4)$.**

The function $\phi$ is convex iff it satsfies the Jensen's inequality for all $\alpha \in (0, 1)$: 

$$
\begin{aligned}
    0 &\le 
    \alpha \phi(x) + (1 - \alpha) \phi(y) - 
    \phi(\alpha x + (1 - \alpha)y)
    \\
    &= 
    \frac{L}{2}\left(
        \alpha\Vert x\Vert^2 + (1 - \alpha)\Vert y\Vert^2
        - \Vert \alpha x + (1 - \alpha) y\Vert^2
    \right) 
    - 
    \left(
        \alpha f(x) + (1 - \alpha) f(y)
        - f(\alpha x + (1 - \alpha)y)
    \right)
    \\
    &=\frac{L \alpha(1 - \alpha)}{2}\Vert x - y\Vert^2
    - 
    \left(
        \alpha f(x) + (1 - \alpha) f(y)
        - f(\alpha x + (1 - \alpha)y)
    \right). 
\end{aligned}
$$

Here we made us of the cute formula. 
See [Cute Formula](../Background/Equalities,%20Inequalities%20of%20Euclidean%20Space.md) for more. 
Therefore, the conditions are equivalent conditions. 
$\blacksquare$

**Remarks**

There is no need for any assumptions, convexity, or Lipschitz continuity of the gradient. 
These results are true for all $f$ which may not have Lipschitz $\nabla f$, or be convex. 



#### **Theorem 3.2 | co-coerciveness group is equivalent**
> Conditions of the second group admit the following: 
> 1. **(C5)** implies **(C6)**. 
> 2. **(C5)** is equivalent to **(C7)**. 
> 3. **(C5), (C6), (C7)** all make implict assumption that $f$ is convex and has Lipschitz gradient. 

**Proof**

**We now show $(C5) \implies (C6)$**. 
For all $x, y \in \R^n$, **(C5), (C6)** has: 

$$
\begin{aligned}
    0 &\le 
    D_f(x, y) - 1/(2L)\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2
    \\
    &\le D_f(x, y) + D_f(y, x) + 
    L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert^2_\star
    \\
    &= \langle \nabla f(x) - \nabla f(y), x - y\rangle 
    - L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2. 
\end{aligned}
$$

**Showing $(C5) \iff (C7)$**. 
For all $x, y \in \R^n$, let $\alpha \in [0, 1]$ and define: 
$$
    x_\alpha = x_0 + \alpha(x_1 - x_0). 
$$

The proof ahead has the following key intermediate steps.

1. **Step (I)**: We show **(C5) implies (C7)**. It has for all $\alpha \in [0, 1]$: 
$$
\begin{aligned}
    & (1 - \alpha) D_f(x_0, x_\alpha) + \alpha D_f(x_1, x_\alpha) 
    \\
    &= (1 - \alpha)f(x_0) + \alpha f(x_1) - f(x_\alpha)
    \\
    &\ge 
    \frac{1}{2L}
    \left(
        \alpha(1 - \alpha) \Vert \nabla f(x_0) - \nabla f(x_1)\Vert_\star^2
        + 
        \Vert 
            \alpha(\nabla f(x_0) - \nabla f(x_\alpha))
            + 
            (1 - \alpha)(\nabla f(x_1) - \nabla f(x_\alpha))
        \Vert_\star^2
    \right)
    \\
    &\ge 
    \frac{\alpha(1 - \alpha)}{2L}
    \Vert \nabla f(x_0) - \nabla f(x_1)\Vert_\star^2. 
\end{aligned}
$$
Using the properties of Bregman Divergences. 

Which is more straightforward to show. 
Using the results of **Step (I), Step (II)**, it yields the inequality for condition **(C7)**. 

1. **Step (II):** 
Going back we need to show **(C7)** implies **(C5)** by taking $\alpha \rightarrow 0$. 

**Showing Step (I)**. 

Condition **(C5)** can be written more compactly. 
Define $h(x; y) = x \mapsto D_f(x, y)$ which makes $\nabla h(x; y) = \nabla f(x) - \nabla f(y)$ hence **(C5)** has for all $x, y \in \R^n$: 

$$
\begin{aligned}
    D_f(x, y) &\ge \frac{1}{2L} \Vert \nabla h(x; y)\Vert_\star^2. 
\end{aligned}
$$

Let $x = x_0, y = x_1$ and $x_\alpha = x_0 + \alpha (x_1 - x_0)$ then consider

$$
\begin{aligned}
    & (1 - \alpha)D_f(x_0, x_\alpha) + \alpha D_f(x_1, x_\alpha) 
    \\
    &= 
    (1 - \alpha)(f(x_0) - f(x_\alpha) - \langle \nabla f(x_\alpha), x_0 - x_\alpha\rangle)
    + \alpha 
    (f(x_1) - f(x_\alpha) - \langle \nabla f(x_\alpha), x_1 - x_\alpha\rangle)
    \\
    &= 
    (1 - \alpha)(f(x_0) - f(x_\alpha) - \alpha\langle \nabla f(x_\alpha), x_0 - x_1\rangle)
    + \alpha 
    (f(x_1) - f(x_\alpha) - (1 - \alpha)\langle \nabla f(x_\alpha), x_1 - x_0\rangle)
    \\
    &= (1 - \alpha)f(x_0) + \alpha f(x_1) - f(x_\alpha) + 0
    \\
    &\ge 
    \frac{1}{2L}\left(
        (1 - \alpha)\Vert \nabla h(x_0; x_\alpha)\Vert_\star^2
        + \alpha \Vert \nabla h(x_1; x_\alpha)\Vert_\star^2
    \right) \quad \text{(C5)}
    \\
    &= \frac{1}{2L}\left(
        \alpha(1 - \alpha)
        \Vert 
            \nabla h(x_0; x_\alpha) - \nabla h(x_1; x_\alpha)
        \Vert_\star^2
        + \Vert 
            (1 - \alpha) \nabla h(x_0, x_\alpha) + 
            \alpha \nabla h(x_1; x_\alpha)
        \Vert_\star^2
    \right) \quad \text{cute formula}
    \\
    &\ge 
    \frac{\alpha(1 - \alpha)}{2L}
    \Vert 
        \nabla h(x_0; x_\alpha) - \nabla h(x_1; x_\alpha)
    \Vert_\star^2
    \\
    &= 
    \frac{\alpha(1 - \alpha)}{2L}
    \Vert 
        \nabla f(x_0) - \nabla f(x_1)
    \Vert_\star^2. 
\end{aligned}
$$

**Showing Step (II)**. 

**(C7)** has for all $x, y \in \R^n$ and $\alpha \in (0, 1)$: 

$$
\begin{aligned}
    \alpha(1 - \alpha)/(2L)\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2
    &\le 
    \alpha f(x) + (1 - \alpha) f(y) - f(\alpha x + (1 - \alpha)y)
    \\
    &= 
    \alpha f(x) + (1 - \alpha) f(y) - f(y + \alpha(x - y))
    \\
    &\le \alpha f(x) + (1 - \alpha) f(y) - (f(y) + \alpha\langle \nabla f(y), x - y\rangle)
    \\
    &= \alpha f(x) - \alpha f(y) - \alpha \langle \nabla f(y), x - y\rangle
    \\
    &= \alpha D_f(x, y)
    \\
    \alpha > 0 \implies
    \frac{(1 - \alpha)}{2L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2
    &\le D_f(x, y). 
\end{aligned}
$$

Take the limit as $\alpha \searrow 0$ on the inequality then it yield the results. 

**Showing that all (C5), (C6), (C7) make implicit assumption (A1), (A2)**. 
From previous results it has **(C7)** implies **(C6)**, and **(C5) implies (C6)**. 
It's sufficient to demonsrate that **(C6)** implies **(A1), (A2)** which had been proved back in Theorem 3.0. 
$\blacksquare$

**Remarks**

At current point, condition **(C6)** are strictly weaker and dangling out of the co-coersive group. 
The theorem that follows will assert the fact that **(C6)** is equivalent to all the conditions. 


#### **Theorem 3.3 | Both groups are equivalent**
> All following relations are true. 
> 1. Conditions **(C1), (C5), (C6)** are all equivalent conditions to **(A1), (A2)**. 
> 2. Under the assumption of **(A1), (A2)**, conditions **(C1), (C2), (C3), (C4), (C6), (C7)** are all equivalent. 

**Proof**

We show that $(C6)\implies (A1) \wedge (A2) \implies (C1) \implies (C5) \implies (C6)$. 
Which establishes $(C6)\iff (C1) \iff (C5) \iff (A1) \wedge (A2)$. 
Using Theorem 3.2, 3.1, it implies that all 7 conditions are equivalent under the assumption $(A1), (A2)$. 

Take note that: 
1. Theorem 3.0 showed (C6) implies (A1) and (A2).
2. Lemma 2.1 showed (A1) and (A2) implies (C1). 
3. **It remains to show that (C1) implies (C5) implies (C6).**

**(C5)** implies **(C6)** is handled by Theorem 3.2. 
The proof for **(C1)** implies **(C5)** is not obvious and it now follows. 
Define the function $h(x; y) = x \mapsto D_f(x, y)$ for any $x, y$. 
Observe that: 
1. $(\forall x \in \R^n)\; h(x; y) \ge 0$ and it admits minimizer $h(y; y) = 0$. 
2. $h(x; y)$ is a convex function because $h(x; y) = f(x) - f(y) - \langle \nabla f(y), x -y\rangle$, with $y$ fixed, it's the sum between two convex functions $x \mapsto f(x)$ and $x \mapsto - f(y) - \langle \nabla f(y), x- y\rangle$. 
3. It has $\nabla h(x; y) = \nabla f(x) - \nabla f(y)$ and $\nabla h(x_1;y) - \nabla f(x_2; y)= \nabla f(x_1) - \nabla f(x_2)$. Hence, the function $h(x; y)$ has a $L$ Lipschitz continuous gradient. 

This fits the setup of Lemma 2.2 hence the results apply for $h$ and it yields for all $x, y$: 

$$
\begin{aligned}
    0 &\le 
    h(x; y) - \left(
        \inf_{z \in \R^n} h(z; y)
    \right) - (2L)^{-1}\Vert \nabla h(x; y)\Vert_\star^2
    \\
    &= 
    h(x; y) - 0 
    - (2L)^{-1}\Vert 
        \nabla f(x) - \nabla f(y)
    \Vert_\star^2
    \\
    &= D_f(x, y) - (2L)^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2. 
\end{aligned}
$$

$\blacksquare$

---
### **Discussion**



