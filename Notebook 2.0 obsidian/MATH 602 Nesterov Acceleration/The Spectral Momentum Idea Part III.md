- [The Spectral Momentum Idea Part II](The%20Spectral%20Momentum%20Idea%20Part%20II.md)


---
### **Intro**

This file formalize some of the explorations and make them into mathematical claims about the spectral momentum algorithm stated from previously.
Assume the acceleration parameters $\theta_t \in [0, 1]$. 
Nesterov's accelerated gradient performs the iterations for iterates $y_t$: 

$$
\begin{aligned}
    y_{t + 1} &= [I - L^{-1} \nabla f]y_{t} + \theta_t([I - L^{-1}\nabla f]y_{t} - [I - L^{-1}\nabla f]y_{t - 1})
\end{aligned}
$$

#### **Assumption set 1**
1. $f(x) = 1/2\Vert Ax - b\Vert_2^2$ for any fixed $A \in \R^{n\times m}$. 


#### **Assumption set 2**
Assume assumption set 1 and assume that: 
1. $A^TA$ is positive definite, therefore $A \in R^{n\times m}$ is a full-rank matrix hence $m \le n$. 

This makes $f(x)$ a strongly convex function with strong convexity constant $\mu > 0$. 

#### **Definition 0 | Basic quantities**
> Let $f(x)$ be given by assumption set 1. 
> Define:
> 1. eigendecomposition for $A^TA$ be $VGV^T$ with orthogonal $V$ and diagonal $G$. Notice that the diaognal entries of $G$ are real and non-negative. 
> 2. $P$ be a permutation matrix such that $\Lambda = PGP^T$ where $\Lambda$ has diagonal entries in increasing order. 
> 3. $L$ to be any upper bound on the Lipschitz constant of the function $f(x)$. 


#### **Claim 0 | Cannonical form of the recurrence matrix for Nesterov's accelerated gradient on all convex quadratic function**
> Let $f(x), A, V, P, G, \Lambda$  be given by Assumption Set 1. 
> Let $L$ be the Lipschitz constant of $f$. 
> Define $y^+ = A^\dagger b$ where $A^\dagger$ is the Moreau Psuedo Inverse. 
> Then, Nesterov's acceleration recurrence can be expressed compactly by the following matrix recurrence relation: 
> $$
> \begin{aligned}
>     \begin{bmatrix}
>         \tilde y_{t} \\ \tilde y_{t + 1}
>     \end{bmatrix}
>     &= M^{(t)} 
>     \begin{bmatrix}
>         \tilde y_{t - 1} \\ \tilde y_{t}
>     \end{bmatrix}. 
> \end{aligned}
> $$
> Where $T = I - L^{-1} \Lambda$ and $M_t$ is the block diaognal matrix 
> $$ 
> \begin{aligned}
>     \begin{bmatrix}
>         I & \mathbf 0 
>         \\
>         -\theta_t T & (1 + \theta_t)T
>     \end{bmatrix}, 
> \end{aligned}
> $$
> and $\tilde y_t = P^TV^T(y_t - y^+)$, making it just an orthogonal transform away from the error vector $y_t - y^+$. 


**Proof** 

For simplicity we assume that $L$ is an upper bound of the Lipschitz modulus for gradient $\nabla f$. 
Assume generic quadratic form $f(x) = \frac{1}{2}\Vert Ax - b\Vert_2^2$, then the gradient operator is an affine: 

$$
\begin{aligned}
   \nabla f(x) 
   &= A^T(Ax - b)
   \\
   &= A^TAx - A^Tb
\end{aligned}
$$

If we set $y^+ = A^\dagger b$ where $A^\dagger$ is the Moreau Psuedo Inver, then it's in the zero set of $\nabla f$, which gives us $A^TAy^+ = A^Tb$. 
Using $y_+$, we write the gradient as $\nabla f(x) = A^TA x - A^TAy^+$. 
Now we may rephrase the gradient descent with momentum into: 

