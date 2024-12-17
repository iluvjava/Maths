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

#### **Algorithm | Chambolle, Dossal**
> Define $(t_k)_{k \ge 1}$ to be $t_k = (n + a - 1)/a$ for all $a \ge 2$. 
> Initialize $x_0 = y_0$, the algorithm updates for sequence $(x_k)_{k \ge 1}, (y_k)_{k \ge1}$ for all $k \ge 1$ by: 
> $$
> \begin{aligned}
>    x_k &= y_k + L^{-1}\mathcal G_L(y_k),  \\
>    y_k &= x_{k} + \frac{t_{k + 1} - 1}{t_{k + 2}}(x_k - x_{k - 1}).     
> \end{aligned}
> $$





---
### **Discussions of R-WAPG and its consequences**

The theorems that follows considers:
1. Fit Chambolle, Dossal's 2015 algorithm into the R-WAPG framework. 
2. Fit V-FISTA into the R-WAPG framework.


#### **Proposition**
> Assume $\mu = 0$. 
> Let $a \ge 2$. 
> Define $\forall k \in \Z, k \ge -1$, the sequence $(\alpha_k)_{k \ge -1}$ by $\alpha_k = a /(k + a + 1)$. 
> Define for all $k \ge 0$, the sequence $\rho_k = (k + a + 1)^2/((k + a + 2)(k + 2))$. 
> Then the sequences are valid option for R-WAPG  and they satisfy: 
> $$
> \begin{aligned}
>     & 
>     \rho_{k - 1} \in \left(1, \alpha_{k - 1}^{-2}\right), 
>     \\ 
>     & \alpha_{k - 1}^{-2} \ge \alpha_k^{-2} - \alpha_k^{-1}. 
> \end{aligned}
> $$  
> In addition, with this choice of $\rho_k$, $\alpha_k$, the R-WAPG reduces to the Chambolle Dossal 2015 algorithm with convergence rate $\mathcal O(\alpha_k)$ given by Lemma-1. 


**Proof**

First, we verify that for all $k \ge 1$ and $a \ge 2$, $\rho_{k - 1} > 1$. 
By definition it has

$$
\begin{aligned}
    \rho_{k - 1} 
    &= \frac{(k + a)^2}{(k + a + 1)(k + 1)}
    \\
    \iff 
    \rho_{k - 1} - 1
    &= 
    \frac{(k + a)^2 - (k + a + 1)(k + 1)}{(k + a + 1)(k + 1)}
    \\
    &= 
    (k + a + 1)^{-1} 
    \left(
        \frac{(k + a)^2 - (k + a + 1)(k + 1)}{k + 1}
    \right)
    \\
    &= 
    (k + a + 1)^{-1} 
    \left(
        \frac{
            (k + a)^2 - (k + a)(k + 1) - (k + 1)
        }{k + 1}
    \right)
    \\
    &= 
    (k + a + 1)^{-1} 
    \left(
        \frac{
            (k + a)^2 - (k + a)(k + 1)
        }{k + 1} 
        - 1
    \right)
    \\
    &= 
    (k + a + 1)^{-1} 
    \left(
        \frac{
            (k + a)(a - 1)
        }{k + 1} 
        - 1
    \right)
    \\
    & \ge 
    (k + a + 1)^{-1} 
    \left(
        \frac{
            (k + 2)(2 - 1)
        }{k + 1} 
        - 1
    \right) > 0. 
\end{aligned}
$$

Therefore, $\rho_{k - 1} > 1$. 
Next, we check $\rho_{k - 1} - \alpha_{k - 1}^{-2} < 0$ for all $k \ge 1, a \ge 2$. 
By definition, we have 

$$
\begin{aligned}
    \rho_{k - 1} - \alpha_{k - 1}^{-2} &= 
    \frac{(k + a)^2}{(k + a + 1)(k + 1)} - \left(
        \frac{a}{k + a + 1}
    \right)^{-2}
    \\
    &= 
    \frac{(k + a)^2}{(k + a + 1)(k + 1)} - \left(
        \frac{k + a + 1}{a}
    \right)^{2}
    \\
    &\le 
    \frac{(k + a)^2}{(k + a + 1)} - \left(
        \frac{k + a + 1}{a}
    \right)^{2}
    \\
    &= \frac{(k + a)^2 - (k + a + 1)^4}{a^2(k + a + 1)^2}
    \le 
    \frac{(k + a + 1)^2 - (k + a + 1)^4}{a^2(k + a + 1)}
    < 0. 
