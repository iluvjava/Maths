- [Regret in APG EST SEQ](Regret%20in%20APG%20EST%20SEQ.md)
- [PPM APG Forms](PPM%20APG%20Forms.md)


---
### **Intro**

This file continues on the "regret" inside the Nesterov's estimating sequence and attempts to 
connect the knowledge with the existing literatures. 
Some words will be repeated for clear presentation of ideas presented in those previous files. 

Developing a weak version of the Accelerated proximal point method that has convergence claim for all possible "reasonable" choices of step sizes is the goal of this file. 

#### **Assumptions**
1. $f: \R \rightarrow \R^n$ is a convex differentiable function that is also $L$-Lipschitz smooth. 
2. $g: Q \rightarrow \R^n$ is a convex function. 
3. $F = f + g$, $F$ is the objective function. 

We introduce the following quantities in order to define the algorithm. 

1. $T_L = [I + \partial g]^{-1}\circ [I - L^{-1}\nabla f]$ which is the proximal gradient operator. 
2. $\mathcal G_L = L(I - T_L)$ to be the gradient mapping operator. 


---
### **Algorithm and convergence claims**

Define $g_k, \epsilon_k, l_F(x; y_k)$ for any $x_k, y_k$: 
$$
\begin{aligned}
    l_F(x; y_k) &:= F(T_Ly_k) + \langle g_k, x - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    \epsilon_{k} &:= F(x_k) - l_F(x_k; y_k). 
\end{aligned}
$$


