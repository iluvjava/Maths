[Nesterov Type Acceleration via Proximal Point Method Part I](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20I.md)

---
### **Intro**

We need to re-derive the Lyponouv convergence theorem to allows for more genericity so that it can be applied for proving the convergence for more varieties of the accelerated gradient methods. 

#### **ToC for VS Code Viewing**
- [**Intro**](#intro)
  - [**ToC for VS Code Viewing**](#toc-for-vs-code-viewing)
  - [**ToC for Obsidian Notebook**](#toc-for-obsidian-notebook)
- [**Prelimaries**](#prelimaries)
  - [**Lemma 0.1 | Nesterov Gradient Mapping**](#lemma-01--nesterov-gradient-mapping)
  - [**Lemma 0.2 | Linear Lower Bound of Gradient Mapping**](#lemma-02--linear-lower-bound-of-gradient-mapping)
- [**Varieties of Nesterov Accelerated Gradient**](#varieties-of-nesterov-accelerated-gradient)
  - [**Def 1.1 | Nes 2.2.7**](#def-11--nes-227)
  - [**Definition 1.2 | Accelerated Gradient Generic PPM Form**](#definition-12--accelerated-gradient-generic-ppm-form)
  - [**Definition 1.3 | Accelerated Gradient Strongly Convex Generic PPM**](#definition-13--accelerated-gradient-strongly-convex-generic-ppm)
  - [**Definition 1.4 | Accelerated Gradient Bregman Strongly Convex PPM**](#definition-14--accelerated-gradient-bregman-strongly-convex-ppm)
  - [**Definition 1.5 | AG Tri-points generic form**](#definition-15--ag-tri-points-generic-form)
  - [**Definition 1.6 | Accelerated Gradient strongly convex Generic Triangular Form**](#definition-16--accelerated-gradient-strongly-convex-generic-triangular-form)
  - [**Definition 1.8 | AG Proximal Gradient Generic PPM Form**](#definition-18--ag-proximal-gradient-generic-ppm-form)
  - [**Definition 1.8' | AG Proximal Gradient Generic PPM Strongly Convex PPM Form**](#definition-18--ag-proximal-gradient-generic-ppm-strongly-convex-ppm-form)
  - [**Definition 1.9 | AG Proxmal Gradient Tri-Pints Form**](#definition-19--ag-proxmal-gradient-tri-pints-form)
  - [**Definition 1.9' | AG Proximal Gradient Strongly conex Generic Form**](#definition-19--ag-proximal-gradient-strongly-conex-generic-form)
  - [**Def 1.10 | Guller's Accelerated PPM**](#def-110--gullers-accelerated-ppm)
- [**Form Comparison**](#form-comparison)
  - [**Lemma 2.1 | Accelerated Gradient Generic Trianglar Form**](#lemma-21--accelerated-gradient-generic-trianglar-form)
  - [**Claim 2.2 | The Interpretation of the Ghost term z**](#claim-22--the-interpretation-of-the-ghost-term-z)
  - [**Lemma 2.3 | The Non-smooth Tri-Points Form**](#lemma-23--the-non-smooth-tri-points-form)
  - [**Claim 2.4 | The Interpretation of Strongly Convex Generic Triangular Form**](#claim-24--the-interpretation-of-strongly-convex-generic-triangular-form)
  - [**Claim 2.5 | The Nesterov 2.2.7 Shares the same Form as AG S-CVX Generic PPM Form**](#claim-25--the-nesterov-227-shares-the-same-form-as-ag-s-cvx-generic-ppm-form)
- [**Lyapunov Analysis**](#lyapunov-analysis)
  - [**Lemma 3.1 | The Lyapunov bounds of Smooth Generic Tri-Points**](#lemma-31--the-lyapunov-bounds-of-smooth-generic-tri-points)
  - [**Lemma 3.2 | Generic Lyapunov Bounds for Non-Smooth Generic Tri-Points (DEPRECATED)**](#lemma-32--generic-lyapunov-bounds-for-non-smooth-generic-tri-points-deprecated)
  - [**Lemma 3.3 | Generic Lypunov bound, Non-smooth**](#lemma-33--generic-lypunov-bound-non-smooth)
- [**Part III**](#part-iii)

#### **ToC for Obsidian Notebook**
```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```

---
### **Prelimaries**

The following concepts are crucial for introducing proximal gradient into the PPM interpretation frameworks of the accelerated gradient method!

#### **Lemma 0.1 | Nesterov Gradient Mapping**
> Let $h = g + f$ where $g$ is convex, $f$ is $L$-Lipschitz smooth and differentiable. 
> With the proximal gradient operator $\mathcal T_L(x) = [I + L^{-1}\partial g]^{-1}[I - L^{-1}\nabla f](x)$, and gradient mapping operator $\mathcal G_L(x) = L(x - \mathcal T(x))$, then it satisfies for all $x$: 
> $$
> \begin{aligned}
>   x^+ &= \mathcal T_L(x), 
>   \\
>   L(x - x^+) &\in  \nabla f(x) + \partial g(x^+) \ni \mathcal G_L(x). 
> \end{aligned}
> $$

**Proof**

$$
\begin{aligned}
    x^+ &= [I + L^{-1}\partial g]^{-1}\circ [I - L^{-1}\nabla f](x)
    \\
    [I + L^{-1}\partial g](x^+) &\ni [I - L^{-1}\nabla f](x)
    \\
    x^+ + L^{-1}\partial g(x^+) &\ni x - L^{-1}\nabla f(x)
    \\
    x^+ - x + L^{-1}\partial g(x^+) &\ni L^{-1}\nabla f(x)
    \\
    L(x^+ - x) + \partial g(x^+) &\ni - \nabla f(x)
    \\
    L(x - x^+) &\in \nabla f(x) + \partial g(x^+)
    \\
    \mathcal G_L(x) &\in \nabla f(x) + \partial g(x^+). 
\end{aligned}
$$

#### **Lemma 0.2 | Linear Lower Bound of Gradient Mapping**
> Continuing from previous lemma, now with $f$ being $\mu \ge 0$ strongly convex. 
> Fix any $x$, let $x^+ = \mathcal T_L(x)$, then we have the inequality for all $z$: 
> $$
> \begin{aligned}
>     h(z) &\ge 
>     h(x^+) + \langle \mathcal G_L (x), z - x\rangle + 
>     \frac{L}{2}\Vert x - x^+\Vert^2 + \frac{\mu}{2}
>     \Vert z - x\Vert^2. 
> \end{aligned}
> $$

**Observations**

Set $z = x^+$, it's: 

$$
\begin{aligned}
    h(x^+) &\ge 
    h(x^+) + \langle L(x - x^+), x^+ - x \rangle + 
    (L/2)\Vert x - x^+\Vert^2 + (\mu/2)\Vert x^+ -x\Vert^2
    \\
    &= h(x^+) - (L/2)\Vert x - x^+\Vert^2 + (\mu/2) \Vert x^+ - x\Vert^2
    \\
    &= h(x^+) - ((L - \mu)/2)\Vert x^+ - x\Vert^2, 
\end{aligned}
$$

so unless $x^+ = x$ (minimum of the function), or $L= \mu$, it's not an equality at $z = x^+$. 
When $g \equiv 0$, it reduces to 

$$
\begin{aligned}
    x' &= \prox{\eta g}(x), 
    \\
    g(z) &\ge
    g(x') + \langle \mathcal \partial g(x'), z - x\rangle
    \\
    &= 
    g(x') + \eta^{-1}\langle \mathcal x - x', z - x\rangle, 
\end{aligned}
$$

which is for the proximal point. 

**Proof**

Directly from the $L$-smoothness of $f$, $\mu\ge 0$ strong convexity of $f$ and convesity of $g$, it has 
$$
\begin{aligned}
    &f(x^+) \le 
    f(x) + \langle \nabla f(x), x^+ - x\rangle
    + \frac{L}{2}\Vert x - x^+\Vert^2, 
    \\
    &
    f(x) \le f(z) - \langle \nabla f(x), z - x\rangle
    - \frac{\mu}{2}\Vert z - x\Vert^2
    , 
    \\
    &g(x^+) \le 
    g(z) + \langle \partial g(x^+), x^+ - z\rangle. 
\end{aligned}
$$

Now, consider adding $g(x^+)$ to the first inequality from above we get 

$$
\begin{aligned}
    h(x^+) &= f(x^+) + g(x^+)
    \\&
    \begin{aligned}
        &\le 
        \left(
            f(x) + \langle \nabla f(x), x^+ - x\rangle
            + \frac{L}{2}\Vert x - x^+\Vert^2
        \right)
        \\
        &\qquad  
        + (g(z) + \langle \partial g(x^+), x^+ - z\rangle)
    \end{aligned}
    \\&
    \begin{aligned}
        &\le 
        \left(
            f(z) - \langle \nabla f(x), z - x\rangle
            - \frac{\mu}{2}\Vert z - x\Vert^2
            + \langle \nabla f(x), x^+ - x\rangle
            + 
            \frac{L}{2}\Vert x - x^+\Vert^2
        \right)
        \\
        &\qquad 
        +
        (g(z) + \langle \partial g(x^+), x^+ - z\rangle)
    \end{aligned}
    \\&
    \begin{aligned}
        &= 
        (f(z) + h(z)) 
        \\
        &\qquad 
        + \left(
            \langle \nabla f(x), x - z\rangle + 
            \langle \nabla f(x), x^+ - x\rangle + 
            \langle \partial g(x^+), x^+ - z\rangle
        \right) 
        \\ 
        &\qquad 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\& 
    \begin{aligned}
        &= h(z) + 
        \left(
            \langle \nabla f(x), x - x^+ + x^+ - z\rangle + 
            \langle \nabla f(x), x^+ - x\rangle + 
            \langle \partial g(x^+), x^+ - z\rangle
        \right)
        \\
        &\qquad 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\& 
    \begin{aligned}
        &= h(z) + 
        \langle \nabla f(x) + \partial g(x^+), x^+ - z\rangle 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\& 
    \begin{aligned}
        &= h(z) + 
            \langle \mathcal G_L(x), x^+ - z\rangle 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\& 
    \begin{aligned}
        &= h(z) + \langle L(x - x^+), x^+ - x + x - z\rangle 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\&
    \begin{aligned}
        &= h(z) + 
        \underbrace{\langle L(x - x^+), x - z\rangle}_{
            = - \langle \mathcal G_L (x), z - x\rangle
        }
        - \frac{\mu}{2}\Vert z - x\Vert^2
        - \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}. 
\end{aligned}
$$

Substituting $\mathcal G_L(x) = L (x - x^+)$ to the above expression, rearrange it a bit will recover the desired inequalities. 
Therefore, the inequality is justified. 




---
### **Varieties of Nesterov Accelerated Gradient**

The analysis of PPM eventually extends to all varieties of Nesterov accelerated gradient methods. 

#### **Def 1.1 | Nes 2.2.7**
> Described in Nesterov ^[Y. Nesterov, Lectures on Convex Optimization, vol. 137. in Springer Optimization and Its Applications, vol. 137. Cham: Springer International Publishing, 2018. doi: 10.1007/978-3-319-91578-4.] (2.2.7), is an accelerated gradient method. 
> Here we faithfully resented it as the way it is in the book.
> Let $f$ be a $L$ Lipschitz smooth and $\mu\ge 0$ strongly convex function. 
> Choose $x_0$, $\gamma_0 > 0$, set $v_0 = x_0$, for iteration $k\ge 0$ it: 
> 1. Computes $\alpha_k \in (0, 1)$ by solving $L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 2. Set $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 3. Choose $y_k = (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)$. Compute $f(y_k)$ and $\nabla f(y_k)$. 
> 4. Find $x_{k + 1}$ such that $f(x_{k + 1}) \le f(y_k) - (2L)^{-1} \Vert \nabla f(y_k)\Vert^2$. 
> 5. Set $v_{k + 1} = \gamma_{k+1}^{-1}((1 - \alpha_k)\gamma_kv_k + \alpha_k \mu y_k - \alpha_k \nabla f(y_k))$. 

**Remarks**

For a faithful derivation of the algorithm as written in Nesterov's book, visit [Nesterov Estimating Sequence](../../MATH%20602%20Nesterov%20Acceleration/Nesterov%20Original%20Conception%20of%20Momentum%20Method.md) for more information. 
Claimed by Ahn ^[K. Ahn and S. Sra, “Understanding nesterov’s acceleration via proximal point method.” arXiv, Jun. 02, 2022. doi: 10.48550/arXiv.2005.08304.], the above Nesterov accelerated gradient fits the generic form of the algorithm: 

$$
\left\lbrace
\begin{aligned}    
    y_t &= \alpha_t x_t + (1 - \alpha_t)z_t
    \\
    x_{t + 1} &= L_t x_t + (1 - L)y_t - \gamma_t \nabla f(y_t)
    \\
    z_{t + 1} &= y_t - \delta_t \nabla f(y_t)
\end{aligned}
\right.
$$



#### **Definition 1.2 | Accelerated Gradient Generic PPM Form**
> Let $f$ be convex and differentiable with Lipschitz gradient, define $l_f(x; y) = f(y) + \langle \nabla f(y), y - x\rangle$ to be a linearization of $f$ at $y$. 
> for all $x_0, y_0 \in \R^n$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$
> Here we assume that $\eta_{i} > 0$ for all $i \in \N$. 





#### **Definition 1.3 | Accelerated Gradient Strongly Convex Generic PPM**
> Let $f$ be convex and differentiable with Lipschitz gradient and $\mu\ge0$-strongly convex, define $l_f(x; y) = f(y) + \langle \nabla f(y), y - x\rangle$ to be a linearization of $f$ at $y$. 
> for all $x_0 \in \R^n$, and let $y_0 = x_0$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{\mu}{2}\Vert x - y_t\Vert^2 + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$
> Here we assume that $\eta_{t + 1} > 0$ for all $t \in \N$. 

**Observations**

Setting $\mu = 0$ this reduces to the previous definition. 

#### **Definition 1.4 | Accelerated Gradient Bregman Strongly Convex PPM**
> With $Q\subseteq \R^n$ closed and convex, define $\Psi: Q \mapsto \overline \R$. 
> Define $f: \mathbb R^n \mapsto \mathbb R$ be $L$-Smooth wrt to norm $\Vert \cdot\Vert$ which is not necessarily the Euclidean norm. 
> With $h:Q \mapsto \overline \R$ strongly convex wrt $\Vert \cdot\Vert$, and differentiable on $\text{int}(Q)$ so it induces Bregmandivergence $D_h(u, v)$ for all $u, v \in Q$. 
> Then we define the following algorithm: 
> $$
> \begin{aligned}
>     y_t &= (1 + \eta_t L)^{-1}(x_t + L\eta_t z_t),
>     \\
>     x_{t + 1} &= 
>     \argmin{x \in Q} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{1}{\tilde\eta_{t + 1}} D_h(x, x_t) + \Psi(x)
>     \right\rbrace, 
>     \\
>     z_{t + 1} &= 
>     (1 + L\eta_t)^{-1} 
>     (x_{t + 1} + L\eta_t z_t). 
> \end{aligned}
> $$

And in this case, the momentum algorithm works in a non-smooth composite settings inside of a constrained set $Q$. 


**Remarks**

It is claimed by Ahn, Sra in 5.17 of their writing that the above PPM based algorithm is an interpretation of Nesterov (6.1.3) from Nesterov's textbook. 

#### **Definition 1.5 | AG Tri-points generic form**
> The algorithm update the iterates $(x_{t}, z_{t}, y_t)$ for all $t \in \N$ according to 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
>     \\
>     y_{t + 1} &= 
>     (1 + L\eta_{t + 1})^{-1}
>     (
>     x_{t + 1} + L\eta_{t + 1}z_{t + 1}
>     ). 
> \end{aligned}
> $$

**Observations**

We make some observations about the base case of this algorithm. 
To start the above algorithm, we can uses different base cases for the parameters in the algorithm. 
1. We can choose $y_0, x_0$, and a sequence $\eta_i, \tilde \eta_i > 0$ for all $i \in \N$ to recursively define $(x_i, y_i, z_i)$ for all $i \in \N$. This requires two initial conditions for the algorithm. 
2. We can choose $x_0, z_0,\eta_0$ and sequence $\eta_i, \tilde \eta_i, i\in \N$ to determine $y_0 = (1 + L\eta_0)^{-1}(x_0 + L\eta_0 z_0), x_1, y_1$, recursively defining the updates for iterates $(y_i, x_{i + 1}, z_{i + 1})$ for $i \in \N \cup \{0\}$. This requires information on $\eta_0$ to start the algorithm. 
3. The case of choosing $y_0, z_0$ also requires knowing $\eta_0$ to determine $x_0$. 

Finally, observe the spacial case that when $\eta_i = 0$ for all $i\in \N$, the above algorithm reduces to gradient descent with stepsize $\tilde \eta_i$ because $y_t = x_t$ for all $t$. 




#### **Definition 1.6 | Accelerated Gradient strongly convex Generic Triangular Form**
> With $f$ $L$-Lipschitz smooth and $\mu$ storngly convex, we can derive similar triangle with the following: 
> $$
> \begin{aligned}
>     & (1 + \tilde \eta_{t + 1}\mu)x_{t + 1} 
>     = 
>     x_t + \mu\tilde \eta_{t + 1}y_t - \tilde \eta_{t + 1}\nabla f(y_t)
>     \\
>     & z_{t + 1} = y_t - L^{-1} \nabla f(y_t)
>     \\
>     & (1 + L\eta_{t + 1})y_{t + 1} = x_{t + 1} + L \eta_{t + 1} z_{t + 1}
> \end{aligned}
> $$

**Observations**

The above algorithm is derived from the generic strongly convex PPM form. 



#### **Definition 1.8 | AG Proximal Gradient Generic PPM Form**
> Let $h=f + g$ be the sum of convex function $g$ and convex differentiable $f$ with $L$-Lipschitz gradient. 
> Define the proximal gradient and gradient mapping operator operator: 
> $$
> \begin{aligned}
>     \mathcal T_L^{g, f}(x) &:=  
>     \prox{L^{-1}g}\left(x - L^{-1}\nabla f(x)\right)
>     \\
>     &= 
>     \argmin{u}
>     \left\lbrace
>         g(u) + f(x) + \langle \nabla f(x), u - x\rangle
>         + 
>         \frac{L}{2}\Vert u - x\Vert^2
>     \right\rbrace,
>     \\
>     \mathcal G_L^{g, f}(x) &= 
>     L(x - \mathcal T_L^{g, f}(x)). 
> \end{aligned}
> $$
> Omitting the superscript $f, g$ on $\mathcal T, \mathcal G$ for simplicity since it's clear in the context. 
> Define the linear lower bounding function for $f$ at $y$, for all $x$: 
> $$
> \begin{aligned}
>     l_h(x; y) &= h(\mathcal T_L y) + \langle \mathcal G_L(y), x - y \rangle \le h(x), 
> \end{aligned}
> $$
> With that we define the algorithm:
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>         l_h(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} 
>         \Vert x - x_t\Vert^2
>     \right\rbrace,
>     \\
>     y_{t + 1}&= 
>     \argmin{x}
>     \left\lbrace
>         h(y_t^+) + \langle \mathcal G_L(y_t), x - y_t\rangle + \frac{L}{2}\Vert x -y_t\Vert^2
>         + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace
>     \\
>     &= \argmin{x} \left\lbrace l_h(x; y^+_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2\right\rbrace. 
> \end{aligned}
> $$

#### **Definition 1.8' | AG Proximal Gradient Generic PPM Strongly Convex PPM Form**
> Let $h=f + g$ be the sum of convex function $g$ and convex differentiable $f$ with $L$-Lipschitz gradient and $\mu \ge 0$ strongly convex. 
> Let the gradient mapping operator be denoted by $\mathcal G_L$, and $\mathcal T_L$ to be the proximal gradient operator. 
> We define the following algorithm. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>     l_h(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} 
>     \Vert x - x_t\Vert^2 + \frac{\mu}{2}\Vert x - \mathcal T_L y_t\Vert^2
> \right\rbrace,
> \\
> y_{t + 1}&= 
> \argmin{x}
> \left\lbrace
>     h(y_t^+) + \langle \mathcal G_L(y_t), x - y_t\rangle + \frac{L}{2}\Vert x -y_t\Vert^2
>     + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
> \right\rbrace
> \\
> &= \argmin{x} \left\lbrace l_h(x; y^+_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2\right\rbrace. 
> \end{aligned}
> $$

#### **Definition 1.9 | AG Proxmal Gradient Tri-Pints Form**
> With $h = f + g$, where $g$ is convex, $f$ is convex and $L$-Lipschitz smooth. 
> Define proximal gradient and gradient mapping operator 
> $$
> \begin{aligned}
>     \mathcal T_L(x) 
>     &:= \prox{L^{-1}g}(x - L^{-1}\nabla f(x)), 
>     \\
>     x^+ &= \mathcal T_L(x), 
>     \\
>     \mathcal G_L(x) 
>     &:= L(x - x^+). 
> \end{aligned}
> $$
> Then the algorithm updates $(y_t, x_{t + 1}, z_{t + 1})$ with expression: 
> $$
> \begin{aligned}
>     y_t^+ &= \mathcal T_L(y_t)
>     \\
>     y_t &= (1 + L\eta_t)^{-1}(x_t + L\eta_t z_t)
>     \\
>     x_{t + 1} &= x_t - \tilde \eta_{t + 1} \mathcal G_L(y_t)
>     \\
>     z_{t + 1} &= y_t - L^{-1}\mathcal G_L(y_t)
> \end{aligned}
> $$
> where the base case has $y_0 = x_0$. 

**Observations**

The same observations as in the smooth case still applies here. 

**Remarks**

This algorithm exists in the literatures. 
The closest one is in Nesterov's 2018's book, equation (2.2.63), however, instead of the proximal gradient, Nesterov has projected gradient instead. 


#### **Definition 1.9' | AG Proximal Gradient Strongly conex Generic Form**
> Continued from definition 1.8', the PPM algorithm can be reduced to generic form by completing the squares, producing: 
$$
\begin{aligned}

\end{aligned}
$$


#### **Def 1.10 | Guller's Accelerated PPM**


See [Accelerated PPM Method](Accelerated%20PPM%20Method.md) for more context about this algorithm. 

---
### **Form Comparison**

In this section, we measure, and compare different forms listed above. 
We show that the Nesterov's 2.2.7 accelerated gradient is the same form as the accelerated gradient PPM strongly convex form. 
We show that the Generic triangle form is the same as the generic PPM form. 

#### **Lemma 2.1 | Accelerated Gradient Generic Trianglar Form**
> The AG Tri-points generic form is equivalent to the AG PPM generic form, yielding the following equalities: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
>     \\
>     y_{t + 1} &= 
>     (1 + L\eta_{t + 1})^{-1}
>     (
>     x_{t + 1} + L\eta_{t + 1}z_{t + 1}
>     ). 
> \end{aligned}
> $$
> Let the base case be: $y_0 = x_0$. 



**Demonstrations**

Solving the optimality on the first PPM yields: 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f(y_t) + 
    \frac{1}{\tilde \eta_{t + 1}} (x - x_t)
    \\
    x &= x_t - \tilde \eta_{t + 1} \nabla f(y_t).
\end{aligned}
$$

Therefore, $x_{t + 1} = x_t - \tilde \eta_{t + 1}\nabla f(y_y)$. 
Similarly, for the updates of $y_{t + 1}$, we have optimality condition of 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f (y_t) + L (x - y_t) + \eta_{t + 1}^{-1} (x - x_{t + 1})
    \\
    \mathbf 0 &= \eta_{t + 1}\nabla f (y_t) + \eta_{t + 1}L (x - y_t) + x - x_{t + 1}
    \\
    \mathbf 0 &= 
    \eta_{t + 1}\nabla f(y_t) -\eta_{t + 1} Ly_t + (\eta_{t + 1}L + 1)x - x_{t + 1}
    \\
    (1 + \eta_{t + 1}L)x
    &= 
    x_{t + 1} - \eta_{t + 1}\nabla f(y_t) + \eta_{t + 1}L y_t
    \\
    \text{define: } y_{t + 1} &:= x. 
\end{aligned}
$$

In the above expression, it hides a step of gradient descent, continuing it we have 

$$
\begin{aligned}
    (1 + \eta_{t + 1}L)y_{t + 1} &= 
    x_{t + 1}  + \eta_{t + 1}L (-L^{-1}\nabla f(y_t) + y_t)
    \\
    \text{let: } z_{t + 1} &= y_t - L^{-1}\nabla f(y_t), \text{ so, }
    \\
    (1 + \eta_{t + 1}L)y_{t + 1} &= 
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}. 
\end{aligned}
$$

Combining it yields the tree points update format 

$$
\begin{aligned}
    x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
    \\
    z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
    \\
    y_{t + 1} &= 
    (1 + L\eta_{t + 1})^{-1}
    (
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}
    ), 
\end{aligned}
$$

the ordering of $x_{t +1}, z_{t + 1}$ can be permuted. 
The base case is when $t = 0$, and that produces directly $x_0 = y_0$ for the initial guess. 

**Remarks**

By the base case $x_0 = y_0$, the update sequence would be $z_1, y_1, x_1$, then increment in that order. 
Depending on the bas case, the order of the update will differ! 
If the base case is forced to be $x_0 = y_0 = z_0$, then we need update order $y_t, x_t, z_t$, or $y_t, z_t, x_t$. 




#### **Claim 2.2 | The Interpretation of the Ghost term z**
> From the generic PPM form of the accelerated gradient, we notice that the update for the vector $y_{t + 1}$ admits the following alternative representation: 
> $$
> \begin{aligned}
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace
>     \\
>     &= \argmin{x} \left\lbrace
>         f(y_t) 
>         - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 
>         + \frac{L}{2}\Vert x - z_{t + 1}\Vert^2
>         + \frac{1}{2\eta_{t + 1}} \Vert x - x_{t + 1}\Vert^2
>     \right\rbrace
>     \\
>     &= (1 + L \eta_{t + 1})^{-1} (x_{t + 1} + L\eta_{t + 1} z_{t + 1}). 
> \end{aligned}
> $$ 



**Demonstrations**

The step of gradient descent comes by conpleting the square: 

$$
\begin{aligned} 
    & \quad 
    l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 
    \\
    &= 
    f(y_t) + \langle \nabla f(y_t), x - y_t\rangle 
    + 
    \frac{L}{2}
    \left\Vert 
        x - (y_t - L^{-1}\nabla f(y_t)) - L^{-1}\nabla f(y_t)
    \right\Vert^2
    \\
    &= 
    f(y_t) + 
    \langle \nabla f(y_t), x - (y_t - L^{-1}\nabla f(y_t)) - L^{-1}\nabla f(y_t)\rangle 
    + 
    \frac{L}{2}
    \left\Vert 
        x - (y_t - L^{-1}\nabla f(y_t)) - L^{-1}\nabla f(y_t)
    \right\Vert^2
    \\
    &\quad  \text{Let }z_{t + 1} 
    = y_t - L^{-1}\nabla f(y_t)
    \\
    &= f(y_t) + \langle \nabla f(y_t), x - z_{t + 1} - L^{-1}\nabla f(y_t)\rangle
    + 
    \frac{L}{2}\left\Vert
         x - z_{t + 1} - L^{-1}\nabla f(y_t)
    \right\Vert^2
    \\
    &= 
    f(y_t) + \langle \nabla f(y_t), x - z_{t + 1}\rangle 
    - L^{-1}\Vert \nabla f(y_t)\Vert^2
    + 
    \frac{L}{2}\Vert x - z_{t + 1}\Vert^2 + 
    \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 - 
    L\langle L^{-1}\nabla f(y_t), x - z_{t + 1}\rangle
    \\
    &= f(y_t) + (1/(2L)- L^{-1})\Vert \nabla f(y_t) \Vert^2 + 
    \frac{L}{2}\Vert x - z_{t + 1}\Vert^2
    \\
    &= f(y_t) - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 + \frac{L}{2}\Vert x - z_{t + 1}\Vert^2. 
\end{aligned}
$$

Observe that besdies the $(L/2)\Vert x - z_{t + 1}\Vert^2$, the other terms are constant and hence giving us 

$$
\begin{aligned}
    y_{t + 1} &= \argmin{x}\left\lbrace
        \frac{L}{2}\Vert x - z_{t + 1}\Vert^2 + 
        \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
    \right\rbrace
    \\
    &= \argmin{x}\left\lbrace
        \left\Vert x - 
            \frac{Lz_{t + 1} + \eta_{t + 1}^{-1}x_{t + 1}}{
                L + \eta_{t + 1}^{-1}
            }
        \right\Vert^2
    \right\rbrace
    \\
    &= 
    \frac{
        L\eta_{t + 1}z_{t + 1} + 
        x_{t + 1}
    }{
        1 + L \eta_{t + 1}
    }
\end{aligned}
$$

Here we used the [Minimizer of Quadratic Sum, Weighted Average](../AMATH%20516%20Numerical%20Optimizations/Minimizer%20of%20Quadratic%20Sum,%20Weighted%20Average.md) tricks to simplify things quickly. 


**Remarks**

The term $z_t = y_t - L^{-1} \nabla f(y_t)$ is made with the goal to write $y_{t + 1}$ to be a convex combinations of $x_{t + 1}, z_{t + 1}$. 
This interpretation is useful. (More on this later probably, but it has something to do with adding non-smoothness). 
As the value of $\eta_t$ increases, $y_t$ gets closer to $z_t$. 
Anyway, the interpretation maybe somewhat important, but the ghost term, $z_{t +1}$ is upmost important in proving the convergence rate of the algorithms. 
This interpretation can be used directly to derive the equivalence between the generic PPM form and the generic similar triangle form. 


#### **Lemma 2.3 | The Non-smooth Tri-Points Form**
> The AG experimental Tri-point form can be derived from AG experiment PPM Form I. 
> Continuing from the definition of the Experimental Tri-point form we claim the following equalities: 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x}
>     \left\lbrace
>         l_h(x, y_t) + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace
>     \\
>     &= x_t - \tilde\eta_{t + 1} \mathcal G_L(y_t)
>     \\
>     y_{t + 1} &= \argmin{x}
>     \left\lbrace
>           h(y_t^+) + \langle \mathcal G_L(y_t), x - y_t\rangle + \frac{L}{2}\Vert x -y_t\Vert^2 + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace
>     \\
>     &= (1 + L\eta_{t + 1})^{-1}
>     (x_{t + 1} + L\eta_{t + 1}(y_t - L^{-1}\mathcal  G_L(y_t))). 
> \end{aligned}
> $$

**Proof**

Let $y_t^+ = \mathcal T_L(y_t)$, recall that $l_h(x; y_t) = h(y_t^+) + \langle \mathcal G_L(y_t), x -y_t\rangle \le f(x)$ by the definition of algorithm. 
Since $l_h(x; y_t)$ is a simple linear function wrt $x$, it's not hard to minimize the quandratic where we can get $x_{t + 1} = x_t - \tilde\eta_{t + 1} \mathcal G_L(y_t)$. 
For $y_{t + 1}$, observe that we can complete the square on the second and the third terms: 

$$
\begin{aligned}
    & \frac{L}{2}\left(
        2\langle L^{-1}\mathcal G_L(y_t), x - y_t\rangle + 
        \Vert x - y_t\Vert^2
    \right)
    \\
    &= 
    \frac{L}{2}
    \left(
        - \Vert L^{-1} \mathcal G_L(y_t)\Vert^2  
        + \Vert L^{-1} \mathcal G_L(y_t)\Vert^2 
        + 
        2\langle L^{-1} \mathcal G_L(y_t), x - y_t\rangle + 
        \Vert x - y_t\Vert^2
    \right)
    \\
    &= \frac{L}{2}\left(
        - \Vert L^{-1}\mathcal G_L(y_t)\Vert^2  
        + \Vert x - (y_t - L^{-1}\mathcal G_L(y_t))
        \Vert^2
    \right), 
\end{aligned}
$$

therefore it transforms into 

$$
\begin{aligned}
    y_{t + 1} &=\argmin{x} \left\lbrace
        \frac{L}{2}\left\Vert 
            x - (y_t - L^{-1}\mathcal G_L(y_t))
        \right\Vert^2
        + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
    \right\rbrace
    \\
    &=
    \frac{(y_t - L^{-1}\mathcal G_L(y_t)) + x_{t + 1}}{L + \eta_{t + 1}^{-1}},
\end{aligned}
$$

Define $z_{t + 1} = y_t - \mathcal G_L(y_t) = \mathcal T_L(y_t)$, which is the proximal gradient set, then the above expression simplifies to 

$$
y_{t + 1} = (1 + L\eta_{t +1})^{-1}(x_{t + 1}+ L\eta_{t + 1}z_{t + 1}). 
$$

As a sanity checks, notice that when $h \equiv 0$, $\mathcal G_L(x) = \nabla f(x)$ by definition, making it the same algorithm as the case when $h$ is smooth. 

**Remarks**

The expression we were minimizing to get $y_{t + 1}$ as the minimizer, is a simple quadratic. Given that the original function $h$ is potentially non-smooth, we have that it's not an upper bound of $h(x)$. 
The upper bound interpretation of the smooth case as proposed by Ahn, Sra for the update of $y_{t + 1}$ fails when $h$ is non-smooth! 


#### **Claim 2.4 | The Interpretation of Strongly Convex Generic Triangular Form**
> The strongly convex generic triangular form is a consequence of the S-CVX generic PPM from. 
> The lower bounding function $l_f(x, y_t) = f(y_t) + \langle \nabla f(y_t), x - y_t\rangle$ we have the following chain of equalities: 
> $$
> \begin{aligned}
>     y_t^+ &= y_t - \mu^{-1}\nabla f(y_t)
>     \\
>     x_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f (x; y_t) + \frac{\mu}{2} \Vert x - y_t\Vert^2 + 
>         \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2 
>     \right\rbrace
>     \\
>     &= (1 + \mu\tilde \eta_{t + 1})^{-1}
>     \left(
>         x_t + \mu \tilde \eta_{t + 1}y_t^{+}
>     \right)
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t)
>     \\
>     y_{t + 1} &= (1 + L\eta_{t + 1})^{-1}(x_{t + 1} + L \eta_{t + 1} z_{t + 1})
> \end{aligned}
> $$
> The update for $y_{t + 1}$ is the same as the generic triangular case. 


**Demonstrations**

Follow a very similar process as the previous claim, but instead with $L = \mu, z_{t + 1} = y_t^+$, it should produce: 

$$
\begin{aligned}
    l_f(x; y_t) + \frac{\mu}{2}\Vert x - y_t\Vert^2
    &= 
    f(y_t) - \frac{1}{2\mu}\Vert \nabla f(y_t)\Vert^2 + \frac{\mu}{2}\Vert x - y_t^+\Vert^2
    \\
    \implies 
    x_{t + 1} &= 
    \argmin{x} 
    \left\lbrace
        f(y_t) - \frac{1}{2\mu}\Vert \nabla f(y_t)\Vert^2 + \frac{\mu}{2}\Vert x - y_t^+\Vert^2
        + 
        \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
    \right\rbrace
    \\
    &= 
    \argmin{x}
    \left\lbrace
        \frac{\mu}{2}\Vert x - y_t^+\Vert^2 + 
        \frac{2}{\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
    \right\rbrace
    \\
    &= (\mu + \tilde \eta_{t + 1})^{-1}
    (\mu y_t^+ + \tilde \eta_{t + 1}x_t)
    \\
    &= (1 + \tilde \eta_{t + 1}\mu)^{-1}
    (x_t + \mu\tilde \eta_{t + 1}y_t^+). 
\end{aligned}
$$


**Remarks**

This particular interpretation **may** assist us with reverse engineering Nesterov's estimating sequence's proof for his 2.2.7 method. 

#### **Claim 2.5 | The Nesterov 2.2.7 Shares the same Form as AG S-CVX Generic PPM Form**

> The Nesterov 2.2.7 accelerated gradient algorithm applied to $f$ that is $\mu$ strongly convex and AG strongly convex generic PPM have the same form. 
> By the observation that the strongly convex generic PPM reduces to Accelerated gradient strongly convex generic triangular form, we claim that the following 2 algorithms have the same representation. 
> The Nesterov 2.2.7 is
> $$
> \begin{aligned}
>     \text{find } &
>     \alpha_k \in (0, 1) 
>     \text{ s.t: } L\alpha_k^2 
>     = (1 - \alpha_k)\gamma_k + \alpha_k \mu = \gamma_{k + 1} 
>     \\
>     y_k &= 
>     \left(
>         \gamma_k + \alpha_k \mu
>     \right)^{-1} \left(
>         \alpha_k \gamma_k v_k + \gamma_{k + 1}x_k
>     \right)
>     \\
>     \text{find } & x_{k + 1} \text{ s.t: }
>     f(x_{k + 1})
>     = f(y_k) - (2L)^{-1}\Vert \nabla f(y_k)\Vert^2
>     \\
>     v_{k+1} &= 
>     \gamma_{k + 1}^{-1} 
>     \left(
>         (1 - \alpha_k) \gamma_k v_k + 
>         \alpha_k \mu y_k 
>         - \alpha_k \nabla f(y_k)
>     \right). 
> \end{aligned}
> $$
> 
> And the Strongly convex Generic Triangular form derived from the AG strongly convex Generic PPM form can be presented as
> $$
> \begin{aligned}
>     x_{t + 1} 
>     & = 
>     (1 + \tilde \eta_{t + 1}\mu)^{-1}
>     (x_t + \mu\tilde \eta_{t + 1}y_t - \tilde \eta_{t + 1}\nabla f(y_t))
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t)
>     \\
>     y_{t + 1} &= 
>     (1 + L\eta_{t + 1})^{-1}
>     (x_{t + 1} + L \eta_{t + 1} z_{t + 1}).
> \end{aligned}
> $$
> And we want to present that these two forms are the same. 
> $x_{t + 1}$ from the AG SCVX Generic PPM has the same update as $v_{t + 1}$, similarly, $y_{t + 1}$ has the same update as $y_k$, and $z_{t + 1}$ the ghost term is the same as $x_{k + 1}$ the descent term in Nestrov 2.2.7. 

**Demonstrations**

We simplify the Nesterov form into the Strongly convex Generic Triangular Form. 
Consider update for $v_{k + 1}$ by substituting $\gamma_{k+1} = (1 - \alpha_k) \gamma_k + \alpha_k \mu$ as informed by the first step of the algorithm, we have 

$$
\begin{aligned}
    v_{k + 1} &= 
    ((1 - \alpha_k)\gamma_k + \alpha_k \mu)^{-1}
    \left(
        (1 - \alpha_k)\gamma_k v_k + \alpha_k \mu y_k - \alpha_k \nabla f(y_k)
    \right)
    \\
    &= ((1 - \alpha_k)\gamma_k + \alpha_k \mu)^{-1}
    (
        (1 - \alpha_k)\gamma_k v_k + \alpha_k \mu(y_k - \alpha_k \mu^{-1}\nabla f(y_k))
    )
    \\
    &= 
    \left(
        1 + \frac{\alpha_k \mu}{(1 - \alpha_k)\gamma_k}
    \right)^{-1}
    \left(
        v_k
        + 
        \left(
            \frac{\alpha_k \mu}{(1 - \alpha_k)\gamma_k} 
        \right)
        \left(
            y_k 
            - \alpha_k \mu^{-1}\nabla f(y_k)
        \right)
    \right). 
\end{aligned}
$$
Notice that the right hand size has the same form as $x_{t + 1}$. 
This is true by the observation that 
$$
\begin{aligned}
    x_{t + 1} &= 
    (1 + \tilde\eta_{t + 1}\mu)^{-1}
    \left( 
        x_t + \mu\tilde \eta_{t + 1}
        \left(y_t - \mu^{-1}\nabla f(y_t)\right)
    \right). 
\end{aligned}
$$

Similarly, when $\mu = 0$, consider $v_{k + 1}$ from that start that 
$$
\begin{aligned}
    v_{k + 1} 
    &= ((1 - \alpha_k)\gamma_k)^{-1}
    (
        (1 - \alpha_k)\gamma_k v_k
        + \alpha_k \mu y_k - \alpha_k \nabla f(y_k)
    )
    \\
    &= 
    v_k - \alpha_k((1 - \alpha_k)\gamma_k)^{-1}\nabla f(y_k)
\end{aligned}
$$

which is the same as the AG generic PPM form where 

$$
x_{t + 1} = x_t - \tilde \eta_{t + 1}\nabla f(y_t)
$$

Next, we consider $y_{k}$ from the Nesterov 2.2.7, and we want to write it as a convex combination of the vector $v_k,x_k$. 
To show that the updates $y_k$ can are of the same form, start by considering that 

$$
\begin{aligned}
    \gamma_{k + 1 } &= (1 - \alpha_k)\gamma_k + \alpha_k \mu
    \\
    &= (\gamma_k + \alpha_k \mu) - \alpha_k \gamma_k, 
\end{aligned}
$$

with the grouping we have 

$$
\begin{aligned}
    y_k &= \left(
        \gamma_k + \alpha_k \mu
        \right)^{-1} \left(
            \alpha_k \gamma_k v_k + \gamma_{k + 1}x_k
        \right)
    \\
    &= 
    \left(
        \gamma_k + \alpha_k \mu
    \right)^{-1}
    \left(
        \alpha_k \gamma_k v_k 
        + 
        ((\gamma_k + \alpha_k\mu) - \alpha_k\gamma_k)x_k
    \right)
    \\
    &= 
    \left(
        \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}
    \right)v_k
    + 
    \left(
        1 - \frac{\alpha_k\gamma_k }{\gamma_k + \alpha_k \mu}
    \right)x_k, 
\end{aligned}
$$

which is indeed, a convex combination of $v_k, x_k$, if, we assume that $(\alpha_k\gamma_k)(\gamma_k + \alpha_k \mu)^{-1}$ is in the interval $(0, 1)$. 
We can assuem this, see remark for more info about this assumption. 
However, it would require more works to express $\eta_t, \tilde\eta$ from the Generic PPM using $\gamma_k, \alpha_k$. 

**Remarks**

Allow the description of PPM into the Nesterov acceleration sequence would be something new and not found in the original literatures. 
Using $\gamma_k = L\alpha_{k-1}^2$, we can simplify so that 

$$
\begin{aligned}
    \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}
    &= 
    \frac{L\alpha_k \alpha_{k - 1}^2}{L\alpha_{k - 1}^2 + \mu \alpha_k}
    \\
    &= \frac{\alpha_k \alpha_{k - 1}^2}{1 + q_f \alpha_k \alpha_{k - 1}^{-2}} \in (0, 1), 
\end{aligned}
$$

where $q_f = \mu / L \in (0, 1)$ and we recall the fact that the sequence $(\alpha_k)_{k \in \N}$ has $\alpha_k \in (0, 1)$ and $\sum_{i = 1}^{\infty} \alpha_k = \infty$. 
For more information, see [Nesterov Estimating Sequence](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md) for more information. 


---
### **Lyapunov Analysis**

In this section, we focus on applying the Lyapunov analysis method on the abstract form of accelerated gradient method. 
This is abstract because we only made use of the Lipschitz smoothnessof the gradient and the lower bound and theupper bound. 
Specific sequences of updates in the algorithm is not yet used in the proof. 

#### **Lemma 3.1 | The Lyapunov bounds of Smooth Generic Tri-Points**
> Continue from Lemma 2.1, by anchoring on $f(z_{t + 1})$ and using the Proximal Inequality of PPM, we can derive these inequalities
> $$
> \begin{aligned}
>     \Upsilon_{1, t + 1}^{\text{AG}}&= 
>     \tilde \eta_{t + 1} (f(z_{t + 1}) - f(x_*))
>     + \frac{1}{2}(
>         \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_t - x_* \Vert^2
>     )  
>     \\
>     & \quad \le 
>     - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
>     \frac{\tilde \eta_{t + 1} L}{2}\Vert z_{t + 1} - y_t\Vert^2
>     - 
>     \langle \tilde \eta_{t + 1} \nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle, 
>     \\
>     \Upsilon_{2, t + 1}^{\text{AG}} 
>     &= f(z_{t + 1}) - f(z_t) 
>     \le 
>     \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + 
>     \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
> \end{aligned}
> $$

**Observations**

The first inequality is not similar to the the gradient descent anaysis since it has $f(z_{t + 1})$ instead of $f(x_{t + 1})$. 
IN the above inequality, $\eta_{t + 1}$ is not playing any roles yet. 

**Proof**

Define $\phi_t(x) = \tilde \eta_{t +1}(f(y_t) + \langle \nabla f(y_t), x- y_t\rangle)$.  
With $L$-smoothness of $f$ in mind, consider the following sequence of inequalities: 
$$
\begin{aligned}
    \phi_t(x_{t + 1}) 
    &= 
    \tilde\eta_{t + 1} (f(y_t) + \langle \nabla f(y_t), x_{t + 1} - y_t\rangle)
    \\
    \phi_t (x_{t + 1}) &= \tilde \eta_{t + 1}(
        f(y_t) + \langle \nabla f(y_t), (x_{t +1} - z_{t + 1}) + (z_{t + 1} - y_t) \rangle
    )
    \\
    &\ge 
    \tilde \eta_{t + 1}
    \left(
        f(z_{t + 1}) - \frac{L}{2} \Vert z_{t + 1} - y_t\Vert^2 + 
        \langle \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \right), 
\end{aligned}
$$

Performing PPM on $\phi_t(x)$ at $x_t$, use PPM Lyapunov inequality, substituing yields equivalences for all $x_*$: 
$$
{\small
\begin{aligned}
    &\phi_t(x_{t + 1}) - \phi_t(x_*) + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    - \frac{1}{2}\Vert x_* - x_t\Vert^2 
    \\
    \quad 
    &\le 
    - \frac{1}{2} \Vert x_{t + 1} - x_t\Vert^2 
    \\
    & 
    \tilde \eta_{t + 1}\left(
        f(z_{t + 1}) - \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
        + 
        \langle \nabla f(y_t), x_{t + 1} - z_{t + 1}\rangle
    \right) - \tilde \eta_{t + 1} f(x_*)
    + 
    \frac{1}{2}\left(
        \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_{t} - x_*\Vert^2
    \right)
    \\
    \quad &\le - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    \\
    \Upsilon_{1, t + 1}^{\text{AG}} := 
    & \tilde \eta_{t + 1} \left(
        f(z_{t + 1}) - f(x_*)
    \right) + \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2 
    - \frac{1}{2}\Vert x_{t} - x_*\Vert^2 
    \\
    \quad &\le 
    -\frac{1}{2} \Vert x_{t + 1 } - x_t\Vert^2 + 
    \frac{\tilde \eta_{t + 1}L}{2}\Vert z_{t + 1} - y_t\Vert^2 
    - \langle \tilde \eta_{t + 1}\nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle. 
\end{aligned}
}
$$

Observe that, the rhs and lhs of the Lyapunov inequality are anchored at $z_{t + 1}$. 
Similarly for the descent inequality we wish to obtain: 

$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &= f(z_{t + 1}) - f(y_t) + f(y_t) - f(z_t) 
    \\
    &\le 
    \langle \nabla f(y_t), z_{t + 1} - y_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \\
    \text{let }\Upsilon_{2, t + 1}^{\text{AG}} 
    &:= f(z_{t + 1}) - f(z_t)
\end{aligned}
$$

Which is the descent inequality anchored on $z_{t + 1}$. 
Merging the $(z_{t + 1} - y_t)$ with $y_t - z_t$ together yield the desired results. 

**Remarks**

These upper bounds are used for the derivation of the convergence rates for several variants of the Nesterov Accelerated gradient method. 
We want to emphizes that the above analysis differs from their gradient descent counter part by the observations that in the expression 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AG}}
    &= 
    \tilde \eta_{t + 1} (f(z_{t + 1}) - f(x_*))
    + \frac{1}{2}(
        \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_t - x_* \Vert^2
    ), 
\end{aligned}
$$

in here, $z_{t + 1}$ is the ghost term and $x_{t + 1}$ is the result of the first half of PPM, they don't match exactly as in the case for the Lyapunov analysis of gradient descent. 
The sitaution had been complicated. 
The use of $z_{t+1}$ and the way it's defined intrigues us. 

The second thing we want to emphasize is the use of 
$$
\begin{aligned}
    \phi_t(x) &\ge 
    \tilde \eta_{t +1}(f(y_t) + \langle \nabla f(y_t), x- y_t\rangle)
    \\
    &\ge \left(
        f(z_{t + 1}) - \frac{L}{2} \Vert z_{t + 1} - y_t\Vert^2 + 
        \langle \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \right) \quad \forall x
\end{aligned}
$$

is invoked with $x = x_{t +1}$ only, hence, the quantifier $\forall x$ is strictly stronger than necessary. 
In a sense, if we can relax the choice of $L$ to be larger so that the above condition is still true for just $x = x_{t + 1}$. 

The theorem is generic in the sense that it didn't make use what algorithms generate the iterates.
It can be phrase generically. 
Which will be the next claim 



#### **Lemma 3.2 | Generic Lyapunov Bounds for Non-Smooth Generic Tri-Points (DEPRECATED)**
> Continue from AG Proximal Gradient Generic PPM Form I, then we have the non-smooth analogous case of the Lyapunov upper bound: 
> $$
> \begin{aligned}
>     \Upsilon_{1, t + 1}^\text{AG}
>     &= 
>     \tilde\eta_{t + 1} (h(z_{t + 1}) - h(x_*)) + 
>     \frac{1}{2} (
>         \Vert x_{t + 1} - x_*\Vert^2
>         - 
>         \Vert x_t - x_*\Vert^2
>     )
>     \\
>     &\le 
>     - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
>     + \frac{\tilde\eta_{t + 1}L}{2}\Vert z_{t + 1} - y_t\Vert^2
>     - \langle 
>         \tilde\eta_{t + 1} \mathcal G_L(y_t), 
>         x_{t + 1} - z_{t + 1}
>     \rangle
>     \\
>     \Upsilon_{2, t + 1}^\text{AG}
>     &= 
>     h(z_{t + 1}) - h(z_t) 
>     \le 
>     \langle \mathcal G_L(y_t), z_{t + 1} - z_t\rangle + 
>     \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
> \end{aligned}
> $$

**Proof**

Define 

$$
\begin{aligned}
    \phi_t(u) &:= 
    \tilde \eta_{t + 1} 
    \left(
        f(y_t) + g(y_t) + \langle \nabla f(y_t) + \partial g(y_t^+), u - y_t\rangle
        % + 
        % \frac{1}{2\tilde \eta_{t + 1}}\Vert u - x_t\Vert^2
    \right)\\
    &= 
    \tilde \eta_{t + 1} \left(
        f(y_t) + \langle \nabla f(y_t), u - y_t\rangle + 
        % \frac{1}{2\tilde \eta_{t + 1}}\Vert u - x_t\Vert^2
        % + 
        g(y_t) + \langle \partial g(y_t^+), u - y_t\rangle
    \right)
\end{aligned}
$$

Then the update in the Generic Tri-Point algorithm has $x_{t + 1} = \prox{\phi_t}(x_t)$ by ignoring the constant term $f(y_t) + g(y_t)$ and therefore we can use the PPM Lyapunov inequality which gives for all $x_*$: 

$$
\begin{aligned}
    & \phi_t(x_{t + 1}) - \phi_t(x_*) + 
    \frac{1}{2}\Vert x_{t+1} - x_*\Vert^2 - 
    \frac{1}{2}\Vert x_t - x_*\Vert^2
    \le \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2, 
    \\
    & \text{where }
    \phi_t(x_{t + 1}) =
    \\
    & \quad 
    \tilde \eta_{t + 1}
    \left(
        f(y_t) + \langle \nabla f(y_t), x_{t + 1} - y_t\rangle + 
        % \frac{1}{2\tilde \eta_{t + 1}}\Vert x_{t + 1} - x_t\Vert^2
        % + 
        g(y_t) + \langle \partial g(y_t^+), x_{t + 1} - y_t\rangle
    \right)
\end{aligned}
$$

Now, using the $L$-smoothness of $f$, we have the inequality: 

$$
\begin{aligned}
    f(y_t) + \langle \nabla f(y_t), x_{t + 1} - y_t\rangle
    &=
    f(y_t) + \langle \nabla f(y_t), (x_{t +1} - z_{t + 1}) + (z_{t + 1} - y_t) \rangle
    \\
    &\ge 
    f(z_{t + 1}) - \frac{L}{2} \Vert z_{t + 1} - y_t\Vert^2 + 
    \langle \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \\
    &= 
    f(y_t^+) - \frac{L}{2}\Vert y_t^+ - y_t\Vert^2
    + \langle \nabla f(y_t), x_{t + 1} - y_t^+\rangle. 
\end{aligned}\tag{$[*]$}
$$

Using the convexity of $g$ we have the inequality: 

$$
\begin{aligned}
    g(y_t) + \langle \partial g(y_t^+), x_{t + 1} - y_t\rangle 
    &= g(y_t) + 
    \langle \partial g(y_t^+), 
    x_{t + 1} - y_t^+ + y_t^+ - y_t
    \rangle
    \\
    &= g(y_t) 
    + \langle \partial g (y_t^+),
        x_{t + 1} - y_t^+
    \rangle
    + 
    \langle 
        \partial g(y_t^+), y_t^+ - y_t
    \rangle
    \\
    g \text{ convex }\implies 
    &\ge 
    g(y_t^+) + 
    \langle \partial g(y_t^+), x_{t + 1} - y_t^+\rangle. 
\end{aligned}\tag{$[\star]$}
$$

In the $([\star])$ derivation, we used the convexity of $g$ where 
$$
\begin{aligned}
    \langle \partial g(y_t^+), y_t - y_t^+\rangle
    &\le g(y_t) - g(y_t^+)
    \\
    \langle \partial g (y_t^+), y_t^+ - y_t \rangle
    &\ge
    g(y_t^+) - g(y_t). 
\end{aligned}
$$

Now, adding $([*]), ([\star])$, multiply their sum by $\tilde\eta_{t + 1}$ makes it equals to $\phi_t(x_{t +1 })$ , we can establish a lower bound for $\phi_t(x_{t + 1})$, yielding inequality 

$$
\begin{aligned}
    \phi_t(x_{t + 1})
    &\ge 
    \tilde\eta_{t + 1}
    \left(
        f(y_t^+) - \frac{L}{2}\Vert y_t^+ - y_t\Vert^2 
        +
        \langle \nabla f(y_t), x_{t + 1} - y_t^+\rangle
        + 
        g(y_t^+) + 
        \langle \partial g(y_t^+), x_{t + 1} - y_t^+\rangle
    \right) 
    \\
    &= 
    \tilde\eta_{t + 1}
    \left(
        h(y_t^+) - \frac{L}{2}\Vert y_t^+ - y_t\Vert^2 
        + 
        \langle \partial g(y_t^+) + \nabla f(y_t), x_{t + 1} - y_t^+\rangle
    \right)
\end{aligned}
$$

Observe that $\partial g(y_t^+) + \nabla f(y_t) \ni \mathcal G_L(y_t)$, and by the algorithm updates $y_t^+ = z_{t + 1}$, therefore the above inequality simplifies to 

$$
\begin{aligned}
    \phi_t(x_{t + 1}) &\ge 
    \tilde\eta_{t + 1} 
    \left(
        h(z_{t + 1}) - 
        \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
        + 
        \langle \mathcal G_L(y_t), x_{t +1} - z_{t + 1}\rangle
    \right). 
\end{aligned}
$$

Finally, we have $\phi_t(u) \le \tilde\eta_{t + 1}h(u)$ for all $u$. 
With that we lower bound the LHS of the PPM Lyapunov inequality of $\phi_t(u)$, making: 

$$
\begin{aligned}
    & \phi_t(x_{t + 1}) - \phi_t(x_*) + 
    \frac{1}{2}\Vert x_{t+1} - x_*\Vert^2 - 
    \frac{1}{2}\Vert x_t - x_*\Vert^2
    \le
    \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    \\
    \implies &
    \tilde \eta_{t + 1}
    \left(
        h(z_{t + 1}) - 
        \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
        + 
        \langle \mathcal G_L(y_t), x_{t +1} - z_{t + 1}\rangle
    \right) - \tilde \eta_{t + 1} h(x_*)
    +
    \frac{1}{2}\Vert x_{t+1} - x_*\Vert^2 - 
    \frac{1}{2}\Vert x_t - x_*\Vert^2
    \\
    & \quad \le
    \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    \\
    \iff &
    \tilde\eta_{t + 1}(h(z_{t + 1}) - h(x_*))
    + \frac{1}{2}\left(
        \Vert x_{t + 1} - x_*\Vert^2 
        - 
        \Vert x_t - x_*\Vert^2
    \right) := \Upsilon_{1, t + 1}^\text{AG}
    \\
    &\quad \le 
    \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    - 
    \tilde\eta_{t + 1}
    \langle \mathcal G_L(y_t), x_{t +1} - z_{t + 1}\rangle
    + 
    \frac{L \tilde\eta_{t + 1}}{2}\Vert z_{t + 1} - y_t\Vert^2. 
\end{aligned}
$$

And this established the first inequality that we wish to prove. 
Next, the smoothness of $f$ establish inequality: 

$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &= f(z_{t + 1}) - f(y_t) + f(y_t) - f(z_t) 
    \\
    &\le 
    \langle \nabla f(y_t), z_{t + 1} - y_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
\end{aligned}\tag{$[**]$}
$$

The convexity of $h$ establish 

$$
\begin{aligned}
    g(z_{t + 1}) + 
    \langle \partial g(z_{t + 1}), z_t - z_{t + 1}\rangle
    &\le g(z_t)
    \\
    g(z_{t + 1}) - g(z_t)
    &\le 
    \langle 
        \partial g (z_{t +1}), 
        z_{t + 1} - z_t
    \rangle. 
\end{aligned}\tag{$[\star *]$}
$$

Adding $([**]), ([\star *])$ yields 

$$
\begin{aligned}
    \Upsilon_{2, t + 1}^{\text{AG}} := 
    h(z_{t + 1}) - h(z_t) 
    &\le 
    \langle 
        \nabla f(y_t) + \partial g(z_{t+1}), 
        z_{t + 1} - z_t
    \rangle + 
    \frac{L}{2}
    \Vert 
        z_{t + 1} - y_t
    \Vert^2. 
\end{aligned}
$$

Using the property of gradient mapping that $\mathcal G_L(y_t) \in \nabla f(y_t) + \partial g(z_{t + 1})$, substituting it, we proved all we want to show. 



#### **Lemma 3.3 | Generic Lypunov bound, Non-smooth**
> Let $h = f + g$ be a sum of $f$ that is $L$-Lipschitz smooth, and $g$ that is $\mu\ge 0$ strongly convex. 
> This makes $h$ strongly convex too. 
> Fix any $\bar x, x, \tilde \eta > 0$ and let 
> $$
> \begin{aligned}
>     \phi(u) &:= \tilde\eta
>     \left(
>         h( \mathcal T_L\bar x) + \langle \mathcal G_L\bar x, u - \bar x\rangle
>         + \frac{L}{2}\Vert \bar x - \mathcal T_L \bar x\Vert^2 
>     \right), 
>     \\
>     x^+ &:= 
>     \prox{\phi}(x) = x - \tilde \eta\mathcal G_L \bar x. 
> \end{aligned}
> $$
> then it has
> $$
> \begin{aligned}
>    \Upsilon_{1}  &:= 
>    \tilde \eta(h(\mathcal T_L \bar x) - h(x_*))
>    + 
>    \frac{1}{2}(\Vert x^+ - x_*\Vert^2 - \Vert x - x_*\Vert^2)
>    \\
>    &\quad \le 
>    - \tilde \eta \langle \mathcal G_L\bar x, x^+ - \mathcal T_L \bar x\rangle
>    + 
>    \frac{\tilde \eta L}{2} \Vert \bar x - \mathcal T_L \bar x\Vert^2
>    - 
>    \frac{1}{2}\Vert x^+ - x\Vert^2, 
>    \\
>    \forall z':
>    \Upsilon_2 &:= 
>    h(\mathcal T_L \bar x) - h(z') 
>    \le 
>    \langle \mathcal G_L\bar x, \mathcal T_L \bar x - z'\rangle + 
>    \frac{L}{2}\Vert \mathcal T_L \bar x - \bar x\Vert^2. 
> \end{aligned}
> $$

**Observations**

By lemma proven at the start of the file, we have $\phi(u) \le \tilde \eta h(u) \; \forall u,$ it is a local lineared lower bound for $\tilde \eta h$. 

**Proof**

Directly observe that we have 

$$
\begin{aligned}
    \quad &
    h(\mathcal T_L\bar x) + 
    \langle \mathcal G_L \bar x, u - \bar x\rangle + 
    \frac{L}{2}\Vert \bar x - \mathcal T_L \bar x\Vert^2
    \\
    &= 
    h(\mathcal T_L \bar x) + 
    \langle \mathcal G_L \bar x, u - \mathcal T_L \bar x\rangle
    + 
    \langle \mathcal G_L \bar x, \mathcal T_L \bar x - \bar x\rangle
    + 
    \frac{L}{2}\Vert \bar x - \mathcal T_L \bar x \Vert^2
    \\
    &= 
    h(\mathcal T_L \bar x) + 
    \langle \mathcal G_L \bar x, u - \mathcal T_L \bar x\rangle
    + 
    \langle 
        L (\bar x - \mathcal T_L \bar x)
        , 
        \mathcal T_L \bar x - \bar x
    \rangle
    + 
    \frac{L}{2}\Vert \bar x - \mathcal T_L \bar x\Vert^2
    \\
    &= 
    h(\mathcal T_L \bar x) + 
    \langle \mathcal G_L \bar x, u - \mathcal T_L \bar x\rangle 
    - \frac{L}{2} \Vert \bar x - \mathcal T_L \bar x\Vert^2. 
\end{aligned}
$$

By PPM descent lemma, let $x_*$ be a minimizer, it claims that 

$$
{\small
\begin{aligned}
    & \quad 
    \phi(x^+) - \phi (x^*) + 
    \frac{1}{2}\left(
        \Vert x^+ - x_*\Vert^2 - 
        \Vert x - x_*\Vert^2
    \right)
    \le 
    - \frac{1}{2}\Vert x^+ - x\Vert^2
    \\
    & \implies 
    \tilde 
    \eta 
    \left(   
        h(\mathcal T_L \bar x) + 
        \langle \mathcal G_L \bar x, u - \mathcal T_L \bar x\rangle 
        - \frac{L}{2} \Vert \bar x - \mathcal T_L \bar x\Vert^2
    \right)
    - \tilde \eta h (x_*)
    +
    \frac{1}{2}\left(
        \Vert x^+ - x_*\Vert^2 - 
        \Vert x - x_*\Vert^2
    \right)
    \le 
    - \frac{1}{2}\Vert x^+ - x\Vert^2
    \\
    & \iff
    \tilde \eta (h(\mathcal T_L\bar x) - h(x_*))  
    + 
    \frac{1}{2}\left(
        \Vert x^+ - x_*\Vert^2 - 
        \Vert x - x_*\Vert^2
    \right)
    \le 
    - \tilde \eta \langle \mathcal G_L\bar x, x^+ - \mathcal T_L \bar x\rangle
    + 
    \frac{\tilde \eta L}{2} \Vert \bar x - \mathcal T_L \bar x\Vert^2
    - 
    \frac{1}{2}\Vert x^+ - x\Vert^2. 
\end{aligned}
}
$$

Next, for all $z, z'$, it would have by smoothness of $f$: 

$$
\begin{aligned}
    f(z) - f(z') &= 
    f(z) - f(\bar x) + f(\bar x) - f(z')
    \\
    &\le 
    \langle 
        \nabla f(\bar x), z - \bar x
    \rangle + 
    \frac{L}{2}\Vert z - \bar x\Vert^2 
    + 
    \langle 
        \nabla f(\bar x), 
        \bar x - z'
    \rangle
    \\
    &= 
    \langle \nabla f(\bar x), z - z'\rangle
    + 
    \frac{L}{2}\Vert z - \bar x\Vert^2. 
\end{aligned}
$$

The convexity of $g$ yields: 

$$
\begin{aligned}
    g(z) + 
    \langle 
        \partial g(z), z' - z
    \rangle 
    &\le g(z')
    \\
    g(z) - g(z') 
    &\le 
    \langle \partial g(z), z - z'\rangle. 
\end{aligned}
$$

Adding them yield 

$$
\begin{aligned}
    h(z) - h(z') &\le 
    \langle \nabla f(\bar x) + \partial g(z), z - z'\rangle + 
    \frac{L}{2}\Vert z - \bar x\Vert^2. 
\end{aligned}
$$

Setting $z = \mathcal T_L \bar x$, we have the desired results. 

**Remarks**

In the context of generic form of accelerated proximal gradient, choose the parameter $\bar x = y_t$, and $z' = z_t$. 
This makes for all $\bar x$, it gives

$$
\begin{aligned}
    x^+ 
    &= x - \tilde \eta \mathcal G_L(\bar x)
    = x - \tilde \eta \mathcal G_L(y_t) = x_{t + 1}
    \\
    z_{t + 1} 
    &= \mathcal T_L \bar x  
    = \bar x - \mathcal G_L \bar x 
    = y_t - \mathcal G_L y_t, 
\end{aligned}
$$

so this is the expected values in the context of the generic algorithm, yielding inequalities

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AG}}
            &:= 
            \tilde \eta_{t + 1}(h(z_{t + 1}) - h(x_*))
            + 
            \frac{1}{2}(\Vert x_{t + 1} - x_*\Vert^2 + \Vert x_t - x_*\Vert^2)
            \\
            &\quad \le 
            - \tilde \eta_{t + 1}\langle \mathcal G_L y_t, x_{t + 1} - z_{t + 1}\rangle
            + 
            \frac{\tilde \eta_{t + 1}L}{2}
            \Vert  
                y_t - z_{t + 1}
            \Vert^2
            - 
            \frac{1}{2}
            \Vert x_{t + 1} - x_t\Vert^2,  
            \\ 
            \Upsilon_{2, t + 1}^{\text{AG}}
            &:= 
            h(z_{t + 1}) - h(z_t) \le 
            \langle \mathcal G_L \bar x, z_{t + 1} - z_t \rangle + 
            \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
\end{aligned}
$$

---
### **Part III**

Visit: [Nesterov Type Acceleration via Proximal Point Method Part III](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20III.md). 