- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)

----
### **Intro**

We prove the convergence rate **by faithfully following Nesterov's book on chapter 2.** 
We show the convergence of his generic method as well. We first present a generic results which doesn't necessarily requires knowledge about the sequence $\lambda_k, \alpha_k$. 
Based on that results we then find a convergence rate of the generic algorithm proposed earlier for the class of convex functions. 


#### **Nesterov's Generic Algorithm (2.2.7)**


$$
\begin{aligned}
    \text{(1):}\; & \text{$k$ th iteration generates iterates by}
    \\
    &
    \begin{aligned}
        \text{(a):}\; & \text{Choose }\alpha_k \in(0, 1) \text{ s.t: }
        L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu = \gamma_{k + 1}.
        \\
        \text{(b):}\; &
        \text{Choose } y^{(k)} = 
        (\gamma_k + \alpha_k \mu)^{-1}\left(
            \alpha_k\gamma_kv^{k} + \gamma_{k + 1}x^{(k)}
        \right).
        \\
        \text{(c):}\; & y^{(k)} = 
        \frac{\alpha_k\gamma_kv^{(k)} + \gamma_{k + 1}x^{(k)}}{
            \gamma_k + \alpha_k \mu
        }
        \\
        \;& \text{Find } x^{(k + 1)} \text{ s.t: }
        f\left(
            x^{(k + 1)}
        \right) \le f\left(
            y^{(k)}
        \right) - \frac{1}{2L}\left\Vert
            \nabla f \left(
                y^{(k)}
            \right)
        \right\Vert^2
        \\
        \text{(d)}: & \; \text{Set }
        v^{(k + 1)} 
        = \gamma_{k + 1}^{-1}\left(
            (1 - \alpha_k)\gamma_k v^{(k)} + \alpha_k \mu y^{(k)} - \alpha_k \nabla f\left(y^{(k)}\right)
        \right)
    \end{aligned}
\end{aligned}
$$

#### **Nesterov Generic Convergence Claims**

Since the algorithm is derived based on the Nesterov estimating sequence frameworks, the convergence rate is the same as the growth rate of the sequence $\lambda_k$, in big-O. 

---
### **The Convergence Lemma**

The following claims will model the convergence of the generic 

#### **Lemma (2.2.4) | The Convergence Lemma**
> If in the method (2.2.7) we choose $\gamma_0 \in (\mu, 3L + \mu)$, then for all $k \ge 0$, we have 
> $$
> \begin{aligned}
>     \lambda_k &\le 
>     \frac{
>         4\mu
>     }{
>         (\gamma_0 - \mu)\left(
>             \exp\left(\frac{k + 1}{2}q_f^{1/2}\right)
>             - 
>             \exp\left(-\frac{k + 1}{2}q_f^{1/2}\right)
>         \right)
>     }
>     \le \frac{4L}{(\gamma_0 - \mu)(k + 1)^2}.
> \end{aligned}
> $$
> Assume that $\lambda_0 = 1$, and $\lambda_k = \prod_{i = 1}^{k} (1 - \alpha_i)$. For $\gamma_0 = \mu$, we haev $\lambda_k = (1 - \sqrt{q_f})^k, k \ge 0$. 

**Proof of Lemma (2.2.4)**

With $\gamma_0 > \mu$, in algorithm (2.2.7 (a)) sugguests $\gamma_{k + 1} - \mu =(1 - \alpha_k)(\gamma_k - \mu)$, hence the relation 

$$
\begin{aligned}
    \gamma_{k + 1}- \mu = (\gamma_0 - \mu)\prod_{i=0}^{k} (1 - \alpha_i) = \lambda_{k + 1}(\gamma_0 - \mu). 
\end{aligned}
$$


At the last line, we used the definition of an estimating sequence. The estimating sequence also has 
$$
\begin{aligned}
    \lambda_{k + 1} &= (1 - \alpha_k)\lambda_n 
    \\
    \alpha_k &=1 -  \frac{\lambda_{k + 1}}{\lambda_k}. 
\end{aligned}
$$

Recall from (1a) from the algorithm we have 

