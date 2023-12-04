---
alias: Nesterov's Lower Convergence Bnd For Strongly Convex Functions

---
### **Intro**

Prerequisites: 
1. [Convergence Rate Lower Bnd for Lip Funcs](Convergence%20Rate%20Lower%20Bnd%20for%20Lip%20Funcs.md). 

We use the same definition for the class of GA1st function to analyze the lower convergence rate the class of Strongly convex function. We follow closely with Nesterov book "Lectures on Convex Optimization" section 2.1.4. We state the theorem here and then we prove it later. 

#### **Thm 2.1.13 | Lower Bounds with Strong Convexity**
> For any $x^{(0)}\in l^2$ (the Hilbert space of sequences), and constant $\mu > 0$, a condition number $Q_f \ge 1$, there exist a function $f \in \mathcal F_{\mu, L}^{1, 1}$ such that for all algorithm in GA1st, we have the lower bounds for the convergence rates of iterates and objective values
> $$
> \begin{aligned}
>    \Vert x^{(k)} - x^*\Vert 
>    &\ge \left(
>    \frac{\sqrt{Q_f} - 1}{\sqrt{Q_f} + 1}
>    \right)^{2k}\left\Vert x^{(0)} - x^*\right\Vert^2
>       \\
>    f\left(x^{(k)}\right) - f(x^*) 
>    &\ge 
>    \frac{\mu}{2}\left(\frac{\sqrt{Q_f} - 1}{\sqrt{Q_f} + 1}\right)^{2k}\left\Vert
>       x^{(0)} - x^* 
>    \right\Vert^2. 
> \end{aligned}
> $$
> With $x^*\in \arg\min_{x\in l^2} f(x)$, which it exists by the fact that we have a strongly convex function in Hilbert Space. 

**Remarks**

This lower bound provided by Nesterov is more straightforward than the case for Lipschitz Smooth function. It's simply saying the existence of some functions for all algorithms such that the optimal value is bounded from below, for all iterations value $k \in \mathbb N$. 

---
#### **Investigating a Special Function**

We choose $f \in \mathcal F^{\infty, 1}_{\mu, Q_f}$, which is a strongly convex function, and let $A\in l^2 \times l^2$ be an infinite sized matrix in $l^2$ sequence space. Suppose that $A = \text{tridiag}(-1, 2, -1)$, then we define and derive 

$$
\begin{aligned}
    f_{\mu, Q_f}(x) &= \frac{\mu(Q_f - 1)}{8}\left\langle x, Ax \right\rangle
    + 
    \frac{\mu}{2}\Vert x\Vert^2
    - 
    \frac{\mu(Q_f - 1)}{4}x_1
    \\
    \nabla f_{\mu, Q_f} &= 
    \frac{\mu(Q_f - 1)}{4}Ax + \mu x - \frac{\mu(Q_f - 1)}{4}\e_1
    \\
    \nabla^2 
    f_{\mu, Q_f}(x) &= 
    \frac{\mu(Q_f - 1)}{4}A + \mu I, 
\end{aligned}
$$

we note that $Q_f = L/\mu$ is the condition number for $\nabla^2 f_{\mu, Q_f}$, the Hessian of the function. Next we observe that $A$ is a singular matrix. With that in mind we may derive the following: 

$$
\begin{aligned}
    & \mathbf 0 \preceq \frac{\mu}{4}A \preceq \mu I
    \\
    & \mathbf 0 \preceq \frac{\mu}{4}(Q_f - 1) A \preceq (Q_f - 1)\mu I
    \\
    & \mu I \preceq  \frac{\mu}{4}(Q_f - 1)A \preceq \mu Q_f = LI, 
\end{aligned}
$$

we may find the minimizer for the function $f_{\mu, Q_f}$, for better notation we use notation $f$ instead. Then we may quantify the minimizers as 

$$
\begin{aligned}
    \frac{\mu(Q_f - 1)}{4}Ax + \mu x - \frac{\mu(Q_f - 1)}{4}\e_1 &= \mathbf 0
    \\
    \left(
        \frac{Q_f - 1}{4}A + I
    \right)x &= 
    \frac{Q_f - 1}{4} \e_1
    \\
    \left(
        A + \frac{4}{Q_f - 1}I
    \right)x &= \e_1, 
