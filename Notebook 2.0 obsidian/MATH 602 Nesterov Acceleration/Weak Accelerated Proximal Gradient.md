- [Regret in APG EST SEQ](Regret%20in%20APG%20EST%20SEQ.md)
- [PPM APG Forms](PPM%20APG%20Forms.md)


---
### **Intro**

This file continues on the "regret" inside the Nesterov's estimating sequence and attempts to 
connect the knowledge with the existing literatures. 
Some words will be repeated for clear presentation of ideas presented in those previous files. 

The goal is to develope a weak version of the Accelerated proximal point method that has convergence claim for all possible "reasonable" choices of stepsizes. 

#### **Assumptions**
1. $f: \R \rightarrow \R^n$ is a convex differentiable function that is also $L$-Lipschitz smooth. 
2. $g: Q \rightarrow \R^n$ is a convex function. 
3. $F = f + g$, $F$ is the objective function. 

We introduce the following quantities in order to define the algorithm. 

1. $T_L = [I + \partial g]^{-1}\circ [I - L^{-1}\nabla f]$ which is the proximal gradient operator. 
2. $\mathcal G_L = L(I - T_L)$ to be the gradient mapping operator. 

<!-- 
#### **Algorithm | Weak accelerated proximal gradient algorithm**
> Let $0 \le \mu \le L$ be the strong convexity and Lipschitz smoothness parameter of $f$. 
> Given iterates $(v_k, x_k)$, or equivalently $(y_k, x_k)$, $(x_k, y_k)$, any $\alpha_k \in (0, 1), \gamma_k > 0$, the algorithm generates scalar $\gamma_{k + 1}$, and vectors $y_k, v_{k + 1}, x_{k + 1}$ by equalities: 
> $$
> \begin{aligned}
>     \gamma_{k + 1} &:= (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
>     \\
>     y_k &= 
>     (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= \gamma_{k + 1}^{-1}
>     (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$

**Observations**

We make some observations here. 
Just from the definition of the algorithm, the iterates $(x_k, v_k, y_k)$ are collinear and it satisfies: 

$$
\begin{aligned}
    (Q1): 
    y_k - v_k &= 
    \frac{\gamma_{k + 1}}{\alpha_k \gamma_k}(x_k - y_k),
    \\
    (Q2): 
    y_k - x_k &= 
    \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
$$

To show the first equality, we have 

$$
\begin{aligned}
    y_k - v_k &= 
    \frac{\gamma_{k + 1}}{\alpha_k \gamma_k}(x_k - y_k)
    \\
    \iff 
    -(\alpha_k \gamma_k\gamma_{k + 1}^{-1} + 1)y_k
    &= 
    - \alpha_k \gamma_k \gamma_{k + 1}^{-1}v_k - x_k
    \\
    \iff 
    y_k &= 
    \frac{
        \alpha_k \gamma_k \gamma_{k + 1}^{-1}v_k + x_k
    }{1 + \alpha_k \gamma_k \gamma_{k + 1}^{-1}}
    \\
    &=  
    \frac{\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k}{\gamma_k + \alpha_k \mu}.
\end{aligned}
$$

On the first equality (Q1), we multiplied both side of the equation by $\gamma_{k + 1}/\alpha_k \gamma_k$ and then group $y_k$ on the LHS. 
The last equality recovers the equality given by the algorithm. 
To see the second equality (Q2), consider: 

$$
\begin{aligned}
    y_k &= (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1} x_k)
    \\
    \iff
    y_k - x_k &= 
    (\gamma_k + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k - (\gamma_k + \alpha_k \mu)x_k + \gamma_{k + 1}x_k)
    \\
    \iff 
    (\gamma_k + \alpha_k \mu)(y_k - x_k)
    &= 
    \alpha_k\gamma_k v_k + 
    (\gamma_{k + 1} - \gamma_k - \alpha_k \mu) x_k
    \\
    &= \alpha_k \gamma_k v_k - \alpha_k \gamma_k x_k = \alpha_k \gamma_k(v_k - x_k)
    \\
    \iff 
    y_k - x_k &= 
    \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
$$

On the second equality of the second $\iff$ we just substituted $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
Therefore, we discover that $x_k, v_k, y_k$ lies on the same line.  -->


---
### **Algorithm and convergence claims**

Forget everything from previous section. 
Let's try to do this again with some differences. 

#### **Algorithm 2 | Stepwise weak accelerated proximal gradient**
> Let $0 \le \mu \le L$ be the strong convexity and Lipschitz smoothness parameter of $f$. 
> Given iterates $(v_k, x_k)$, or equivalently $(y_k, x_k)$, $(x_k, y_k)$, any $\alpha_k \in (0, 1), \gamma > 0$, the algorithm generates scalar $\hat \gamma$, and vectors $y_k, v_{k + 1}, x_{k + 1}$ by equalities: 
> $$
> \begin{aligned}
>     \hat \gamma &:= (1 - \alpha_k)\gamma + \mu \alpha_k, 
>     \\
>     y_k &= 
>     (\gamma + \alpha_k \mu)^{-1}(\alpha_k \gamma v_k + \hat\gamma x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= \hat\gamma^{-1}
>     (\gamma(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$

**Observations**

We make 2 crucial observations here. 
With the algorithm, we define the following quantities associate with it. 
Fix any integer $k \ge 0$. 
Given any $(x_k, y_k)$. 
Define $g_i, \epsilon_i, l_F(x; y_k)$: 
$$
\begin{aligned}
    l_F(x; y_k) &= F(T_Ly_k) + \langle g_k, x - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    \epsilon_{k} &:= F(x_k) - l_F(x_k; y_k). 
\end{aligned}
$$

$\epsilon_k \ge 0$ always because we assumed $F$ is convex. 
To verify, we use the fundamental proximal gradient inequality. 
Next, observe that we have $x_k, y_k, v_k$ lie on the same line because they have 

$$
\begin{aligned}
    (Q1): 
    y_k - v_k &= 
    \frac{\hat \gamma}{\alpha_k \gamma}(x_k - y_k),
    \\
    (Q2): 
    y_k - x_k &= 
    \frac{\alpha_k \gamma}{\gamma + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
$$

To see (Q1), observe 

$$
\begin{aligned}
    y_k - v_k &= 
    \frac{\hat \gamma}{\alpha_k \gamma}(x_k - y_k)
    \\
    \iff 
    -(\alpha_k \gamma\hat \gamma^{-1} + 1)y_k
    &= 
    - \alpha_k \gamma \hat \gamma^{-1}v_k - x_k
    \\
    \iff 
    y_k &= 
    \frac{
        \alpha_k \gamma \hat \gamma^{-1}v_k + x_k
    }{1 + \alpha_k \gamma \hat \gamma^{-1}}
    \\
    &=  
    \frac{\alpha_k \gamma v_k + \hat \gamma x_k}{\gamma + \alpha_k \mu}.
\end{aligned}
$$

On the first equality (Q1), we multiplied both side of the equation by $\gamma_{k + 1}/\alpha_k \gamma_k$ and then group $y_k$ on the LHS. 
The last equality comes by multiplying both the numerator and denominator by $\hat \gamma$, leaving the numerator $\hat \gamma + \alpha_k \gamma = \gamma + \alpha_k \mu$. 
We used the definition of $\hat \gamma$ here. 

To see the second equality (Q2), consider: 

$$
\begin{aligned}
    y_k &= (\gamma + \alpha_k \mu)^{-1}(\alpha_k \gamma v_k + \hat\gamma x_k)
    \\
    \iff
    y_k - x_k &= 
    (\gamma + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k - (\gamma + \alpha_k \mu)x_k + \hat \gamma x_k)
    \\
    \iff 
    (\gamma + \alpha_k \mu)(y_k - x_k)
    &= 
    \alpha_k\gamma v_k + 
    (\hat \gamma - \gamma - \alpha_k \mu) x_k
    \\
    &= \alpha_k \gamma v_k - \alpha_k \gamma x_k 
    \\
    &= \alpha_k \gamma(v_k - x_k)
    \\
    \iff 
    y_k - x_k &= 
    \frac{\alpha_k \gamma}{\gamma + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
$$

On the second equality that follows the second $\iff$ we just substituted $\hat\gamma = (1 - \alpha_k)\gamma + \alpha_k \mu$. 
Therefore, we discover that $x_k, v_k, y_k$ lies on the same line. 


#### **Claim | Stepwise Lyapunov Claim**
> Fix any integer $k \ge0$, suppose that $v_{k + 1}, x_{k + 1}, y_k, g_k, \gamma, \hat \gamma$ satisifes Algorithm 2. 
> Given any $R_k$.
> Define: 
> $$
> \begin{aligned}
>     R_{k + 1}
>     := 
>     \frac{1}{2}\left(
>         L^{-1} - \frac{\alpha_k^2}{\hat \gamma}
>     \right)\Vert g_k\Vert^2
>     + 
>     (1 - \alpha_k)
>     \left(
>         \epsilon_k + R_k + 
>         \frac{\mu\alpha_k\gamma}{2\hat \gamma}
>         \Vert v_k - y_k\Vert^2
>     \right). 
> \end{aligned}
> $$
> Then it has for all $x^* \in \R^n$ where $F^* = F(x^*)$, the inequality: 
> $$
> \begin{aligned}
>     F(x_{k + 1}) - F^* + R_{k + 1} + \frac{\hat \gamma}{2}\Vert v_{k + 1} - x^*\Vert^2
>     &\le 
>     (1 - \alpha_k)
>     \left(
>         F(x_k) - F^* + R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
>     \right). 
> \end{aligned}
> $$

**Proof**

Start by considering the first and the third term of the LHS of the inequality that we want to prove. 

$$
\begin{aligned}
    F(x_{k + 1}) &= 
    F(x_k) - \epsilon_k - \langle  g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    R_{k + 1}
    &= 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\hat \gamma}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma}{2\hat \gamma}
        \Vert v_k - y_k\Vert^2
    \right), 
    \\
    \implies 
    F(x_{k + 1}) + R_{k + 1}
    &= 
    F(x_k) - \epsilon_k - \langle  g_k, x_k - y_k\rangle
    - \frac{\alpha_k^2}{2\hat \gamma}\Vert g_k\Vert^2
    \\
    &\quad 
        + 
        (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma_k}{2\hat \gamma}
            \Vert v_k - y_k\Vert^2
        \right). 
\end{aligned}\tag{1*}
$$


Coefficient of $\epsilon_k$ and $\Vert g_k\Vert^2$ are grouped. 
Next, we have: 

$$
\begin{aligned}
    \frac{\hat \gamma}{2}\Vert v_{k + 1} - x^* \Vert^2
    &= 
    \frac{\hat \gamma}{2}\Vert 
        \hat \gamma^{-1}
        (
            \gamma_k(1 - \alpha_k)v_k - 
            \alpha_k g_k + \mu \alpha_k y_k
        )
        - x^* 
    \Vert^2
    \\
    &=  
    \frac{\hat \gamma}{2}
    \Vert 
        \hat \gamma^{-1}
        (
           \hat \gamma v_k + \mu \alpha_k(y_k - v_k)
            - \alpha_k g_k
        )
        - x^* 
    \Vert^2
    \\
    &= 
    \frac{\hat \gamma}{2}
    \Vert 
        v_k + \hat \gamma^{-1} \mu \alpha_k (y_k - v_k)
        - \hat \gamma^{-1}\alpha_k g_k
        - x^* 
    \Vert^2
    \\
    &= 
    \frac{\hat \gamma}{2}
    \Vert v_k - x^*\Vert^2 
    + 
    \frac{\alpha_k^2}{2\hat \gamma}\Vert \mu(y_k - v_k) - g_k\Vert^2 
    \\ &\quad 
        + 
        \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle
    \\
    &= 
    \left(
       \frac{(1 - \alpha_k)\gamma + \mu \alpha_k}{2} 
    \right)\Vert v_k - x^*\Vert^2
    \\ &\quad
        + 
        \frac{\alpha_k^2}{2\hat \gamma}
        \Vert \mu(y_k - v_k) - g_k\Vert^2 
        + 
        \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle. 
\end{aligned}\tag{2*}
$$


On the above derivation, the first equality is by definition of $v_{k + 1}$; the second equality is by $\hat \gamma = (1 - \alpha_k)\gamma + \mu \alpha_k$ the second equality comes by considering: 

$$
\begin{aligned}
    \gamma(1 - \alpha_k) v_k &= 
    (\hat \gamma  - \mu \alpha_k)v_k
    = \hat \gamma v_k - \mu\alpha_k v_k
    \\
    \iff 
    \gamma(1 - \alpha_k) v_k + \mu \alpha_k y_k
    &= 
    \hat \gamma v_k + \mu \alpha_k(y_k - v_k). 
\end{aligned}
$$

Focusing on the last two terms by the end of expression (2\*), we have  

$$
\begin{aligned}
    \frac{\alpha^2_k}{2\hat \gamma} 
    \Vert \mu(y_k - v_k) - g_k\Vert^2
    & = 
    \frac{\alpha_k^2\mu}{\hat \gamma}
    \left(
        \frac{\mu}{2}\Vert y_k - v_k\Vert^2 
        - \langle y_k - v_k, g_k\rangle
    \right)
    + \frac{\alpha_k^2}{2\hat \gamma}\Vert g_k\Vert^2, 
    \\
    \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle
    &= 
    \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle 
    - \alpha_k \langle v_k - x^*, g_k\rangle. 
\end{aligned}\tag{2.1*}
$$

Adding the LHS of both equations above together gives: 

$$
\begin{aligned}
    & \quad 
    \frac{\alpha^2_k}{2\hat \gamma} 
    \Vert \mu(y_k - v_k) - g_k\Vert^2
    + 
    \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle
    \\
    &= 
    \left\langle g_k, 
        - \alpha_k(v_k - x^*) 
        - \frac{\alpha_k^2\mu}{\hat \gamma}(y_k - v_k)
    \right\rangle
    + \frac{\alpha_k^2}{2\hat \gamma}\Vert g_k\Vert^2
    + \frac{\alpha_k^2 \mu^2}{2\hat \gamma}\Vert y_k - v_k\Vert^2
    + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle. 
\end{aligned}
$$


With the above we can conclude that (2*) simplifies to 

$$
{\small
\begin{aligned} 
    & 
    \left(
       \frac{(1 - \alpha_k)\gamma + \mu \alpha_k}{2} 
    \right)\Vert v_k - x^*\Vert^2
    + 
    \left\langle g_k, 
        - \alpha_k(v_k - x^*) 
        - \frac{\alpha_k^2\mu}{\hat \gamma}(y_k - v_k)
    \right\rangle
    \\
    & \quad 
        + \frac{\alpha_k^2}{2\hat \gamma}\Vert g_k\Vert^2
        + \frac{\alpha_k^2 \mu^2}{2\hat \gamma}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle. 
\end{aligned}\tag{2.2*}
}
$$

Recall that: 

$$
\begin{aligned}
    (Q1): 
    y_k - v_k &= 
    \frac{\hat \gamma}{\alpha_k \gamma}(x_k - y_k),
    \\
    (Q2): 
    y_k - x_k &= 
    \frac{\alpha_k \gamma}{\gamma + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
$$

Ok that is a lot, we list the following equations to assist things: 

$$
\begin{aligned}
    &  
    - \alpha_k(v_k - x^*) - \frac{\alpha_k^2 \mu}{\hat \gamma}(y_k - v_k) - (x_k - y_k)
    \\
    \text{use Q1}: & =
    -\alpha_k(v_k - x^*) -
    \frac{\alpha_k^2}{\hat \gamma}\frac{\hat \gamma}{\alpha_k \gamma}(x_k - y_k)
    - (x_k - y_k) 
    \\
    &= 
    -\alpha_k(v_k - x^*) -
    \frac{\alpha_k \mu}{\gamma}(x_k - y_k)
    - (x_k - y_k) 
    \\
    &= 
    -\alpha_k(v_k - x^*) -
    \left(
        1 + \frac{\alpha_k \mu}{\gamma}
    \right)(x_k - y_k)
    \\
    \text{use Q2}: 
    &= 
    -\alpha_k(v_k - x^*) - 
    \frac{\alpha_k \mu + \gamma}{\gamma}
    \frac{\alpha_k \gamma}{\gamma_k + \alpha_k \mu}(x_k - v_k)
    \\
    &= 
    -\alpha_k(v_k - x^*)
    - \alpha_k(x_k - v_k)
    \\
    &= \alpha_k(x^* - x_k). 
\end{aligned}\tag{Q3}
$$

Adding (2.2\*) to (1\*) gives: 

$$
\begin{aligned}
    &
    F(x_k) - \epsilon_k - \langle  g_k, x_k - y_k\rangle
    - \frac{\alpha_k^2}{2\hat \gamma}\Vert g_k\Vert^2
    + (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma}{2\hat \gamma}
        \Vert v_k - y_k\Vert^2
    \right)
    \\
    &\quad 
        + 
        \left(
        \frac{(1 - \alpha_k)\gamma + \mu \alpha_k}{2} 
        \right)\Vert v_k - x^*\Vert^2
        + 
        \left\langle g_k, 
            - \alpha_k(v_k - x^*) 
            - \frac{\alpha_k^2\mu}{\hat \gamma}(y_k - v_k)
        \right\rangle
    \\
    & \quad 
        + \frac{\alpha_k^2}{2\hat \gamma}\Vert g_k\Vert^2
        + \frac{\alpha_k^2 \mu^2}{2\hat \gamma}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    &= 
    F(x_k) - \epsilon_k 
    + \left\langle 
        g_k, 
        - \alpha_k(v_k - x^*) 
        - \frac{\alpha_k^2\mu}{\hat \gamma}(y_k - v_k)
        - (x_k - y_k)
    \right\rangle
    \\
    &\quad 
        + (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma}{2\hat \gamma}
            \Vert v_k - y_k\Vert^2
        \right)
        + 
        \left(
        \frac{(1 - \alpha_k)\gamma + \mu \alpha_k}{2} 
        \right)\Vert v_k - x^*\Vert^2
    \\
    & \quad 
        + \frac{\alpha_k^2 \mu^2}{2\hat \gamma}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    \text{Use Q3}&= 
    F(x_k) - \epsilon_k 
    + \alpha_k\left\langle 
        g_k, 
        x^* - x_k
    \right\rangle
    \\
    &\quad 
        + (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma}{2\hat \gamma}
            \Vert v_k - y_k\Vert^2
        \right)
        + 
        \left(
        \frac{(1 - \alpha_k)\gamma + \mu \alpha_k}{2} 
        \right)\Vert v_k - x^*\Vert^2
    \\
    & \quad 
        + \frac{\alpha_k^2 \mu^2}{2\hat \gamma}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    &= 
    F(x_k) - \alpha_k\epsilon_k + \alpha_k\langle g_k, x^* - x_k\rangle
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\&\quad 
        + \frac{(1 - \alpha_k)\mu\alpha_k\gamma}{2\hat \gamma}\Vert v_k - y_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2
    \\&\quad 
        + \frac{\alpha_k^2 \mu^2}{2\hat\gamma}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle. 
\end{aligned}\tag{3*}
$$

From the left to the right on the first equality, coefficients of $\Vert g_k\Vert^2$ cancels out to zero and the inner product containing $g_k$ are grouped. 
Going from the left to the right of the third equality, we applied (Q3) derived earlier to simplify the inner product term. 
The last equalities re-arranged terms and grouped the coefficients of $\epsilon_k$ together. 
Taking a page break, continuing on (3*) we have

$$
\begin{aligned}
    &
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\&\quad 
        + \frac{(1 - \alpha_k)\mu\alpha_k\gamma}{2\hat \gamma}\Vert v_k - y_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2
    \\&\quad 
        + \frac{\alpha_k^2 \mu^2}{2\hat \gamma}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    &= 
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + 
        \left(
            \frac{(1 - \alpha_k)\mu\alpha_k\gamma}{2\hat \gamma}
            + 
            \frac{\alpha_k^2 \mu^2}{2\hat \gamma}
        \right)\Vert y_k - v_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2 
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    & =
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + 
        \frac{\mu \alpha_k}{2}\Vert y_k - v_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2 
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\ &=
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        +
        \frac{\mu\alpha_k}{2} \Vert y_k - x^*\Vert^2
    \\&= 
    F(x_k) - \alpha_k\left(
        \epsilon_k + \langle g_k, x_k - x^*\rangle
        - \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}\tag{3.1*}
$$

On the first equality, coefficients of $\Vert y_k - v_k\Vert^2$ are grouped together. 
On the second to the third equality, the terms had been simplified by 

$$
\begin{aligned}
    \frac{(1 - \alpha_k)\mu\alpha_k\gamma}{2\hat \gamma} + 
    \frac{\alpha_k^2 \mu^2}{2\hat \gamma}
    &= 
    \frac{\mu\alpha_k}{2}\left(
        \frac{(1 - \alpha_k)\gamma_k + \alpha_k \mu}{\hat \gamma}
    \right)
    \\
    &= \frac{\mu\alpha_k}{2}\left(
        \frac{\hat \gamma}{\hat \gamma}
    \right) = \frac{\mu\alpha_k}{2}. 
\end{aligned}
$$


(3.1\*) was adding (1\*) and (2.2\*) together, which is the same as adding (1\*) and (2\*) together. 
So that was all equal to (1\*) + (2\*) and it says: 

$$
\begin{aligned}
    & F(x_{k + 1}) + R_{k + 1} + 
    \frac{\hat \gamma}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    &= 
    F(x_k) - \alpha_k\left(
        \epsilon_k + \langle g_k, x_k - x^*\rangle
        - \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    \iff & 
    \\
    & F(x_{k + 1}) - F(x^*) + R_{k + 1} + 
    \frac{\hat \gamma}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    &= 
    F(x_k) - F(x^*) - \alpha_k\left(
        \epsilon_k + \langle g_k, x_k - x^*\rangle
        - \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &= (1 - \alpha_k)(F(x_k) - F(x^*))
    + \alpha_k\left(
        F(x_k) - F(x^*) - \epsilon_k - \langle g_k, x_k - x^*\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + 
        (1 - \alpha_k)\left(
            R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
        \right). 
\end{aligned}
\tag{3.2*}
$$

Focusing on the second term, we simplify the multiplier inside: 

$$
{\small
\begin{aligned}
    & F(x_k) - F(x^*) - \epsilon_k - \langle g_k, x_k - x^*\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \\
    &= 
    F(x_k) - F(x^*) - \left(
        F(x_k) - F(T_L y_k) - \langle g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2
    \right)- \langle g_k, x_k - x^*\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \\
    &= F(T_L y_k) - F(x^*) + \langle g_k, x^* - y_k\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    + \frac{1}{2L}\Vert g_k\Vert^2 \le 0. 
\end{aligned}
}
\tag{4*}
$$

We used the fact that $F$ is $\mu$ strongly convex and $\rho_k \in [0, 1]$ (the parameter that defines $g_k$) here! 
Therefore, we conclude that: 

$$
\begin{aligned}
    F(x_{k + 1}) - F(x^*) + R_{k + 1} + 
    \frac{\hat \gamma}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    (1 - \alpha_k)\left(
        F(x_k) - F(x^*) + R_k + \frac{\gamma}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}
$$

**Remarks**

Use $\mu = D_f(x^*, y_k)/\Vert y_k - x^*\Vert^2$ also works, $\mu$ is a very pessimistic choice for the inequality above. 


#### **Algorithm 2.1 | Weak accelerated proximal gradient**
> Choose any $\gamma_0$, $(x_0, v_0)$ or equivalently $(x_0, y_0), (y_0, v_0)$. 
> Given any sequence $(\rho_k)_{k\ge0}, (\alpha_k)_{k \ge0}$ such that for all integer $k\ge 0$, they have $\rho_k \in [0, 1], \alpha_k \in (0, 1)$. 
> The algorithm generates a sequence of $(x_k, y_k, v_k)$ such that they satisfy for all $k\ge 0$ recursively: 
> $$
> \begin{aligned}
>     \gamma_k &:= \left.\begin{cases}
>           \rho_{k - 1}L\alpha_{k - 1}^2 & k \ge 1,
>           \\
>           \gamma_0 & k = 0. 
>     \end{cases}\right\rbrace,
>     \\
>     \hat \gamma_{k + 1} &:= L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
>     \\
>     y_k &= 
>     (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \hat\gamma_{k + 1} x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= 
>     \hat\gamma^{-1}_{k + 1}
>     (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$


**Theorem | Convergence of the weak accelerated proximal gradient algorithm**
> Let vectors $(x_k, y_k, v_k)_{k \ge0}$ and scalars $\alpha_k$ be generated by the weak accelerated proximal gradient algorithm. 
> Define recursively for all $k\ge1$ by 
> $$
> \begin{aligned}
>    R_{k + 1}
>    := 
>    \frac{1}{2}\left(
>        L^{-1} - \frac{\alpha_k^2}{\hat \gamma_{k + 1}}
>    \right)\Vert g_k\Vert^2
>    + 
>    (1 - \alpha_k)
>    \left(
>        \epsilon_k + R_k + 
>        \frac{\mu\alpha_k\gamma_k}{2\hat \gamma_{k + 1}}
>        \Vert v_k - y_k\Vert^2
>    \right). 
> \end{aligned}
> $$
> Choose $R_0= 0$ to be the base case. 
> Choose any $x^* \in \R^n$ then
> $$
> \begin{aligned}
>     F(x_{k + 1}) - F(x^*) + \frac{L \alpha_k^2}{2}\Vert v_{k + 1} - x^*\Vert^2
>     &\le 
>     \left(
>         \prod_{i = 0}^{k} \left(1  - \alpha_i\right)
>     \right)
>     \left(
>         F(x_0) - F(x^*) + \frac{\gamma_0}{2}\Vert v_k - x^*\Vert^2
>     \right). 
> \end{aligned}
> $$

**Proof**


Recall the stepwise convergence theorem, since the choice of $\gamma, \hat \gamma$ is arbitrary choices for the theorem, we choose $\gamma = \rho_{k - 1} L \alpha_{k - 1}^2, \hat \gamma = L \alpha_k^2$, giving us: 

$$
\begin{aligned}
    F(x_{k + 1}) - F^* + R_{k + 1} + \frac{L \alpha_k^2}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    (1 - \alpha_k)
    \left(
        F(x_k) - F^* + R_k + \frac{\rho_{k - 1}L \alpha_{k - 1}^2}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &\le 
    (1 - \alpha_k)
    \left(
        F(x_k) - F^* + R_k + \frac{L \alpha_{k - 1}^2}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &\le 
    \left(
        \prod_{i = 0}^{k} \left(1  - \alpha_i\right)
    \right)
    \left(
        F(x_0) - F^* + R_0 + \frac{\gamma_0}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}
$$
Going from the left to the right on the second inequality, we used the fact that $\rho_{k - 1} \in [0, 1]$. 
Additionally, the algorithm converges by considering $R_k$: 

$$
\begin{aligned}
    R_{k + 1}
    &= 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\hat \gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma_k}{2\hat \gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \right)
    \\
    &= (1 - \alpha_k)
    \left(
        \epsilon_k + R_k 
        + \frac{\mu\alpha_k\gamma_k}{2\hat \gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \right)
    \\
    &\ge 
    (1 - \alpha_k) R_k
    \\
    &\ge R_0 \prod_{i = 0}^{k} \left(1 - \alpha_i\right) = 0. 
\end{aligned}
$$

Going from the left to the right on the first equality, we used the fact that $\hat \gamma_{k + 1} = L \alpha_{k}^2$.
This makes coefficient of $\Vert g_k\Vert^2$ zero. 
The fist inequality is by $\epsilon_k \ge 0$ and the non-negativity of the remaining terms. 
The last equality is by the assumption that $R_0 = 0$. 
Therefore: 

$$
\begin{aligned}
    F(x_{k + 1}) - F^* +
    \frac{L\alpha_k^2}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    \left(
        \prod_{i = 0}^{k} \left(1  - \alpha_i\right)
    \right)
    \left(
        F(x_0) - F^* + \frac{\gamma_0}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}
$$

**Remarks**

The choice of $\rho_k \in (0, 1]$ is just a convenience for convergence analysis. 
It's a belief that there exists sequence $\rho_k$ where $\rho_k \ge 1$ where the algorithm would have a chance at converging still. 


#### **Algorithm | Relaxed accelerated proximal gradient**
> Initialize any $\gamma_0$, $(x_0, v_0)$ or equivalently $(x_0, y_0), (y_0, v_0)$. 
> Given any sequence $(\rho_k)_{k\ge0}, (\alpha_k)_{k \ge0}$ such that for all integer $k\ge 0$, they have $\rho_k \ge 0, \alpha_k \in (0, 1)$. 
> The algorithm generates a sequence of $(x_k, y_k, v_k)$ such that they satisfy for all $k\ge 0$ recursively: 
> $$
> \begin{aligned}
>     \gamma_k &:= \left.\begin{cases}
>           (1 + \rho_{k - 1})L\alpha_{k - 1}^2 & k \ge 1,
>           \\
>           \gamma_0 & k = 0. 
>     \end{cases}\right\rbrace,
>     \\
>     \hat \gamma_{k + 1} &:= L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
>     \\
>     y_k &= 
>     (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \hat\gamma_{k + 1} x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= 
>     \hat\gamma^{-1}_{k + 1}
>     (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$




---
### **Analyzing WAPG**

We show that the algorithm is able to encapsulate algorithms in the literatures, and more. 

#### **Algorithm 2.2 | Weak accelerated proximal gradient intermediate form**
> Suppose that $(y_i, x_i, v_i)$ are generated by the WAPG algorithm for all $0 \le i \le k$. 
> Then the iterates can be expressed without the sequence $(\gamma_k)_{k \ge0}, (\rho_k)_{k\ge0}$, and they satisfy: 
> $$
> \begin{aligned}
>     y_k &= 
>     \left(
>         1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
>     \right), 
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= 
>     \left(
>         1 + \frac{\mu}{L \alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{\mu}{L \alpha_k - \mu}\right) y_k
>     \right) - \frac{1}{L\alpha_{k}}\mathcal G_L y_k, 
>     \\
>     L &\alpha_k^2 \le (1 - \alpha_k)L \alpha_{k - 1} + \mu \alpha_k. 
> \end{aligned}
> $$

**Proof**

$$
\begin{aligned}
    y_{k} &= 
    (\gamma_k + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k + \hat \gamma_{k + 1}x_k)
    \\
    &= 
    (\hat \gamma_{k + 1} + \alpha_k \gamma_k)^{-1}
    (\alpha_k \gamma_k v_k + \hat \gamma_{k + 1}x_k)
    \\
    &= 
    \left(
        \frac{\hat \gamma_{k + 1}}{\alpha_k\gamma_k} + 1
    \right)^{-1}
    \left(
        v_k + \frac{\hat \gamma_{k + 1}}{\alpha_k \gamma_k} x_k
    \right)
    \\
    &= 
    \left(
        1 + \frac{L\alpha_k^2}{\alpha_k \rho_{k - 1}L\alpha_{k - 1}^2} 
    \right)^{-1}
    \left(
        v_k + \frac{L\alpha_k^2}{\alpha_k \rho_{k - 1}L\alpha_{k - 1}^2} x_k
    \right)
    \\
    &= 
    \left(
        1 + \frac{\alpha_k}{\rho_{k - 1}\alpha_{k - 1}^2}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k}{\rho_{k - 1}\alpha_{k - 1}^2} x_k
    \right)
    \\
    &= 
    \left(
        1 + \frac{L - L \alpha_k}{L \alpha_k - \mu}
    \right)^{-1}
    \left(
        v_k + 
        \frac{L - L \alpha_k}{L \alpha_k - \mu} x_k
    \right). 
\end{aligned}
$$

From the left to right of the second inequality, we used the fact that $\hat \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k\mu$. 
Going from the left to the right of the second last inequality, we did the following: 
$$
\begin{aligned}
    L\alpha_k^2 &= 
    (1 - \alpha_k)L\rho_{k- 1}\alpha_{k - 1}^2 + \alpha_k \mu 
    \\
    \iff 
    L \alpha_k^2 - \alpha_k\mu &= 
    (1 - \alpha_k)L \rho_{k - 1}\alpha_{k - 1}^2
    \\
    \iff 
    \rho_{k - 1}\alpha_{k - 1}^2
    &= 
    \frac{L \alpha_k^2 - \alpha_k\mu}{L (1 - \alpha_k)}
    \\
    \iff 
    \frac{1}{\rho_{k - 1}\alpha_{k - 1}^2}
    &= 
    \frac{L (1 - \alpha_k)}{L \alpha_k^2 - \alpha_k\mu}
    \\
    \iff 
    \frac{\alpha_k}{\rho_{k - 1}\alpha_{k - 1}^2}
    &= 
    \frac{L - L\alpha_k}{L\alpha_k - \mu}. 
\end{aligned}
$$

For $v_{k + 1}$ considers 

$$
\begin{aligned}
    v_{k + 1} &= 
    \hat \gamma_{k + 1}^{-1}
    ((1 - \alpha_k)\gamma_k v_k + \mu\alpha_k y_k)
    - \alpha_k\hat \gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    ((1 - \alpha_k)\gamma_k + \alpha_k \mu)^{-1}
    \left(
        (1 - \alpha_k)\gamma_k v_k + \mu\alpha_k y_k
    \right)
    - \alpha_k\hat \gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k\mu}{(1 - \alpha_k)\gamma_k}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k\mu}{(1 - \alpha_k)\gamma_k} y_k
    \right)
    - \alpha_k\hat \gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k\mu}{(1 -\alpha_k)L\rho_{k - 1}\alpha_{k - 1}^2}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k\mu}{(1 - \alpha_k)\rho_{k - 1}L\alpha_{k - 1}^2} y_k
    \right)
    - \frac{1}{L\alpha_{k}}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k \mu}{L \alpha_k^2 - \alpha_k \mu}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k \mu}{L \alpha_k^2 - \alpha_k \mu} y_k
    \right)
    - \frac{1}{L\alpha_{k}}\mathcal G_L y_k. 