#### **Algorithm 2 | Stepwise weak accelerated proximal gradient**
> Assume $0 \le \mu < L$.
> Fix any $k \in \mathbb Z$. 
> For any $(v_k, x_k), \alpha_k \in (0, 1), \gamma_k > 0$, let $\hat \gamma_{k + 1}$, and vectors $y_k, v_{k + 1}, x_{k + 1}$ be given by: 
> $$
> \begin{aligned}
>     \hat \gamma_{k + 1} &= (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
>     \\
>     y_k &= 
>     (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \hat\gamma_{k + 1} x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= \hat\gamma^{-1}_{k + 1}
>     (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$

**Observations 1**

We make 2 crucial observations here. 
With the algorithm, we define the following quantities associate with it. 
Fix any integer $k \ge 0$. 
Given any $(x_k, y_k)$. 


$\epsilon_k \ge 0$ always because we assumed $F$ is convex. 
To verify, we use the fundamental proximal gradient inequality. 

**Observations 2**

We make two crucial observations here. 
Fix any integer $k \ge 0$, recall $\alpha_k > 0, \gamma > 0$.
We have $x_k, y_k, v_k$ lie on the same line because and they have the following equivalent equalities: 

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

On the first equality (Q1), we multiplied both side of the equation by $\hat \gamma/\alpha_k \gamma$ and then group $y_k$ on the LHS. 
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
> Fix any integer $k \in \mathbb Z$.
> Given any $v_k, x_k$ and $\gamma_k > 0$, invoke Definition \ref{def:stepwise-wapg} to obtain $v_{k + 1}, x_{k + 1}, y_k, \hat \gamma_{k + 1}$. 
> Fix any arbitrary $R_k \in \R$.
> Define: 
> $$
> \begin{aligned}
>     R_{k + 1}
>     := 
>     \frac{1}{2}\left(
>         L^{-1} - \frac{\alpha_k^2}{\hat \gamma_{k + 1}}
>     \right)\Vert g_k\Vert^2
>     + 
>     (1 - \alpha_k)
>     \left(
>         \epsilon_k + R_k + 
>         \frac{\mu\alpha_k\gamma_k}{2\hat \gamma_{k + 1}}
>         \Vert v_k - y_k\Vert^2
>     \right). 
> \end{aligned}
> $$
> Then it has for all $x^* \in \R^n$ where $F^* = F(x^*)$, the inequality: 
> $$
> \begin{aligned}
>     F(x_{k + 1}) - F^* + R_{k + 1} + \frac{\hat \gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
>     &\le 
>     (1 - \alpha_k)
>     \left(
>         F(x_k) - F^* + R_k + \frac{\gamma_{k}}{2}\Vert v_k - x^*\Vert^2
>     \right). 
> \end{aligned}
> $$

**Proof**

The proof is a direct proof. 
Here we drop the subscript $k$, $k + 1$ on $\gamma_{k}, \hat \gamma_{k + 1}$ because they are fixed throughout the proof, and it makes for better readability! 

Start by considering the first and the third term of the LHS of the inequality that we want to prove. 
Using the definition of $\epsilon_k$ from the previous section we have: 

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
Since $\alpha_k > 0, \gamma > 0$, we may use them. 
So it gives: 

$$
\begin{aligned}
    &  
    - \alpha_k(v_k - x^*) - \frac{\alpha_k^2 \mu}{\hat \gamma}(y_k - v_k) - (x_k - y_k)
    \\
    & =
    -\alpha_k(v_k - x^*) -
    \frac{\alpha_k^2\mu}{\hat \gamma}\frac{\hat \gamma}{\alpha_k \gamma}(x_k - y_k)
    - (x_k - y_k) 
    & \text{by Q1 }
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
    &= 
    -\alpha_k(v_k - x^*) - 
    \frac{\alpha_k \mu + \gamma}{\gamma}
    \frac{\alpha_k \gamma}{\gamma + \alpha_k \mu}(x_k - v_k)
    & \text{by Q2}
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
{\small
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
}
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

We used the fact that $F$ is $\mu$ strongly convex 
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

Use any $0\le \mu \le D_f(x^*, y_k)/\Vert y_k - x^*\Vert^2$ also works. 
The default $\mu$ being the strong convexity modulus is a very pessimistic choice for the inequality above. 

The pessimistic choice of $\mu$ being the strong convexity modulus is for claiming the convergence of all initial guess $x_0, y_0$. 

---
### **Building the R-WAPG**

This sections builds up the R-WAPG algorithms. 

#### **Definition | R-WAPG sequences**
> Assume $0 \le \mu < L$. 
> The sequences $(\alpha_k)_{k \ge 0}, (\rho_k)_{k \ge1}$ are sequences parameterized by $\mu, L$. 
> They are valid for R-WAPG if all the following holds: 
> $$
> \begin{aligned}
>     \alpha_0 &\in (0, 1], 
>     \\
>     \alpha_k &\in (\mu/L, 1) \quad (\forall k \ge 1), 
>     \\
>     \rho_k &:= \frac{\alpha_{k + 1}^2 - (\mu/L)\alpha_{k + 1}}{(1 - \alpha_{k + 1})\alpha_k^2} \quad \forall (k \ge 0). 
> \end{aligned}
> $$
> We call $(\alpha_k)_{k \ge 0}, (\rho_k)_{k \ge 0}$ the R-WAPG sequences. 

**Observations**

1. $\rho_k > 0$ for all $k \ge 0$. 
2. $\forall k \ge 1: L\alpha_k^2 = (1 - \alpha_k)L\rho_{k - 1}\alpha_{k - 1}^2 +\mu\alpha_k$. 



#### **Algorithm 2.1 | Relaxed weak accelerated proximal gradient (R-WAPG)**
> Initialize any $(x_1, v_1)$. 
> Given R-WAPG sequences $(\alpha_k)_{k \ge 1}, (\rho_k)_{k \ge 1}$, 
> The algorithm generates a sequence of vector $(y_k, x_{k + 1}, v_{k + 1})_{k \ge 1}$, by the following procedures: 
> For $k=1, 2, 3, \cdots$
> $$
> \begin{aligned}
>     \gamma_k &:= \rho_{k -1}L\alpha_{k - 1}^2, 
>     \\
>     \hat \gamma_{k + 1} & := (1 - \alpha_k)\gamma_k + \mu \alpha_k = L\alpha_k^2, 
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

**Observations**

For all $k \ge 1$, the algorithm chains together the sequence of $(\hat \gamma_{k+1})_{k \ge 1}$ and $(\gamma_k)_{k \ge 1}$ through the equalities: 
$$
\begin{aligned}
    \hat \gamma_{k + 1} 
    &= L\alpha_k^2 
    \\
    &= (1 - \alpha_k)\gamma_k + \alpha_k \mu
    \\
    &= (1 - \alpha_k)L\rho_{k - 1}\alpha_{k - 1}^2 + \alpha_k \mu
    \\
    &= (1 - \alpha_k)\rho_{k - 1}\hat \gamma_{k} + \alpha_k \mu. 
\end{aligned}
$$


<!-- 
If $\alpha_1 \in (0, 1)$, which is true by $\gamma_1 \in (0, L]$, then the entire sequence $\alpha_k \in (0, 1)$. 
Suppose inductively that $\alpha_{k - 1}, \rho_{k - 1}$ are given such that they satisfy $\alpha_{k -1} \in (0, 1)$ and $0 < \rho_{k - 1} \alpha_{k - 1}^2 < 1$. 
Solving the quadratic $L\alpha_k^2=(1 - \alpha_k)\rho_{k - 1}L\alpha_{k - 1}^2 + \mu \alpha_k$ for $\alpha_k$ yields candidates. 

$$
\begin{aligned}
    \alpha_k &= 
    \frac{1}{2}\left(
        \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
        \pm
        \sqrt{(\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L)^2 + 4\rho_{k - 1}\alpha_{k - 1}^2}
    \right). 
\end{aligned}
$$

Choosing the positive sign which is the larger one of the roots of the quadratic. 
We have $\alpha_k > 0$ because: 

$$
\begin{aligned}
    \alpha_k &=
    \frac{1}{2}\left(
        \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
        +
        \sqrt{(\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L)^2 + 4\rho_{k - 1}\alpha_{k - 1}^2}
    \right)
    \\
    &\ge 
    \frac{1}{2}\left(
        \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
        +
        \left|\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L\right|
    \right) + \alpha_{k - 1}\sqrt{\rho_{k - 1}}
    \\
    & > 0. 
\end{aligned}
$$

On the last strict inequality we used the fact that $\rho_{k - 1}> 0, \alpha_{k - 1} > 0$. 
An upper bound can be identified by using inductive hypothesis and considering: 

$$
\begin{aligned}
    \alpha_k &= 
    \frac{1}{2}\left(
        \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
        +
        \sqrt{(\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L)^2 + 4\rho_{k - 1}\alpha_{k - 1}^2}
    \right)
    \\
    &<
    \frac{1}{2}\left(
        \frac{\mu}{L} + 
        \sup_{x \in (0, 1)}
        \left\lbrace
            -x + \sqrt{(x - \mu/L)^2 + 4x}
        \right\rbrace
    \right)
    \\
    &\le \frac{1}{2}\left(
        \mu/L + \max\left(\mu/L, -1 + \sqrt{(1 - \mu/L)^2 + 4}\right)
    \right) \le 1. 
\end{aligned}
$$
Going to the first inequality, we used $\rho_{k - 1} \alpha_{k - 1}^2 < 1$ to get the strict inequality. 
Going from the second to the third inequality, we maximized $\mu/L$ by monotone increasing of linear function and the square root function. 
Therefore, inductively, $\alpha_k \in (0, 1)$ holds. 
However, the limit of $\alpha_k$ could be 1.  -->

#### **Theorem | Convergence of the R-WAPG**
> Fix any arbitrary $x^* \in \R^n, N \in \mathbb N$. 
> Let vector sequence $(y_k, v_{k}, x_{k})_{k \ge 1}$ and scalar sequences $\alpha_k, \rho_k$ be a valid R-WAPG sequences. 
> Define $R_1 = 0$ and suppose that for $k = 1, 2, \cdots, N$, we have $R_k$ recursively given by: 
> $$
> \begin{aligned}
>     R_{k + 1}
>     := 
>     \frac{1}{2}\left(
>         L^{-1} - \frac{\alpha_k^2}{\hat \gamma_{k + 1}}
>     \right)\Vert g_k\Vert^2
>     + 
>     (1 - \alpha_k)
>     \left(
>         \epsilon_k + R_k + 
>         \frac{\mu\alpha_k\gamma_k}{2\hat \gamma_{k + 1}}
>         \Vert v_k - y_k\Vert^2
>     \right). 
> \end{aligned} 
> $$
> Then for all $k = 1, 2, \cdots, N$: 
> $$
> \begin{aligned}
>     & F(x_{k + 1}) - F(x^*) + \frac{L \alpha_k^2}{2}\Vert v_{k + 1} - x^*\Vert^2
>     \\
>     &\le 
>     \left(
>         \prod_{i = 0}^{k - 1} \max(1, \rho_{k})
>     \right)
>     \left(
>         \prod_{i = 1}^{k} \left(1  - \alpha_i\right)
>     \right)
>     \left(
>         F(x_1) - F(x^*) + \frac{\gamma_1}{2}\Vert v_1 - x^*\Vert^2
>     \right). 
> \end{aligned}
> $$


**Proof**

The $R_k$ is the same as the stepwise Lyapunov claim which is based on each step of R-WAPG. 
Hence, we can use the stepwise convergence claim and the base case: $k = 1$ is demonstrated by: 

$$
\begin{aligned}
    & F(x_{2}) - F(x^*) + R_2 + \frac{L \alpha_1^2}{2}\Vert v_{2} - x^*\Vert^2
    \\
    & = F(x_{2}) - F(x^*) + R_2 + \frac{\hat \gamma_{2}}{2}\Vert v_{2} - x^*\Vert^2
    & \text{by: } \hat \gamma_2 = L \alpha_1^2
    \\
    &\le 
    (1 - \alpha_1)\left(
        F(x_1) - F(x^*) + R_1 + \frac{\gamma_1}{2}\Vert v_1 - x^*\Vert^2
    \right) 
    & 
    \\
    &= 
    (1 - \alpha_1)\left(
        F(x_1) - F(x^*) + R_1 + \frac{L\rho_{0}\alpha_{0}^2}{2}\Vert v_1 - x^*\Vert^2
    \right) 
    \\
    &= \max\left(\rho_0, 1\right)
    (1 - \alpha_1)\left(
        F(x_1) - F(x^*) + R_1 + \frac{L\alpha_0^2}{2}\Vert v_1 - x^*\Vert^2
    \right). 
\end{aligned}
$$

For the inductive case we have from the definition of the algorithm: 

$$
\begin{aligned}
    \hat \gamma_{k + 1} = L\alpha_{k}^2 
    &=(1 - \alpha_k)\rho_{k - 1}L\alpha_{k - 1}^2 + \mu\alpha_k
    \\
    &= (1 - \alpha_k)\gamma_k + \mu\alpha_k. 
\end{aligned}
$$

Unrolls inductively it gives: 

$$
\begin{aligned}
    &
    F(x_{k + 1}) - F^* + R_{k + 1} + \frac{\hat\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2 
    \\
    &=
    F(x_{k + 1}) - F^* + R_{k + 1} + \frac{L \alpha_k^2}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    &\le 
    (1 - \alpha_k)
    \left(
        F(x_k) - F^* + R_k + \frac{\rho_{k - 1}L \alpha_{k - 1}^2}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &\le 
    (1 - \alpha_k)
    \left(
        F(x_k) - F^* + R_k + \max(1, \rho_{k - 1})\frac{L \alpha_{k - 1}^2}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &\le 
    \max(1, \rho_{k - 1})(1 - \alpha_k)
    \left(
        F(x_k) - F^* + R_k + \frac{L \alpha_{k - 1}^2}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &\le 
    \left(
        \prod_{i = 0}^{k - 1} \max(1, \rho_{k})
    \right)
    \left(
        \prod_{i = 1}^{k} \left(1  - \alpha_i\right)
    \right)
    \left(
        F(x_1) - F^* + R_1 + \frac{L\alpha_0^2}{2}\Vert v_1 - x^*\Vert^2
    \right). 
\end{aligned}
$$

Additionally, for all $k = 1, 2, \cdots, N$ it has $R_{k + 1} \ge 0$ because: 
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
    &\ge R_1 \prod_{i = 1}^{k} \left(1 - \alpha_i\right) = 0. 
\end{aligned}
$$

Therefore, it gives 

$$
\begin{aligned}
    & 
    F(x_{k + 1}) - F^* +
    \frac{L\alpha_k^2}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    &\le 
    \left(
        \prod_{i = 0}^{k - 1} \max(1, \rho_{k})
    \right)
    \left(
        \prod_{i = 1}^{k} \left(1  - \alpha_i\right)
    \right)
    \left(
        F(x_1) - F^* + \frac{L\alpha_0^2}{2}\Vert v_1 - x^*\Vert^2
    \right). 
\end{aligned}
$$




---
### **Analyzing R-WAPG**

We show that the algorithm is able to encapsulate algorithms in the literatures, and more. 


#### **Proposition | First equivalent representation of R-WAPG**
> Assume $\mu < L$. 
> Choose any $\gamma_0 \in (0, 1)$ as the initial condition for R-WAPG to produce vectors sequence $(y_i)_{i \in \N}, (x_i)_{i \in \N}, (v_i)_{i \in \N}$ and $(\rho_k)_{i \in \N}, (\alpha_k)_{i \in \N}$. 
> Then the iterates can be expressed without $(\gamma_k)_{k \ge0}, (\rho_k)_{k\ge0}$, and for all $k\ge 0$ they are algebraically equivalent to
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
>     \right) - \frac{1}{L\alpha_{k}}\mathcal G_L y_k. 
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

On the third $\iff$, we can assume $\alpha_k \neq \mu/L$ because $\alpha_k = \mu/L$ is impossible. 
For contradiction, assume $a_k = \mu/L$. 
Then
$$
\begin{aligned}
    L \alpha_k^2 - \alpha_k\mu &= 
    (1 - \alpha_k)L \rho_{k - 1}\alpha_{k - 1}^2 = 0 \implies \alpha_{k - 1} = 0. 
\end{aligned}
$$

Which contradict $\alpha_{k - 1} \in (0, 1)$. 
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

The proof of the intermediate form is now complete. 
This form doesn't have $\rho_k, \gamma_k, \hat \gamma_k$ in it. 
Finally, to see the inequality, consider the fact that $\rho_k \in [0, 1]$ so it has: 
$$
\begin{aligned}
    \hat \gamma_{k + 1} = L\alpha_k^2 = (1 - \alpha_k)\rho_{k - 1}L \alpha_{k - 1}^2 + \alpha_k \mu 
    \le (1 - \alpha_k)L \alpha_{k - 1}^2 + \alpha_k \mu. 
\end{aligned}
$$


Therefore, the algorithm is valid for all possible choice of $\alpha_k$ by the inequality constraint. 


**Remarks**

The only auxiliary sequence it needs is $\alpha_k$, which directly links to the convergence rate of the algorithm. 


#### **Definition | R-WAPG intermediate form**
> Given any initial $\alpha_0 \in (0, 1)$, $(x_0, y_0)$ or equivalently $(x_0, v_0), (y_0, v_0)$. 
> Assume $\mu < L$. 
> The algorithm generate sequence of vector iterates $(x_k, v_k, y_k)_{k \ge0}$ by the procedures: 
> $$
> \begin{aligned}
>     \text{find }& \rho_{k - 1}: 0 < \rho_{k - 1} < \alpha_{k - 1}^{-2},
>     \\
>     \alpha_k &= 
>     \frac{1}{2}\left(
>       \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
>       +
>       \sqrt{(\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L)^2 + 4\rho_{k - 1}\alpha_{k - 1}^2}
>     \right), 
>     \\
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
>     \right) - \frac{1}{L\alpha_{k}}\mathcal G_L y_k. 
> \end{aligned}
> $$



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


#### **Proposition | R-WAPG second equivalent representation**
> Let iterates $(x_k, v_k, y_k)_{k \ge 0}$ and sequence $(\alpha_k, \rho_k)_{k \ge0}$ be given by R-WAPG intermediate form. 
> Then for all $k \ge0$, iterate $(v_k)_{k \ge 0}, (x_k)_{k \ge 0}, (y_k)_{k \ge0}$ are algebraically equivalent to: 
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

#### **Definition | R-WAPG similar triangle form**
> Given any initial $\alpha_0 \in (0, 1)$, $(x_0, y_0)$ or equivalently $(x_0, v_0), (y_0, v_0)$. 
> Assume $\mu < L$. 
> The algorithm generate sequence of vector iterates $(x_k, v_k, y_k)_{k \ge0}$ by the procedures: 
> $$
> \begin{aligned}
>     \text{find }& \rho_{k - 1}: 0 < \rho_{k - 1} < \alpha_{k - 1}^{-2},
>     \\
>     \alpha_k &= 
>     \frac{1}{2}\left(
>       \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
>       +
>       \sqrt{(\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L)^2 + 4\rho_{k - 1}\alpha_{k - 1}^2}
>     \right), 
>     \\
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
>     x_{k + 1} + (\alpha_k^{-1} -1)(x_{k + 1} - x_k). 
> \end{aligned}
> $$


#### **Proposition | Third equivalent representation of R-WAPG**
> Let sequence $(\alpha_k, \rho_k)_{k \ge0}$ and iterates $(x_k, v_k, y_k)_{k\ge 0}$ given by R-WAPG intermediate form. 
> Then the iterates are algebraically equivalent to: 
> $$
> \begin{aligned}
>     x_{k + 1} &= y_k - L^{-1}\mathcal G_Ly_k, 
>     \\
>     y_{k + 1} &= 
>     x_{k + 1} + 
>     \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
> \end{aligned}
> $$
> In the special case when $\mu = 0$, the momentum term admits simpler representation 
> $$
> \begin{aligned}
>    \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}
>    & = \alpha_{k + 1}(\alpha_k^{-1} - 1). 
> \end{aligned}
> $$

**Proof**

Start by considering the update rule for $v_k$ from the similar triangle form of WAPG which is: 

$$
\begin{aligned}
    v_{k + 1} &= 
    x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \\
    \iff 
    (L \alpha_{k + 1} - \mu)v_{k + 1} 
    &= 
    (L \alpha_{k + 1} - \mu)x_{k + 1} + (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
\end{aligned}
$$

Next, we simplify the update for the iterates $y_{k}$ by the similar triangle form of WAPG. 

$$
\begin{aligned}
    y_k &= 
    \left(
        1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
    \right)^{-1}
    \left(
        v_k + 
        \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
    \right)
    \\
    &= 
    \left(
       \frac{L - \mu}{L\alpha_k - \mu} 
    \right)^{-1}
    \left(
        v_k + 
        \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
    \right)
    \\
    &= 
    \frac{L\alpha_k - \mu}{L - \mu} v_k
    + 
    \frac{L - L \alpha_k}{L - \mu} x_k
    \\
    &= (L - \mu)^{-1}((L \alpha_k - \mu)v_k + (L - L \alpha_k)x_k). 
\end{aligned}
$$

Now considering substituting $v_{k + 1}$ into $y_{k + 1}$ so it has: 


$$
\begin{aligned}
    y_{k + 1} &= 
    (L - \mu)^{-1}((L\alpha_{k + 1} - \mu)v_{k + 1} + (L - L \alpha_{k + 1})x_{k + 1})
    \\
    &= (L - \mu)^{-1}
    \left(
        (L\alpha_{k + 1} - \mu)x_{k + 1} + 
        (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
        + (L - L \alpha_{k + 1})x_{k + 1}
    \right)
    \\
    &= 
    (L - \mu)^{-1}
    \left(
        (L\alpha_{k + 1} - \mu)x_{k + 1} + (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \right)
    \\
    &= x_{k + 1} + \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)}{L - \mu}(x_{k + 1} - x_k). 
\end{aligned}
$$

The coefficient for $(x_{k + 1} - x_k)$ needs some works to formulate it without the parameter $\mu, L$. 
To do that we have: 

$$
\begin{aligned}
    \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)}{L - \mu}
    &= \frac{(L\alpha_{k + 1} - \mu)\alpha_k(1 - \alpha_k)}{\alpha_k^2(L - \mu)}
    \\
    &= 
    \alpha_k(1 - \alpha_k)
    \left(
        \frac{\alpha_k^2(L - \mu)}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= \alpha_k(1 - \alpha_k)
    \left(
        \frac{L\alpha_k^2 - \mu\alpha_k^2}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= 
    \alpha_k(1 - \alpha_k)
    \rho_k\left(
        \frac{L\rho_k\alpha_k^2 - \mu\rho_k\alpha_k^2}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= 
    \rho_k\alpha_k(1 - \alpha_k)
    \left(
        \frac{(L\alpha_{k + 1} - \mu)(\rho_k\alpha_k^2 + \alpha_{k + 1})}
        {L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}.
\end{aligned}
$$

Going from the left to right on the fourth equality, we used $L\alpha_{k + 1}^2 = (1 - \alpha_{k + 1})\rho_kL\alpha_k^2 + \mu \alpha_{k + 1}$ with 

$$
\begin{aligned}
    L \rho_k \alpha_k^2 - \mu \rho_k \alpha_k^2 
    &= 
    (1 - \alpha_{k + 1})L \rho_k \alpha_k^2 + \alpha_{k + 1} L \rho_k \alpha_k^2 - \mu \rho_k \alpha_k^2
    \\
    &= 
    ((1 - \alpha_{k + 1})L \rho_k \alpha_k^2 + \mu \alpha_{k + 1}) - \mu\alpha_{k + 1} + \alpha_{k + 1} L \rho_k \alpha_k^2 - \mu \rho_k \alpha_k^2
    \\
    &= L \alpha_{k + 1}^2 - \mu\alpha_{k + 1} + \alpha_{k + 1}L\rho_k\alpha_k^2 - \mu \rho_k \alpha_k^2
    \\
    &= 
    L\alpha_{k + 1}(\alpha_{k + 1} + \rho_k \alpha_k^2) - \alpha_{k + 1}\mu - \mu \rho_k \alpha_k^2
    \\
    &= (L \alpha_{k + 1} - \mu)(\alpha_{k + 1} + \rho_k \alpha_k^2). 
\end{aligned}
$$


When $\mu = 0$, things simplify. 
Consider that $\alpha_{k +1}^2 = (1 - \alpha_{k + 1})\alpha_k^2$. 

$$
\begin{aligned}
    \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}
    &= 
    \frac{\rho_k\alpha_{k + 1}\alpha_k(1 - \alpha_k)}
    {\rho_k\alpha_{k + 1}\alpha_k^2 + \alpha_{k + 1}^2}
    \\
    &= 
    \frac{\rho_k\alpha_{k + 1}\alpha_k(1 - \alpha_k)}
    {\rho_k\alpha_{k + 1}\alpha_k^2 + \rho_k(1 - \alpha_{k + 1})\alpha_k^2}
    \\
    &= \frac{\rho_k\alpha_{k + 1}\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2}
    \\
    &= \alpha_{k + 1}(\alpha_k^{-1} - 1). 
\end{aligned}
$$

#### **Definition | R-WAPG Momentum Form**
> Initialize any $\alpha_0 \in (0, 1)$. 
> The algorithm generates iterates $(v_k, x_k, y_k)$ and auxiliary sequence $(\rho_k)_{k \ge0}$ by the following procedures: 
> $$
> \begin{aligned}
>     \text{find }& \rho_{k - 1}: 0 < \rho_{k - 1} < \alpha_{k - 1}^{-2},
>     \\
>     \alpha_k &= 
>     \frac{1}{2}\left(
>       \frac{\mu}{L} - \rho_{k - 1}\alpha_{k - 1}^2 
>       +
>       \sqrt{(\rho_{k - 1}\alpha_{k - 1}^2 - \mu/L)^2 + 4\rho_{k - 1}\alpha_{k - 1}^2}
>     \right), 
>     \\
>     x_{k + 1} &= y_k - L^{-1}\mathcal G_Ly_k, 
>     \\
>     y_{k + 1} &= 
>     x_{k + 1} + 
>     \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
> \end{aligned}
> $$
> In the special case $\mu = 0$, the momentum term can be represented without relaxation parameter $\rho_k$: 
> $$
> \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}} 
> = \alpha_{k + 1}(\alpha_k^{-1} - 1).  
> $$




