- [Regret in APG EST SEQ](Regret%20in%20APG%20EST%20SEQ.md)
- [PPM APG Forms](PPM%20APG%20Forms.md)

---
### **Intro**

This file continues on the "regret" inside the Nesterov's estimating sequence and attempts to 
connect the knowledge with the existing literatures. 
Some words will be repeated for clear presentation of ideas presented in those previous files. 

#### **Assumptions**
1. $f: \R \rightarrow \R^n$ is a convex differentiable function that is also $L$-Lipschitz smooth. 
2. $g: Q \rightarrow \R^n$ is a convex function. 
3. $F = f + g$, $F$ is the objective function. 

We introduce the following quantities in order to define the algorithm. 

1. $T_L = [I + \partial g]^{-1}\circ [I - L^{-1}\nabla f]$ which is the proximal gradient operator. 
2. $\mathcal G_L = L(I - T_L)$ to be the gradient mapping operator. 



#### **Algorithm | Weak accelerated proximal gradient algorithm**
> Given iterates $(v_k, x_k)$, or equivalently $(y_k, x_k)$, $(x_k, y_k)$, any $\alpha_k \in (0, 1)$, the algorithm generates scalar $\gamma_{k + 1}$, and vectors $y_k, v_{k + 1}, x_{k + 1}$ by equalities: 
> $$
> \begin{aligned}
>     \gamma_{k + 1} &:= (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
>     \\
>     y_k &= 
>     (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= \gamma_{k + 1}^{-1}
>     (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$

We make some observations here. 




--- 
### **Stepwise Lyapunov claim**

#### **Theorem | Stepwise Lyapunov claim**
Suppose that a sequence 
