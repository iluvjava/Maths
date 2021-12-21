[[Conjugate Gradient 2]]

---
### **Intro**

Here we state the results of the rate of convergence for the Conjugate Gradient algorithm for: 

* Exact Numerics
* Floating Numerics


Results are referenced with professor Greenbaum's work on this topic. 

---
### **Exact Arithmatic**

The relative error measured via the energy norm of the PSD matrix would be: 

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



