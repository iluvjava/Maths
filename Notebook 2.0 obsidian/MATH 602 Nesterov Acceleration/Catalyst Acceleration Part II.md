- [The Catalyst Acceleration Idea Part I](The%20Catalyst%20Acceleration%20Idea%20Part%20I.md)

---
### **Intro**
We continue from the previous discussion on Catalyst acceleration. 
This excerpt is for Catalyst acceleration in the non-convex settings. 
The proofs used for the non-convex paper was quite pleasant. 
The algorithm fixes $\kappa$ hence we denote $\mathcal M$ instead of $\mathcal M^{\kappa^{-1}}$ for lighter notation. 


#### **Algorithm | Non-convex catalyst (The basic version)**
Let $\kappa$ be fixed for the evaluation of Moreau envelope. 
Find any $x_0 \in \text{dom}(F)$. 
Initialize the algorithm with $\alpha_1 = 1, v_0 = x_0$. 
For $k \ge 1$, we have the following rules for the iterates $(x_k, y_k, v_k)$ such that: 

$$
\begin{aligned}
    &
    \text{find } \bar x_k \approx \argmin{x}\left\lbrace
        \mathcal M(x; x_{k - 1})
    \right\rbrace
    \text{ s.t: }
        \left\lbrace
            \begin{aligned}
                & \text{dist}(\mathbf 0, \partial \mathcal M(\bar x_k; x_{k - 1})) 
                \le 
                \kappa\Vert \bar x_k - x_{k - 1}\Vert, 
                \\
                & \mathcal M(\bar x_k; x_{k - 1}) 
                \le F(x_{k - 1}). 
            \end{aligned}
        \right.
    \\
    & y_k = \alpha_k v_{k - 1} + (1 - \alpha_k) x_{k - 1};
    \\
    & 
    \text{find }\tilde x_k \approx \argmin{x} \left\lbrace
        \mathcal M(x; y_k) 
        : 
        \text{dist}\left(
        \mathbf 0, \partial \mathcal M(\tilde x_k; y_k)
        \right) 
        \le \frac{\kappa}{k + 1}\Vert \tilde x_k - y_k\Vert
    \right\rbrace;
    \\
    & v_{k} = x_{k - 1} + \frac{1}{\alpha_k}(\tilde x_k - x_{k - 1});
    \\
    & 
    \text{find } \alpha_{k + 1} \in (0, 1): 
    \frac{1 - \alpha_{k + 1}}{\alpha_{k + 1}^2} = \frac{1}{\alpha_k^2};
    \\
    & \text{choose } x_k \text{ s.t: } f(x_k) = \min(f(\bar x_k), f(\tilde x_k)).
\end{aligned}
$$

**Remark**

Parameter $\kappa$ here is chosen to make the function $\mathcal M(\cdot, y)$ strongly convex at all point. 
This constant would be the lower bound on the weak convexity constant. 


#### **Lemma | Bounds on the estimating sequence parameters alpha**


----
### **Convergence proof**

Throughout this text, we assume that the function $F$ is weakly convex and we assume that $\partial$ operator here is the Rockafellar Limiting subgradient. 

#### **Lemma B.2 | Staionarity of proximal point evaluation**
> Fix any $y$, suppose that $y^+$ satisfies $\dist(\mathbf 0,\partial \mathcal M^{k^{-1}}(y^+; y)) \le \epsilon$ then the following inequality holds: 
> $$
> \begin{aligned}
>     \dist(\mathbf 0; \partial F(y^+)) 
>     \le \epsilon + \kappa\Vert y^+ - y\Vert. 
> \end{aligned}
> $$

**Proof**

The proof is direct by the definition of subgradient. 


#### **Theorem | Convergence of the algorithm**
> The algorithm generates $\bar x_k$ which is the monotone gradient descent step, and it converges to a stationary point when $F$ is $\kappa$ weakly convex: 
> $$
> \begin{aligned}
>     \min_{j = 1, \cdots, N} \dist^2(\mathbf 0, \partial F(\bar x_j))
>     \le \frac{8 \kappa}{N}(F(x_0) - F^*). 
> \end{aligned}
> $$
> When the function $F$ is convex, then the algorithm has $F(x_N) - F^*$ that converges at a rate of $\mathcal O(k^{-2})$. 

#### **Convergence of the algorithm**

We now proof both theorem 4.1, 4.2 in one go. 
From the algorithm we have monotone property of the iterates given by: 

$$
\begin{aligned}
    F(x_{k - 1}) \ge \mathcal M(\bar x_k, x_{k - 1}) \ge 
    F(x_k) + \frac{\kappa}{2}\Vert \bar x_k - x_{k - 1}\Vert^2. 
\end{aligned}
$$

Using Lemma B.2, set $\epsilon = \kappa \Vert \bar x_k - x_{k - 1}\Vert$, $y = x_{k - 1}$, $y^+ = \bar x_k$ then 
$$
\begin{aligned}
    \dist(\mathbf 0, \partial F(\bar x_k)) \le 2 \kappa \Vert \bar x_k - x_{k - 1} \Vert. 
