- [The Spectral Momentum Idea Part II](The%20Spectral%20Momentum%20Idea%20Part%20II.md)


---
### **Intro**

This file formalize some of the explorations and make them into mathematical claims about the spectral momentum algorithm stated from previously.
Assume the acceleration parameters $\theta_t \in [0, 1]$. 
Nesterov's accelerated gradient performs the iterations for iterates $y_t$: 

$$
\begin{aligned}
    y_{t + 1} &= [I - L^{-1} \nabla f]y_{t} + \theta_t([I - L^{-1}f]y_{t} - [I - L^{-1}f]y_{t - 1})
\end{aligned}
$$

#### **Claim 0 | Cannonical form of the recurrence matrix for Nesterov's accelerated gradient on all convex quadratic function**
> For the above recurrence, if we assume $f(x) = \frac{1}{2}\Vert Ax - b\Vert_2^2$ where $A \in \mathbb R^{n\times m}$, define $L$ to be any Lipschitz constant for $L$. 
> Define $y^+ = A^\dagger b$ where $A^\dagger$ is the Moreau Psuedo Inverse, define $VGV^T = A^TA$ to be the orthogonal eigendecomposition of semi-definite matrix $A^TA$ where $G$ is diagonal. Define $\Lambda = PGP^T$ where $P$ is a permutation matrix the re-orders diaognal in $G$ so that the diaognal elements of $\Lambda$ are in increasing order. 
> Then, Nesterov's acceleration recurrence can be expressed compactly by the following matrix recurrence relation: 
> $$
> \begin{aligned}
>     \begin{bmatrix}
>         \tilde y_{t} \\ \tilde y_{t + 1}
>     \end{bmatrix}
>     &= M_t 
>     \begin{bmatrix}
>         \tilde y_{t - 1} \\ \tilde y_{t}
>     \end{bmatrix}. 
> \end{aligned}
> $$
> Where $T_t = I - L^{-1} \Lambda$ and $M_t$ is the block diaognal matrix 
> $$ 
> \begin{aligned}
>     \begin{bmatrix}
>         I & \mathbf 0 
>         \\
>         -\theta_t T_t & (1 + \theta_t)T_t
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

Next, $A^TA$ is semi-definite so it admits orthogonal eigendecomposition: $V G V^T =A^TA$ with $V$ orthonormal and $G$ diagonal. 
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
        I & \mathbf 0 
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
        PP^T & \mathbf 0 
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
        I & \mathbf 0 
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
    T_t &= I - L^{-1}\Lambda
    \\
    \text{Set: }
    M_t &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t T_t & (1 + \theta_t)T_t
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


#### **Claim 0.1 | Block diagonal matrix as a diagonal 2x2 block matrix**
> A block 2x2 matrix $G \in \R^{2n \times 2n}$ with inner $n\times n$ diaognal matrix is a unitary transform from a diagonal block 2x2 matrix. 
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
> Where $D_{i, j} = \text{diag}(d_{i, j}^{(1)}, d_{i, j}^{(2)}, \cdots, d_{i, j}^{(n)})$. 

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

#### **Block diaognal recurrence**

Using claim 0.1, 0. 
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

Where $T_t = \text{diag}(\tau_t^{(1)}, \cdots, \tau_t^{(n)})$. 
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
            - \theta_t^{(i)} \tau_t ^{(i)}
            & (1 + \theta_t) \tau_t^{(i)}
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

It suffices to show the behavior of the algorithm under the assumption that $\Lambda$ is a diagonal matrix 
We will first study the case where $\tilde y_t$ is a scalar, in which case we will have matrix $M_t$ as a 2x2 matrix. 
Ignoring the subscript $t$ for notational simplicity we have 

$$
\begin{aligned}
    M = \begin{bmatrix}
        0 & 1\\ -\theta \tau & (1 + \theta) \tau
    \end{bmatrix}. 
\end{aligned}
$$

Next, we make claims on the eigensystem, spectral radius for $M$ for varying $\theta_t \in [0, 1]$. 

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

