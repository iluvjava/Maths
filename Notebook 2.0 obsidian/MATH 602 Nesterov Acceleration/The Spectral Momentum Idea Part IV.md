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

**Proof**

We can do this because $M_t$ is a 2x2 block matrix of diagonals matrices. 
The diaognal matrices contribute 2 elements on each row and columns, with exactly $n$ elements apart from each other. 
This allows us to use $P_\pi$ to permute the rows, and columns together to transform it into a diagonal matrix with 2x2 blocks on it. 


----
### **Studying the 2x2 recurrence matrix on the diagonal**

This section lists important results about the iteration matrix $M^{t, i}$. 
First, ignoring the super scripts $i$, $t$ which indicates the block position of $M^{t, i}$ in the iteration matrix $M_t$, and the iteration counter $t$, simplify the notations and write: 

$$
\begin{aligned}
    M:= 
    \begin{bmatrix}
        1 & 0 \\ 
        - \theta \tau & (1 + \theta)\tau
    \end{bmatrix}. 
\end{aligned}
$$

In this section we will cover: 

1. The eigensystem of matrix $M$ for all $(\theta, \tau) \in [0, 1]^2$. 
2. The spectral radius $\rho(M)$ for all $(\theta, \tau) \in [0, 1]^2$. 
3. with $\tau$ fixed, the minimum of $\rho(M)$ for all $\theta \in [0, 1]$. 
4. with $\tau$ fixed, the maximum and maximizer of $\rho(M)$ for all $\theta \in [0, 1]$. 
5. For any $\theta \in [0, 1]$, the spectral radius is a monotone increasing function wrt to any $\tau \in [0, 1]$. 

The results will assist with deriving the convergence rate of $\tilde y_t$ in the sections that follows. 



#### **Claim 2.1 | Eigensystem of the 2x2 Nesterov's recurrence matrix**
> The eigenvalues $\lambda_1, \lambda_2$ and eigenvectors $v_1, v_2$ of the above matrix $M$ are: 
>
> $$
> \begin{aligned}
>     \\
>     \lambda_1 &= 
>     \frac{1}{2}\left(
>         - \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
>         + \tau\theta + \tau
>     \right),
>     \\
>     \lambda_2
>     &= \frac{1}{2}\left(
>         \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
>         + \tau\theta + \tau
>     \right),
>     \\
>     v_1 &= 
>     \begin{bmatrix}
>         \lambda_2/\tau\theta
>         \\
>         1
>     \end{bmatrix},
>     \\
>     v_2 &= 
>     \begin{bmatrix}
>         \lambda_1/\tau\theta
>         \\
>         1
>     \end{bmatrix}. 
> \end{aligned}
> $$

**Proof**

