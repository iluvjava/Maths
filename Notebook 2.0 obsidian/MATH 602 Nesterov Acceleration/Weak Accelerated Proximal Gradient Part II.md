- [Weak Accelerated Proximal Gradient Part I](Weak%20Accelerated%20Proximal%20Gradient%20Part%20I.md)


---
### **Intro**
The discussion continues from the file/files linked at the top of the document of the markdown file. 
We start with a major lemma that will assist with the analysis that follows. 
The definition of R-WAPG will be useful, which we list it here: 


#### **Definition | R-WAPG sequences**
> Assume $0 \le \mu < L$. 
> The sequences $(\alpha_k)_{k \ge 0}, (\rho_k)_{k \ge1}$ are sequences parameterized by $\mu, L$. 
> They are valid for R-WAPG if all the following holds: 
> $$
> \begin{aligned}
>     \alpha_0 &\in (0, 1], 
>     \\
>     \alpha_k &\in (\mu/L, 1) \quad (\forall k \ge 1), 
>     \\
>     \rho_k &:= \frac{\alpha_{k + 1}^2 - (\mu/L)\alpha_{k + 1}}{(1 - \alpha_{k + 1})\alpha_k^2} \quad \forall (k \ge 0). 
> \end{aligned}
> $$
> We call $(\alpha_k)_{k \ge 0}, (\rho_k)_{k \ge 0}$ the R-WAPG sequences. 

**Observations**

1. $\rho_k > 0$ for all $k \ge 0$. 
2. $\forall k \ge 1: L\alpha_k^2 = (1 - \alpha_k)L\rho_{k - 1}\alpha_{k - 1}^2 +\mu\alpha_k$. 