$$
\begin{aligned}
    y_{t + 1} &= 
    (1 + \theta_t)[I - L^{-1}\nabla f] y_t - \theta_t [I - L^{-1}\nabla f]y_{t - 1}
    \\
    &= 
    (1 + \theta_t)(
        y_t - L^{-1}A^TAy_t + L^{-1}A^Tb
    ) - \theta_t
    (
        y_{t - 1} - L{-1}A^TA y_{t - 1} + L^{-1}A^Tb
    )
    \\
    &= 
    (1 + \theta_t)(y_t - L^{-1}A^TA y_t)
    - \theta_t(y_{t - 1} - L^{-1}A^TAy_{t - 1}) 
    + L^{-1}A^Tb
    \\
    &= (1 + \theta_t)(y_t - L^{-1}A^TA y_t) 
    - \theta_t(y_{t - 1} - L^{-1}A^TAy_{t - 1}) 
    + L^{-1}A^TA y^+
    \\
    &= (1 + \theta_t)(I - L^{-1}A^TA)y_t 
    - \theta_t(I - L^{-1}A^TA)y_{t - 1} 
    + L^{-1}A^TA y^+
    \\
    \iff 
    y_{t + 1} - L^{-1}A^TA y^+ &= 
    (1 + \theta_t)(I - L^{-1}A^TA)y_t
    - \theta_t(I - L^{-1}A^TA)y_{t - 1}. 
\end{aligned}
$$

Next, $A^TA$ is semi-definite therefore it admits orthogonal eigendecomposition: $V G V^T =A^TA$ with $V$ orthonormal and $G$ diagonal. 
Since $L$ is the Lipschitz constant of $\nabla f$, it implies that $\mathbf 0 \preceq A^T \preceq LI$. 
Therefore we have $\mathbf 0 \preceq I - L^{-1} A^TA \preceq I$ and $I - L^{-1}A^TA = V(I - L^{-1}G)V^T$. 
Using that we can simplify the above recurrence into 

$$
\begin{aligned}
    y_{t + 1} - L^{-1}VGV^T y^+ 
    &= 
    (1 + \theta_t)V(I - L^{-1}G)V^Ty_t
    - \theta_t V(I - L^{-1}G)V^Ty_{t - 1}
    \\
    V(V^T y_{t + 1} - L^{-1}GV^T y^+)
    &= 
    V
    \left(
        (1 + \theta_t)(I - L^{-1}G)V^Ty_t
        - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    \right)
    \\
    V^T y_{t + 1} - L^{-1}GV^T y^+
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^Ty_t
    - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    \\
    V^T y_{t + 1} 
    - V^T y^+
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^Ty_t
    - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    + L^{-1}GV^T y^+ - V^T y^+
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^Ty_t
    - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    - (I -  L^{-1}G)V^T y^+
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^T(y_t - y^+)
    - \theta_t(I - L^{-1}G)V^T(y_{t - 1} - y^+). 
\end{aligned}
$$

The recurrence can be established on the successive iterates of $y_t - y^+, y_{t - 1} - y^+$, giving us the block recurrence relations: 

$$
\begin{aligned}
    \begin{bmatrix}
        V^T(y_{t} - y^+)
        \\
        V^T(y_{t + 1} - y^+)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & I
        \\
        - \theta_t(I - L^{-1}G)
        & 
        (1 + \theta_t)(I - L^{-1}G)
    \end{bmatrix}
    \begin{bmatrix}
        V^T (y_{t - 1} - y^+) \\ V^T (y_t - y^+)
    \end{bmatrix}. 
\end{aligned}
$$

Finally, we consider a permutation matrix the re-orders the rows and columns of $G$ with $PGP^T = \Lambda$ such that $\Lambda$ is a diagonal matrix of $l_i$ where $l_i \le l_{i + 1}$ for all $i = 1, \cdots, n -1$. 
Then the above recurrence relations becomes: 

$$
\begin{aligned}
    \begin{bmatrix}
        V^T(y_{t} - y^+)
        \\
        V^T(y_{t + 1} - y^+)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & PP^T
        \\
        - P\theta_t(I - L^{-1}\Lambda)P^T
        & 
        (1 + \theta_t)P(I - L^{-1}\Lambda)P^T
    \end{bmatrix}
    \begin{bmatrix}
        V^T (y_{t - 1} - y^+) \\ V^T (y_t - y^+)
    \end{bmatrix}
    \\
    \begin{bmatrix}
        P^TV^T(y_{t} - y^+)
        \\
        P^TV^T(y_{t + 1} - y^+)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t(I - L^{-1}\Lambda)
        & 
        (1 + \theta_t)(I - L^{-1}\Lambda)
    \end{bmatrix}
    \begin{bmatrix}
        P^TV^T (y_{t - 1} - y^+) \\ P^TV^T (y_t - y^+)
    \end{bmatrix}. 
\end{aligned}
$$

From the first equality to the second, a $P^T$ is multiplied on both side of the equation and a $P^T$ is factored ou as a block diagonal matrix to merge to the vector multiplying from the right side of the matrix. 
Finally, we make the substitution $\tilde y_t =P^TV^T (y_t - y^+)$ to transform the above matrix recurrence into 