\end{aligned}
$$

From the previous inequality: 

$$
\begin{aligned}
    F(x_{k - 1}) - F(x_k) 
    &\ge \frac{\kappa}{2}\Vert \bar x_k - x_{k - 1}\Vert^2
    \\
    8 \kappa (F(x_{k - 1}) - F(x_k)) &\ge 4 \Vert \kappa (\bar x_k - x_{k - 1})\Vert^2 \ge 
    \dist^2(\mathbf 0, \partial F(\bar x_k))
    \\
    \implies 
    \dist^2(\mathbf 0, \partial F(\bar x_k)) 
    &\le 
    8 \kappa (F(x_{k - 1}) - F(x_k))
    \\
    \implies 
    \min_{j = 1, \cdots, N} \dist^2(\mathbf 0, \partial F(\bar x_j))
    &\le 
    \frac{8\kappa}{N}
    \sum_{j = 1}^{N} F(x_{j - 1}) - F(x_j)
    \\
    &\le 
    \frac{8 \kappa}{N} (F(x_0) - F(x_N)) 
    \le \frac{8 \kappa}{N}(F(x_0) - F^*). 
\end{aligned}
$$

Where $F^*$ here is the minimizer. 
This establish the convergence to the staionary point by $F^*$ bounded below. 
Next we assume that $F$ is convex. 
Let the extrapolated gradient produce tracable error $\xi_k \in \partial \mathcal M(\tilde x_k, y_k)$ such that $\Vert \xi_k\Vert \le \frac{\kappa}{k + 1}\Vert \tilde x_k - y_k\Vert$. 
Then for any $x\in \R^n$, $\kappa$ strong convexity of $\mathcal M(\cdot, y_k)$ yields inequality: 
$$
\begin{aligned}
    0 &\le
    F(x) + \frac{\kappa}{2}\Vert x - y_k\Vert^2 
    - \left(
        F(\tilde x) + \frac{\kappa}{2}\Vert x - \tilde x_k\Vert^2 
    \right)
    - \frac{\kappa}{2}\Vert \tilde x_k - y_k\Vert^2 - \langle \xi_k, x - \tilde x_k\rangle
    , 
    \\
    F(x_k)
    \le F(\tilde x_k) 
    &\le 
    F(x) + \frac{\kappa}{2}\left(
        \Vert x - y_k\Vert^2 - \Vert x - \tilde x_k\Vert^2 - \Vert \tilde x_k - y_k\Vert^2
    \right)
    + \langle  \xi_k, \tilde x_k - x \rangle 
    \\
    &\le 
    F(x) + \frac{\kappa}{2}\left(
        \Vert x - y_k\Vert^2 - \Vert x - \tilde x_k\Vert^2 - \Vert \tilde x_k - y_k\Vert^2
    \right)
    + \frac{\kappa}{k + 1}\Vert \tilde x_k - y_k\Vert\Vert x - \tilde x_k\Vert. 
\end{aligned}
$$

Sure, now observe that with the substitutions $x = \alpha_k x^* + (1 - \alpha_k) x_{k-1}$ where $x^*$ is the minimizer then

$$
\begin{aligned}
    x - y_k
    &= 
    \alpha_k x^* + (1 - \alpha_k) x_{k - 1} - y_k 
    \\
    &= \alpha_k x^* + (1 - \alpha_k) x_{k - 1} - (\alpha_k v_{k - 1} + (1 - \alpha_k)x_{k - 1})
    \\
    &= \alpha_k (x^* - v_{k - 1}), 
    \\
    x - \tilde x_k 
    &= 
    \alpha_k x^* + (1 - \alpha_k) x_{k - 1} - \tilde x_k
    \\
    &\quad 
    \textcolor{gray}{
    \begin{aligned}
        \tilde x_k - x_{k - 1} &= \alpha_k(v_k - x_{k - 1})
        \\
        \tilde x_k &= x_{k - 1} + \alpha_k(v_k - x_{k - 1})
    \end{aligned}
    }
    \\
    &= 
    \alpha_k x^* + (1 - \alpha_k) x_{k - 1} - (x_{k - 1} + \alpha_k(v_k - x_{k - 1}))
    \\
    &= \alpha_k x^* - \alpha_k x_{k - 1} - \alpha_k(v_k - x_{k - 1})
    \\
    &= \alpha_k (x^* - v_k). 
\end{aligned}
$$

Using convexity, it transform the inequality into 