\end{aligned}
$$

the matrix on the RHS takes form of $\text{tridiag}(-1, 2 + 4(Q_f - 1), -1)$ coordinate-wise, we may solve the system 

$$
\begin{aligned}
    \left(
        2 + \frac{4}{Q_f - 1}
    \right)x_1 - x_2 &= 1 \quad \textcolor{gray}{\text{first row}}
    \\
    2\frac{Q_f + 1}{Q_f - 1}x_1 &= 
    x_2 + 1; 
    \\
    -x_{k + 1} + 2\frac{Q_f + 1}{Q_f - 1}x_k &= x_{k - 1}, 
\end{aligned}
$$

with $q = \frac{\sqrt{Q_f} - 1}{\sqrt{Q_f} + 1}$, then $x_k^* = q^k$ would be a solution for the system. Not hard to derive it with an induction. To do that we have 

$$
\begin{aligned}
    2\frac{Q_f + 1}{Q_f - 1}q 
    &= q^2 + 1
    \\
    2 \frac{Q_f + 1}{Q_f - 1}\frac{\sqrt{Q_f} - 1}{\sqrt{Q_f} + 1}
    &= 
    \left(
        \frac{\sqrt{Q_f} - 1}{\sqrt{Q_f} + 1}
    \right)^2 + 1
    \\
    2 \frac{Q_f + 1}{Q_f - 1}
    \frac{Q_f - 1}{\left(\sqrt{Q_f} + 1\right)^2}
    &= 
    \left(
        \frac{\sqrt{Q_f} - 1}{\sqrt{Q_f} + 1}
    \right)^2 + 1
    \\
    2 \frac{Q_f + 1}{\left(
        \sqrt{Q_f} + 1
    \right)^2} &= \frac{
        Q_f + 1 - 2\sqrt{Q_f} + Q_f + 2\sqrt{Q_f} + 1
    }{\left(
        \sqrt{Q_f} + 1
    \right)^2}, 
\end{aligned}
$$

which is an equality. Inductively we let $x_k = q^k$ to be the solution, when we look at the $k$th row, then we may solve the next row using this fact by considering 

$$
\begin{aligned}
    q^{k + 1} - 2\frac{Q_f + 1}{Q_f - 1}q^k - q^{k - 1} &= 0
    \\
    - q^2 + 2\frac{Q_f + 1}{Q_f - 1}q - 1 &= 0
    \\
    2 \frac{Q_f + 1}{Q_f - 1} &= 1 + q^2, 
\end{aligned}
$$

which is the based case again. 


---
### **Proof for Theom 2.1.13 Lower Bound for Convergence Rate**

For amny GA1st class of algorithm, we can assume WLOG to let $x^{(0)} = \mathbf 0$, then 

$$
\begin{aligned}
    \left\Vert
         x^{(0)} - x^*
    \right\Vert^2 = 
    \sum_{i = 1}^{\infty} (x^*_i)^2 &= \sum_{i = 1}^{\infty} q^{2i} = \frac{q^2}{1 - q^2}. 
\end{aligned}
$$

next, using the property of GA1st class of algorithm, we have $x^{(k)}\in \text{span}\{\e_i\}_{i = 1}^k$, then by lemma 2.1.5 from previously we have 

$$
\begin{aligned}
    \left\Vert
        x^{(k)} - x^*
    \right\Vert^2 & \ge 
    \sum_{ i =k + 1}^{\infty} (x_i^*)^2
    \\
    &= \sum_{i = k + 1}^{\infty} q^{2i} 
    \\
    &= \frac{q^{2(k + 1)}}{1 - q^2}
    \\
    &= q^{2k} \left\Vert
        x^{(0)} - x^*
    \right\Vert^2,
\end{aligned}
$$

which is the convergence rates lower bound of the iterates. Using the quadratic growth property for strongly convex function, we have the convergence rate of the function value to be 

$$
\begin{aligned}
    f(x) - f(x^*) \ge \frac{1\mu}{2} \Vert x - x^*\Vert^2 \ge 
    \frac{\mu}{2}q^{2k}\left\Vert x^{(0)} - x^*\right\Vert^2, 
\end{aligned}
$$

and the theorem is proven. 