#### **Algorithm 2.1 | Relaxed weak accelerated proximal gradient (R-WAPG)**
> Initialize any $(x_1, v_1)$. 
> Given R-WAPG sequences $(\alpha_k)_{k \ge 1}, (\rho_k)_{k \ge 1}$, 
> The algorithm generates a sequence of vector $(y_k, x_{k + 1}, v_{k + 1})_{k \ge 1}$, by the following procedures: 
> For $k=1, 2, 3, \cdots$
> $$
> \begin{aligned}
>     \gamma_k &:= \rho_{k -1}L\alpha_{k - 1}^2, 
>     \\
>     \hat \gamma_{k + 1} & := (1 - \alpha_k)\gamma_k + \mu \alpha_k = L\alpha_k^2, 
>     \\
>     y_k &= 
>     (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \hat\gamma_{k + 1} x_k), 
>     \\
>     g_k &= \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= 
>     \hat\gamma^{-1}_{k + 1}
>     (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
>     \\
>     x_{k + 1} &= T_L y_k. 
> \end{aligned}
> $$

**Observations**

For all $k \ge 1$, the algorithm chains together the sequence of $(\hat \gamma_{k+1})_{k \ge 1}$ and $(\gamma_k)_{k \ge 1}$ through the equalities: 
$$
\begin{aligned}
    \hat \gamma_{k + 1} 
    &= L\alpha_k^2 
    \\
    &= (1 - \alpha_k)\gamma_k + \alpha_k \mu
    \\
    &= (1 - \alpha_k)L\rho_{k - 1}\alpha_{k - 1}^2 + \alpha_k \mu
    \\
    &= (1 - \alpha_k)\rho_{k - 1}\hat \gamma_{k} + \alpha_k \mu. 
\end{aligned}
$$

---
### **Equivalent forms of the R-WAPG algorithm**

1. List equivalent forms of the R-WAPG algorithm. 
2. Proves that these representations are indeed equivalent to the definition of R-WAPG algorithm. 

#### **Definition | R-WAPG Intermediate form**
> Assume $\mu < L$ and let $(\alpha_k)_{k \ge 0}, (\rho_k)_{k \ge 0}$ are a pair of R-WAPG sequence. 
> Initialize any $x_1, v_1$ in $\R^n$. 
> For $k \ge 1$, the algorithm generates sequence of vector iterates $(y_{k}, v_{k + 1}, x_{k + 1})_{k \ge 1}$ by the procedures: For $k = 1, 2, \cdots$ 
> $$
> \begin{aligned}
>     & y_{k} = 
>     \left(
>         1 + \frac{L - L\alpha_{k}}{L\alpha_{k} - \mu}
>     \right)^{-1}
>     \left(
>         v_{k} + 
>         \left(\frac{L - L\alpha_{k}}{L\alpha_{k} - \mu} \right) x_{k}
>     \right), 
>     \\
>     & x_{k + 1} = 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     & v_{k + 1} = 
>     \left(
>         1 + \frac{\mu}{L \alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{\mu}{L \alpha_k - \mu}\right) y_k
>     \right) - \frac{1}{L\alpha_{k}}\mathcal G_L y_k. 
> \end{aligned}
> $$


#### **Definition | R-WAPG similar triangle form**
> Given any $(x_1, v_1)$ in $\R^n$. 
> Assume $\mu < L$.
> Let the sequence $(\alpha_k)_{k \ge 0}, (\rho_k)_{k\ge 0}$ be a pair of R-WAPG sequence. 
> For $k \ge 1$, the algorithm generates sequences of vector iterates $(y_k, v_{k + 1}, x_{k + 1})_{k \ge 1}$ by the procedures: for $k = 1, 2, \cdots$
> $$
> \begin{aligned}
>     & y_k = 
>     \left(
>         1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
>     \right), 
>     \\
>     & x_{k + 1} = 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     & v_{k + 1} = 
>     x_{k + 1} + (\alpha_k^{-1} -1)(x_{k + 1} - x_k).  
> \end{aligned}
> $$

#### **Definition | R-WAPG momentum form**
> Given any $y_1 = x_1 \in \R^n$ and a pair of R-WAPG sequence $(\rho_k)_{k \ge 0}, (\alpha_k)_{k\ge 0}$. 
> The algorithm generates iterates $x_{k + 1}, y_{k + 1}$ For $k = 1, 2, \cdots$ by the procedures: for $k=1, 2,\cdots$
> $$
> \begin{aligned}
>     & x_{k + 1} = y_k - L^{-1}\mathcal G_Ly_k, 
>     \\
>     & 
>     y_{k + 1} = 
>     x_{k + 1} + 
>     \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
> \end{aligned}
> $$
> In the special case where $\mu = 0$, the momentum term can be represented without relaxation parameter $\rho_k$: 
> $$
>     (\forall k \ge 1)\quad \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}} 
>     = \alpha_{k + 1}(\alpha_k^{-1} - 1).  
> $$


#### **Proposition | Fist R-WAPG equivalent form**
> If the sequence $(y_k, v_k, x_k)_{k \ge 1}$ is produced by R-WAPG, 
> then the iterates can be expressed without $(\gamma_k)_{k \ge1},(\hat \gamma_k)_{k \ge 2}$, and for all $k\ge 1$ they are algebraically equivalent to
> $$
> \begin{aligned}
>     & 
>     y_{k} = 
>     \left(
>         1 + \frac{L - L\alpha_{k}}{L\alpha_{k} - \mu}
>     \right)^{-1}
>     \left(
>         v_{k} + 
>         \left(\frac{L - L\alpha_{k}}{L\alpha_{k} - \mu} \right) x_{k}
>     \right), 
>     \\
>     & x_{k + 1} = 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     & v_{k + 1} = 
>     \left(
>         1 + \frac{\mu}{L \alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{\mu}{L \alpha_k - \mu}\right) y_k
>     \right) - \frac{1}{L\alpha_{k}}\mathcal G_L y_k. 
> \end{aligned}
> $$

**Proof**

For all $k \ge 1$, by R-WAPG, it has 