$$
\begin{aligned}
    F(x_k) &\le 
    \alpha_k F(x^*) + (1 - \alpha_k) F(x_{k - 1}) 
    + \frac{\alpha_k^2\kappa}{2}\left(
        \Vert x^* - v_{k - 1}\Vert^2 - 
        \Vert v_k - x^*\Vert^2
    \right)
    \\
    &\quad 
        - \frac{\kappa}{2}\Vert \tilde x_k - y_k\Vert^2 
        + \frac{\kappa \alpha_k}{k + 1}\Vert \tilde x - y_k\Vert\Vert v_k - x^*\Vert
    \\
    &=
    \alpha_k F(x^*) + (1 - \alpha_k) F(x_{k - 1}) 
    + \frac{\alpha_k^2\kappa}{2}\left(
        \Vert x^* - v_{k - 1}\Vert^2 - 
        \Vert v_k - x^*\Vert^2
    \right)
        \\
        &\quad 
        - \frac{\kappa}{2}\left(
            \Vert \tilde x_k - y_k\Vert
            - \frac{\alpha_k}{k + 1}\Vert v_k - x^*\Vert
        \right)^2 
        + \frac{\kappa}{2}\left(\frac{\alpha_k}{k + 1}\right)^2\Vert v_k - x^*\Vert^2
    \\ 
    &\le 
    \alpha_k F(x^*) + (1 - \alpha_k) F(x_{k - 1}) 
    + \frac{\alpha_k^2 \kappa}{2}\left(
        \Vert x^* - v_{k - 1}\Vert^2 - 
        \Vert v_k - x^*\Vert^2
    \right)
        \\
        &\quad  
        + \frac{\kappa \alpha_k^2}{2}\left(\frac{1}{k + 1}\right)^2\Vert v_k - x^*\Vert^2
    \\
    \iff 
    F(x_k) - F^*
    &\le 
    (1 - \alpha_k)(F(x_{k - 1}) - F^*)
    \\ &\quad 
        + 
        \frac{\alpha_k^2\kappa}{2}
        \left(
            \Vert x^* - v_{k - 1}\Vert^2
            - \left(
                1 - \frac{1}{(k + 1)^2}
            \right)\Vert v_k - x^*\Vert^2
        \right)
\end{aligned}
$$

Denote $A_k := 1 - 1/(1 + k)^2$ to simplify the notations. 
Continue the simplifications of the above inequality

$$
\begin{aligned}
    F(x_k) - F^* +
    \frac{\alpha_k^2\kappa}{2}\left(
        1 - \frac{1}{(k + 1)^2}
    \right)
    \Vert v_k - x^*\Vert^2
    &\le 
    (1 - \alpha_k)(F(x_{k - 1}) - F^*)
    + 
    \frac{\alpha_k^2\kappa}{2}
    \Vert x^* - v_{k - 1}\Vert^2
    \\
    \iff 
    \alpha_k^{-2}(F(x_k) - F^*)
    + 
    \frac{\kappa A_k}{2}\Vert v_k - x^*\Vert^2
    &\le 
    \alpha_k^{-2}(1 - \alpha_k)(F(x_{k - 1}) - F^*)
    + 
    \frac{\kappa}{2}
    \Vert x^* - v_{k - 1}\Vert^2
    \\
    \iff
    \alpha_k^{-2}(F(x_k) - F^*)
    + 
    \frac{\kappa A_k}{2}\Vert v_k - x^*\Vert^2
    &\le 
    \alpha_{k - 1}^{-2}(F(x_{k - 1}) - F^*)
    + 
    \frac{\kappa}{2}
    \Vert x^* - v_{k - 1}\Vert^2
    \\
    & \le 
    \frac{1}{A_{k - 1}}\left(
        \alpha_{k - 1}^{-2}(F(x_{k - 1}) - F^*)
        + 
        \frac{\kappa A_{k - 1}}{2}
        \Vert x^* - v_{k - 1}\Vert^2
    \right). 
\end{aligned}
$$

The second last inequality use the fact that $(1 - \alpha_k)/\alpha_k^2 = \alpha_{k - 1}^{-2}$ and $\alpha_1 = 1$. 
The last inequality used the fact that $A_{k - 1} \in (0, 1]$. 
Urolling the recurrence up to $N$ we have the inequality: 

$$
\begin{aligned}
    \alpha_N^{-2}(F(x_N) - F^*)
    &\le 
    \left(
        \prod_{j = 1}^{N - 1} A_{j}^{-1}
    \right)\frac{\kappa}{2}\Vert v_0 - x^*\Vert^2. 
\end{aligned}
$$

By definition of $A_k$ sequence, we have: 

$$
\begin{aligned}
    \prod_{j = 1}^{N - 1} A_{j - 1}^{-1}
    &= 
    \frac{1}{\prod_{j = 1}^{N - 1}(1 - j^{-2})} \le 2. 
\end{aligned}
$$

This established the convergence rate $F(x_N) - F^*$ to be on $\mathcal O(\alpha_N^{2})$. 
And, the sequence $\alpha_i$ has an upper for all $k\ge 0$: 

$$
\begin{aligned}
    \alpha_{k} \le \frac{2}{k + 1}. 
\end{aligned}
$$

Therefore, the algorithm has convergence on the staionary point condition and it achieves optimal convergence rate when $F$ is a convex function. 