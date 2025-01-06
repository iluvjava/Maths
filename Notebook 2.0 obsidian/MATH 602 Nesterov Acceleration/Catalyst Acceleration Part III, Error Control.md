Pre-requisite: 

- [Catalyst Acceleration Part I, Introduction](Catalyst%20Acceleration%20Part%20I,%20Introduction.md)

---
### **Intro**

This file's major focus is Hongzhou Lin's second paper on Catalyst Meta Acceleration Method. 

We made the choice to redefine some of the notation, in hope of making things clearer. 

#### **Assumption 1 | Catalyst simple objective**
> Let $F: \R \rightarrow \overline \R$ be closed convex and $\mu \ge 0$ strongly convex. 
For any fixed $y \in \R^n$ and regularization parameter $\kappa > 0$, we define the following: 
$$
\begin{aligned}
    (\forall x \in \R^n) \; 
    \mathcal M_F^{1/\kappa}(x; y) &:= F(x) + \frac{\kappa}{2}\Vert x - y\Vert^2, 
    \\
    \mathcal J_{\kappa^{-1}F}(y) 
    &:= \argmin{x} \left\lbrace
        \mathcal M_F^{1/\kappa}(x; y)
    \right\rbrace,
    \\
    \mathcal M^*_{F, \kappa^{-1}}(y) 
    &:= \min_x
    \left\lbrace
        \mathcal M_F^{1/\kappa}(x; y)
    \right\rbrace. 
\end{aligned}
$$
$\mathcal M_{F}^{\kappa^{-1}}(\cdot, y)$ is a $\mu + \kappa$ strongly convex function, and $\mathcal M^*_{F, 1/\kappa}(y)$ is the Moreau Envelope of the function. 
It exhibits smoothness and strong convexity and it's full domain: $\R^n \rightarrow \R$. 


---
### **Lin et al., first Catalyst paper**

For easier notation, we also define the inexact proximal gradient introduced in Lin et al.'s first catalyst paper. 

#### **Definition 1 | Inexact Proximal operator with absolute error**
> Let $F$ be given by Assumption 1, we define the inexact proximal operator with absolute error $\epsilon > 0$ for any $y \in \R^n$ to be the following set: 
> $$
> \begin{aligned}
>     \mathcal J_{\kappa^{-1}F}^\epsilon (y) &= 
>     \left\lbrace
>         x \left | 
>             \mathcal M_F^{1/\kappa}(x; y) - 
>             \mathcal M^*_{f, 1/\kappa}(y) \le \epsilon
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

#### **Algorithm 1 | The Basic Catalyst algorithm**
> Let $F:\R \rightarrow \overline \R$ be $\mu \ge 0$ strongly convex and closed. 
> Let the initial estimate be $x_0 \in \R^n$, fix parameters $\kappa > 0$ and $\alpha_0 \in (0, 1]$. 
> Let $(\epsilon_k)_{k \ge 0}$ be an error sequence chosen for the evaluation for inexact proximal point method. 
> Initialize $x_0 = y_0$. Then the algorithm generates $(x_k, y_k)_{k\ge 0}$ for all $k \ge 1$ such that: 
> $$
> \begin{align*}
>     & \text{find } x_k \in \mathcal J_{\kappa^{-1}F}^{\epsilon_k} y_{k - 1}, 
>     \\
>     & \text{find } \alpha_k \in (0, 1) \text{ such that } \alpha_k^2 = (1 - \alpha_k)\alpha_{k - 1}^2 + (\mu/(\mu + \kappa))\alpha_k,
>     \\
>     & 
>     y_{k} = x_k + \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})}{\alpha_{k - 1}^2 + \alpha_k}(x_k - x_{k - 1}). 
> \end{align*}
> $$


Notations now follow. 
We Denote $\mathbb A$ to be the algorithm used for the outer loop, producing iterates $(x_k, y_k)_{k \ge0}$, $\mathbb M$ for the inner loop algorithm producing iterations $(z_{k, i})_{i \ge0}$ where $k$ denotes that iteration on the outer loop. 