$$
\begin{aligned}
    y_{k} &= 
    (\gamma_k + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k + \hat \gamma_{k + 1}x_k)
    \\
    &= 
    (\hat \gamma_{k + 1} + \alpha_k \gamma_k)^{-1}
    (\alpha_k \gamma_k v_k + \hat \gamma_{k + 1}x_k)
    \\
    &= 
    \left(
        \frac{\hat \gamma_{k + 1}}{\alpha_k\gamma_k} + 1
    \right)^{-1}
    \left(
        v_k + \frac{\hat \gamma_{k + 1}}{\alpha_k \gamma_k} x_k
    \right)
    \\
    &= 
    \left(
        \frac{L\alpha_k^2}{\alpha_k\gamma_k} + 1
    \right)^{-1}
    \left(
        v_k + \frac{L\alpha_k^2}{\alpha_k \gamma_k} x_k
    \right)
    \\
    &= 
    \left(
        \frac{L\alpha_k}{\gamma_k} + 1
    \right)^{-1}
    \left(
        v_k + \frac{L\alpha_k}{ \gamma_k} x_k
    \right)
    \\
    &= 
    \left(
        1 + \frac{L - L \alpha_k}{L \alpha_k - \mu}
    \right)^{-1}
    \left(
        v_k + 
        \frac{L - L \alpha_k}{L \alpha_k - \mu} x_k
    \right). 
\end{aligned}
$$

From the left to right of the second inequality, we used the fact that $\hat \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k\mu$. 
Going from the left to the right of the second last inequality, we did the following: 
$$
\begin{aligned}
    L\alpha_k^2 &= 
    (1 - \alpha_k)\gamma_k + \alpha_k \mu 
    \\
    \iff 
    L \alpha_k^2 - \alpha_k\mu &= 
    (1 - \alpha_k)\gamma_k
    \\
    \iff 
    \gamma_k/L
    &= 
    \frac{L \alpha_k^2 - \alpha_k\mu}{L (1 - \alpha_k)}
    \\
    \iff 
    L/\gamma_k
    &= 
    \frac{L (1 - \alpha_k)}{L \alpha_k^2 - \alpha_k\mu}
    \\
    \iff 
    L\alpha_k/\gamma_k
    &= 
    \frac{L - L\alpha_k}{L\alpha_k - \mu}. 
\end{aligned}
$$

On the third $\iff$, we can assume $\alpha_k \neq \mu/L\;  \forall k \ge 1$ because the definition of R-WAPG sequence asserts $\alpha_k \in (\mu/L, 1)$ for all $k \ge 1$. 
For all $k \ge 1$, $v_{k + 1}$ has: 
$$
\begin{aligned}
    v_{k + 1} &= 
    \hat \gamma_{k + 1}^{-1}
    ((1 - \alpha_k)\gamma_k v_k + \mu\alpha_k y_k)
    - \alpha_k\hat \gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    ((1 - \alpha_k)\gamma_k + \alpha_k \mu)^{-1}
    \left(
        (1 - \alpha_k)\gamma_k v_k + \mu\alpha_k y_k
    \right)
    - \alpha_k\hat \gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k\mu}{(1 - \alpha_k)\gamma_k}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k\mu}{(1 - \alpha_k)\gamma_k} y_k
    \right)
    - \alpha_k\hat \gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k \mu}{L \alpha_k^2 - \alpha_k \mu}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k \mu}{L \alpha_k^2 - \alpha_k \mu} y_k
    \right)
    - \frac{1}{L\alpha_{k}}\mathcal G_L y_k. 
\end{aligned}
$$
Going from the left to the right of the second equality, we substitute $\hat \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \mu\alpha_k$. 
At the end, recall that for all $k \ge 1$, it has $\hat \gamma_{k + 1} = L \alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu$, so: 
$$
\begin{align*}
    (1 - \alpha_k)\gamma_k
    &= 
    \hat \gamma_{k + 1} - \mu \alpha_k
    = 
    L\alpha_{k}^2 - \alpha_k\mu. 
