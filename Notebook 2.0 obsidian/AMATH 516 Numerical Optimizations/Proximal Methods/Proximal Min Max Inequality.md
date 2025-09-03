- [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Chambolle Pock](../../AMATH%20515%20Optimization%20Fundamentals/Chambolle%20Pock.md)
- [Subgradient Characterizations of Convexity](../Properties%20of%20Functions/Subgradient%20Characterizations%20of%20Convexity.md)

---
### **Intro**

We are taking a detailed look into one of the inequalities that are crucial to the proof of the Chambolle Pock algorithm, for subgradients. 
The inequality make use of: 
- Convex subgradient inequality. 
- The proximal inequality. 

Here, we will follow the notations introduced in: 
> "A first-order primal-dual algorithm for convex problems with applications to imaging" By Chambolle, Pock. 

#### **Assumption 0 | Standing assumption**
> Let $\mathcal Y, \mathcal X$ be Hilbert spaces. 
> We make the following assumptions on $(F, G, K)$
> - $F: \mathcal Y \rightarrow \overline \R, G: \mathcal X \rightarrow \overline \R$ are closed convex proper function. 
> - $K: \mathcal X \rightarrow \mathcal Y$ is a linear mapping. 

The KKT conditions corresponds to the following min-max objective which is: 

$$
\begin{aligned}
    \min_{x \in \mathcal X}\max_{y \in \mathcal Y}
    \left\lbrace
        \langle Kx, y\rangle + G(x) - F^\star(y)
    \right\rbrace
\end{aligned}
$$

Taking an implicit step wrt to both $F, G$ using proximal point yields the following proximal point relations: 

$$
\begin{aligned}
    & \left(
        \forall (\bar x, \bar y) \in \mathcal X \times \mathcal Y
    \right): 
    \left\lbrace
    \begin{aligned}
        y_{n + 1} &= (I + \sigma \partial F^\star)^{-1}(y_n + \sigma K\bar x), 
        \\[0.2em]
        x_{n + 1} &= (I + \tau \partial G)^{-1}(x_n - \tau K^* \bar y). 
    \end{aligned}
    \right.
\end{aligned}\tag{MM-Prx}
$$

Recall the following: 

#### **Theorem | Proximal inequality**
> Let $\sigma > 0$. 
> Let $f: \mathcal H \rightarrow \overline \R$, $y^+ = (I + \sigma \partial f)^{-1}y$. 
> If,$f$ is a closed convex proper function, then: 
> $$
> \begin{aligned}
>     (\forall z \in \mathcal H)\quad
>     0 &\le 
>     f(z) - f(y^+) + \frac{1}{2\sigma}\Vert y - z\Vert^2 
>     - \frac{1}{2\sigma} \Vert y - y^+\Vert^2 
>     - \frac{2}{2\sigma} \Vert z - y^+\Vert^2. 
> \end{aligned}
> $$

**Proof**

Check the files linked at the top of this mardown file. 

$\blacksquare$


