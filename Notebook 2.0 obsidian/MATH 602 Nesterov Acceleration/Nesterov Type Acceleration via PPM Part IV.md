- [A Better Proof for FISTA Convergence](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md)
- [Ryu's Proof of AG](Ryu's%20Proof%20of%20AG.md)

----
### **Intro**

In this section, we present a sleek proof of the Nesterov acceleration method using the PPM interpretation developed in the previous materials. 
The proof is similar in form as stated in [Ryu's Proof of AG](Ryu's%20Proof%20of%20AG.md), and it's reverse engineered from materials presented in [A Better Proof for FISTA Convergence](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md). 


#### **Assumptions**

Recall previously that we rolled things with the assumption that: 
1. $h = f + g$,
2. $f, g$ are convex, 
3. $f$ is $L$-Lipschitz smooth,
4. $\mathcal T_L = (I + L^{-1}\partial g)^{-1}\circ [I - L^{-1}\nabla f]$, the proximal gradient operator,
5. $\mathcal G_L = L (I - \mathcal T_L)$, the gradient mapping,
6. $x_+ \in \argmin{x} h(x)$, the minimizer exists for $h$.  


#### **Algorithm**

The algorithm is the S-CVX PPM form with the assumption that $\tilde \eta_{t + 1} = \eta_t + L^{-1}$, by writing $\tilde \eta_{t + 1}$ as $\tilde \eta_t$ instead, with that the S-CVX PPM iterates can be written as: 

$$
\begin{aligned}
    y_k &= (1 - (L\tilde \eta_k)^{-1}) z_k + (L\tilde \eta_k)^{-1} x_k, 
    \\
    x_{k + 1} &= x_k - \tilde \eta_k \mathcal G_L(y_k), 
    \\
    z_{k + 1} &= y_k - L^{-1} \mathcal G_L(y_k). 
\end{aligned}
$$


#### **Notations**
Use the notation $\Delta_k = h(z_{k + 1}) - h(\bar x)$ to describe the optimality gap. 

#### **The proximal gradient lemma**
> Use our assumptions, recall that previously we have the inequality that for all $x, z$ we have 
> $$
> \begin{aligned}
>     h(z) 
>     &\ge h(\mathcal T_L x) + 
>     \langle \mathcal G_L x, z - x\rangle + \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
>     \\
>     &= 
>     h(\mathcal T_L x) + \langle \mathcal G_L x, z - x\rangle + \frac{1}{2L}\Vert \mathcal G_L x\Vert^2
> \end{aligned}
> $$


---
### **The convergence rate of the algorithm**

Convergence rate proof is better exposed by brute force. 
There is very little beauty in the argument of the convergence proof unfortunately. 
The entire argument is based on the proximal gradient lemma, which is pivotal. 

#### **Claim | The optimal convergence rate of the algorithm**
> With the assumptions, if there is a sequence $\sigma_t$ such that $\sigma_k - \sigma_{k-1} \le \tilde \eta_k, \sigma_t = L\tilde \eta_k^2$, producing a convergence rate of $\mathcal O(\sigma_k^{-1})$ for $\Delta_k$. 

**Observations**

Substituting $\sigma_k = L \tilde \eta_k$, it gives inequality 

$$
\begin{aligned}
    & L \tilde \eta_k^2 - L \tilde \eta_{k - 1}^2 
    \le 
    \tilde \eta_k
    \\
    & \text{if : }  \tilde \eta_k = L^{-1} t_k, \text{ then equivalently: }
    \\
    & L^{-1}t_k^2 - L^{-1}t_{k - 1}^2
    \le L^{-1}t_k 
    \\
    & 
    t_k^2 - t_{k - 1}^2
    \le t_k, 
\end{aligned}
$$

which is the famous conditions for the sequence used in Chambolle Dossal's proof. 
Nothing too new. 


**Proof**

We label several of the important relations to state the convergence result first, and then we establish the proof for these realtions. 
For all $k \in \N$ it yields the following inequalities: 