#### **Assumption 2 | Inner loop iteration complexity**
> Fix any $k \in \N$, any $y \in \R^n$. 
> Suppose $\mathbb M$ generates iterates $(z_{k, t})_{t \ge 0}$ for the inner loop iteration such that it has a linear convergence rate: 
> $$
> \begin{aligned}
>     \mathcal M_F^{\kappa^{-1}}(z_{k, t}, y) - \mathcal M^*_{F, \kappa^{-1}}(y) 
>     &\le 
>     A(1 - \tau_{\mathbb M})^t
>     \left(
>         \mathcal M_{F}^{\kappa^{-1}}(z_{k,0})
>         -
>         \mathcal M^*_{F, \kappa^{-1}}(y)
>     \right). 
> \end{aligned}
> $$


#### **Theorem 1.1 | Outer loop iteration complexity, strongly convex**
> For $\mathbb A$ with regularization parameter $\kappa > 0$. 
> Assume that $F$ is $\mu > 0$ strongly convex. 
> Choose $\alpha_0 = \sqrt{q}$ with $q = \mu/(\kappa + \mu)$ and the error sequence 
> $$
> \begin{aligned}
>     \epsilon_k = \frac{2}{9}(F(x_0) - F^*)(1 - \rho)^k \quad \text{with }\quad 
>     \rho < \sqrt{q}. 
> \end{aligned}
> $$
> Then the $\mathbb A$ generates $(x_{k})_{k \ge 0}$ such that 
> $$
> \begin{aligned}
>     F(x_k) - F^* &\le 
>     C(1 - \rho)^{k + 1} (F(x_0) - F^*) \quad \text{ with }\quad 
>     C = \frac{8}{(\sqrt{q} - \rho)^2}. 
> \end{aligned}
> $$



#### **Theorem 1.2 | Outer loop iteration complexity, convex but not strongly convex**
> For $\mathbb A$ with regularization parameter $\kappa > 0$. 
> Assume that $F$ is convex but with strong convexity constant $\mu = 0$. 
> Choose $\alpha_0 = (\sqrt{5} - 1)/2$ and the error sequence 
> $$
> \begin{aligned}
>     \epsilon_k &= \frac{2(F(x_0) - F^*)}{9(k + 2)^{4 + \eta}} \quad 
>     \text{with}\quad \eta > 0. 
> \end{aligned}
> $$
> Take $x^*$ to be an minimizer of $F$. 
> Then algorithm $\mathbb A$ generates $(x_k)_{k \ge0}$ such that it has a convergence rate of 
> $$
> \begin{aligned}
>     F(x_k) - F^* &\le 
>     \frac{8}{(k + 2)^2}\left(
>         \left(1 + \frac{2}{\eta}\right)^2(F(x_k) - F^*)
>         + \frac{\kappa}{2}\Vert x_0 - x^*\Vert^2
>     \right).
> \end{aligned}
> $$


Both Theorem 1.1, 1.2 requires prior knowledge on $F^*$, which may not be accessible in a practical context. 



---
#### **Deriving the total complexity given the complexity of the inner iteration**
We now clarify on a very high level, additional key innovations in Lin's first Catalyst paper, this time we focus on summarizing the complexity results of the inner loop, and the outer loop algorithm. 


#### **Proposition 3.2 | Inner loop complexity strongly convex**
> Under the same settings of Theorem 1.1, suppose that method $\mathbb M$ has linear convergence rate as as specified in Assumption 2. 
> Then, when $z_{k, 0} = x_{k - 1}$, the precision $\epsilon_k$ is achived within a number of iteration $T_{\mathbb M} \le \widetilde {\mathcal O}(1/ \tau_{\mathbb M})$. 
> Here $\widetilde{\mathcal O}$ hides logarithmic complexity in $\mu, \kappa$ and other constants. 