$$
\begin{aligned}
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & I
        \\
        -\theta_t(I - L^{-1}\Lambda)
        & 
        (1 + \theta_t)(I - L^{-1}\Lambda)
    \end{bmatrix}
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}
    \\
    \text{Set: }
    T &= I - L^{-1}\Lambda
    \\
    \text{Set: }
    M_t &= 
    \begin{bmatrix}
        \mathbf 0  & I
        \\
        -\theta_t T & (1 + \theta_t)T
    \end{bmatrix}
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}
    \\
    \iff 
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= M_t 
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}. 
\end{aligned}
$$

Therefore, for Nesterov's acceleration, it suffice to study the block diagonal iteration matrix $M_t$. 


#### **Claim 1 | Block diagonal matrix as a diagonal 2x2 block matrix**
> A block 2x2 matrix $G \in \R^{2n \times 2n}$ with inner $n\times n$ diagonal matrix is a unitary transform from a diagonal block 2x2 matrix. 
> Given a generic block 2x2 with: 
> $$
> \begin{aligned}
>     G = \
>     \begin{bmatrix}
>         D_{1, 1} & D_{1, 2} 
>         \\
>         D_{2, 1} & D_{2, 2} 
>     \end{bmatrix}
> \end{aligned}
> $$
> Where $D_{i, j} = \text{diag}\left(d_{i, j}^{(1)}, d_{i, j}^{(2)}, \cdots, d_{i, j}^{(n)}\right)$. 

**Proof**

By the definition of the following permutation matrix: 

$$
\begin{aligned}
   (\forall i = 1, \cdots 2n): 
    P_\pi e_i &= \begin{cases}
        e_{j}, \text{where } j = \lfloor i/2\rfloor & \text{if } i \equiv 1 \text{ mod } 2, 
        \\
        e_{j}, \text{where } j = n +  i/2 & \text{else}. 
    \end{cases}
\end{aligned}
$$

The we have 

$$
\begin{aligned}
    P_\pi^T
    \text{diag}\left(
        \begin{bmatrix}
            d_{1, 1}^{(i)} & d_{1, 2}^{(i)}
            \\
            d_{2, 1}^{(i)} & d_{2, 2}^{(i)}
        \end{bmatrix}; 
        i = 1, \cdots, n
    \right)P_\pi
    = 
    \begin{bmatrix}
        D_{1, 1} & D_{1, 2} 
        \\
        D_{2, 1} & D_{2, 2} 
    \end{bmatrix}. 
\end{aligned}
$$

#### **Corollary | Block diagonal recurrence**

Using claim 1, 0. 
$M_t$ is a block diagonal matrix in the form of 

$$
\begin{aligned}
    M_t &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t T_t & (1 + \theta_t)T_t
    \end{bmatrix}.
\end{aligned}
$$

Where $T_t = \text{diag}\left(\tau^{(t)}_1, \cdots, \tau^{(t)}_1\right)$. 
We see that the matrix recurrence gives the following form: 

$$
\begin{aligned}
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= P^T_\pi 
    \text{diag}
    \left(
        \begin{bmatrix}
            1 & 0 
            \\
            - \theta_t \tau_i^{(t)}
            & (1 + \theta_t) \tau_i^{(t)}
        \end{bmatrix}; 
        i = 1, \cdots, n
    \right)
    P_\pi
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}. 
\end{aligned}
$$


---
### **Convergence analysis of the spectral momentum algorithm in for convex quadratic function**

It suffices to show the behavior of the algorithm under the assumption that $\Lambda$ is a diagonal matrix. 
We will first study the case where $\tilde y_t$ is a scalar, in which case we will have matrix $M^{(t)}$ as a 2x2 matrix. 
Ignoring the index $t$ for notational simplicity we have 

$$
\begin{aligned}
    M= \begin{bmatrix}
        0 & 1 \\ -\theta \tau & (1 + \theta) \tau
    \end{bmatrix}. 
\end{aligned}
$$

Next, we make claims on the eigensystem, spectral radius for $M$ for $\theta_t \in [0, 1]$ and $\tau \in [0, 1]$. 
Take note that there are 2 cases for the possibilities on $\tau$. 
1. Without Assumption 2, we could have $\tau = 0$. 
2. With Assumption 2, we would have $\tau \in [0, 1)$. By Assumption 2, $A^TA$ is positive definite, hence $\Lambda$ is a diagonal matrix of entiries strictly larger than one. By definition $\mathbf 0 \prec \Lambda \preceq LI$, $0\preceq I - L^{-1}\Lambda \prec I$. 

