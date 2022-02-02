Relevant: [[Non Linear Steady State BVP Error]]


---
### **Intro**

We are interested in the error of the steady state solution for some Non-Linear BVP we obtained via the Newton's Method. Looking for the steady state solution for BVP problem can be phrased into solving a non-linear multi-variable function, denoted in the form of: 

$$
\begin{aligned}
    \mathbf{G}(\theta) = \mathbf{0}
\end{aligned}\tag{1}
$$

The system is discretized with finite difference on an grid point, which transform the the continuous system into solving a discrete non-linear system, such as the one in expression (1). Assuming solution exists. 

$\theta$ is a vector denoting the trajectory of the function of the steady state solution over an interval obtained by solving the system (1). Let $\hat{\theta}$ denotes the exact solution vector, which is the vector obtained by evaluating the true solution function at the grid point. Then the following would be true: 

$$
\begin{aligned}
    \mathbf{G}(\theta) &= \mathbf{0}
    \\
    \mathbf{G}(\hat{\theta}) &= \tau
\end{aligned}\tag{2}
$$

Where the vector $\tau$ is the error vector from some finite difference scheme involved in $\mathbf{G}(\theta)$. Then: 

$$
\begin{aligned}
    \mathbf{G}(\theta) - \mathbf{G}(\hat{\theta}) &= - \tau
    \\
    \text{Taylor: }\quad 
    \mathbf{G}(\theta) &= G(\hat{\theta}) + J[\mathbf{G}]_{\hat{\theta}}(\theta - \hat{\theta}) + \mathcal{O}(\Vert \theta - \hat{\theta}\Vert^2)
    \\
    \implies 
    \mathbf{G}(\theta) - G(\hat{\theta}) &= 
    J[\mathbf{G}]_{\hat{\theta}}(\theta - \hat{\theta}) + \mathcal{O}(\Vert \theta - \hat{\theta}\Vert^2)
    \\
    -\tau &= 
    J[\mathbf{G}]_{\hat{\theta}}(\theta - \hat{\theta}) + \mathcal{O}(\Vert \theta - \hat{\theta}\Vert^2)
    \\
    \text{Let: } \eta &= \theta - \hat{\theta}
    \\
    -\tau &= J[\mathbf{G}]_{\hat{\theta}}(\eta) + \mathcal{O}(\Vert\eta\Vert^2)
\end{aligned}\tag{3}
$$

Te key is the second line, where we centered the function $\mathbf{G}$ at $\hat{\theta}$, the exactly solution vector, and then we project to figure out the solution from the (1) $\theta$ using the first 2 terms of taylor theorem. 

When there exists some norm $\Vert \Vert$ where $\mathbf{G}^{-1}$  is uniformally bounded as $h\rightarrow 0$ by some constant that is not paramaterized by $h$, then the *Nonlinear Difference Method* $\mathbf{G}(\theta)$ is stable.


