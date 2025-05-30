- [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md)


---
### **Intro**

We present a sleeker proof of the convergence rate of function value of the proximal point algorithm. 
The new proof will make use a simpler lemma than previous discussions on the topic. 
We present the proximal point algorithm next. 

#### **Standing assumptions**
Let $f$ be convex, lsc. 
Given any stepsize sequence $(\lambda_t)_{t \in \N\cup \{0\}}$. 
For any initial iterates $x_0 \in \R^n$, define sequence $(x_t)_{t \in \N}$ generated by 

$$
\begin{aligned}
    x_{t + 1} := \argmin{x} 
    \left\lbrace
        f(x) + \frac{1}{2\lambda_t} \Vert x - x_t\Vert^2
    \right\rbrace. 
\end{aligned}
$$

In addition, assume thta existence of minimizer $x_* \in \argmin{x}f(x)$. 

--- 
### **Statement of convergence**

To simplify the notations, define 

$$
\begin{aligned}
    \mathcal J_k &:= (I + \lambda_k \partial f)^{-1}, \text{resolvent}, 
    \\
    g_k &:= \lambda_k^{-1}(x_k - \mathcal J_k x_k) \in \partial f(x_{k + 1}), 
    \text{ dual prox}, 
    \\
    x_{k + 1} &:= 
    x_k - \lambda_k g_k = \mathcal J_k x_k, 
    \text{ ppm update}. 
\end{aligned}
$$

We are interested in the convergence of 

$$
\begin{aligned}
    0\le \Delta_k := f(x_k) - f(x_*). 
\end{aligned}
$$


#### **Claim | Convergence of ppm, simple convex case**
> With the sequence $\sigma_{k + 1} - \sigma_{k} = \lambda_k \ge 0$. 
> Define the base case $\sigma_0 = \lambda_0$. 
> Then the PPM algorithm has convergence rate $\mathcal O(\sigma_k^{-1})$. 

**Proof**

Consider that $0\le \sigma_{k + 1} - \sigma_k \le \epsilon_{k + 1}$ for some sequence $\sigma_{k + 1}$ representing the monotone increasing property for $\sigma_k$. 

$$
\begin{aligned}
    \sigma_{k + 1} \Delta_{k + 1} - \sigma_k \Delta_k 
    &= 
    (\sigma_{k + 1} - \sigma_k) \Delta_{k + 1}
    + \sigma_k \Delta_{k + 1} - \sigma_k \Delta_k 
    \\
    &= 
    (\sigma_{k + 1} - \sigma_k) \Delta_{k + 1}
    + 
    \sigma_k (\Delta_{k + 1} - \Delta_k)
    \\
    & \textcolor{gray}
    {\text{if } 0\le \sigma_{k + 1} -\sigma_k \le \epsilon_{k + 1}}
    \\
    \implies
    &\le \epsilon_{k + 1}\Delta_{k + 1} + \sigma_k(\Delta_{k + 1} - \Delta_k). 
\end{aligned}
$$


From the proximal inequality, we have for all sequence $(x_k)_{k \in \N \cup\{0\}}$: 

$$
\begin{aligned}
    (\forall x): 
    f(x) - f(\mathcal J_k x_k) - \langle  g_k, x - \mathcal J_k x_k\rangle 
    &\ge 0
    \\
    \iff 
    (\forall x): 
    f(x) - f(x_{k + 1}) - \langle  g_k, x - \mathcal J_k x_k\rangle 
    &\ge 0. 
\end{aligned}
$$

This is by a convexity argument for the dual prox operator $g_k \in \partial f(x_{k + 1})$. 
Let $x = x_k$ we have: 

$$
\begin{aligned}
    f(x_k) - f(x_{k + 1}) - \langle  g_k, x_k - \mathcal J_k x_k\rangle
    &\ge 0
    \\
    f(x_k) - f_* + f_* - f(x_{k +1}) - \langle g_k, \lambda_k g_k\rangle
    &\ge 0
    \\
    \Delta_k - \Delta_{k + 1} - \lambda_k \Vert g_k\Vert^2 &\ge 0
    \\
    \Delta_{k + 1} - \Delta_k + \lambda_k \Vert g_k\Vert^2 &\le 0. 
\end{aligned}\tag{1}
$$

Similarly, when $x= x_*$, the above produces: 

$$
\begin{aligned}
    f(x_*) - f(x_{k + 1}) - \langle g_k, x_* - \mathcal J_k x_k\rangle
    &\ge 0
    \\
    - \Delta_{k + 1} - \langle g_k, x_* - x_{k + 1}\rangle
    &\ge 0
    \\
    - \Delta_{k + 1} - \langle g_k, x_* - x_k + x_k - x_{k + 1}\rangle
    &\ge 0
    \\
    - \Delta_{k + 1} - \langle g_k, x_* - x_k + \lambda_k g_k\rangle
    &\ge 0
    \\
    - \Delta_{k + 1} 
    - \lambda_k \Vert g_k\Vert^2 - \langle g_k, x_* - x_k\rangle
    &\ge 0
    \\
    \Delta_{k + 1} + 
    \lambda_k \Vert g_k\Vert^2 + \langle g_k, x_* - x_k\rangle
    &\le 0. 
