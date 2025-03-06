- [The Spectral Momentum Idea](The%20Spectral%20Momentum%20Idea.md)


---
### **Intro**

Without loss of generality, we consider all convex Quadratic function, which has the factorized form of 

$$
\begin{aligned}
    f(x) &= \frac{1}{2}\Vert Ax - b\Vert^2
    \\
    &= 
    \frac{1}{2}\langle Ax, Ax\rangle + (1/2)\Vert b\Vert^2
    - \langle b, Ax\rangle
    \\
    &= 
    \frac{1}{2}\langle x, A^TAx\rangle + (1/2)\Vert b\Vert^2
    - \langle b, Ax\rangle
    \\
    f(x) - (1/2)\Vert b\Vert^2 &= 
    \frac{1}{2}\langle x, A^TAx \rangle - \langle A^Tb, x\rangle
\end{aligned}
$$

Let $x^+ = A^\dagger b$, which always exists and can be unique, then the above can have

$$
\begin{aligned}
    f(x - x^+) - (1/2)\Vert b\Vert^2
    &= \frac{1}{2}\langle x - x^+, A^TA(x - x^+)\rangle
    - \langle b, Ax\rangle
    \\
    &= 
    \frac{1}{2}\langle x , A^TAx\rangle
    + \frac{1}{2}\langle x^+, Ax^+\rangle + 
    \langle x, A^TAx^+\rangle
    - \langle b, Ax\rangle
    \\
    &= \frac{1}{2}\langle x , A^TAx\rangle
    + \frac{1}{2}\langle x^+, Ax^+\rangle + 
    \langle Ax, AA^\dagger b\rangle
    - \langle b, Ax\rangle
    \\
    &= \frac{1}{2}\langle x , A^TAx\rangle
    + \frac{1}{2}\langle x^+, Ax^+\rangle
    \\
    f(x - x^+) - (1/2)\Vert b\Vert^2
    - \frac{1}{2}\langle x^+, A, x^+\rangle
    &= \frac{1}{2}\langle x, A^TA, x\rangle
\end{aligned}
$$

$A^TA$ is always being a positive semi-definite matrix. 
Therefore, without loss of generality, there is offset transformation in the domain and the range of any convex quadratic function into a cannonical form of $(1/2)\langle x, G, x\rangle$. 
Let's now assume that: 

$$
\begin{aligned}
    f(x) &= \frac{1}{2}\langle x, Gx\rangle
\end{aligned}
$$

In addition, because the matrix is also semi-definite, it has orthogonal eigen decomposition with $G = V\Lambda V^T$. 
Let's make $y = V^Tx$, so $x = Vy$, so the above can be written into: 

$$
\begin{aligned}
    f(V y) &= \frac{1}{2}\langle Vy, V\Lambda V^T Vy\rangle = \frac{1}{2}\langle y, \Lambda y\rangle. 
\end{aligned}
$$

Therefore, without loss of generality, it suffice to assume a convex quadratic to take the form of $1/2\langle x, \Lambda x\rangle$ where $\Lambda$ is a diaognal matrix of non-negative entries. 
Finally, we can even assume furether that $\Lambda$ is a matrix whose diagonal are decreasing in values. 
This assumption can be made without loss of generality by applying a permutation transformation. 


#### **Let's consider the Nesterov's acceleration on such a canonical form**

Let $L$ be the Lipschitz constant of a quadratic function $f = (1/2)\langle x, \Lambda x\rangle$, so
$\Lambda = \text{diag}([l_1, \cdots, l_n])$ is a diagonal positive semi-definite matrix with $\mathbf 0 \preceq \Lambda\preceq LI$. 

Define $T := I - L^{-1}\Lambda$. 
Observe that: $\mathbf 0 \preceq T \prec I$. 
Let $(\theta_t)_{t\in \N}$ be a sequence such that $\theta_t \in (0, 1)$. 
The famous Nesterov's acceleration can be simplified into: 

