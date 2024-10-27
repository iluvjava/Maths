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

Where we have $A^TA$ always being a positive semi-definite matrix. 
Also true in Hilbert space too. 
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


#### **Let's consider the Nesterov's acceleration on such a canonical form**

Let $L$ be the Lipschitz constant of a quadratic function $f = (1/2)\langle x, \Lambda x\rangle$, so
$\Lambda = \text{diag}([l_1, \cdots, l_n])$ is a diagonal positive semi-definite matrix with $\mathbf 0 \preceq \Lambda\preceq LI$. 

Define $T := I - L^{-1}\Lambda$. 
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

It would be great for the $T$ matrix to be a diagonal matrix. 
We can do that without loss of generality, because $T$ is semi-definite. 
Assume $T$ is diagonal. 
So we can solve the block 2x2 matrix's eigen system and carry the eigen system over for the entire block 2x2 matrix. 
To use the matrix power trick, it would be great to consider $\theta_t$ to be a constant. 

---
### **Eigen Decomposition of a sub 2 by 2 matrix**

For simplicity, we assume that $T = [\tau] \in (0, 1)$, is a scalar, hence the above iterations represented in block matrix can be written into a 2x2 matrix iteration. 

Using [Wolframe Alpha](https://www.wolframalpha.com/input?i=eigenvalues+%7B%7B%5B%2F%2Fnumber%3A0%2F%2F%5D%2C%5B%2F%2Fnumber%3A1%2F%2F%5D%7D%2C%7B%5B%2F%2Fnumber%3A-u+t%2F%2F%5D%2C%5B%2F%2Fnumber%3A%281+%2B+u%29+t%2F%2F%5D%7D%7D), we query with $u = \theta_t$ with $t$ being a scaler, we get the eigen system of the 2x2 matrix 

$$
\begin{aligned}
    \begin{bmatrix}
        0 & 1\\ -\theta_t \tau & (1 + \theta_t) \tau
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
            + \sqrt{
            \tau - 4\theta+ 2 \tau \theta + \tau \theta^2
        }}{2\tau\theta}
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
            - \sqrt{\tau - 4\theta+ 2 \tau \theta + \tau \theta^2}
        }{2\tau\theta}
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
    \right),
    \\
    \lambda_2 &= 
    \frac{1}{2}\left(
        \sqrt{\tau}\sqrt{\tau \theta^2 + 2 \tau \theta + \tau - 4\theta}
        + \tau \theta + \tau
    \right). 
\end{aligned}
$$

This, is a discrete dynamical system descretizing a first order system of ODE that describes a second order ODE. 
One of the interest is the spectral radius, and in this case, it's $\max(|\lambda_1|, |\lambda_2|)$. 
Because we have a conjugate pair of eigenvalue, $|\lambda_1| = |\lambda_2|$, they are the same and one of them suffice for analysis. 

#### Analyzing the spectral radius

Observe that, whether $\lambda_1, \lambda_2$ are complex shifts when $\tau \theta^2 + 2 \tau \theta + \tau - 4\theta$ is close to zero. 
Since we are taking the norm, that would also be the critical point for both $|\lambda_1|, | \lambda_2|$. 
Next we will show that, there exists a value $\theta^+ \in (0, 1)$ such that it minimizes the spectral radius of the iteration matrix. 
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

Which has a striking similarly compared to the optimal acceleration rates for Nesterov's acceleration in the case of strongly convex function. 

The spectral radius in this case would be



---
### **Eigen Decomposing the entire block matrix**

Define a the function

$$
\begin{aligned}
    r(\theta, \tau) := 
    \sqrt{\tau}\sqrt{\tau\theta^2 + 2\tau \theta + \tau - 4\theta}. 
\end{aligned}
$$

The reader should verify the the eigen system of the entire block matrix would decompose into: 