#### **Proposition 3.3 | Inner loop complexity, convex but not strongly convex**
> Under the settings of Theorem 1.2, suppose that method $\mathbb M$ has linear convergence rate as specified in Assumption 2. 
> Suppose that the initial guess for $\mathbb M$ is $z_{0, k} = x_{k - 1}$. 
> Assume that $F$ has bounded level set, then there exists $T_{\mathbb M} \le \widetilde{\mathcal O}(1 / \tau_{\mathbb M})$ such that for any $k \ge 1$. 
> Then it requires at most $T_{\mathbb M}\log(k + 2)$ iterations for $\mathbb M$ to achieve accuracy $\epsilon_k$. 

In Proposition 3.2, if $\mathbb A$ has $k$ iteration, then the total number of experience experiend by $\mathbb M$ upper bounded via $m \le k T_{\mathbb M}$. 
Therefore, the convergence rate of the objective value as measure by the total number of iteration of $m$ experience by the inner loop is bounded by: 

$$
\begin{aligned}
    F(x_k) - F^* &\le \mathcal O \left(
        (1 - \rho)^k 
    \right) \le 
    \mathcal O \left(
        (1 - \rho)^{m/ T_{\mathbb M}}
    \right) \le 
    \mathcal O\left(
        \left(1 - \rho/T_{\mathbb M}\right)^{m}
    \right)
    \\
    &\le \widetilde{\mathcal O}\left(
        \tau_{\mathbb M}\sqrt{\mu}/(\mu + \kappa)
    \right). 
\end{aligned}
$$
The secondinequality on the first line made use of the fact that $1 + x \le (1 + x/n)^n$ for all $n \ge 1$ and $|x| \le n$. 
The optimal value of $\kappa$ is suggusted by choosing the best $\kappa > 0$ that minimizes the above upper bound. 

In proposition 3.3, we can bound the iteration complexity of of $F(x_k) - F^*$ by counting the total number of iteration experience by $\mathbb M$ by the $k$ th iteration of $\mathbb A$. 
The total number of iteration experience by $\mathbb M$ is upper bounded by 
$$
\begin{aligned}
    m &\le \sum_{i - 1}^{k} k T_{\mathbb M} \log(i + 2) \le k T_{\mathbb M} \log(k + 2) 
    \le T_{\mathbb M}k(k + 2) 
    \le 
    \mathcal O(T_{\mathbb M} k^2). 
\end{aligned}
$$
By theorem 1.2, we have the inequality 

$$
\begin{aligned}
    F(x_k)- F^* &\le 
    \mathcal O(k^{-2})\le 
    \mathcal O(m^{-2}T_{\mathbb M}) \le \widetilde{\mathcal O}(m^{-2}\tau_{\mathbb M}^{-1}). 
\end{aligned}
$$


---
### **Warm Starting with strongly convex objective**


#### **Lemma B.1 | Consequence of Warm Starting**
> Let $(x_k)_{k \ge 0}, y_{k \ge 0}$ be generated by Algorithm 1, therefore, by definition of $x_{k - 1} \in \mathcal J_{\kappa^{-1}F}^{\epsilon_{k - 1}} (y_{k - 2})$ has 
> $$
> \begin{aligned}
>     \mathcal M_F^{\kappa^{-1}}(x_{k - 1}, y_{k - 2}) - 
>     \mathcal M_{F, \kappa^{-1}}^*(y_{k - 2}) \le \epsilon_{k - 1}. 
> \end{aligned}
> $$
> Then, choosing warm start iterate $z_{k - 1}$ from $\mathbb A$ gives 
> $$
> \begin{aligned}
>     \mathcal M_F^{\kappa^{-1}}(x_{k - 1}, y_{k - 1}) - 
>     \mathcal M_{F, \kappa^{-1}}^*(y_{k - 1}) 
>     &\le 
>     2 \epsilon_{k - 1} + \frac{\kappa^2}{\kappa + \mu}
>     \Vert y_{k - 1} - y_{k + 1}\Vert^2. 
> \end{aligned}
> $$

Before we start the discussion of the next lemma, recall that for a strongly convex objective $F$, it gives 

#### **Lemma B.2 | Warm starting condition 2**