\end{align*}
$$
The is now complete. 
This form doesn't have $\rho_k, \gamma_k, \hat \gamma_k$ in it. 

#### **Proposition | Second R-WAPG equivalent form**
> Let iterates $(y_k, x_{k}, v_{k})_{k \ge 1}$ and sequence $(\alpha_k, \rho_k)_{k \ge 0}$ be given by Definition R-WAPG. 
> Then for all $k \ge 1$, iterate $y_k, x_{k + 1}, v_{k + 1}$
> satisfy: 
> $$
> \begin{aligned}
>     y_{k} &= 
>     \left(
>         1 + \frac{L - L\alpha_{k}}{L\alpha_{k} - \mu}
>     \right)^{-1}
>     \left(
>         v_{k} + 
>         \left(\frac{L - L\alpha_{k}}{L\alpha_{k} - \mu} \right) x_{k}
>     \right), 
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
> \end{aligned}
> $$

**Proof**

From the intermediate form, we define $(\tau_k, \xi_k, \delta_k)_{k \ge 1}$ in the abstract triangle form to be: 
$$
\begin{aligned}
    (\forall k \ge 1) \quad \tau_k &= \frac{L(1 - \alpha_k)}{L\alpha_k - \mu},
    \\
    (\forall k \ge 1)\quad 
    \xi_k &= \frac{\mu}{L \alpha_k - \mu},
    \\
    (\forall k \ge 1)\quad 
    \delta_k &:= \frac{1 + \xi_k}{L\alpha_k}. 
\end{aligned}
$$
We claim that these parameters satisfy $L\delta_k = 1 + \tau_k + \xi_k$. 
To see, we have forall $k\ge 1$: 
$$
\begin{aligned}
    1 + \tau_k + \xi_k &= 
    1 + \frac{L(1 - \alpha_k)}{L \alpha_k - \mu} 
    + \frac{\mu}{L \alpha_k - \mu}
    \\
    &= 
    1 + \frac{L - L \alpha_k + \mu}{L\alpha_k - \mu}
    \\
    &= 
    \frac{L - L \alpha_k + \mu + L \alpha_k - \mu}{L\alpha_k - \mu}
    \\
    &= \frac{L}{L\alpha_k - \mu}. 
\end{aligned}
$$
Next, it also has for all $k \ge 1$:
$$
\begin{aligned}
    \frac{1 + \xi_k}{\alpha_k}
    &= 
    \frac{1 + \frac{\mu}{L\alpha_k - \mu}}{\alpha_k}
    = 
    \frac{\frac{L\alpha_k - \mu + \mu}{L \alpha_k - \mu}}{\alpha_k}
    = 
    \frac{L}{L\alpha_k - \mu}.
\end{aligned}
$$
Hence,  $v_{k + 1} - x_{k + 1} = (1 + \xi_k)^{-1}(x_{k + 1} - x_k)\; \forall k \ge 1$ by the asbtract similar triangle form. 
Therefore, substituting it gives: 
$$
\begin{aligned}
    v_{k + 1} &= 
    x_{k + 1} + \left(
        1 + \frac{\mu}{L\alpha_k - \mu}
    \right)^{-1}\left(
        \frac{L(1 - \alpha_k)}{L\alpha_k - \mu}
    \right)(x_{k + 1} - x_k)
    \\
    &= 
    x_{k + 1} + \left(
        \frac{L\alpha_k}{L\alpha_k - \mu}
    \right)^{-1}\left(
        \frac{L(1 - \alpha_k)}{L\alpha_k - \mu}
    \right)(x_{k + 1} - x_k)
    \\
    &= 
    x_{k + 1} + \left(
        \frac{L\alpha_k - \mu}{L\alpha_k}
    \right)\left(
        \frac{L - L\alpha_k}{L\alpha_k - \mu}
    \right)(x_{k + 1} - x_k)
    \\
    &= x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