$$
\begin{aligned}
    y_t &= T y_{t - 1} + \theta_t T(y_{t - 1} - y_{t - 2})
    \\
    &= (T + \theta_t T) y_{t - 1} - \theta_t T y_{t - 2}
    \\
    \begin{bmatrix}
        y_{t - 1}  \\ y_{t}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & I 
        \\
        - \theta_t T
        & T + \theta_t T
    \end{bmatrix}
    \begin{bmatrix}
        y_{t - 2} \\ y_{t - 1}
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        \mathbf 0 & I 
        \\
        - \theta_t T
        & 
        (1 + \theta_t)T
    \end{bmatrix}
    \begin{bmatrix}
        y_{t - 2} \\ y_{t - 1}
    \end{bmatrix}
\end{aligned}
$$

$T$ is diagonal too. 
So we can solve the block 2x2 matrix's eigen system by solving the eigen system over its 2x2 sub matrices. 
To use the matrix power trick, it would be great to consider $\theta_t$ to be a constant. 

---
### **Eigen Decomposition of a sub 2 by 2 matrix**

For simplicity, we assume that $T = [\tau] \in (0, 1)$, is a scalar, hence the above iterations represented in block matrix can be written into a 2x2 matrix iteration. 


#### **Exposing the eigen system**
Using [Wolframe Alpha](https://www.wolframalpha.com/input?i=eigenvalues+%7B%7B%5B%2F%2Fnumber%3A0%2F%2F%5D%2C%5B%2F%2Fnumber%3A1%2F%2F%5D%7D%2C%7B%5B%2F%2Fnumber%3A-u+t%2F%2F%5D%2C%5B%2F%2Fnumber%3A%281+%2B+u%29+t%2F%2F%5D%7D%7D), we query with $u = \theta$ with $t$ being a scaler, we get the eigen system of the 2x2 matrix 

$$
\begin{aligned}
    M = \begin{bmatrix}
        0 & 1\\ -\theta \tau & (1 + \theta) \tau
    \end{bmatrix}
\end{aligned}
$$

to be: 

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
    \end{bmatrix}
\end{aligned}
$$

And the corresponding eigenvalues are 

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

So the eigen system is simplified into: 

$$
\begin{aligned}
    \\
    \lambda_1 &= 
    \frac{1}{2}\left(
        - \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
        + \tau\theta + \tau
    \right),
    \\
    \lambda_2
    &= \frac{1}{2}\left(
        \sqrt{(\tau\theta + \tau)^2 - 4\tau\theta}
        + \tau\theta + \tau
    \right),
    \\
    v_1 &= 
    \begin{bmatrix}
        \lambda_2/\tau\theta
        \\
        1
    \end{bmatrix},
    \\
    v_2 &= 
    \begin{bmatrix}
        \lambda_1/\tau\theta
        \\
        1
    \end{bmatrix}. 
\end{aligned}
$$

the iteration matrix $M^k$ has representation: 

$$
\begin{aligned}
    
\end{aligned}
$$

This represent a discretized first order system of ODE that describes a second order ODE. 
One of the interest is the spectral radius, which is $\max(|\lambda_1|, |\lambda_2|)$ in this case. 
As the parameter $\theta$ varies, we have the following possibilities: 
1. If we have a conjugate pair of eigenvalue, $|\lambda_1| = |\lambda_2|$, they are the same and one of them suffice for analysis. 
2. If we have real non-negative $\lambda_1, \lambda_2$, and $\lambda_2$ is the larger. 

#### **Optimizing the spectral radius**

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

and this one doesn't fall into the range by $\tau \in [0, 1]$, the next value is: 

$$
\begin{aligned}
    \theta^{+} = \frac{1 - \sqrt{1 - \tau}}{1 + \sqrt{1 - \tau}} \in [0, 1]
\end{aligned}
$$

This critical point minimizer of spectral radius $\max(|\lambda_1|, |\lambda_2|)$. 
We skip the mathematical reasoning here and the reader should plot out the function on a computer to see why. 
Further simplifications yield: 

$$
\begin{aligned}
    \theta^+
    &= 
    \frac{
        1 - \sqrt{1 - \tau}
    }{
        1 + \sqrt{1 - \tau}
    }
    \\
    &= 
    \frac{\sqrt{1 - \tau}- (1 - \tau)}{\sqrt{1 - \tau} + (1 - \tau)}
    \\
    &= 
    \frac{
        \frac{\sqrt{1 - \tau}}{1 - \tau} - 1
    }{
        \frac{\sqrt{1 - \tau}}{1 - \tau} + 1
    }
    \\
    &= 
    \frac{
        \sqrt{\frac{1}{1- \tau}} - 1
    }{
        \sqrt{\frac{1}{1- \tau}} + 1
    }. 
\end{aligned}
$$

Recall that $T = I - L^{-1}\Lambda$, and in this case we have $\Lambda = [l]$, just a scalar, so with that we have: it simplifies to 

$$
\begin{aligned}
    \frac{\sqrt{\frac{1}{l/L}} - 1}{\sqrt{\frac{1}{l/L}} + 1}
    = 
    \frac{\sqrt{L/l} - 1}{\sqrt{L/l} + 1}. 
\end{aligned}
$$

Which has a striking similarly compared to the optimal acceleration sequence of Nesterov's accelerated gradient method specialized for strongly convex function. 
The spectral radius is smallest if we choose $\theta = \theta^+$, it sets the quantity inside of the square root to zero and make $\lambda_1, \lambda_2$ real valued: 

$$
\begin{aligned}
    \rho
    \left(
        \begin{bmatrix}
        0 & 1\\ -\theta^+ \tau & (1 + \theta^+) \tau
        \end{bmatrix}
    \right)
    &= 
    \frac{1}{2}(1 + \theta^+)\tau < 1
\end{aligned}
$$

#### **Analyzing the spectral radius**

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
    \frac{1}{2}(1 + \theta)\tau < 1
\end{aligned}
$$

#### **Monotonicity of the Spectral radius**

For all $\tau \in [0, 1), \theta \in (0, 1)$, the spectral radius of $M$ is monotone decreasing wrt to $\tau$.
Fix any $\tau$, which produces critical $\theta^+ = (1 - \sqrt{1 - \tau})/(1 + \sqrt{1 - \tau})$, then the spectral radius of $M$ monotonically decreases for all $\theta \in [0, \theta^+]$  and inceases for all $\theta \in [\theta^+, 1]$. 


#### **The worst momentum value for the spectral radius**

The worst value of the spectral radius happens when $\theta \in \{1, 0\}$. 
The spectral radius would be exactly: $\sqrt{\tau}, \frac{\tau}{2}$. 
This is true because $|\lambda_1|$ monotone increase for all $\theta \in (\theta^+, 1)$. 
When $\theta \in (0, \theta^+)$, the spectral radius is $|\lambda_2|$, and it monotone decreases. 


---
### **Eigen Decomposing the entire block matrix**

Define a the function

$$
\begin{aligned}
    r(\theta, \tau) 
    :&= 
    \sqrt{\tau}\sqrt{\tau\theta^2 + 2\tau \theta + \tau - 4\theta}
    \\
    &= 
    \sqrt{
        (\tau\theta + \tau)^2 - 4\tau \theta
    }
\end{aligned}
$$

Let $\tau_i \in [0, 1)$ for all $i = 1,\cdots, n$. 
Define the block iteration matrix: 

$$
\begin{aligned}
    T &= 
    \text{diag}([\tau_1, \cdots, \tau_n])
    \quad
    M_t
    = 
    \begin{bmatrix}
        \mathbf 0 & I 
        \\
        - \theta_t T
        & 
        (1 + \theta_t)T
    \end{bmatrix}. 
\end{aligned}
$$

The eigen system of $M$ is given by unitary eigen matrix $X_t$ and eigen value matrix $\Gamma_t$.   
It is analogus to the 2x2 case, it's given as: 

$$
\begin{aligned}
    R^+_t :&= 
    \text{diag}\left(
        r(\theta_t, \tau_i) 
    \right) + (1 + \theta_t)T, 
    \\
    R^-_t :&= 
    \text{diag}\left(
        -r(\theta_t, \tau_i) 
    \right) + (1 + \theta_t)T, 
    \\
    X_t &=
    \theta_t^{-1} T^{-1}
    \begin{bmatrix}
        R_t^+ & R_t^-
        \\
        \frac{\theta}{2}T & \frac{\theta}{2}T
    \end{bmatrix}
    \\
    \Gamma_t &= 
    \begin{bmatrix}
        R_t^- &
        \\ 
        &  R_t^+
    \end{bmatrix}. 
\end{aligned}
$$

The trick we use here is to observe that $M_t$ is a block diagonal matrix. 
We can apply a permuation matrix to change it into a block diagonal 2x2 matrix. 
Therefore, its eigen system are independent groups of $2\times2$  matrix. 
The permutation matrix is: 

$$
\begin{aligned}
    (\forall i = 1, \cdots 2n): 
    P_\pi e_i &= \begin{cases}
        e_{j}, \text{where } j = \lfloor i/2\rfloor & \text{if } i \equiv 1 \text{ mod } 2
        \\
        e_{j}, \text{where } j = n +  i/2 & \text{else}
    \end{cases}
\end{aligned}
$$

So the $M$ matrix can be transformed into a block 2x2 with: 

$$
\begin{aligned}
    \text{diag}\left(
        \begin{bmatrix}
            0 &  1 \\
            - \theta_t \tau_i & (1 + \theta_t)\tau_i
        \end{bmatrix}
    \right)&= 
    P M_t P. 
\end{aligned}
$$

The spectral radius of the iteration matrix $M$ will be exclusively determined by the largest value of $\tau_i$ among all $i = 1, \cdots, n$, denote it as $\overline{\tau}$. 
Given $\theta_t \in [0, 1]$, fix $\overline \tau$, from the previous analysis, the spectral radius exactly given by: 

$$
\begin{aligned}
    \rho(M_t) &= 
    \begin{cases}
        \frac{1}{2}
        \left(
            \sqrt{
                (\overline\tau\theta + \overline\tau)^2 - 4 \overline\tau\theta
            } + 
            \overline \tau\theta + \overline\tau
        \right) 
        & \text{if }
        0 \le \theta_t \le 
        \frac{1 - \sqrt{1 - \overline \tau}}{1 + \sqrt{1 - \overline \tau}}
        \\
        \sqrt{\overline \tau \theta} 
        & \text{if }
        1 \ge 
        \theta_t
        > \frac{1 - \sqrt{1 - \overline \tau}}{1 + \sqrt{1 - \overline \tau}}
    \end{cases}. 
\end{aligned}
$$

The minimum spectral radius is given when $\theta_t$ is choosen to be: 

$$
\begin{aligned}
    \theta_t = \frac{1 - \sqrt{1 - \overline \tau}}{1 + \sqrt{1 - \overline \tau}}, 
\end{aligned}
$$

for all $M_t$ where $t \in \N$. 

---
### **Power iterations**

The iteration matrix gives us the opportunity to model the algorithm as a product of a sequence of matrices. 
This opens the possibility to analyze the convergence rate. 
One approach would be to use the spectral radius. 


#### **Convergence rate analysis**



#### **Tracking the differences between the successive iterates**


---
### **Estimating the acceleration parameter via local concavity**

Common in most analysis of algorithm, the spectral radius dictates the convergence rate of the algorithm and the choice of the optimal acceleration parameter $\theta$ for all iterations. 
The proposed algorithm which we called spectral radius seems to exploiting the initial guess and local concavity of to speed up the convergence. 

This is problematic because if we are in infinite dimension, there is a choice of matrix $T$ that makes the spectral radius equals to $1$, and $\overline \tau = 1$, and forcing $\theta_t = 1$. 
To illustrate the possibility consider $\mu \ge 0$: 

$$
\begin{aligned}
    \Lambda&= \text{diag}(1, 1/2, 1/3, \cdots), \mathbf 0 \preceq \Lambda  \preceq I
    \\
    \\
    T &= I - L^{-1} = \text{diag}(0, 1/2, 2/3, 4/5, \cdots )
\end{aligned}
$$

There is no convergence of Nesterov's acceleration in this scenario! 
Because $\overline \tau = \sup_{n \in \N} \frac{n - 1}{n} = 1$. 

But in reality, it will converge for almost all initial guesses and an optimal choice of $\theta$, the acceleration parameter specific to the initial guess will mitigate the issue. 