Then from Claim 0, 1 we have $T = I - L^{-1} \Lambda$ to be a diagonal of $\tau_i \in [0, 1)$. 




#### **Claim 1 | Eigensystem of the 2x2 Nesterov's recurrence matrix**
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





#### **Claim 2 | the spectral radius function**
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




#### **Corollary | The minimum of the spectral value and its minimizer**
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



#### **Corollary | The maximum of the spectral radius and its maximizers**
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





#### **Corollary | The spectral radius if monotone wrt to elements in the matrix**
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
### **Convergence rate directly by spectral radius**

To better represent the elements of a matrix or vector and the iteration indices on these quantities, we adopt the following notations: 


#### **Notations**
1. $\tilde y^{(t)}_i$ to denote the $i$ th element of the vector $\tilde y^{(t)}$ denoting the iterates generated by the algorithm at the $t$ th iteration. 
2. Use $M^{(t)}$ to represent the iteration matrix at the $t$ th iteration. 
3. Use $\Lambda$ to be a diagonal matrix with non-negative entries, ordered in increasing order of magnitude having $\mathbf 0 \preceq \Lambda \preceq I$. This matrix is from the cannonical representation of all convex quadratic function fom the discussions in the first section. 

Block iteration matrix $M_t$ expressed by: 

$$
\begin{aligned}
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t T & (1 + \theta_t)T
    \end{bmatrix}, 
\end{aligned}
$$

is a $\R^{n\times n}$ block 2x2 diagonal matrix. 
A repermutation of the matrix by $P_\pi$ introduced back in claim 0.1 showed that $M^{(t)}$ is a block diagonal where the $i$ th 2x2 block on the diagonal is given by: 

$$
\begin{aligned}
    M^{(t)} &=
    P^T_\pi
    \text{diag}\left(
        \begin{bmatrix}
            1 & 0 
            \\
            - \theta_i \tau_i 
            & 
            (t + \theta_i ) \tau_i
        \end{bmatrix}; 
        i = 1, \cdots, n
    \right)
    P^T_\pi, 
    \\
    M_{i}^{(t)}
    &= 
    \begin{bmatrix}
        1 & 0 
        \\
        - \theta_i \tau_i 
        & 
        (t + \theta_i ) \tau_i
    \end{bmatrix}. 
\end{aligned}
$$

Focusing on the specific recurrence relation on $\tilde y_{t + 1}, \tilde y_t, \tilde y_{t - 1}$ operates by this recurrence matrix, it has for all $i=1,\cdots, n$: 

$$
\begin{aligned}
    \begin{bmatrix}
        \tilde y^{(t + 1)}_i \\ \tilde y^{(t)}_i
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        1 & 0 
        \\
        - \theta_i \tau_i 
        & 
        (t + \theta_i ) \tau_i
    \end{bmatrix}
    \begin{bmatrix}
        \tilde y_i^{(t - 1)} \\  
        \tilde y_i^{(t)}
    \end{bmatrix}. 
\end{aligned}
$$

Here, we used the notation of $\tilde y^{(t + 1)}_i$ to denote the $i$ th element of the vector $\tilde y^{(t)}$, the error vector at the $t$ th iteration. 
Therefore, the convergence behavior of $y_i^{(t)}$ for any $i = 1, \cdots, n$ would be upper bounded by the spectral radious of the ith diagonal 2x2 recurrence matrix is: 

$$
\begin{aligned}
    \theta^+_i &= 
    \frac{1 - \sqrt{1 - \tau_i}}{1 + \sqrt{1 - \tau_i}}; 
    \\
    \rho\left(M^{(t)}_i\right)
    &= 
    \begin{cases}
        \sqrt{\tau \theta} & \text{if } \theta \in (\theta^+, 1], 
        \\[0.5em]
        \frac{1}{2}\left(
            \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
            + \tau\theta + \tau
        \right) 
        & 
        \text{if }\theta \in [0, \theta^+]. 
    \end{cases}
\end{aligned}
$$

Since we know that $\tau_i \in [0, 1)$. 
For all choices in $\theta_t \in [0, 1]$, $\rho(M^{(t)}_i) < 1$. 
Therefore the our spectral momentum algorithm converges for any use of $\theta_t$ within the interval. 


#### **Claim | Components wise spectral radius bound**
> The convergence of each component $\tilde y_i^{(t)}$ by the algorithm would be governed by the spectral radius of the 2x2 block $M_i^{(t)}$. 