#### **Definition | Partial Primal Dual Gap (PPDg)**
> Let $(F, G, K)$ satisfy **Assumption 0**. 
> Then, we define the Parial Primal Dual Gap (PPDg) to be: 
> $$
> \begin{aligned}
>     \mathcal G_{B_1 \times B_2} (x, y):= 
>     \max_{y' \in B_2}\left\lbrace
>         \langle y', Kx\rangle
>         - F^\star(y')
>         + G(x)
>     \right\rbrace
>     - 
>     \min_{x'\in B_2}\left\lbrace
>         \langle y, Kx'\rangle
>         - F^\star(y) + G(x')
>     \right\rbrace. 
> \end{aligned}
> $$

The following inequality is a key result of popular primal dual algorithms. 

#### **Theorem | Proximal Min-max inequality**
> Let $(F, G, K)$ satisfies **Assumption 0**.
> Consider $(\bar x, \bar y)$, and $y_{n + 1}, y_n, x_{n + 1}, x_n$ as given by (MM-Prx) then it has for all $(x, y) \in \mathcal X \times \mathcal Y$: 
> $$
> \begin{aligned}
>     0 &\le \left(
>         F^\star(y) - G(x_{n + 1}) - \langle K x_{n + 1}, y\rangle
>     \right) + 
>     \left(
>         - F^\star(y_{n + 1})
>         + G(x) + \langle Kx, y_{n + 1}\rangle
>     \right)
>         \\&\quad 
>         + \left(
>             \frac{1}{2\sigma} \Vert y_n - y\Vert^2 
>             - \frac{1}{2\sigma} \Vert y_n - y_{n + 1}\Vert^2
>             - \frac{1}{2\sigma} \Vert y - y_{n + 1}\Vert^2
>         \right)
>         \\ &\quad 
>         + \left(
>             \frac{1}{2 \tau} \Vert x_n - x\Vert^2 
>             - \frac{1}{2\tau} \Vert x_n - x_{n + 1}\Vert^2 
>             - \frac{1}{2\tau} \Vert x - x_{n + 1}\Vert^2
>         \right)
>         \\ &\quad 
>         + \langle 
>             y_{n + 1} - y, 
>             K(\bar x - x_{n + 1})
>         \rangle
>         + \langle K (x_{n + 1} - x), y_{n + 1} - \bar y\rangle. 
> \end{aligned}
> $$

**Proof**

Apply Proximal Inequality to the MM-PRX conditions it yields the following 2 relations: 

$$
\begin{aligned}
    & y_{n + 1} = (I + \sigma \partial F^\star)^{-1}(y_n + K \bar x)
    \\
    \iff & 
    (\forall y \in \mathcal Y)\; 
    0 \le F^\star(y) - F^\star(y_{n + 1})
    + \frac{1}{2\sigma}\Vert y_n + \sigma K\bar x - y\Vert^2
    - \frac{1}{2\sigma} \Vert y_n + \sigma K\bar x - y_{n + 1}\Vert^2
    - \frac{1}{2\sigma} \Vert y - y_{n + 1}\Vert^2. 
\end{aligned}\tag{a}
$$

And, 
$$
\begin{aligned}
    & x_{n + 1} = (I + \tau \partial G)^{-1}(x_n - \tau K^* \bar y)
    \\ \iff &
    (\forall x \in \mathcal X)\; 
    0 \le
    G(x) - G(x_{n + 1}) 
    + \frac{1}{2\tau} \Vert x_n - \tau K^*\bar y - x\Vert^2
    - \frac{1}{2\tau} \Vert x_n - \tau K^* \bar y - x_{n + 1}\Vert^2
    - \frac{1}{2\tau} \Vert x - x_{n + 1}\Vert^2. 
\end{aligned}\tag{b}
$$

The third and the fourth term in (a) can be simplified giving us: 

$$
\begin{aligned}
    & \frac{1}{2\sigma} \Vert y_n + \sigma K\bar x - y\Vert^2
    - \frac{1}{2\sigma} \Vert y_n + \sigma K \bar x - y_{n + 1}\Vert^2
    \\
    &= 
    \frac{1}{2\sigma} \Vert y_n - y\Vert^2 
    - \frac{1}{2\sigma} \Vert y_n - y_{n + 1}\Vert^2
    + \langle y_n - y, K \bar x\rangle 
    - \langle y_n - y_{n + 1}, K \bar x\rangle
    \\
    &= 
    \frac{1}{2\sigma} \Vert y_n - y\Vert^2 
    - \frac{1}{2\sigma} \Vert y_n - y_{n + 1}\Vert^2
    + \langle K \bar x, y_{n + 1} - y\rangle. 
\end{aligned}\tag{c}
$$

Similarly, the third and fourth term of (b) has: 

$$
\begin{aligned}
    & \frac{1}{2\tau} \Vert x_n - \tau K^*\bar y - x\Vert^2
    - \frac{1}{2\tau} \Vert x_n - \tau K^* \bar y - x_{n + 1}\Vert^2
    \\
    &=
    \frac{1}{2 \tau} \Vert x_n - x\Vert^2 
    - \frac{1}{2\tau} \Vert x_n - x_{n + 1}\Vert^2 
    - \langle x_n - x, K^* \bar y \rangle
    + \langle x_n - x_{n + 1}, K^*\bar y\rangle
    \\
    &= 
    \frac{1}{2 \tau} \Vert x_n - x\Vert^2 
    - \frac{1}{2\tau} \Vert x_n - x_{n + 1}\Vert^2 
    - \langle K^* \bar y, x_{n + 1} - x \rangle. 
\end{aligned}\tag{d}
$$

Substitute (c), (d) into (a), (b) and then add them together should yield: 

$$
\begin{aligned}
    0&\le 
    F^\star(y) - F^\star(y_{n + 1})
    + \frac{1}{2\sigma} \Vert y_n - y\Vert^2 
    - \frac{1}{2\sigma} \Vert y_n - y_{n + 1}\Vert^2
    + \langle K \bar x, y_{n + 1} - y\rangle
    - \frac{1}{2\sigma} \Vert y - y_{n + 1}\Vert^2
        \\ &\quad 
        + G(x) - G(x_{n + 1}) 
        + \frac{1}{2 \tau} \Vert x_n - x\Vert^2 
        - \frac{1}{2\tau} \Vert x_n - x_{n + 1}\Vert^2 
        - \langle K^* \bar y, x_{n + 1} - x \rangle
        - \frac{1}{2\tau} \Vert x - x_{n + 1}\Vert^2
    \\
    &= 
    \left(
        F^\star(y) - G(x_{n + 1}) - \langle K x_{n + 1}, y\rangle
    \right) + 
    \left(
        - F^\star(y_{n + 1})
        + G(x) + \langle Kx, y_{n + 1}\rangle
    \right)
        \\&\quad 
        + \left(
            \frac{1}{2\sigma} \Vert y_n - y\Vert^2 
            - \frac{1}{2\sigma} \Vert y_n - y_{n + 1}\Vert^2
            - \frac{1}{2\sigma} \Vert y - y_{n + 1}\Vert^2
        \right)
        \\ &\quad 
        + \left(
            \frac{1}{2 \tau} \Vert x_n - x\Vert^2 
            - \frac{1}{2\tau} \Vert x_n - x_{n + 1}\Vert^2 
            - \frac{1}{2\tau} \Vert x - x_{n + 1}\Vert^2
        \right)
        \\ &\quad 
        + \langle y_{n + 1} - y, K \bar x\rangle
        - \langle K^\star \bar y, x_{n + 1} - x\rangle
        + \langle Kx_{n + 1}, y\rangle - \langle  Kx, y_{n + 1}\rangle
    \\
    &= (\sim) + (\sim) + (\sim) + (\sim)
    + \langle y_{n + 1} - y, K \bar x\rangle
    - \langle K^\star \bar y, x_{n + 1} - x\rangle
    + \langle Kx_{n + 1}, y\rangle - \langle  Kx, y_{n + 1}\rangle
    \\
    &= 
    (\sim) + (\sim) + (\sim) + (\sim)
    + \langle y_{n + 1} - y, K \bar x\rangle
    - \langle K^\star \bar y, x_{n + 1} - x\rangle
    + \langle Kx_{n + 1}, y - y_{n + 1} + y_{n + 1}\rangle 
    - \langle  Kx, y_{n + 1}\rangle
    \\
    &= 
    (\sim) + (\sim) + (\sim) + (\sim)
    + \langle 
        y_{n + 1} - y, 
        K(\bar x - x_{n + 1})
    \rangle
    - \langle \bar y, K(x_{n + 1} - x)\rangle
    + \langle K (x_{n + 1} - x), y_{n + 1}\rangle
    \\
    &= (\sim) + (\sim) + (\sim) + (\sim)
    + \langle 
        y_{n + 1} - y, 
        K(\bar x - x_{n + 1})
    \rangle
    + \langle K (x_{n + 1} - x), y_{n + 1} - \bar y\rangle. 
\end{aligned}
$$