\end{aligned}
$$

#### **Proposition | Third R-WAPG equivalent form**
> Let sequence $(\alpha_k, \rho_k)_{k \ge 0}$ and iterates $(x_k, v_k, y_k)_{k\ge 1}$ given by R-WAPG intermediate form. 
> Then for all $k \ge 1$, the iterates $(x_{k + 1}, y_{k + 1})_{k \ge 1}$ are algebraically equivalent to: 
> $$
> \begin{aligned}
>     x_{k + 1} &= y_k - L^{-1}\mathcal G_Ly_k, 
>     \\
>     y_{k + 1} &= 
>     x_{k + 1} + 
>     \frac{\rho_k\alpha_k(1 - \alpha_k)}
>     {\rho_k\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
> \end{aligned}
> $$
> If in addition, $v_1 = x_1$ then 
> $$
> \begin{aligned}
>     y_1 = \left(
>         1 + \frac{L - L \alpha_1}{L\alpha_1 - \mu}
>     \right)^{-1}\left(
>         v_1 + \left(
>             \frac{L - L \alpha_1}{L \alpha_1 - \mu}
>         \right)x_1
>     \right) = x_1. 
> \end{aligned}
> $$
> In the special case when $\mu = 0$, the momentum term admits simpler representation 
> $$
> \begin{aligned}
>     (\forall k \ge 1) \quad 
>     \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}
>     & = \alpha_{k + 1}(\alpha_k^{-1} - 1). 
> \end{aligned}
> $$

**Proof**

