- [The Spectral Momentum Idea Part III](The%20Spectral%20Momentum%20Idea%20Part%20III.md)


---
### **Intro**

This file repeat the same thing from the previous file, but re-organize it so it's shorter and it reads better. 
The Nesterov's accelerated gradient method generates iterates $(y_t)_{t\in \N}$ by the following recurrence relations: 

$$
\begin{aligned}
    y_{t + 1} &= [I - L^{-1} \nabla f]y_{t} + \theta_t([I - L^{-1}\nabla f]y_{t} - [I - L^{-1}\nabla f]y_{t - 1}). 
\end{aligned}
$$

---
### **The setup**

#### **Definition 1**
1. Let $A \in \R^{m \times n}$. 
2. Let $b \in \R^n$. 
3. Define $f(x) = \frac{1}{2}\Vert Ax - b\Vert^2$ to be a convex quadratic function. 

#### **Assumption set 1**

$f(x)$ is a strongly convex function with strong convexity constant $\mu > 0$. 


#### **Lemma 1**
> Let $f, A, b$ be given by Definition 1. 
> Let $y^+ = A^\dagger b$. 
> Then 
> 1. $A^TA$ admits decomposition $VGV^T$ with $G$ with non-negative diagonal entries and $V$ as a orthogonal matrix. 
> 2. There exists a permutation matrix $P$ that permutes the diagonal elements in $G$ such that $\Lambda = PGP^T$ and $\Lambda$ is a diagonal matrix of non-negative elements in increasing order of magnitude. 
> 3. The gradient $\nabla f(x) = A^TA x - A^TAy^+ = A^TA(x - y^+) = VGV^T(x - y^+) = VPGP^TV^T(x - y^+)$. So the gradient descent operator which, define it $\nabla f(x) = x - \nabla f(x) = x - VPGP^TV^T(x - y^+)$
> 4. $f(x)$ is has Lipschitz gradient with constant $L$ being the largest eigenvalue of matrix $A^TA$. 

**Proofs**


**To show (1.), we have:**

For any $A\in \R^{m\times n}$, $A^TA$ is real symmetric there it has a orthogonal eigendecomposition with $A^TA = VGV^T$ where $V$ is orthogonal and $G$ is real diaognal. 
In addition $A^TA \in \R^{n\times n}$ is positive semi-definite because $\langle x, A^TAx\rangle = \langle Ax, Ax\rangle = \Vert Ax\Vert^2 \ge 0$ for all $x$, therefore the eigen matrix $G$ is a real diagonal matrix with non-negative elements on its diagonal. 

**To show (2.), we have:** 

Assume that $G = \text{diag}(g_1, g_2, \cdots, g_n)$, denote $\sigma(i): [n] \mapsto [n]$ be such that $g_{\sigma(1)} \le g_{\sigma(2)} \le \cdots \le g_{\sigma(n)}$. 
Then the matrix $P = [\e_{\sigma(1)}\; \e_{\sigma(2)}\; \cdots \; \e_{\sigma(n)}]^T$ completes the permutations making $PGP^T$ a diagonal matrix $\Lambda$ such that its diagonal elements are in increasing order of magnitude. 

**To show (3.), we have**

Use (2.), (3.).

**To show (4.), we have**

The gradient operator $\nabla f(x) = A^TA(x - y^+)$ is affine, hence the largest eigenvalue is the lowest Lipschitz constant. 


#### **Lemma 2 | Matrix recurrence of Nesterov's acceleration**
> Let $f, A, b$ be given by defintiion 1. 
> Let mtrices $V, G, \Lambda, P$ and vector $y^+$ be given by Lemma 1. 
> Let $L$ be the Lipschitz constant for the gradient $\nabla f$. 
> Then the Nesterov's accelerated gradient method applied on $f$ can be expressed by a matrix iteration formula: 
> $$
> \begin{aligned}
>     \begin{bmatrix}
>         \tilde y_{t} \\ \tilde y_{t + 1}
>     \end{bmatrix}
>     &= 
>     M_t 
>     \begin{bmatrix}
>         \tilde y_{t - 1} 
>         \\ 
>         \tilde y_t
>     \end{bmatrix}. 
> \end{aligned}
> $$
> Here, we defined $\tilde y_t = P^TV^T(y_t - y^+)$, and $T = I - L^{-t}\Lambda$, and the $M_t$ matrix is given by 
> $$
> \begin{aligned}
>     M_t &= 
>     \begin{bmatrix}
>         \mathbf 0 & I \\
>         - \theta_t T & (1 + \theta_t) T
>     \end{bmatrix}. 
> \end{aligned}
> $$

    

**Proof**

Substitutingthe gradient representation $T x= x - VGV^T(x - y^+)$, the recurrence relations simplifies: 

