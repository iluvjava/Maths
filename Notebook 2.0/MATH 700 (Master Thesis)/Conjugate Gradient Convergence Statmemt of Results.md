[[Conjugate Gradient Anne's Version]]

---
### **Intro**

Here we state the results of the rate of convergence for the Conjugate Gradient algorithm for: 

* Exact Numerics: [[Exact Conjugate Gradient Convergence]]
* Floating Numerics: [[Floats Conjugate Gradient Convergence]]

Results are referenced with professor Greenbaum's work on this topic. 

---
### **Exact Arithmatic**

Assuming exact arithematic, then the algorithm terminates whenver the Krylov Subspace stop expanding. Equaling to the grade of a krylov subapce. For any initial guess $x_0$, the algorithm: 

> Conjugate Gradient terminates at most $n$ iterations where $n$ is the number of rows and columns of the matrix A. 


Next, we assume that the matrix $A$ is exceeding huge, and we wish to bound the relative error measured via the energy norm of the PSD matrix, then it would be: 

> $$
> \frac{\Vert  e^{(k)}\Vert_A}{
>     \Vert  e^{(0)} \Vert_A} \le 
> 2 \left(
>     \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}
> \right)^k
> $$

Where $\kappa$ is the condition number of the matrix $A$, $\lambda_n/\lambda_1$. Where we assume $\lambda_n, \lambda_1$ are the largest and the smallest eigenvalues of the matrix $A$. 

With the additional assumption that the largest eigen values is on its own, away from all the other small eigenvalues who are near the origin and close together to each other, a better bound for the convergence can be attained. 

Eigenvalues are like: 

$$
\lambda_1 \le \lambda_2 \le \cdots << \lambda_n
$$

And the rate of convergence is: 

> $$
> \frac{\Vert e^{(k)}\Vert_A}{\Vert e^{(0)}\Vert_A} \le 
> 2 \left(
>     \frac{\sqrt{\kappa_{n - 1}} - 1}{\sqrt{\kappa_{n - 1} + 1}}
> \right)^{k - 1}
> $$

Where $\kappa_{n - 1}$ is: 

$$
\kappa_{n - 1} =  \frac{\lambda_{n - 1}}{\lambda_1}
$$

Which gives better covergence rate than when all eigenvalues are equally spread out. This is true because the condition number is significally smaller when the largest eigenvalues that lies outside of all the others are removed. An extreme case would be all previous $n - 1$ eigenvalues are equal to the same except for $\lambda_n$.

The bound is tight and there eixsts a choice of the initial guess and matrix such that the relative errer hit the equality case for some iterations value $k$.

Another Assumption that we can place on the distribution of eigenvalues, or the spectrum of the values is when, we have most of the eigenvalues that are huge cluster away from the origin, while that is one eigenvalue that is very close to the origin: 

$$
\lambda_1 << \lambda_2 < \lambda_3 < \cdots < \lambda_n
$$

Then, a better bound can be placed on the Relative Error of the Error energy norm: 

$$
\frac{\Vert e^{(k)} \Vert_A^2}{\Vert e^{(0)} \Vert_A^2}
\le
|P_k(z)| \le 
\left|
\left(
    \frac{\lambda_n - \lambda_1}{\lambda_1}
\right)2\left(
    \frac{\sqrt{\kappa_0} + 1}{\sqrt{\kappa_0} - 1}
\right)^{k - 1}
\right|
$$

Where, $\kappa_0 = \frac{\lambda_n}{\lambda_2}$

Take notice that the convergence rate is worse due to the fraction is approaching infinity as $\lambda_1$ gets closer and closer, but there is still hope that the quanityt $\kappa_0$ is very close to one. 

---
### **Floating Points Arithmetic**

Let's define some of the quantities that are proven to be useful for the discussion: 

$$
\begin{aligned}
    & n:: \text{Size of the matrix}
    \\
    & k:: \text{Iteration Number}
    \\
    & \epsilon:: \text{Machine Epsilon}
    \\
    & \epsilon_0= 2(n + 4)\epsilon
    \\
    & \epsilon_1 = 2(7 + m \Vert \;|A|\;\Vert/\Vert A\Vert)\epsilon
    \\
    & \epsilon_0 = \frac{1}{12}
    \\
    & \text{Assuming}: k(3\epsilon_0 + \epsilon_1) < 1
\end{aligned}
$$

The error and the residual has super script $\bullet^C$, indicating that it's from the conjugate Gradient Method, so it's the same as in the textbook from Greenbaum. 

Here is a statement of results: 
> $$
> \frac{\Vert r_k^C\Vert}{\Vert r_0^C\Vert} \le 
> \sqrt{1 + 2\epsilon_0} 2\sqrt{\tilde{\kappa}} 
> \left(
>     \frac{\sqrt{\tilde{\kappa}} - 1}{\sqrt{\tilde{\kappa}} + 1}
> \right)^k + \sqrt{k}\tilde{\kappa}\epsilon_1
> $$

Where:

$$
\begin{aligned}
    \tilde{\kappa} &= 
    \frac
    {
        \lambda_n + (k + 1)^{5/2}\epsilon_2 \Vert A\Vert
    }
    {
        \lambda_1 - (k  + 1)^{5/2}\epsilon_2 \Vert A\Vert
    }
\end{aligned}
$$

And we have to notice that the relative error is measured on the Residual instead of the error, and the translation between the 2 type of error is given as: 

$$
\begin{aligned}
    \frac{\Vert r_k^C\Vert}{\Vert r_0^C\Vert}
    &= \frac{\Vert Ae_k^C\Vert}{\Vert Ae_0\Vert}
    \le 
    \sqrt{\kappa(A)}\frac{\Vert e_k^C\Vert}{\Vert e_0^C\Vert}
\end{aligned}
$$

This is using backwards analysis, by perturbating the Lanczos Factorizations of the matrix to see what perturbed problem can have exact arithmematic that equals to the floating point arithematic. 