$$
\begin{aligned}
    & 
    \begin{aligned}
        ([1]): 
        \Delta_k &\le
        - \langle \mathcal G_L y_k, x_+ - y_k \rangle - \frac{1}{2L} \Vert \mathcal G_L y_k\Vert^2
        \\
        \iff 
        0& \ge 
        \Delta_k + \langle \mathcal G_L y_k, x_+ - y_k\rangle + \frac{1}{2L}\Vert \mathcal G_L y_k\Vert^2. 
    \end{aligned}
    \\
    & 
    \begin{aligned}
        ([2]): 
        \Delta_k - \Delta_{k -1} 
        &\le 
        - \langle \mathcal G_L y_k, z_k - y_k\rangle - \frac{1}{2L}\Vert \mathcal G_L y_k\Vert^2
        \\
        \iff 
        0 &\ge
        \Delta_k - \Delta_{k - 1}
        + \langle \mathcal G_L y_k, z_k - y_k\rangle
        + \frac{1}{2L} \Vert \mathcal G_L y_k \Vert^2
    \end{aligned}
\end{aligned}
$$

If we assume that $\sigma_k - \sigma_{k - 1} \le \epsilon_k, \epsilon_k \ge 0$ then the following special inequality on the optimality gap: 

$$
\begin{aligned}
    \sigma_k\Delta_k - \sigma_{k -1}\Delta_{k -1}
    &\le 
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k -1}) + \epsilon_k \Delta_k. 
\end{aligned}\tag{[3]}
$$

And we have the equality: 

$$
\begin{aligned}
    \frac{1}{2}
    (
        \Vert x_{k + 1} - x_+\Vert^2 - \Vert x_k - x_+\Vert^2
    )
    &= 
    - \tilde \eta_k \langle \mathcal G_L, x_k - x_+\rangle
    + \frac{\tilde \eta_k^2}{2}\Vert \mathcal G_L(y_k)\Vert^2. 
\end{aligned}\tag{[4]}
$$

Next, we show that these inequalities can construct the convergence rate without too much gory details of algebra. 
Using the relations between the iterates generated by the algorithm, a combinations of $(\sigma_k - \epsilon_k)([2]) + \epsilon_k([1]) \le 0$ simplifies to 

$$
\begin{aligned}
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) + \epsilon_k \Delta_k 
    + 
    \left(
        \langle 
            \mathcal G_L y_k, (\sigma_k - \epsilon_k)z_k - \sigma_k y_k + \epsilon_k x_+
        \rangle
        + 
        \frac{\sigma_k}{2L}\Vert \mathcal G_L y_k\Vert^2
    \right) &\le 0
\end{aligned}\tag{[5]}
$$

Using the algorithm, recall that the iterats satisfies the relations: 

$$
\begin{aligned}
    y_k &= (1 - (L \tilde \eta_k)^{-1})z_k + (L\tilde \eta_k)^{-1}x_k
    \\
    L\tilde \eta_k y_k &= 
    (L \tilde \eta_k - 1)z_k + x_k
    \\
    -x_k &= 
    (L\tilde \eta_k - 1)z_k - L \tilde \eta_k y_k, 
\end{aligned}
$$

if we use the relations that $L\tilde \eta_k = \epsilon_k^{-1}\sigma_k$, it transform the above equality into: 

$$
\begin{aligned}
    -x_k &= (\epsilon_k^{-1}\sigma_k - 1)z_k - \epsilon_k^{-1}\sigma_k y_k
\end{aligned}
$$

allowing us to transform the cross product in $([5])$, so it simplifies to 

$$
\begin{aligned}
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) + \epsilon_k \Delta_k 
    + 
    \left(
        \epsilon_k 
        \langle \mathcal G_L y_k, x_+ - x_k\rangle
        + 
        \frac{\sigma_k}{2L}\Vert \mathcal G_L y_k\Vert^2
    \right) &\le 0. 
\end{aligned}\tag{[5.1]}
$$

Comparing ([4]) with the above, set $\epsilon_k = \tilde \eta_k, L \tilde \eta_k^2 = \sigma_t$, previous relation $L\tilde \eta_k = \epsilon_k^{-1} \sigma_k$ remains true.
This equates parts in ([5.1]), producing: 

$$
\begin{aligned}
    \epsilon_k \langle  \mathcal G_Ly_k, x_+ - x_k\rangle + 
    \frac{\sigma_k}{2L}\Vert \mathcal G_L y_k\Vert^2
    = 
    \tilde \eta 
    \langle  \mathcal G_Ly_k, x_+ - x_k\rangle
     + 
    \frac{\tilde \eta_k^2}{2}\Vert \mathcal G_L y_k\Vert^2, 