We use [Wolframe Alpha](https://www.wolframalpha.com/input?i=eigenvalues+%7B%7B%5B%2F%2Fnumber%3A0%2F%2F%5D%2C%5B%2F%2Fnumber%3A1%2F%2F%5D%7D%2C%7B%5B%2F%2Fnumber%3A-u+t%2F%2F%5D%2C%5B%2F%2Fnumber%3A%281+%2B+u%29+t%2F%2F%5D%7D%7D), the query has $u = \theta$,  $t$ as a scaler, we get the eigen system of the 2x2 matrix to be: 


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
        - \sqrt{\tau^2\theta^2 + 2 \tau^2\theta + \tau^2 - 4\theta \tau^2}
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

#### **Claim 2 | The optimal spectral radius of the 2x2 iteration matrix**
> Fixing any value of $\tau \in [0, 1)$ spectral radius $\rho(M)$ is discontinuous for $\theta \in [0, 1]$. 
> The value $\theta^+ \in [0, 1]$ minimizing the spectral radius $\rho(M)$ is: 
> $$
> \begin{aligned}
>     \theta^{+} = \frac{1 - \sqrt{1 - \tau}}{1 + \sqrt{1 - \tau}} \in [0, 1]. 
> \end{aligned}
> $$
> Additionally, the minimal value of the spectral radius is $\rho(M) = \frac{1}{2}(1 + \theta^+)\tau < 1$. 

**Proof**

As the parameter $\theta$ varies in the interval $[0, 1]$, below we list all the possibilities of eigen values $\lambda_1, \lambda_2$ of matrix $M$: 
1. If we have a conjugate pair of eigenvalue, $|\lambda_1| = |\lambda_2|$, they are the same and one of them suffice for analysis. 
2. If we have real non-negative $\lambda_1, \lambda_2$, and $\lambda_2$ is the larger. 

Observe that, whether $\lambda_1, \lambda_2$ are complex shifts when $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta$ changes sign. 
Since we are taking the norm, that would also be the critical point for both $|\lambda_1|, | \lambda_2|$. 
Next we will show that, there exists a value $\theta^+ \in (0, 1)$ such that it minimizes the spectral radius of the iteration matrix $M$. 
Let's solve for when $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta = 0$: 

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

To further simplifies, there are two possibilities here, taking the positive sign we have 

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

This critical point minimizer of spectral radius $\max(|\lambda_1|, |\lambda_2|)$. 
We skip the mathematical reasoning here and the reader should plot out the function on a computer to see why. Substituting above $\theta^+$ we have the smallest value for the spectral radius. 
With the we have 

$$
\begin{aligned}
    \rho
    \left(
        \begin{bmatrix}
        0 & 1\\ -\theta^+ \tau & (1 + \theta^+) \tau
        \end{bmatrix}
    \right)
    &= 
    \frac{1}{2}(1 + \theta^+)\tau < 1. 
\end{aligned}
$$

This sets the square root inside of the eigenvalue to be zero. 



#### **Corrollary | Spectral radius for varying momentum parameter**
> Let $\rho(M)$ denote the spectral radius of matrix $M$, fix any $\tau \in [0, 1)$, then the spectral radius for $\theta \in [0, 1]$ is given by the piecewise function 
> 
> $$
> \begin{aligned}
>     \rho(M) 
>     &= 
>     \begin{cases}
>         \sqrt{\tau \theta} & \text{if } \theta \in (\theta^+, 1], 
>         \\
>         \frac{1}{2}\left(
>             \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
>             + \tau\theta + \tau
>         \right) 
>         & 
>         \text{if }\theta \in [0, \theta^+]. 
>     \end{cases}
> \end{aligned}
> $$

**Proof**


Consider the case where $\theta \in (\theta^+, 1)$. 
Because $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta$ is a positive quadratic wrt to $\theta$, it would be negiatve if $\theta \ge \theta^+$, because $\theta^+$ is the smaller root of the two.
So it makes making $\lambda_1, \lambda_2$ complex and conjugate to each other. 
In this case, the absolute value of the eigenvalue is given by: 

$$
\begin{aligned}
    |\lambda_1| &= 
    \frac{1}{2}
    \left(
        |\tau^2\theta^2 + 2\tau\theta + \tau^2 - 4\tau\theta|
         + 
        (\tau\theta + \tau)^2
    \right)^{1/2}
    \\
    &= 
    \frac{1}{2}
    \left(
        -\tau^2\theta^2 - 2\tau\theta - \tau^2 + 4\tau\theta
         + 
        (\tau\theta + \tau)^2
    \right)^{1/2}
    \\
    &= 
    \frac{1}{2}
    \left(
        -\tau^2\theta^2 - 2\tau\theta - \tau^2 + 4\tau\theta
         + 
        \tau^2\theta^2 + \tau^2 + 2 \tau^2 \theta
    \right)^{1/2}
    \\
    &= 
    \frac{1}{2}\left(
        4\tau\theta
    \right)^{1/2}
    \\
    &= \sqrt{\tau \theta} < 1
\end{aligned}
$$

When we choose parameter $\theta \in (0, \theta^+)$, it will make the quantity $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta$ positive. 
In this case, the eigenvalues $\lambda_1, \lambda_2$ would be a real eigenvector. 
Their absolute value would be different. 
$|\lambda_2|$ is the larger one and we have: 

$$
\begin{aligned}
    |\lambda_2| &= 
    \frac{1}{2}\left(
        \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
        + \tau\theta + \tau
    \right) \le 
    \frac{1}{2}(1 + \theta)\tau < 1. 
\end{aligned}
$$

Combining we get the results for the spectral radius $\rho(M)$. 

**Remark**

$\rho(M)$ is monotone increasing wrt to parameter $\tau$. 


---
### **Convergence rate directly by spectral radius**

Block iteration matrix $M_t$ expressed by: 

$$
\begin{aligned}
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t T_t & (1 + \theta_t)T_t
    \end{bmatrix}, 
\end{aligned}
$$

is a $\R^{n\times n}$ block 2x2 diagonal matrix. 
A repermutation of the matrix by $P_\pi$ introduced back in claim 0.1 showed that $M_t$ is a block diagonal where the $ith$ 2x2 block is given by: 

$$
\begin{aligned}
    \begin{bmatrix}
        1 & 0 
        \\
        - \theta_i \tau_i 
        & 
        (t + \theta_i ) \tau_i
    \end{bmatrix}. 
\end{aligned}
$$

Focusing on the specific recurrence relation on $\tilde y_{t + 1}, \tilde y_t, \tilde y_{t - 1}$ operates by this recurrence matrix, it has

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

Therefore, given any value of $$



---
### **Tracking Rayleigh quotient**