\end{aligned}
$$
The last strict inequality comes from $k + a + 1 > 1$ for all $a\ge 2, k \ge 1$. 
Therefore, $\rho_k, \alpha_k$ are valid sequence for R-WAPG and the convergence claim for R-WAPG applies. 
By the assumption that $\mu = 0$, the relations between $\rho_k, \alpha_k$ from R-WAPG is given by: 

$$
\begin{aligned}
    L\alpha_k^2 &= (1 - \alpha_k)L \rho_{k- 1}\alpha_{k - 1}^2
    \\
    \iff 
    \alpha_k^2 &= (1 - \alpha_k) \rho_{k - 1}\alpha_{k - 1}^2. 
\end{aligned}
$$

To verify, it has on the LHS $\alpha_k^2 = a^2/(k + a + 1)^2$ and the RHS has 

$$
\begin{aligned}
    (1 - \alpha_k)\rho_{k - 1}\alpha_{k - 1}^2 
    &= 
    \left(
        1 - \frac{a}{k + a + 1}
    \right)\left(
        \frac{(k + a)^2}{(k + a + 1)(k + 1)}
    \right)
    \left(
        \frac{a}{k + a}
    \right)^2
    \\
    &= \left(
        \frac{k + 1}{k + a + 1}
    \right)\left(
        \frac{(k + a)^2}{(k + a + 1)(k + 1)}
    \right)
    \left(
        \frac{a^2}{(k + a)^2}
    \right)
    \\
    &= \frac{a^2}{(k + a + 1)^2} = \alpha_k^2. 
\end{aligned}
$$

Therefore, the sequence $\alpha_k, \rho_k$ given is a valid choice for R-WAPG.  
Invoke directly the convergence claim, the algorithm converges at an rate of $\mathcal O(\alpha_k^2)$. 
Using the third equivalent form, R-WAPG has for all $k \ge 0$. 

$$
\begin{aligned}
    x_{k + 1} &= y_k - L^{-1}\mathcal G_Ly_k, 
    \\
    y_{k + 1} &= 
    x_{k + 1} + 
    \frac{\alpha_k^{-1} - 1}{\alpha_{k + 1}^{-1}}(x_{k + 1} - x_k). 
\end{aligned}
$$
By the substitution $\alpha_{k - 2} = t_{k}^{-1}=a/(k + a -1)$, we have the sequence $(t_k)_{k \ge1}$ defined as $t_k = (k + a - 1)/a$ which coincided with the choice from Chambolle Dossal 2015, and it make the updates for $y_{k}$ for all $k \ge 0$ into: 

$$
\begin{aligned}
    x_{k + 1} &= y_k - L^{-1}\mathcal G_L y_k, 
    \\
    y_{k + 1} &= x_{k + 1} + \frac{t_{k + 2} - 1}{t_{k + 3}}(x_{k + 1} - x_{k}). 
\end{aligned}
$$

Which is the same update rules for Chambolle Dossal. 


Since $\rho_{k - 1} > 1$ for all $k \ge 1$, we have $\alpha_{k - 1}^{-2} \ge \alpha_k^{-2} - \alpha_k^{-1}$ because 

$$
\begin{aligned}
    \alpha_k^2 &= (1 - \alpha_k)\alpha_{k -1}^2 \rho_{k - 1} 
    \ge (1 - \alpha_k)\alpha_{k - 1}^2
    \\
    \iff 1 &\ge 
    \alpha_k^{-1}(\alpha_k^{-1} - 1)\alpha_{k - 1}^2
    \\
    \alpha_{k - 1}^{-2} &\ge 
    \alpha_k^{-2} - \alpha_k^{-1}. 
\end{aligned}
$$