$$
\begin{aligned}
    \alpha_k &= \sqrt{\frac{\alpha_k^2 L}{L}} 
    \\
    &= 
    \sqrt{
        \frac{\gamma_{k + 1}}{L}
    }
    \\
    &= 
    \sqrt{\frac{
        \lambda_{k + 1}(\gamma_0 - \mu) + \mu
    }{
        L
    }}
    \\
    &= 
    \lambda^{1/2}_{k + 1}
    \left(
        L^{-1}(\gamma_0 - \mu) + \frac{q_f}{\lambda_{k + 1}}
    \right)^{1/2}\quad  \text{dividing by $\lambda_{k + 1}$}, 
    \\
    \frac{1}{\lambda_{k + 1}} - \frac{1}{\lambda_k}
    &= 
    \lambda^{-1/2}_{k + 1}
    \left(
        L^{-1}(\gamma_0 - \mu) + \frac{q_f}{\lambda_{k + 1}}
    \right)^{1/2} = \frac{\alpha_k}{\lambda_{k + 1}}. 
\end{aligned}
$$

the above expression undergoes factorization on the LHS giving 

$$
\begin{aligned}
    \frac{1}{\lambda_{k + 1}} - \frac{1}{\lambda_k}
    &= 
    \left(
        \frac{1}{\lambda_{k + 1}^{1/2}} - \frac{1}{\lambda_k^{1/2}}
    \right)
    \left(
        \frac{1}{\lambda_{k + 1}^{1/2}} + \frac{1}{\lambda_k^{1/2}}
    \right)\;  \text{using $\lambda_{k + 1} \le \lambda_{k}$ by $\alpha \in (0, 1)$}, 
    \\
    &\le 
    \frac{2}{\lambda_{k + 1}^{1/2}} \left(
        \frac{1}{\lambda_{k + 1}^{1/2}} - \frac{1}{\lambda_{k}^{1/2}}
    \right). 
\end{aligned}
$$

##### **Claim (2.2.11) | A Monotonenically Increasing Quantity**
> Define $\xi_k = \left(\frac{L}{(\gamma_0 - \mu)\lambda_k}\right)^{1/2}$, we get the following relation 
> $$
> \xi_{k + 1}- \xi_k \ge \frac{1}{2}\left(
>     q_f \xi_{k + 1}^2 + 1
> \right)^{1/2}. 
> $$

This is equation (2.2.11) in Nesterov's writing. 

**Proof of the claim**

The claim is a consequence of what had ben derived in prior. It can be written as 

$$
\begin{aligned}
    \frac{\lambda_{k + 1}^{1/2}}{2}
    \left(
        \frac{1}{\lambda_{k + 1}} - \frac{1}{\lambda_k}
    \right) &\le \left(
        \frac{1}{\lambda_{k + 1}^{1/2}} - \frac{1}{\lambda_{k}^{1/2}}
    \right). 
\end{aligned}
$$

We analyze the left hand side so

$$
\begin{aligned}
    \frac{\lambda_{k + 1}^{1/2}}{2}
    \left(
        \frac{1}{\lambda_{k + 1}} - \frac{1}{\lambda_k}
    \right)
    &= 
    \frac{1}{2}
    \left(
        \frac{q_f}{\lambda_{k + 1}} + 
        \frac{\gamma_0 - \mu}{L}
    \right)
    \\
    &= 
    \frac{1}{2}
    \left(
        \frac{\gamma_0 - \mu}{L}
    \right)^{1/2} 
    \left(
        \frac{q_f}{\lambda_{k + 1}} \frac{L}{\gamma_0 - \mu}
        + 1
    \right)^{1/2}
    \\
    &= 
    \frac{1}{2}
    \left(
        \frac{\gamma_0 - \mu}{L}
    \right)^{1/2} 
    \left(
        q_f \xi_k^2
        + 1
    \right)^{1/2}
    \\
    &\le 
    \left(
        \frac{1}{\lambda_{k + 1}^{1/2}} - \frac{1}{\lambda_{k}^{1/2}}
    \right). 