\end{aligned}
$$

Going from the left to the right of the second equality, we substitute $\hat \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \mu\alpha_k$. 
Going from the left to right of the second last equality, we made the substitution $\hat \gamma_{k + 1} = L \alpha_k^2$, and $\gamma_k = \rho_{k - 1}L \alpha_{k - 1}^2$. 
To arrive at the last equality, we considered substituting the denominator by the definition for $\hat\gamma_{k + 1}$. 

$$
\begin{aligned}
    (1 - \alpha_k)L\rho_{k - 1}\alpha_{k - 1}^2
    &= 
    \hat \gamma_{k + 1} - \mu \alpha_k
    = 
    L\alpha_{k}^2 - \alpha_k\mu. 
\end{aligned}
$$

The proof of the intermediate form is no complete. 
This form doesn't have $\rho_k, \gamma_k, \hat \gamma_k$ in it. 
Finally, to see the inequality, consider the fact that $\rho_k \in [0, 1]$ so it has: 
$$
\begin{aligned}
    \hat \gamma_{k + 1} = L\alpha_k^2 = (1 - \alpha_k)\rho_{k - 1}L \alpha_{k - 1}^2 + \alpha_k \mu 
    \le (1 - \alpha_k)L \alpha_{k - 1}^2 + \alpha_k \mu. 