#### **Claim | Global spectral radius bound**
> Let block iteration matrix $M^{(t)}$ be given in block diagonal form as 
> $$
> \begin{aligned}
>     T &= I - L^{-1}\Lambda, 
>     \\
>     M^{(t)}&= 
>     \begin{bmatrix}
>         I & \mathbf 0 
>         \\
>         -\theta_t T & (1 + \theta_t)T
>     \end{bmatrix} 
>     \\
>     &= 
>     P_\pi^T
>     \text{diag}\left(
>         \begin{bmatrix}
>             1 & 0 \\ - \theta \tau_i & (1 + \theta_t) \tau_i
>         \end{bmatrix}
>         ; 
>         i = 1, \cdots, n
>     \right)P_\pi. 
> \end{aligned}
> $$
> Let $\bar\tau = \max_{1\le i \le n} \tau_i$, then for any $\theta^{(t)} \in [0, 1]$ the spectral radius of $\rho(M^{(t)})$ would be given by: 
> $$
> \begin{aligned}
>     \bar\theta^+ &= 
>     \frac{1 - \sqrt{1 - \bar \tau}}{1 + \sqrt{1 - \bar\tau}}
>     \\
>     \rho\left(
>         M^{(t)}
>     \right)
>     &= 
>     \left. 
>     \begin{cases}
>         \sqrt{\bar \tau \theta} & \text{if } \theta \in [\bar \theta^+, 1], 
>         \\
>         \frac{1}{2}
>         \left(
>             \sqrt{(\theta + \bar \tau)^2 - 4 \bar \tau \theta} + 
>             \bar \tau\theta + \bar \tau
>         \right) & \text{if } \theta \in [0, \bar \theta^+). 
>     \end{cases}
>     \right\rbrace < 1
> \end{aligned}
> $$

**Proof**

This would be true by the analysis of the Eigensystem ofthe entire matrix $M^{(t)}$. 
Take note that we already found the eigensystem of each of the 2x2 matrix in the diagonal block 2x2 matrix. 
Therefore performing the Eigendecomposition on the 2x2 block matrix on the diaognal we have: 

$$
\begin{aligned}
    M^{(t)} &= 
    P_\pi^T \text{diag}
    \left(
        \begin{bmatrix}
            1 & 0 
            \\
            - \theta_t \tau_i & (1 + \theta_t)\tau_i 
        \end{bmatrix} 
        ;  
        i = 1, \cdots,n
    \right)
    P_\pi
    \\
    &= 
    P_\pi^T \text{diag}
    \left(
        \begin{bmatrix}
            \lambda_i/\tau\theta & \lambda_i^\circ/\tau\theta
            \\
            1 & 1
        \end{bmatrix}
        \begin{bmatrix}
            \lambda_i & \\ & \lambda_i^\circ
        \end{bmatrix}
        \begin{bmatrix}
            \lambda_i/\tau\theta & \lambda_i^\circ/\tau\theta
            \\
            1 & 1
        \end{bmatrix}^{-1}
        ;  
        i = 1, \cdots,n
    \right)
    P_\pi
\end{aligned}
$$

where $\lambda_i = \frac{1}{2}(\sqrt{(\tau_i\theta + \tau_i)^2 - 4 \tau_i\theta} + \tau_i\theta + \tau_i)$. 
And $\lambda_i^\circ = \frac{1}{2}(-\sqrt{(\tau_i\theta + \tau_i)^2 - 4 \tau_i\theta} + \tau_i\theta + \tau_i)$. 
When $\lambda_i$ is imaginary, then $\lambda_i^\circ$ and $\lambda_i$ are complex conjugate to each other. 
Otherwise, we have $\lambda_i \ge \lambda_i^\circ$. 

The spectral radius of $\rho(M^{(t)}) = \max_{i = 1, \cdots, n} \max(|\lambda_i|, |\lambda_i^\circ|)$. 
By previous worst case analysis of the spectral radius of all 2x2 block matrix on the diagonal, we have $\max(|\lambda_i|, |\lambda_i^\circ|)\le \sqrt{\tau_i}$. 
Therefore, the upper bound for the spectral radius of the entire matrix would be: 

$$
\begin{aligned}
    \bar \tau &= \max_{i=1, \cdots, n}\tau_i
    \\
    \rho(M^{(t)}) &\le \sqrt{\bar \tau}. 
\end{aligned}
$$

Recall that $0 \le  \tau_i = 1 - l_i<1$ where $l_i$ are the diagonals of $\Lambda$. 

**Remarks**





---
### **Tracking Rayleigh quotient**


Rayleigh quotient is used for determine the acceleration parameter $\theta_t$ during the execution of the algorithm. 