\end{aligned}
$$

implying that 

$$
\begin{aligned}
    \frac{1}{2}
    \left(
        \frac{\gamma_0 - \mu}{L}
    \right)^{1/2} 
    \left(
        q_f \xi_k^2
        + 1
    \right)^{1/2} 
    &\le 
    \left(
        \frac{1}{\lambda_{k + 1}^{1/2}} - \frac{1}{\lambda_{k}^{1/2}}
    \right)
    \\
    \frac{1}{2}\left(
        q_f \xi_k^2
        + 1
    \right)^{1/2} 
    &\le 
    \left(
        \frac{L}{\gamma_0 - \mu}
        \left(
            \frac{1}{\lambda_{k + 1}^{1/2}} - 
            \frac{1}{\lambda_{k}^{1/2}}
        \right)
    \right) = \xi_{k +1} - \xi_k. 
\end{aligned}
$$

And the claim is now proven. 

**Continuing the proof of Lemma (2.2.4)**

Next, we propose a lower bound for $\xi_k$. For $\delta = (1/2)\sqrt{q_f}$, we are going to prove by induction that 

$$
\begin{aligned}
    \xi_{k + 1} &\ge \frac{1}{4\delta}(\exp((k + 1)\delta)) - \exp((k + 1)\delta)), \forall k \ge 0. 
\end{aligned}
$$

The above is listed as (2.2.12) in Nesterov's writing. As we can see, the hyperbolic cosine made an appearance here. For $k = 0$ we have the base case 

$$
\begin{aligned}
    \xi_0 &= \sqrt{\frac{L}{\gamma_0 - \mu}}
    \\
    &> \frac{1}{\sqrt{3}}
    \\
    &> \frac{1}{2}(\exp(1/2) - \exp(-1/2))
    \\
    &\ge \frac{1}{4}
    (\exp(\delta) - \exp(-\delta)), 
\end{aligned}
$$

the first equality is attained from $\lambda_0 = 1$, which is assumed for the lemma. The inequalities that follows can be justified by just simple numerical comparison. The final line uses the fact that $\delta \ge 1/2$ due $q_f \in (0, 1]$ by definition. Inductively we now assume that this is true for $k \ge 0$. Define the function $\psi(t)$, presented as 

$$
\begin{aligned}
    \psi(t) &:= \frac{1}{4\delta}(
        \exp((t + 1)\delta) - \exp(-t(t + 1)\delta)
    )
    \\
    \psi'(t) &= \frac{1}{4}(
        \exp((t + 1)\delta) + \exp(-(t + 1)\delta)
    ) > 0
\end{aligned}
$$

is increasing in $t$. Thus in view of theorem 2.1.3 the function $\psi(\cdot)$ is convex. In view of our assumptions

$$
\begin{aligned}
    \psi(k) \le \xi_k \le 
    \xi_{k + 1} - \frac{1}{2}
    (
        q_f \xi_{k + 1}^2 + 1
    )^{1/2}
    =: 
    \gamma(\xi_{k + 1}). 
\end{aligned}
$$

For contradiction, suppose that $\xi_{k + 1}< \psi(t + 1)$. Then, we consider the following chain of equality

$$
\begin{aligned}
    \psi(k) &< 
    \psi(k + 1) - \frac{1}{2}
    \left(
        4\delta^2\left(
            \frac{1}{4\delta}
            (
                \exp((k + 2)\delta) - \exp(-(k + 2)\delta)
            )
        \right)^2 + 1
    \right)^{1/2}
    \\
    &= \psi(k + 1) 
    - \frac{1}{2}\left(
        \frac{1}{4}
        \left(
            \exp((k + 2)\delta) + \exp(-(k + 2)\delta)
        \right)^2 + 1
    \right)^{1/2}
    \\
    &= 
    \psi(k + 1) 
    - \frac{1}{2}\left(
        \frac{1}{4}
        \left(
            \exp(2(k + 2)\delta) + \exp(-2(k + 2)\delta) - 2
        \right) + 1
    \right)^{1/2}
    \\
    &= 
    \psi(k + 1) 
    - \frac{1}{2}\left(
        \frac{1}{4}\exp(2(k + 2)\delta) + 
        \frac{1}{4}\exp(-2(k + 2)\delta) + 1/2
    \right)^{1/2}
    \\
    &= 
    \psi(t + 1) - 
    \frac{1}{2}
    \left(
        \left(
            \frac{1}{2}
            \exp((k + 2)\delta) + 
            \frac{1}{2}
            \exp(-(k + 2)\delta)
        \right)^2
    \right)^{1/2}
    \\
    &= 
    \psi(t + 1) - 
    \frac{1}{4}\left(
        \exp((k + 2)\delta) + \exp(-(k + 2)\delta)
    \right)
    \\
    &= \psi(k + 1) - \psi'(k + 1)
    \\
    &= \psi(k + 1) + \psi'(k + 1)(k - (k + 1)) \le \psi(k), 