\end{aligned}
$$


The only auxiliary sequence it needs is $\alpha_k$, which directly links to the convergence rate of the algorithm. 

#### **Definition | Abstract Similar Triangle Form**
> For all $k\ge 0$, iterates $(w_t, y_t, x_{t + 1}, z_{t + 1})$ satisfies recursively that: 
> $$
> \begin{aligned}
>     y_{t} &= 
>     (1 + \tau_t)^{-1}(\tau_t z_{t} + x_{t}), 
>     \\
>     w_t &= (1 + \xi_t)^{-1}(\xi_ty_t + x_t), 
>     \\
>     x_{t + 1}
>     &= 
>     w_t - (1 + \xi_t)^{-1} \delta_t\mathcal G_L(y_t), 
>     \\
>     z_{t + 1} &= 
>     y_t - L^{-1}\mathcal G_L y_t. 
> \end{aligned}
> $$
> > 
> If $1 + \xi_t + \tau_t = L\delta_t$, then 
> $$
>     x_{t +1} - z_{t + 1} = (1 + \xi_t)^{-1}\tau_t(z_{t + 1} - z_t). 
> $$
> Which makes the algorithm a similar triangle form. 

**Proof**

See [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md) for more information. 

#### **Algorithm 2.3 | Similar triangle form**
> Given any sequence $(\alpha_i)_{i \ge k}$ such that $\alpha_i \in (0, 1)$ for all $0\le i \le k$ and $L\alpha_k^2\le (1 - \alpha_k)L\alpha_{k - 1}^2 + \alpha_k \mu$. 
> Let $(x_k, y_k, v_k)$ to be generated as specified by Algorithm 2.2 by the $(\alpha_k)_{k \ge0}$. > Then the iterate $(v_k)$ can be expressed without $y_k, v_k$ by: 
> $$
> \begin{aligned}
>     y_k &= 
>     \left(
>         1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
>     \right), 
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
> \end{aligned}
> $$

**Proof**

Without repeating, see [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md) on the similar triangle form proof for Nesterov's 2.2.19 original algorithm. 


#### **Algorithm 2.4 | Momentum Form**
> Suppose any sequence $(\alpha_k)_{k \ge 0}$ satisfies recursively the conditions
> $L\alpha_k^2 \le (1 - \alpha_k)L\alpha_{k - 1}^2 + \alpha_k \mu$. 
> If $\alpha_k$ is used in the Similtar triangle form to generate the iterates $(x_k, y_k v_k)$. 
> Then the iterates are algebraically equivalent to: 
> $$
> \begin{aligned}
>     x_{k + 1} &= y_k - L^{-1}\mathcal G_Ly_k, 
>     \\
>     y_{k + 1} &= 
>     x_{k + 1} + 
>     \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
> \end{aligned}
> $$

See [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md) for the proof. 

---
### **Examples of WAPG methods in the literatures**

#### **Algorithm | V-FISTA**

#### **Algorithm | Chambolle Dossal**

#### **Algorithm | FISTA**