\end{aligned}
$$

Therefore, substituting ([4]) into ([5.1]) yields inequality: 

$$
\begin{aligned}
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) + \epsilon_k \Delta_k 
    + 
    \frac{1}{2}
    (
        \Vert x_{k + 1} - x_+\Vert^2 - \Vert x_k - x_+\Vert^2
    )
    &\le 0
    \\
    \underset{([3])}{\implies}
    \sigma_k \Delta_k - \sigma_{k - 1}\Delta_{k - 1}
    + 
    \frac{1}{2}
    (
        \Vert x_{k + 1} - x_+\Vert^2 - \Vert x_k - x_+\Vert^2
    )
    &\le 
    0
    \\
    \iff 
    \sigma_k \Delta_k + \frac{1}{2}\Vert x_{k + 1} - x_+\Vert^2
    - 
    \left(
        \sigma_{k - 1}\Delta_{k - 1}
        + 
        \frac{1}{2}\Vert x_k - x_+\Vert^2
    \right)
    &\le 
    0
\end{aligned}
$$

By the end, it makes Lyapunov quantity $\Phi_k = \sigma_k \Delta_k + (1/2)\Vert x_{k + 1} - x_+\Vert^2$. 
Hence the above inequality is $\Phi_k - \Phi_{k - 1}$, telescoping it then yields the inequality: 

$$
\begin{aligned}
    \sum_{i = 1}^{N}\Phi_i - \Phi_{i - 1} = \Phi_N - \Phi_0 
    &\le 0
    \\
    \sigma_N \Delta_N 
    =
    \sigma_N (f(z_{N + 1}) - f(x_+))
    &\le 
    \sigma_0 \Delta_0 + \frac{1}{2}\left(
        \Vert x_0 - x_+\Vert^2 - \Vert x_{N +1} - x_+\Vert^2
    \right), 
\end{aligned}
$$

hence it derives the convergence rate of $\mathcal O(\sigma_k^{-1})$. 


**Proof for ([1], [2])**

Fix any $k \in \N$, applying that proximal gradinet lemma with $z = z_{k + 1}, x = x_+$, then it yiekds

$$
\begin{aligned}
    \Delta_k &= h(z_{k + 1}) - h(x_+) = h(\mathcal T_L y_k) - h(x_+) 
    \\
    &\le 
    - \langle \mathcal G_l y_k, x_+ - y_k \rangle 
    - \frac{L}{2}\Vert L^{-1} \mathcal G_Ly_k\Vert^2
    \\
    &= 
    - \langle \mathcal G_l y_k, x_+ - y_k \rangle 
    - \frac{1}{2L}\Vert \mathcal G_L y_k\Vert^2
    \\
    \iff 
    0& \ge \Delta_k + \langle \mathcal G_L y_k, x_+ - y_k\rangle + \frac{1}{2L}\Vert \mathcal G_L y_k\Vert^2. 
\end{aligned}
$$

Similarly, by setting $z = z_{k + 1}, x = z_k$, it gives 

$$
\begin{aligned}
    \Delta_k - \Delta_{k - 1} &= 
    h(z_{k + 1}) - h(x_+) - (h(z_k) - h(x_+)) 
    \\
    &= h(z_{k + 1}) - h(z_k)
    \\
    &= h( \mathcal G_L y_k) - h(z_k)
    \\
    &\le 
    - \langle \mathcal G_L y_k, z_k - y_k\rangle - 
    \frac{1}{2L} \Vert \mathcal G_L y_k \Vert^2
    \\
    \iff 
    0 &\ge
    \Delta_k - \Delta_{k - 1}
    + \langle \mathcal G_L y_k, z_k - y_k\rangle
    + \frac{1}{2L} \Vert \mathcal G_L y_k \Vert^2
\end{aligned}
$$


**Proof for ([3])**

$$
\begin{aligned}
    & \sigma_k \Delta_k - \sigma_{k - 1} \Delta_{k - 1}
    \\
    & 
    \textcolor{gray}{
        \text{by: } \sigma_k - \sigma_{k - 1} \le \epsilon_k, \epsilon_k \ge 0
    }
    \\
    &\le 
    \sigma_k \Delta_k - (\sigma_k - \epsilon_k)\Delta_{k - 1}
    \\
    &= 
    (\sigma_k - \epsilon_k)\Delta_k - (\sigma_k - \epsilon_k)\Delta_{k - 1}
    + \epsilon \Delta_k 
    \\
    &= (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) + \epsilon_k \Delta_k. 