\end{aligned}
$$

which would be a contradiction, hence it has to be that $\xi_{k + 1}\ge \psi(k + 1)$. The last line is just using the fact that $\psi$ is a convex function. Next, we consider the case where $\mu = 0$, to accomplish we consider $\mu \searrow 0$ on $\psi$, so $q_f \searrow 0$ , so $\delta \searrow 0$ and hence 

$$
\begin{aligned}
    \lim_{\delta \searrow 0}
    \psi(t) &= 
    \lim_{\delta \searrow 0}
    \frac{1}{4\delta}
    \left(
        \exp((t + 1)\delta) - \exp(-(t + 1)\delta)
    \right)
    \\
    &= 
    \lim_{\delta\searrow 0}\frac{1}{4}((t + 1)\exp((t + 1)\delta) + (t + 1)\exp(-(t + 1)\delta))
    \\
    &= \frac{1}{4}(2(t + 1)) = \frac{1}{2}(t + 1).
\end{aligned}
$$

where from the second line to the third line I used the Lopital's rule. Finally, to recover the convergence rate for $\lambda_k$, we use how $\xi_k$ is defined,

$$
\begin{aligned}
    \xi_k = 
    \left(
        \frac{L}{(\gamma_0 - \mu)\lambda_k}
    \right)^{1/2} 
    &\ge \psi(k)
    \\
    &\; \triangleright 
    \gamma_0 \in (\mu, \mu + 3L)
    \\
    \frac{\xi_k^2(\gamma_0 - \mu)}{L}
    = \lambda_k^{-1}
    &\ge
    \frac{\psi(k)^2(\gamma_0 - \mu)}{L}
    \\
    \lambda_k
    &\le 
    \frac{L(\gamma_0 - \mu)}{\psi(k)^2}. 
\end{aligned}
$$

Using the properties of the estimating sequence, the upper bound on the convergence rate of the function value follows from 

$$
\begin{aligned}
    f(x^{(k)})  - f^* &\le 
    \lambda_k 
    \left(
        f(x^{(0)}) - f^* + \gamma_0
        \Vert x^{(0)} - x^*\Vert^2
    \right)
    \\
    &\le 
    \frac{L(\gamma_0 - \mu)}{\psi(k)^2}
    \left(
        f\left(x^{(0)}\right) - f^*
        + \gamma_0 \left\Vert
            x^{(0)} - x^*
        \right\Vert^2
    \right), 
\end{aligned}
$$

where, $\psi(k)$, was defined as in earlier. This function, gives 2 type of convergence rate depending on the value of $\delta$, in the limiting case, where $\mu = 0$, the convergence is sublinear, otherwise, it's a linear convergence rate. 


**Remarks**

Recall the complexity lower bound from [Nesterov Lower Convergence Bounds for Lipschitz Smooth Functions](Convergence%20Rate%20Lower%20Bnd%20for%20Lip%20Functions.md) and [Convergence Rate Lower Bound for S-CVX Func](Convergence%20Rate%20Lower%20Bound%20for%20S-CVX%20Func.md), the above convergence rate is in the complexity class for both type of functions. 
Therefore, the generic method proposed by Nesterov is an optimal method. 