We use [Wolfram Alpha](https://www.wolframalpha.com/input?i=eigenvalues+%7B%7B%5B%2F%2Fnumber%3A0%2F%2F%5D%2C%5B%2F%2Fnumber%3A1%2F%2F%5D%7D%2C%7B%5B%2F%2Fnumber%3A-u+t%2F%2F%5D%2C%5B%2F%2Fnumber%3A%281+%2B+u%29+t%2F%2F%5D%7D%7D), the query has $u = \theta$,  $t$ as a scaler, we get the eigen system of the 2x2 matrix to be: 


$$
\begin{aligned}
    v_1 
    &= 
    \begin{bmatrix}
        - \frac{
            -\sqrt{\tau} -\sqrt{\tau} \theta 
            - \sqrt{
                \tau - 4\theta+ 2 \tau \theta + \tau \theta^2
            }
        }
        {2 \sqrt{\tau} \theta}
        \\[1em]
        1
    \end{bmatrix}
    = 
    \begin{bmatrix}
        \frac{
            \tau + \tau \theta 
            + \sqrt{\tau}\sqrt{
            \tau - 4\theta+ 2 \tau \theta + \tau \theta^2
        }}{2\tau\theta}
        \\[1em]
        1
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        \frac{1}{2\tau\theta}
        \left(
            \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
            + \tau\theta + \tau
        \right)
        \\[1em]
        1
    \end{bmatrix}
    \\
    v_2 &= 
    \begin{bmatrix}
        - \frac{
            -\sqrt{\tau} - \sqrt{\tau} \theta + \sqrt{
                \tau - 4\theta+ 2 \tau \theta + \tau \theta^2
            }
        }
        {2 \sqrt{\tau} \theta}
        \\[1em]
        1
    \end{bmatrix}
    = 
    \begin{bmatrix}
        \frac{
            \tau + \tau \theta 
            - \sqrt{\tau}\sqrt{\tau - 4\theta+ 2 \tau \theta + \tau \theta^2}
        }{2\tau\theta}
        \\[1em]
        1
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        \frac{1}{2\tau\theta}
        \left(
            - \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
            + \tau\theta + \tau
        \right)
        \\[1em]
        1
    \end{bmatrix}. 
\end{aligned}
$$

And the eigenvalues simplified: 

$$
\begin{aligned}
    \lambda_1 &= 
    \frac{1}{2}\left(
        -\sqrt{\tau}
        \sqrt{
            \tau \theta^2 + 2 \tau \theta + \tau - 4\theta
        }
        + \tau \theta + \tau
    \right) 
    \\
    &= 
    \frac{1}{2}
    \left(
        - \sqrt{\tau^2\theta^2 + 2 \tau^2\theta + \tau^2 - 4\theta \tau}
        + \tau\theta + \tau
    \right), 
    \\
    &= 
    \frac{1}{2}\left(
        - \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
        + \tau\theta + \tau
    \right)
    \\
    \lambda_2 &= 
    \frac{1}{2}\left(
        \sqrt{\tau}\sqrt{\tau \theta^2 + 2 \tau \theta + \tau - 4\theta}
        + \tau \theta + \tau
    \right)
    \\
    &= 
    \frac{1}{2}\left(
        \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
        + \tau\theta + \tau
    \right). 
\end{aligned}
$$

**Remarks**

Let's discuss edge cases. 
Edge case happens when $\tau = 1$, making $M$: 

$$
\begin{aligned}
    \begin{bmatrix}
        0 & 1 \\
        - \theta & 1 + \theta
    \end{bmatrix}. 
\end{aligned}
$$



#### **Claim 2.2 | the spectral radius function**
> Fixing any value of $\tau \in [0, 1]$. There exists a unique $\theta \in [0, 1]$ that makes the imaginary parts of $\lambda_1, \lambda_2$ equals to zero: 
> $$
> \begin{aligned}
>     \theta^{+} = \frac{1 - \sqrt{1 - \tau}}{1 + \sqrt{1 - \tau}} \in [0, 1]. 
> \end{aligned}
> $$
> As a consequence, the spectral radius of $M$ is a piecewise function with 2 parts given by: 
> $$
> \begin{aligned}
>     \rho(M) &= 
>     \begin{cases}
>         \sqrt{\lambda_1\lambda_2} = \sqrt{\theta\tau} & \text{if } \theta \in [0, \theta^+], 
>         \\
>         \lambda_2 = \frac{1}{2}\left(
>             \sqrt{(\tau \theta + \tau)^2 - 4\tau\theta} + \tau\theta + \tau
>         \right)
>         & \text{if } \theta \in (\theta^+, 1].
>     \end{cases}
> \end{aligned}
> $$

**Proof**

If we fix any $\tau \in [0, 1)$, 
Let $\theta$ varies in the interval $[0, 1]$, we have following possibilities for eigenvalues $\lambda_1, \lambda_2$ of matrix $M$ depending on whether $\tau\theta^2 + 2\tau\theta + \tau - 4\theta = 0$: 
1. If we have a complex conjugate pair of eigenvalues then spectral radius of $M$ satisfies $|\lambda_1| = |\lambda_2| = \sqrt{\lambda_1\lambda_2} = \rho(M)$. 
2. If we have real eigenvalues $\lambda_1, \lambda_2$, then $\lambda_2$ is the larger, hence in this case we have $\rho(M) = |\lambda_2|$ by triangle inequality of absolute value. 

Whether $\lambda_1, \lambda_2$ are complex depends on the sign shifts caused by $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta$ inside of the square root as $\theta$ varies in the interval $[0, 1]$. 
We claim that there exists a unique $\theta^+ \in (0, 1)$ such that it sets the imagary part of the eigenvalues to zero, i.e: $\Im(\lambda_i) = 0$ for $i \in \{1, 2\}$. 
To identify $\theta^+$ we solve $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta = 0$: 

$$
\begin{aligned}
    \theta^+ &= 
    \frac{
        4 - 2\tau \pm \sqrt{(2\tau - 4)^2 - 4\tau^2}
    }
    {
        2\tau
    }
    \\
    &= 
    \frac{
        4 - 2\tau \pm \sqrt{16 - 16 \tau}
    }
    {
        2\tau
    }
    \\
    &= \frac{2 - \tau \pm 2 \sqrt{1 - \tau}}{\tau}
    \\
    &= \frac{
        1 - (1 - \tau)\pm 2 \sqrt{1 - \tau}
    }
    {
        \tau
    }
    \\
    &= \frac{
        (1 \pm \sqrt{1 - \tau})^2
    }{
        1 - (1 - \tau)
    }
    \\
    &= \frac{
        (1 \pm \sqrt{1 - \tau})^2
    }{
        (1 -  \sqrt{1 - \tau})
        (1 + \sqrt{1 - \tau})
    }. 
\end{aligned}
$$

Take note that $\theta^+ \in \R$  because $\tau \in [0, 1]$. 
To identify the root in the interval of $(0, 1)$, there are two possibilities here, taking the positive sign we have 

$$
\begin{aligned}
    \theta^+ &= 
    \frac{1 + \sqrt{1 - \tau}}{1 - \sqrt{1 - \tau}} > 1,
\end{aligned}
$$

and this one doesn't fall into the range by $\tau \in [0, 1]$, the next root (the smaller one) does: 

$$
\begin{aligned}
    \theta^{+} = \frac{1 - \sqrt{1 - \tau}}{1 + \sqrt{1 - \tau}} \in [0, 1]
\end{aligned}
$$

Because $\theta^+$ is the smaller roots of the quadratic, we have that for all $\theta\in [\theta^+, 1]$, $\lambda_1, \lambda_2$ are complex conjugates of each other. 
Therefore the spectral radius of $M$ has 2 cases and it's given by: 

$$
\begin{aligned}
    \rho(M) &= 
    \begin{cases}
        \sqrt{\lambda_1\lambda_2} & \text{if } \theta \in (\theta^+, 1]
        \\
        \lambda_2 & \text{if }\theta \in [0, \theta^+]
    \end{cases}
\end{aligned}
$$

Using the trick that $\lambda_1\lambda_2 = |M|$, the product of the eigenvalues equals to the determinant. And we have $|M| = \tau\theta$. 
So $\sqrt{\lambda_1\lambda_2} = \sqrt{\theta\tau}$. 
Therefore the spectral radius as of $M$ is a piecewise function where $\tau \in [0, 1]$ and $\theta \in [0, 1]$ which is 

$$
\begin{aligned}
    \rho(M) &= 
    \begin{cases}
        \sqrt{\tau\theta} & \text{if } \theta \in (\theta^+, 1],
        \\
        \frac{1}{2}\left(
            \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
            + \tau\theta + \tau
        \right) 
        & 
        \text{if }\theta \in [0, \theta^+]. 
    \end{cases}
\end{aligned}
$$

**Remarks**

Monotonicity of discrete piecies of $\rho(M)$ requires characterizations to find the maximum, and minimum. 




#### **Corollary 2.3 | The minimum of the spectral value and its minimizer**
> For all $\tau \in [0, 1]$ there exists a unique minimizer $\theta^+ \in [0, 1]$ for the spectral radius $\rho(M)$: 
> $$
> \begin{aligned}
>     \theta^+ &= \frac{1 - \sqrt{1 - \tau}}{1 + \sqrt{1 - \tau}}. 
> \end{aligned}
> $$
> This gives the minimum value for the spectral radius $\rho(M) = (1/2)(\tau\theta^+ + \tau) = \sqrt{\theta^+\tau}$. 

**Proof**

We discuss it by cases because $\rho(M)$ is a 2 piecewise functions. 
Notice that $\sqrt{\tau \theta}$ is monotone increasing wrt to $\tau, \theta$. 
We have $\theta \in (\theta^+, 1]$, therefore $\theta^+$ makes it smaller than all other alternative values. 

Next for all $\theta \in [0, \theta^+]$ we have 

$$
\begin{aligned}
    \frac{1}{2}\left(
        \sqrt{(\tau \theta + \tau)^2 - 4\tau \theta}
        + \tau \theta + \tau
    \right) 
    & \ge 
    \frac{1}{2}
    \left(
        \min_{x \in [0, \theta^+]}
        \left\lbrace
            \sqrt{(\tau x + \tau)^2 - 4\tau x}
        \right\rbrace
        + 
        \tau \theta + \tau
    \right)
    \\
    &= 0 + (1/2)(\tau \theta + \tau)
\end{aligned}
$$

Since this is true for all $\theta \in [0, \theta^+]$, substituting $\theta = \theta^+$, we get the desired results that $\theta^+$ is the minimizer. 
We can do this because recall that $\theta^+$ makes $(\tau \theta + \tau)^2 - 4 \tau \theta = 0$, which is the smallest value can get for anything inside of square root. 


**Remarks**



#### **Corollary 2.4 | The maximum of the spectral radius and its maximizers**
> The spectral radius of $M$ satisfies: 
> $$
> \begin{aligned}
>     (\forall \tau \in (0, 1))\; 
>     \max_{\theta \in [0, 1]} \rho(M) = \sqrt{\tau} < 1
> \end{aligned}
> $$
> If $\tau = 0$, we have $\rho(M)=0$. 
> If $\tau = 1$, we have $\rho(M)=1$. 

**Proof**

To find the maximum, we identify the maximum value taken by each 2 part of the piecewise function that defines $\rho(M)$ then we find the maximum value among those. 
Since $\sqrt{\tau\theta}$ is monotone increasing, it attains maximal value for $\theta = 1$, giving us $\sqrt{\tau}$. 

Next, observe that we have that $\forall \theta \in [0, \theta^+]$: 

$$
\begin{aligned}
    \frac{1}{2} 
    \left(
        \sqrt{(\tau \theta + \tau)^2 - 4 \tau \theta} 
        + \tau\theta + \tau
    \right)
    &\le
    \frac{1}{2}
    \left(
        \max_{x \in [0, \theta^+]}
        \left\lbrace
            \sqrt{(\tau x + \tau)^2 - 4 \tau x}
        \right\rbrace
        + \tau\theta + \tau
    \right)
    \\
    &= 
    \frac{1}{2}(\tau +\tau \theta + \tau)
\end{aligned}
$$

Set $\theta = 0$ then we have the upper bound $\tau$. 
Finally, we have $\tau \in [0, 1)$ and therefore $\tau < \sqrt{\tau}$ and the maximum value happens for $\theta = 1$ and we have $\rho(M) = \sqrt{\tau}$ when that happens. 


**Remarks**





#### **Corollary 2.5 | Monotonicity of spectral radius**
> fix any values of $\theta \in [0, 1]$ the spectral radius $\rho(M)$ is a monotone increasing function wrt to $\tau$ in the matrix for all $\tau \in [0, 1)$. 

**Proof**

The first case of the piecewise function $\rho(M)$ has $\sqrt{\tau \theta}$, which is monotone wrt to the variable $\tau$. 
The second piece can factor out $\sqrt{\tau}$ giving us: 

$$
\begin{aligned}
    \frac{1}{2}\left(
        \sqrt{\tau}\sqrt{\tau(\theta + 1)^2 - 4 \theta}
        + \sqrt{\tau}(\sqrt{\tau}\theta + \sqrt{\tau}) 
    \right)
    = 
    \frac{\sqrt{\tau}}{2}\left(
        \sqrt{\tau(\theta + 1)^2 - 4 \theta}
        + \sqrt{\tau}(\theta + 1) 
    \right), 
\end{aligned}
$$

Observe that the parts inside of the parenthesis is always a monotone increasing quantity wrt to $\tau \in [0, 1)$. 
The quadratic inside of $\sqrt{}$ is monotone increasing and the linear function is also increasing. 
Therefore this part of the piecewise function is increasing wrt to variable $\tau$. 

---
### **Convergence rate**

In this section, we derive the convergence rate of firstly $\tilde y_t^{(i)}$, the $i$ th element of vector $y_t$ individually, and then the convergence rate of $\tilde y_t$ globally for the entire for the Nesterov's accelerated gradient method applied onto strongly convex quadratic function. 

#### **Claim 3 | Spectral radius on strongly convex function**
> Using assumption set 1, then the iteration matrix 
> $$
> M^{(t, i)} = 
> \begin{bmatrix}
>     1 & 0 
>     \\
>     - \theta_t \tau_i & (1 + \theta_t) \tau_i, 
> \end{bmatrix}
> $$
> contains element $\tau_i \in [0, 1)$ for all $\tau_i$ with $i = 1, \cdots, n$. 

