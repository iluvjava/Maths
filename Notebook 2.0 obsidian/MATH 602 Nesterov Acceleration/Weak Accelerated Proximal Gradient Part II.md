- [Weak Accelerated Proximal Gradient Part I](Weak%20Accelerated%20Proximal%20Gradient%20Part%20I.md)


---
### **Intro**
The discussion continues from the file/files linked at the top of the document of the markdown file. 
We start with a major lemma that will assists with the analysis that follows. 

#### **Lemma-1 | The convergence rate simplified**
> For any initial $\rho_0 = 1, \gamma_0 \in (0, L], \alpha_0 \in (0, 1)$, define the following procedues for generating sequence $\alpha_k, \rho_k$ for all $k \ge 1$: 
> $$
> \begin{aligned}
>     & \text{choose any } \rho_{k - 1} \in [1, \alpha_{k - 1}^{-2}), 
>     \\
>     & 
>     \text{find }\alpha_k \in (0, 1) \text{ s.t: } L \alpha_k^2= (1 - \alpha_k)\rho_{k - 1} L \alpha_{k - 1}^2 + \mu \alpha_k. 
> \end{aligned}
> $$
> Then it has for all $0 \le \mu < L$: 
> $$
> \begin{aligned}
>     & 1 > \alpha_k > \mu / L,
>     \\
>     & \left(
>         \prod_{i = 0}^{k - 1} \max(\rho_i, 1)
>     \right)\left(
>         \prod_{i = 0}^{k} (1 - \alpha_i)
>     \right)
>     = 
>     \left(
>         \prod_{i = 1}^{k}\alpha_{i - 1}^{-2}\alpha_i(\alpha_i - \mu/L)
>     \right)(1 - \alpha_0). 
> \end{aligned}
> $$

**Proof**

$\alpha_k > \mu/L$ is asserted by 

$$
\begin{aligned}
    \alpha_k^2 &= 
    (1 - \alpha_k)\rho_{k - 1}\alpha_{k - 1}^2 + (\mu/L)\alpha_k
    \\
    &\ge (1 - \alpha_k)\alpha_{k - 1}^2 + (\mu/L)\alpha_k 
    & \text{by } \rho_{k - 1} \ge 1
    \\
    & > \frac{\mu}{L}\alpha_k.
    & \text{ by }\alpha_k < 1
\end{aligned}
$$

Next, to show the confirm the claim on the big product, it has 

$$
\begin{aligned}
    \left(
        \prod_{i = 0}^{k - 1}\max(\rho_i, 1)
    \right)
    \left(
        \prod_{i = 0}^{k}(1 - \alpha_i)
    \right)
    &= 
    \left(
        \prod_{i = 1}^{k}\rho_{i - 1}
    \right)
        \prod_{i = 0}^{k}(1 - \alpha_i)
    \\
    &= 
    \left(
        \prod_{i = 1}^{k}\rho_{i - 1}(1 - \alpha_i)
    \right)(1 - \alpha_0). 
\end{aligned}
$$

Recall the equality which solves for $\alpha_k$ for all $k \ge 1$ has 

$$
\begin{aligned}
    \iff 
    L\alpha_k &= (1 - \alpha_k)\rho_{k - 1}L\alpha_{k - 1}^2 + \mu\alpha_k
    \\
    \iff 
    \alpha_k^2 &= (1 - \alpha_k)\rho_{k - 1}\alpha_{k - 1}^2 + (\mu/L) \alpha_k
    \\
    \iff 
    \frac{\alpha_k^2}{\alpha_{k - 1}^2} 
    &= 
    (1 - \alpha_k)\rho_{k - 1} + (\mu/L) \frac{\alpha_k}{\alpha_{k - 1}^2}
    \\
    \iff 
    \frac{\alpha_k^2}{\alpha_{k - 1}^2} 
    - (\mu/L) \frac{\alpha_k}{\alpha_{k - 1}^2}
    &= 
    (1 - \alpha_k)\rho_{k - 1}
    \\
    \iff 
    \alpha_{k - 1}^2\alpha_k(\alpha_k - \mu/L) &= (1 - \alpha_k)\rho_{k - 1}. 
\end{aligned}
$$

Therefore, the big product $\prod_{i = 1}^{k}\rho_{i - 1}(1 - \alpha_i)$ simplifies into $\prod_{i = 1}^{k} \alpha_{i - 1}^{-2} \alpha_i(\alpha_i - \mu/L)$ which produces the claim we want to prove. 

---
### **Examples of WAPG methods in the literatures**

In this section, we list canonical accelerated proximal gradient type of algorithms commonly known in the literatures. 
Throughout the section we use the same assumptions the stated in previous files linked to this file. 


#### **Algorithm | V-FISTA**
> Initialize $x_0 = y_0$, the algorithm updates for all $k \ge 1$: 
> $$
> \begin{aligned}
>     x_{k} &= T_Ly_{k - 1}, 
>     \\
>     y_k &= 
>     x_{k + 1} + \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}(x_{k + 1} - x_k). 
> \end{aligned}
> $$
> Here, $\kappa = \mu /L$ and $\mu > 0$. 


#### **Algorithm | Chambolle Dossal**
> 

---
### **Discussions of R-WAPG and its consequences**


#### **Definition | The Chambolle Dossal FISTA Sequence**
> 