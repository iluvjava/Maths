No Prereq. 

---
### **Intro**

Non-linear boundary value problems is not similar to the linear case in terms of the solutions we expect from the system. There could be no solution, finite many solution, infinitely many solutions, and there could be cases where the problem cannot be solved. 

Here we will only look at an example of solving a non-linear system of BVP problems. 

---
### **The Non-Linear Pendulum Systems**

$$
\begin{cases}
    \theta''(t) = -\sin(\theta(t)) & t \in [0, T]
    \\
    \theta(0) = \alpha, \theta(t) = \beta & B.C
\end{cases}
$$

Discretizing the differential Operator we have: 

$$
\begin{aligned}
   \underbrace{ \frac{1}{h^2}(\theta_{i-1} - 2\theta_i + \theta_{i + 1})
    +
    \sin(\theta_i)}_{:= G(\theta)} &= 0
\end{aligned}
$$

Take note that to obtain a solution for the BVP, one would need to solve the above system of non-linear equations, and we can make use of the Newton's Iterations for solving it: 

$$
\begin{aligned}
    \left.\mathcal{J}[G(\theta)]\right|_{\theta = \theta^{(k)}}
    (\theta^{(k + 1)} - \theta^{(k)}) &= 
    - G(\theta^{(k)})
    \\
    \theta^{(k + 1)} &= 
    \theta^{(k)} - \left.\mathcal{J}[G(\theta)]\right|_{\theta = \theta^{(k)}} G(\theta^{(k)})
\end{aligned}
$$

Which forms the iterative procedures for updating the initial guess. We assume that the Jacobian of the system is in fact invertible. 

And, the Jacobian we have can be represented like: 

$$
\begin{aligned}
    \mathcal{J}_{i, j}[G](\theta^{(k)}) &= 
    \begin{cases}
        \frac{1}{h^2} &  j = i - 1 \vee j = i + 1
        \\
        \frac{-2}{h^2} + \cos(\theta_i) & j = i
        \\
        0   & \text{otherwise}
    \end{cases}
\end{aligned}
$$

Which is a tridiagonal symmetric matrix parameterized by the previous guess of the iterations $\theta^{(k)}$, and information of the initial conditions are not present in the matrix. 

**The Physical Scenario of the Non-Linear System**

The non-linear system contains all possible trajectory of $\theta$ over the temporal domain. An the boundary conditions asserts that at time $t = 0$, we start with some angle $\alpha$ and then ended with another angle $\beta$ at the end when $t = T$

And, it's not hard to see that, it has the potential to rotated full circles and come back, any $2\pi$ periodic rotations trajectories will satisfies the conditions. 


---
### **The Non-linear Oscillator**

Here we consider another example of an non-linear boundary value problem. 