Start by considering the update rule for $v_k$ from the similar triangle form which has for all $k \ge 1$: 
$$
\begin{aligned}
    v_{k + 1} &= 
    x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \\
    \iff 
    (L \alpha_{k + 1} - \mu)v_{k + 1} 
    &= 
    (L \alpha_{k + 1} - \mu)x_{k + 1} + (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
\end{aligned}
$$
Next, we simplify the update $y_{k}$ by Similar triangle form for all $k \ge 1$: 
$$
\begin{aligned}
    y_k &= 
    \left(
        1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
    \right)^{-1}
    \left(
        v_k + 
        \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
    \right)
    \\
    &= 
    \left(
    \frac{L - \mu}{L\alpha_k - \mu} 
    \right)^{-1}
    \left(
        v_k + 
        \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
    \right)
    \\
    &= 
    \frac{L\alpha_k - \mu}{L - \mu} v_k
    + 
    \frac{L - L \alpha_k}{L - \mu} x_k
    \\
    &= (L - \mu)^{-1}((L \alpha_k - \mu)v_k + (L - L \alpha_k)x_k). 
\end{aligned}
$$
We have $y_1 = x_1$ when $v_1 = x_1$ because substituting $v_1 = x_1$ for how $y_1$ is defined it has: 
$$
\begin{aligned}
    y_1 &= (L - \mu)^{-1}(L(\alpha_1 - \mu)x_1 + (L - L\alpha_1)x_1)
    \\
    &= (L - \mu)^{-1}(L(\alpha_1 - \mu)x_1 + (L - L \alpha_1)x_1)
    \\
    &= (L - \mu)^{-1}((L - \mu)x_1) = x_1. 
\end{aligned}
$$
Now substituting $v_{k + 1}$ into $y_{k + 1}$, so it has for all $k\ge 1$: 
$$
\begin{aligned}
    y_{k + 1} &= 
    (L - \mu)^{-1}((L\alpha_{k + 1} - \mu)v_{k + 1} + (L - L \alpha_{k + 1})x_{k + 1})
    \\
    &= (L - \mu)^{-1}
    \left(
        (L\alpha_{k + 1} - \mu)x_{k + 1} + 
        (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
        + (L - L \alpha_{k + 1})x_{k + 1}
    \right)
    \\
    &= 
    (L - \mu)^{-1}
    \left(
        (L\alpha_{k + 1} - \mu)x_{k + 1} + (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \right)
    \\
    &= x_{k + 1} + \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)}{L - \mu}(x_{k + 1} - x_k). 
\end{aligned}
$$

The coefficient for $(x_{k + 1} - x_k)$ needs some works to formulate it without the parameter $\mu, L$. 
To do that we have: 

$$
\begin{aligned}
    \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)}{L - \mu}
    &= \frac{(L\alpha_{k + 1} - \mu)\alpha_k(1 - \alpha_k)}{\alpha_k^2(L - \mu)}
    \\
    &= 
    \alpha_k(1 - \alpha_k)
    \left(
        \frac{\alpha_k^2(L - \mu)}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= \alpha_k(1 - \alpha_k)
    \left(
        \frac{L\alpha_k^2 - \mu\alpha_k^2}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= 
    \alpha_k(1 - \alpha_k)
    \rho_k\left(
        \frac{L\rho_k\alpha_k^2 - \mu\rho_k\alpha_k^2}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= 
    \rho_k\alpha_k(1 - \alpha_k)
    \left(
        \frac{(L\alpha_{k + 1} - \mu)(\rho_k\alpha_k^2 + \alpha_{k + 1})}
        {L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}.
\end{aligned}
$$

Going from the left to right on the fourth equality, we used $L\alpha_{k + 1}^2 = (1 - \alpha_{k + 1})\rho_kL\alpha_k^2 + \mu \alpha_{k + 1}$ with 
$$
\begin{aligned}
    L \rho_k \alpha_k^2 - \mu \rho_k \alpha_k^2 
    &= 
    (1 - \alpha_{k + 1})L \rho_k \alpha_k^2 + \alpha_{k + 1} L \rho_k \alpha_k^2 - \mu \rho_k \alpha_k^2
    \\
    &= 
    ((1 - \alpha_{k + 1})L \rho_k \alpha_k^2 + \mu \alpha_{k + 1}) - \mu\alpha_{k + 1} + \alpha_{k + 1} L \rho_k \alpha_k^2 - \mu \rho_k \alpha_k^2
    \\
    &= L \alpha_{k + 1}^2 - \mu\alpha_{k + 1} + \alpha_{k + 1}L\rho_k\alpha_k^2 - \mu \rho_k \alpha_k^2
    \\
    &= 
    L\alpha_{k + 1}(\alpha_{k + 1} + \rho_k \alpha_k^2) - \alpha_{k + 1}\mu - \mu \rho_k \alpha_k^2
    \\
    &= (L \alpha_{k + 1} - \mu)(\alpha_{k + 1} + \rho_k \alpha_k^2). 
\end{aligned}
$$
When $\mu = 0$, things simplify. 
Consider that $\forall k \ge 1: \alpha_{k + 1}^2 = (1 - \alpha_{k + 1})\rho_k\alpha_k^2$. 
$$
\begin{aligned}
    \frac{\rho_k\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2 + \alpha_{k + 1}}
    &= 
    \frac{\rho_k\alpha_{k + 1}\alpha_k(1 - \alpha_k)}
    {\rho_k\alpha_{k + 1}\alpha_k^2 + \alpha_{k + 1}^2}
    \\
    &= 
    \frac{\rho_k\alpha_{k + 1}\alpha_k(1 - \alpha_k)}
    {\rho_k\alpha_{k + 1}\alpha_k^2 + \rho_k(1 - \alpha_{k + 1})\alpha_k^2}
    \\
    &= \frac{\rho_k\alpha_{k + 1}\alpha_k(1 - \alpha_k)}{\rho_k\alpha_k^2}
    \\
    &= \alpha_{k + 1}(\alpha_k^{-1} - 1). 
\end{aligned}
$$

---
### **Fitting existing Algorithms in the literatures using R-WAPG**