$$
\begin{aligned}
    y_{t + 1} &= 
    T y_t + \theta_t(Ty_t - Ty_{t - 1})
    \\
    &= (1 + \theta_t) Ty_t - \theta_t Ty_{t - 1}
    \\
    &= 
    (1 + \theta_t)[I - L^{-1}VGV^T]y_t - \theta_t [I - L^{-1}VGV^T] y_{t - 1}
    + VGV^Ty^+
    \\
    &= 
    (1 + \theta_t)V[I - L^{-1}G]V^Ty_t - \theta_t V[I - L^{-1}G]V^T y_{t - 1}
    + VGV^Ty^+
    \\
    V^Ty_{t + 1}
    &= (1 + \theta_t)[I - L^{-1}G]V^Ty_t - \theta_t [I - L^{-1}G]V^T y_{t - 1}
    + GV^Ty^+
    \\
    V^Ty_{t + 1} - V^T y^+
    &= (1 + \theta_t)[I - L^{-1}G]V^Ty_t - \theta_t [I - L^{-1}G]V^T y_{t - 1}
    + GV^Ty^+ - V^T y^+
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)[I - L^{-1}G]V^Ty_t - \theta_t [I - L^{-1}G]V^T y_{t - 1}
    - [I - L^{-1}G]V^Ty^+
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)[I - L^{-1}G]V^T(y_t - y^+) - \theta_t [I - L^{-1}G]V^T (y_{t - 1} - y^+)
    \\
    & \textcolor{gray}{\text{Use: } G = P\Lambda P^T, }
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)P[I - L^{-1}\Lambda]P^TV^T(y_t - y^+) - \theta_t P[I - L^{-1}G]P^TV^T (y_{t - 1} - y^+)
    \\
    P^TV^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)[I - L^{-1}\Lambda]P^TV^T(y_t - y^+) - \theta_t [I - L^{-1}\Lambda]P^TV^T (y_{t - 1} - y^+). 
\end{aligned}
$$

Substituting $\tilde y_{t} = P^TV^T(y_t - y^+)$ then the above simplifies to

$$
\begin{aligned}
    \tilde y_{t + 1} 
    &= (1 + \theta_t)[I - L^{-1}\Lambda]\tilde y_t - \theta_t [I - L^{-1}\Lambda]\tilde y_{t - 1}
    \\
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & I
        \\
        -\theta_t[I - L^{-1}\Lambda]
        & (1 + \theta_t)[I - L^{-1}\Lambda]
    \end{bmatrix}
    \begin{bmatrix}
        \tilde y_{t - 1} 
        \\ 
        \tilde y_t
    \end{bmatrix}. 
\end{aligned}
$$

Set $T = I - L^{-1}\Lambda$ then the above matrix recurrence can be written with 

$$
\begin{aligned}
    M_t &= 
    \begin{bmatrix}
        \mathbf 0 & I
        \\
        -\theta_t T
        & (1 + \theta_t) T
    \end{bmatrix}
    \\
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= 
    M_t 
    \begin{bmatrix}
        \tilde y_{t - 1} 
        \\ 
        \tilde y_t
    \end{bmatrix}. 
\end{aligned}
$$


#### **Lemma 3 | Block Diagonal representation of the recurrence matrix**
> Let $M_t, \tilde y_t$ be given by Lemma 2. 
> Then there exists a permutation matrix $P_\pi$: 
> $$
> \begin{aligned}
>    (\forall i = 1, \cdots 2n): 
>     P_\pi e_i &= \begin{cases}
>         e_{j}, \text{where } j = \lfloor i/2\rfloor & \text{if } i \equiv 1 \text{ mod } 2, 
>         \\
>         e_{j}, \text{where } j = n +  i/2 & \text{else}. 
>     \end{cases}
> \end{aligned}
> $$
> such that it transforms $M_t$ into a 2x2 block diagonal form. Let's define $T =I - L^{-1}\Lambda= \text{diag}(\tau_1, \cdots, \tau_n)$. 
> $$
> \begin{aligned}
>     M^{(t, i)} &:= \begin{bmatrix}
>             1 & 0 
>             \\
>             - \theta_t \tau_i
>             & (1 + \theta_t) \tau_i
>         \end{bmatrix}, 
>     \\
>     \begin{bmatrix}
>         \tilde y_{t} \\ \tilde y_{t + 1}
>     \end{bmatrix}
>     &= P^T_\pi 
>     \text{diag}
>     \left(
>         M^{(t, i)}
>         ; 
>         i = 1, \cdots, n
>     \right)
>     P_\pi
>     \begin{bmatrix}
>         \tilde y_{t - 1} \\ \tilde y_{t}
>     \end{bmatrix}. 
> \end{aligned}
> $$