\end{aligned}\tag{2}
$$

We claim that in addition, iterates satisfies 

$$
\begin{aligned}
    \frac{1}{2}
    \left(
        \Vert x_{k + 1} - x_*\Vert^2 - 
        \Vert x_k - x_*\Vert^2 
    \right)
    &= 
    \frac{\lambda_k^2}{2}\Vert g_k\Vert^2 
  - \langle \lambda_k g_k, x_k - x_*\rangle. 
\end{aligned}\tag{3}
$$

We put it here and it will be proved later. 
By considering: $\lambda_k (2) + \sigma_k(1)$, we get the inequality: 

$$
\begin{aligned}
    \lambda_k
    \left(
        \Delta_{k + 1}
         + \lambda_k \Vert g_k\Vert^2 + \langle g_k, x_* - x_k\rangle
    \right)
    + \sigma_k
    \left(
        \Delta_{k + 1} - \Delta_k + \lambda_k \Vert g_k\Vert^2
    \right)
    &\le 0
    \\
    \iff 
    \lambda_k \Delta_{k + 1} + \sigma_k (\Delta_{k + 1} - \Delta_k) + 
    \lambda_k^2 \Vert g_k\Vert^2 + \lambda_k\langle g_k, x_* - x_k\rangle + 
    \sigma_k \lambda_k \Vert g_k\Vert^2 
    &\le 0
    \\
    \underset{(3)}{\iff}
    \lambda_k \Delta_{k + 1} + \sigma_k (\Delta_{k + 1} - \Delta_k) + 
    \lambda_k^2 \Vert g_k\Vert^2 + 
    \frac{1}{2}(\Vert x_{k + 1} - x_*\Vert^2 - \Vert x_k - x_*\Vert^2) -  
    \frac{\lambda_k^2}{2}\Vert g_k\Vert^2 + 
    \sigma_k \lambda_k \Vert g_k\Vert^2 
    &\le 0
    \\
    \iff
    \lambda_k \Delta_{k + 1} + \sigma_k (\Delta_{k + 1} - \Delta_k) + 
    \frac{1}{2}(\Vert x_{k + 1} - x_*\Vert^2 - \Vert x_k - x_*\Vert^2) +  
    \frac{\lambda_k^2}{2}\Vert g_k\Vert^2 + 
    \sigma_k \lambda_k \Vert g_k\Vert^2 
    &\le 0
    \\
    \textcolor{gray}{\text{by: } \lambda_k \ge 0, \sigma_k\ge 0}& 
    \\
    \implies
    \lambda_k \Delta_{k + 1} + \sigma_k (\Delta_{k + 1} - \Delta_k) + 
    \frac{1}{2}(\Vert x_{k + 1} - x_*\Vert^2 - \Vert x_k - x_*\Vert^2)
    &\le 0
    \\
    \textcolor{gray}{\text{by: } \sigma_{k + 1} - \sigma_k \le \lambda_k}
    \\
    \implies 
    (\sigma_{k + 1} - \sigma_k) \Delta_{k + 1} + \sigma_k (\Delta_{k + 1} - \Delta_k) + 
    \frac{1}{2}(\Vert x_{k + 1} - x_*\Vert^2 - \Vert x_k - x_*\Vert^2)
    &\le 0
    \\
    \iff 
    \sigma_{k + 1}\Delta_{k + 1} - \sigma_k \Delta_k +
    \frac{1}{2}(\Vert x_{k + 1} - x_*\Vert^2 - \Vert x_k - x_*\Vert^2)
    &\le 0
    \\
    \iff 
    \sigma_{k + 1}(\Delta_{k + 1} + \Vert x_{k + 1} - x_*\Vert^2) + 
    \sigma_k(\Delta_k + \Vert x_k - x_*\Vert^2)
    &\le 0. 
\end{aligned}
$$

Telescoping the above inequality for $k = 0, \cdots, N$ will yield the desired convergence results for the algorithm. 

Finally, the proof for (3) is direct algebra: 

$$
\begin{aligned}
    \frac{1}{2}
    \left(
        \Vert x_{k + 1} - x_*\Vert^2 - 
        \Vert x_k - x_*\Vert^2 
    \right) &= 
    \frac{1}{2}\left(
        \Vert x_k - \lambda_k g_k - x_*\Vert^2 - 
        \Vert x_k - x_*\Vert^2 
    \right)
    \\
    &= 
    \frac{1}{2}\left(
        \lambda_k^2\Vert g_k\Vert^2
        +
        2\langle x_k - x_*, \lambda_k g_k\rangle
    \right). 
\end{aligned}
$$


**Remark**

Sleek proof isn't it? 
What about strongly convex, PL conditions? 