\end{aligned}
$$

**Proof for ([4])**

Using the relations of the iterates as defined by the algorithm, it has 

$$
\begin{aligned}
    & \frac{1}{2} 
    \left(
        \Vert x_{k + 1} - x_+\Vert^2
        - 
        \Vert x_k - x_+\Vert^2 
    \right)
    \\
    &=
    \frac{1}{2} 
    \left(
        \Vert x - \tilde \eta_k\mathcal G_L (y_k) - x_+ \Vert^2 
        - 
        \Vert x_k - x_+\Vert^2
    \right)
    \\
    &= 
    \frac{1}{2}\left(
        -2\langle \tilde \eta_k \mathcal G_L(y_k), x_k - x_+\rangle
        + 
        \tilde \eta_k^2 \Vert \mathcal G_L(y_k)\Vert^2
    \right)
    \\
    &= 
    \langle \tilde \eta_k \mathcal G_L(y_k), x_k - x_+\rangle
        + 
    \frac{\tilde \eta_k^2}{2} \Vert \mathcal G_L(y_k)\Vert^2. 
\end{aligned}
$$


**Proof for ([5])**

Derivation of $(\sigma_k - \epsilon_k)([2]) + \epsilon_k([1]) \le 0$ assumed that we have $\sigma_k - \epsilon_k \ge 0$, $\epsilon_k \ge 0$. 
With these assumptions we can proceed: 

$$
{\small
\begin{aligned}
    (\sigma_k - \epsilon_k)
    \left(
         \Delta_k - \Delta_{k - 1}
        + \langle \mathcal G_L y_k, z_k - y_k\rangle
        + \frac{1}{2L} \Vert \mathcal G_L y_k \Vert^2
    \right)
    + 
    \epsilon_k 
    \left(
        \Delta_k + \langle \mathcal G_L y_k, x_+ - y_k\rangle + \frac{1}{2L}\Vert \mathcal G_L y_k\Vert^2
    \right)
    &\le 
    0
    \\
    \iff
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) 
    + \epsilon_k \Delta_k 
    + 
    \left(
        \langle \mathcal G_L y_k, 
            (\sigma_k - \epsilon_k)(z_k - y_k)
            + 
            \epsilon_k (x_+ - y_k)
        \rangle
        + 
        \frac{\sigma_k}{2L}\Vert \mathcal G_Ly_k\Vert^2
    \right) 
    &\le 0
    \\
    \iff
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) 
    + \epsilon_k \Delta_k 
    + 
    \left(
        \langle \mathcal 
            G_L y_k, 
            (\sigma_k - \epsilon_k)z_k + 
            (\epsilon_k - \sigma_k - \epsilon_k)y_k
            + 
            \epsilon_k x_+
        \rangle
        + 
        \frac{\sigma_k}{2L}\Vert \mathcal G_Ly_k\Vert^2
    \right) 
    &\le 0
    \\
    \iff
    (\sigma_k - \epsilon_k)(\Delta_k - \Delta_{k - 1}) 
    + \epsilon_k \Delta_k 
    + 
    \left(
        \langle \mathcal 
            G_L y_k, 
            (\sigma_k - \epsilon_k)z_k - \sigma_k y_k + \epsilon_k x_+
        \rangle
        + 
        \frac{\sigma_k}{2L}\Vert \mathcal G_Ly_k\Vert^2
    \right) 
    &\le 0
\end{aligned}
}
$$

**Remarks**

There are several choices for the step sizes that can verify the optimal convergence rate for the accelerated Proximal Gradient algorithm. 
A constant step size of $\tilde \eta_t$ would satisfies the inequality $\tilde \eta_k^2 - \tilde \eta_{k - 1}^2 \le L^{-1} \tilde \eta_k$. 
Next, consider the choice 


---
### **The proximal point case of acceleration**

Based on the previous proof, we can consider the proximal point case of the acceleration algorithm. 
To start, we observe that if $g \equiv 0$, the algorithm proposed reduced to a proximal point algorithm with acceleration. 
In this section, we will be interested in the convergence rate of this accelerated proximal point algorithm. 

