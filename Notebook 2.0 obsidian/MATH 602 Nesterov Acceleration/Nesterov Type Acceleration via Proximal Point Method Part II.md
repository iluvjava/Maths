[Nesterov Type Acceleration via Proximal Point Method Part I](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20I.md)

---
### **Intro**

We need to re-derive the Lyponouv convergence theorem to allows for more genericity so that it can be applied for proving the convergence for more varieties of the accelerated gradient methods. 

---
### **Varieties of Nesterov Accelerated Gradient**

The analysis of PPM eventually extends to all varieties of Nesterov accelerated gradient methods. 

#### **Def 1.1 | AG Generic Form I**
> Described in Nesterov ^[Y. Nesterov, Lectures on Convex Optimization, vol. 137. in Springer Optimization and Its Applications, vol. 137. Cham: Springer International Publishing, 2018. doi: 10.1007/978-3-319-91578-4.] (2.2.7), is an accelerated gradient method. 
> Here we faithfully resented it as the way it is in the book.
> Let $f$ be a $L$ Lipschitz smooth and $\mu\ge 0$ strongly convex function. 
> Choose $x_0$, $\gamma_0 > 0$, set $v_0 = x_0$, for iteration $k\ge 0$ it: 
> 1. Computes $\alpha_k \in (0, 1)$ by solving $L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 2. Set $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 3. Choose $y_k = (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)$. Compute $f(y_k)$ and $\nabla f(y_k)$. 
> 4. Find $x_{k + 1}$ such that $f(x_{k + 1}) \le f(y_k) - (2L)^{-1} \Vert \nabla f(y_k)\Vert^2$. 
> 5. Set $v_{k + 1} = \gamma_{k+1}^{-1}((1 - \alpha_k)\gamma_kv_k + \alpha_k \mu y_k - \alpha_k \nabla f(y_k))$. 

**Remarks**

For a faithful derivation of the algorithm as written in Nesterov's book, visit [Nesterov Estimating Sequence](../../MATH%20602%20Nesterov%20Acceleration/Nesterov%20Original%20Conception%20of%20Momentum%20Method.md) for more information. 
Claimed by Ahn ^[K. Ahn and S. Sra, “Understanding nesterov’s acceleration via proximal point method.” arXiv, Jun. 02, 2022. doi: 10.48550/arXiv.2005.08304.], the above Nesterov accelerated gradient fits the generic form of the algorithm: 

$$
\left\lbrace
\begin{aligned}    
    y_t &= \alpha_t x_t + (1 - \alpha_t)z_t
    \\
    x_{t + 1} &= \beta_t x_t + (1 - \beta)y_t - \gamma_t \nabla f(y_t)
    \\
    z_{t + 1} &= y_t - \delta_t \nabla f(y_t)
\end{aligned}
\right.
$$


#### **Definition 1.2 | Accelerated Gradient Generic PPM Form**
> Let $f$ be convex and differentiable with Lipschitz gradient, define $l_f(x; y) = f(y) + \langle \nabla f(y), y - x\rangle$ to be a linearization of $f$ at $y$. 
> for all $x_0 \in \R^n$, and let $y_0 = x_0$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$
> Here we assume that $\eta_{t + 1} > 0$ for all $t \in \N$. 


#### **Lemma 1.3 | Accelerated Gradient Generic Trianglar Form**
> The Two ways PPM defined above reduces to the following 3 points accelerated gradient algorithm: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
>     \\
>     y_{t + 1} &= 
>     (1 + L\eta_{t + 1})^{-1}
>     (
>     x_{t + 1} + L\eta_{t + 1}z_{t + 1}
>     ). 
> \end{aligned}
> $$
> Let the base case be: $y_0 = x_0$. 



**Demonstrations**

Solving the optimality on the first PPM yields: 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f(y_t) + 
    \frac{1}{\tilde \eta_{t + 1}} (x - x_t)
    \\
    x &= x_t - \tilde \eta_{t + 1} \nabla f(y_t).
\end{aligned}
$$

Therefore, $x_{t + 1} = x_t - \tilde \eta_{t + 1}\nabla f(y_y)$. 
Similarly, for the updates of $y_{t + 1}$, we have optimality condition of 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f (y_t) + L (x - y_t) + \eta_{t + 1}^{-1} (x - x_{t + 1})
    \\
    \mathbf 0 &= \eta_{t + 1}\nabla f (y_t) + \eta_{t + 1}L (x - y_t) + x - x_{t + 1}
    \\
    \mathbf 0 &= 
    \eta_{t + 1}\nabla f(y_t) -\eta_{t + 1} Ly_t + (\eta_{t + 1}L + 1)x - x_{t + 1}
    \\
    (1 + \eta_{t + 1}L)x
    &= 
    x_{t + 1} - \eta_{t + 1}\nabla f(y_t) + \eta_{t + 1}L y_t
    \\
    \text{define: } y_{t + 1} &:= x. 
\end{aligned}
$$

In the above expression, it hides a step of gradient descent, continuing it we have 

$$
\begin{aligned}
    (1 + \eta_{t + 1}L)y_{t + 1} &= 
    x_{t + 1}  + \eta_{t + 1}L (-L^{-1}\nabla f(y_t) + y_t)
    \\
    \text{let: } z_{t + 1} &= y_t - L^{-1}\nabla f(y_t), \text{ so, }
    \\
    (1 + \eta_{t + 1}L)y_{t + 1} &= 
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}. 
\end{aligned}
$$

Combining it yields the tree points update format 

$$
\begin{aligned}
    x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
    \\
    z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
    \\
    y_{t + 1} &= 
    (1 + L\eta_{t + 1})^{-1}
    (
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}
    ), 
\end{aligned}
$$

the ordering of $x_{t +1}, z_{t + 1}$ can be permuted. 
The base case is when $t = 0$, and that produces directly $x_0 = y_0$ for the initial guess. 

**Remarks**

By the base case $x_0 = y_0$, the update sequence would be $z_1, y_1, x_1$, then increment in that order. 
Depending on the bas case, the order of the update will differ! 
If the base case is forced to be $x_0 = y_0 = z_0$, then we need update order $y_t, x_t, z_t$, or $y_t, z_t, x_t$. 

#### **Claim 1.4 | The Interpretation of the Ghost term $z_{t + 1}$**
> The term $z_t = y_t - L^{-1} \nabla f(y_t)$ is made with the goal to write $y_{t + 1}$ to be a convex combinations of $x_{t + 1}, z_{t + 1}$. 

**Demonstrations**

The step of gradient descent comes by conpleting the square: 

$$
\begin{aligned} 
    & \quad 
    l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 
    \\
    &= 
    f(y_t) + \langle \nabla f(y_t), x - y_t\rangle 
    + 
    \frac{L}{2}
    \left\Vert 
        x - (y_t - L^{-1}\nabla f(y_t)) - L^{-1}\nabla f(y_t)
    \right\Vert^2
    \\
    &= 
    f(y_t) + 
    \langle \nabla f(y_t), x - (y_t - L^{-1}\nabla f(y_t)) - L^{-1}\nabla f(y_t)\rangle 
    + 
    \frac{L}{2}
    \left\Vert 
        x - (y_t - L^{-1}\nabla f(y_t)) - L^{-1}\nabla f(y_t)
    \right\Vert^2
    \\
    &\quad  \text{Let }z_{t + 1} 
    = y_t - L^{-1}\nabla f(y_t)
    \\
    &= f(y_t) + \langle \nabla f(y_t), x - z_{t + 1} - L^{-1}\nabla f(y_t)\rangle
    + 
    \frac{L}{2}\left\Vert
         x - z_{t + 1} - L^{-1}\nabla f(y_t)
    \right\Vert^2
    \\
    &= 
    f(y_t) + \langle \nabla f(y_t), x - z_{t + 1}\rangle 
    - L^{-1}\Vert \nabla f(y_t)\Vert^2
    + 
    \frac{L}{2}\Vert x - z_{t + 1}\Vert^2 + 
    \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 - 
    L\langle L^{-1}\nabla f(y_t), x - z_{t + 1}\rangle
    \\
    &= f(y_t) + (1/(2L)- L^{-1})\Vert \nabla f(y_t) \Vert^2 + 
    \frac{L}{2}\Vert x - z_{t + 1}\Vert^2.
\end{aligned}
$$

Observe that besdies the $(L/2)\Vert x - z_{t + 1}\Vert^2$, the other terms are constant and hence giving us 

$$
\begin{aligned}
    y_{t + 1} &= \argmin{x}\left\lbrace
        \frac{L}{2}\Vert x - z_{t + 1}\Vert^2 + 
        \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
    \right\rbrace. 
\end{aligned}
$$


**Remarks**

This interpretation is occastionally useful. 
As the value of $\eta_t$ increases, $y_t$ gets closer to $z_t$. 
Anyway, the interpretation maybe somewhat important, but the ghost term, $z_{t +1}$ is upmost important in proving the convergence rate of the algorithms. 

#### **Definition 1.5 | Accelerated Gradient Strongly Convex PPM**
> Let $f$ be convex and differentiable with Lipschitz gradient and $\mu\ge0$-strongly convex, define $l_f(x; y) = f(y) + \langle \nabla f(y), y - x\rangle$ to be a linearization of $f$ at $y$. 
> for all $x_0 \in \R^n$, and let $y_0 = x_0$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{\mu}{2}\Vert x - y_t\Vert^2 + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$
> Here we assume that $\eta_{t + 1} > 0$ for all $t \in \N$. 

**Observations**

Setting $\mu = 0$ this reduces to Two Ways PPM. 

#### **Definition 1.6 | Accelerated Gradient Convex Bregman PPM**
> With $Q\subseteq \R^n$ closed and convex, define $\Psi: Q \mapsto \overline \R$. 
> Define $f: \mathbb R^n \mapsto \mathbb R$ be $L$-Smooth wrt to norm $\Vert \cdot\Vert$ which is not necessarily the Euclidean norm. 
> With $h:Q \mapsto \overline \R$ strongly convex wrt $\Vert \cdot\Vert$, and differentiable on $\text{int}(Q)$ so it induces Bregmandivergence $D_h(u, v)$ for all $u, v \in Q$. 
> Then we define the following algorithm: 
> $$
> \begin{aligned}
>     y_t &= (1 + \eta_t L)^{-1}(x_t + L\eta_t z_t),
>     \\
>     x_{t + 1} &= 
>     \argmin{x \in Q} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{1}{\tilde\eta_{t + 1}} D_h(x, x_t) + \Psi(x)
>     \right\rbrace, 
>     \\
>     z_{t + 1} &= 
>     (1 + L\eta_t)^{-1} 
>     (x_{t + 1} + L\eta_t z_t). 
> \end{aligned}
> $$

And in this case, the momentum algorithm works in a non-smooth composite settings inside of a constrained set $Q$. 


**Remarks**

It is claimed by Ahn, Sra in 5.17 of their writing that the above PPM based algorithm is an interpretation of Nesterov (6.1.3) from Nesterov's textbook. 

#### **Definition 1.7 | Accelerated Gradient generic strongly convex Triangular Form**
> With $f$ $L$-Lipschitz smooth and $\mu$ storngly convex, we can derive similar triangle with the following: 
> $$
> \begin{aligned}
>     & (1 + \tilde \eta_{t + 1}\mu)x_{t + 1} 
>     = 
>     x_t + \mu\tilde \eta_{t + 1}y_t - \tilde \eta_{t + 1}\nabla f(y_t)
>     \\
>     & z_{t + 1} = y_t - L^{-1} \nabla f(y_t)
>     \\
>     & (1 + L\eta_{t + 1})y_{t + 1} = x_{t + 1} + L \eta_{t + 1} z_{t + 1}
> \end{aligned}
> $$

**Observations**

The above algorithm can be derived with the PPM storngly convex formulation. 


#### **Definition 1.8 | AG Experimental Form 1**
> Let $f=h + g$ be the sum of convex function $h$ and convex differentiable $g$ with $L$-Lipschitz gradient, define the linear lower bounding function $l_g(x;y) = g(y) + \langle \nabla g(y), y - x\rangle$ to be a linearization of $f$ at $y$, for all $x_0 \in \R^n$, and with $y_0 = x_0$, we define the following variants of generic gradient descent method: 
> 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>         l_g(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         h(x) + l_g(x; y_t) + 
>         \frac{L}{2}\Vert x - y_t\Vert^2 + \frac{1}{2\eta_{t + 1}} \Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations**


**Remarks**

We suspect that this reduces to the accelerated proximal gradient FISTA algorithm, or something else in the literatures, and it would be different compare to what appeared in definition 1.6. 
Additionarlly, it should be able to combine with Definition 1.6. 
It's as simple as changing how we get $x_{t +1}$ into 

$$
\begin{aligned}
    x_{t + 1} &= \argmin{x}\left\lbrace
        l_g(x;y_t) + \frac{1}{\tilde \eta_{t + 1}} D_h(x, x_t) 
    \right\rbrace
\end{aligned}
$$

Thse are our hypothesis and guesses, further works are required here. 


---
### **Form Comparison**

In this section, we measure, and compare different forms listed above. 
We show that the Nesterov's 2.2.7 accelerated gradient is the same form as the accelerated gradient PPM strongly convex form. 
We show that the Generic triangle form is the same as the generic PPM form. 


---
### **Lyapunov Analysis**

In this section, we focus on applying the Lyapunov analysis method on the abstract form of accelerated gradient method. 
This is abstract because we only made use of the Lipschitz smoothnessof the gradient and the lower bound and theupper bound. 
Specific sequences of updates in the algorithm is not yet used in the proof. 

#### **Lemma 3.1 | The Lyapunov upper bounds for generic 2 steps PPM**
> Applying PPM descent lemma on the first step of the two ways proximal point method, by anchoring on $f(z_{t + 1})$, we can derive the RHS of the descent quantity from the PPM inequality. 
> With definitions for quantities: 
> $$
> \begin{aligned}
>     \Upsilon_{1, t + 1}^{\text{AG}}&= 
>     \tilde \eta_{t + 1} (f(z_{t + 1}) - f(x_*))
>     + \frac{1}{2}(
>         \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_t - x_* \Vert^2
>     )  
>     \\
>     & \quad \le 
>     - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
>     \frac{\tilde \eta_{t + 1} L}{2}\Vert z_{t + 1} - y_t\Vert^2
>     - 
>     \langle \tilde \eta_{t + 1} \nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle, 
>     \\
>     \Upsilon_{2, t + 1}^{\text{AG}} 
>     &= f(z_{t + 1}) - f(z_t) 
>     \le 
>     \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + 
>     \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
> \end{aligned}
> $$

**Observations**

The first inequality is not similar to the the gradient descent anaysis since it has $f(z_{t + 1})$ instead of $f(x_{t + 1})$. 
IN the above inequality, $\eta_{t + 1}$ is not playing any roles yet. 

**Proof**

Define $\phi_t(x) = \tilde \eta_{t +1}(f(y_t) + \langle \nabla f(y_t), x- y_t\rangle)$.  
With $L$-smoothness of $f$ in mind, consider the following sequence of inequalities: 
$$
\begin{aligned}
    \phi_t(x_{t + 1}) 
    &= 
    \tilde\eta_{t + 1} (f(y_t) + \langle \nabla f(y_t), x_{t + 1} - y_t\rangle)
    \\
    \phi_t (x_{t + 1}) &= \tilde \eta_{t + 1}(
        f(y_t) + \langle \nabla f(y_t), (x_{t +1} - z_{t + 1}) + (z_{t + 1} - y_t) \rangle
    )
    \\
    &\ge 
    \tilde \eta_{t + 1}
    \left(
        f(z_{t + 1}) - \frac{L}{2} \Vert z_{t + 1} - y_t\Vert^2 + 
        \langle \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \right), 
\end{aligned}
$$

Performing PPM on the function produces the PPM Lyapunov inequality, substituing yields equivalences for all $x_*$: 
$$
{\small
\begin{aligned}
    & \phi_t(x_{t + 1}) - \phi_t(x_*) + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    - \frac{1}{2}\Vert x_* - x_t\Vert^2 
    =: \Upsilon_{1, t + 1}^{\text{AG}}
    \\
    \quad 
    &\le 
    - \frac{1}{2} \Vert x_{t + 1} - x_t\Vert^2 
    \\
    & 
    \tilde \eta_{t + 1}\left(
        f(z_{t + 1}) - \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
        + 
        \langle \nabla f(y_t), x_{t + 1} - z_{t + 1}\rangle
    \right) - \tilde \eta_{t + 1} f(x_*)
    + 
    \frac{1}{2}\left(
        \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_{t} - x_*\Vert^2
    \right)
    \\
    \quad &\le - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    \\
    & 
    \tilde \eta_{t + 1} \left(
        f(z_{t + 1}) - f(x_*)
    \right) + \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2 
    - \frac{1}{2}\Vert x_{t} - x_*\Vert^2 
    \\
    \quad &\le 
    -\frac{1}{2} \Vert x_{t + 1 } - x_t\Vert^2 + 
    \frac{\tilde \eta_{t + 1}}{2}\Vert z_{t + 1} - y_t\Vert^2 
    - \langle \tilde \eta_{t + 1}\nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle. 
\end{aligned}
}
$$

Observe that, the rhs and lhs of the Lyapunov inequality are anchored at $z_{t + 1}$. 
Similarly for the descent inequality we wish to obtain: 

$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &= f(z_{t + 1}) - f(y_t) + f(y_t) - f(z_t) 
    \\
    &\le 
    \langle \nabla f(y_t), z_{t + 1} - y_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \\
    \text{let }\Upsilon_{2, t + 1}^{\text{AG}} 
    &:= f(z_{t + 1}) - f(z_t)
\end{aligned}
$$

Which is the descent inequality anchored on $z_{t + 1}$. 
Merging the $(z_{t + 1} - y_t)$ with $y_t - z_t$ together yield the desired results. 

**Remarks**

These upper bounds are used for the derivation of the convergence rates for several variants of the Nesterov Accelerated gradient method. 

We want to emphizes that the above analysis differs from their gradient descent counter part by the observations that in the expression 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AG}}
    &= 
    \tilde \eta_{t + 1} (f(z_{t + 1}) - f(x_*))
    + \frac{1}{2}(
        \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_t - x_* \Vert^2
    ), 
\end{aligned}
$$

in here, $z_{t + 1}$ is the ghost term and $x_{t + 1}$ is the result of the first half of PPM, they don't match exactly as in the case for the Lyapunov analysis of gradient descent. 
The sitaution had been complicated. 
The use of $z_{t+1}$ and the way it's defined intrigues us. 

---
### **Deriving Convergences of AG Variants From the Lyapunov Upper Bounds**

In this section, we repeat part II, but with the above theorem. 
With $x_* \in \argmin{x} f(x)$, and 

$$
\begin{aligned}
    \Phi_t &= \left(
        \sum_{i = 1}^{t} \tilde\eta_{t + 1}
    \right) (f(z_t) - f(x_*)) + \frac{1}{2}\Vert x_t - x_*\Vert^2 \quad \forall t \in \N
    \\
    \Phi_0 &= \frac{1}{2}\Vert x_t - x_*\Vert^2
\end{aligned}
$$

where we observe that, compare to the Lyapunov function of gradient descent, we had $z_t$ instead of $x_t$. 
Review [Proximal Point Method, Convex Part I](Proximal%20Point%20Method,%20Convex%20Part%20I.md) and references therein for more information. 
Using a similar derivation the difference as in the case for the PPM analysis of Lyapunov function for gradient descent, giving $\forall t \in \N$

$$
{\small
\begin{aligned}
    \Phi_{t + 1} - \Phi_t 
    &= 
    \left(
        \sum_{i = 1}^{t+1} \tilde\eta_{i}
    \right) (f(z_{t + 1}) - f(x_*)) 
    - 
    \left(
        \sum_{i = 1}^{t} \tilde\eta_{i}
    \right) (f(z_{t}) - f(x_*)) 
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    &= 
    \tilde \eta_{t + 1} (f(z_{t + 1}) - f(z_*))
    +
    \left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right)(f(z_{t + 1}) - f(z_t))
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    &= \left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right)\Upsilon_{2, t + 1}^{\text{AG}} + \Upsilon_{2, t + 1}^{\text{AG}}. 
\end{aligned}\tag{$[*]$}
}
$$

Now, it is a big assumption, but with the assumption that $\Phi_{t + 1} - \Phi_t \le 0$ for the appropriate choice of $\tilde \eta_t, \eta_t$ in the algorithm, we have a convergence rate of $f(z_{T + 1}) - f(x_*) \le \mathcal O\left(\sum_{i = 1}^{T} \eta_i^{-1}\right)$ from the analysis of PPM. 



#### **Scenario 1 | Not Similar Triangle**

The first scenario starts by considering the upper bounds of $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$, together with the updates of the Generic Triangular Form of the algorithm:  

$$
\begin{aligned}
    x_{t + 1} - x_t &= \tilde \eta_{t + 1}\nabla f(y_t)
    \\
    z_{t +1} - y_t &= L^{-1}\nabla f(y_t), 
\end{aligned}
$$

we consider the upper bound of $\Upsilon_{1, t + 1}^{\text{AG}}$, with that we can simplify it: 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AG}}
    &\le 
    -\frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + 
    \frac{\tilde \eta_{t + 1}L }{2} \Vert z_{t + 1} - y_t\Vert^2 
    - 
    \langle \tilde \eta_{t + 1} \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \\
    &\le 
    - \frac{1}{2}\Vert \tilde \eta_{t + 1} \nabla f(y_t)\Vert^2 
    + \frac{\tilde \eta_{t + 1} L}{2}\Vert L^{-1} \nabla f(y_t)\Vert^2 
    + 
    \langle 
        - \tilde \eta_{t + 1} \nabla f(y_t), 
        -L^{-1}\nabla f(y_t) + y_t - x_t + \tilde \eta_{t + 1}\nabla f(y_t)
    \rangle
    \\
    &= 
    \left(
        \frac{\tilde \eta_{t + 1}^2}{2} + 
        \frac{\tilde \eta_{t + 1}}{2L}
    \right)
    \Vert \nabla f(y_t)\Vert^2 
    + \tilde \eta_{t + 1} 
    \left\langle 
        \nabla f(y_t), 
        (\tilde \eta_{t + 1} - L^{-1})\nabla f(y_t) + y_t - x_t 
    \right\rangle
    \\
    &= 
    (1/2)(L^{-1}\tilde \eta_{t + 1} - \tilde \eta_{t + 1}^2)
    \Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}(\tilde \eta_{t + 1} - L^{-1})
    \Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}\langle \nabla f(y_t), y_t - x_t\rangle
    \\
    &= \frac{1}{2}\left(
        -L^{-1}\tilde \eta_{t + 1} + \tilde \eta_{t + 1}^2
    \right)\Vert \nabla f(y_t)\Vert^2 
    + 
    \tilde\eta_{t + 1} \langle \nabla f(y_t), y_t - x_t\rangle. 
\end{aligned}
$$
For $\Upsilon_{2, t + 1}^\text{AG}$, we simplify it with the updates of the algorithms in mind. 

$$
\begin{aligned}
    \Upsilon_{2, t + 1}^\text{AG}
    &\le 
    \langle \nabla f(y_t), z_{t +1} - y_t\rangle + 
    \frac{L}{2}\Vert z_{t +1} - y_{t} \Vert^2 
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle 
        \nabla f(y_t), -L^{-1} \nabla f(y_t)
    \rangle + 
    \frac{L}{2}\Vert L^{-1}\nabla f(y_t) \Vert^ 2
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= -\frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 
    + \langle \nabla f(y_t), y_t - z_t\rangle. 
\end{aligned}
$$

Observe that the cross product term for $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$ doesn't match. 
Hence let's consider $y_t - x_t = L \eta_t (z_t - y_t)$ from the algorithm, we make the choice to do surgery on upper bound of $\Upsilon_{2, t + 1}^\text{AG}$, so $\langle \nabla f(y_t), y_t - x_t\rangle = \langle \nabla f(y_t), L \eta_t (z_t - y_t)\rangle$. 
With this in mind, applying the RHS of $[(*)]$ yields: 

$$
{\small
\begin{aligned}
    & \Upsilon_{1, t + 1}^{\text{AG}} + \left(
        \sum_{i=1}^{t}\tilde\eta_i 
    \right) \Upsilon_{2, t + 1}^{\text{AG}} 
    \\
    &\quad \le 
    \frac{1}{2}\left(
        -L^{-1}\tilde \eta_{t + 1} + \tilde \eta_{t + 1}^2
    \right)\Vert \nabla f(y_t)\Vert^2 
    + 
    \tilde\eta_{t + 1} \langle \nabla f(y_t), y_t - x_t\rangle
    + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i 
    \right)\left(
        -\frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 
        + \langle \nabla f(y_t), y_t - z_t\rangle
    \right)
    \\
    &\quad =
    \left(
        \frac{1}{2}\tilde\eta_{t + 1}\left(
            \tilde \eta_{t +1} - L^{-1}
        \right)
        - 
        \frac{1}{2L}\sum_{i = 1}^{t}\tilde \eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}\langle \nabla f(y_t), L\eta_t (z_t - y_t)\rangle
    + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)
    \langle \nabla f (y_t), y_t - z_t\rangle
    \\
    &\quad 
    = 
    \left(
        \frac{1}{2}\tilde\eta_{t + 1}\left(
            \tilde \eta_{t +1} - L^{-1}
        \right)
        - 
        \frac{1}{2L}\sum_{i = 1}^{t}\tilde \eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \left(
        L\eta_t \tilde \eta_{t + 1} - \sum_{i = 1}^{t}\tilde \eta_i
    \right)
    \langle \nabla f(y_t), z_t - y_t\rangle. 
\end{aligned}
}
$$

In this scenario, we make the choice of $\tilde \eta_t = \eta_t$. 
Continuting will simplify the upper bound so that it is: 

$$
\begin{aligned}
    \frac{1}{2}\left(
        \eta_{t + 1}^2 - L^{-1}\eta_{t +1} - L^{-1}\sum_{i = 1}^{t}\eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \left(
        L\eta_t \eta_{t + 1} - \sum_{i = 1}^{t} \eta_i
    \right)
    \langle \nabla f(y_t), z_t - y_t\rangle 
    &
    \le 0. 
\end{aligned}
$$

Assuming the above inequality holds then one of the sufficient conditions would happen when the coefficient of the cross product term is zero and the coefficient for the normed term is negative, yielding the condition for all $t \in \N$: 

$$
\begin{aligned}
    \begin{cases}
        L\eta_{t + 1}^2 + \eta_{t + 1} - \sum_{i = 1}^{t}\eta_i 
        \le 0, 
        \\
        L\eta_t \eta_{t + 1} - \sum_{i = 1}^{t} \eta_i 
        = 0. 
    \end{cases}
\end{aligned}
$$

Substituting the sequence equality back to the first one yield: 

$$
\begin{aligned}
    L\eta_{t + 1}^2 - (\eta_{t + 1} + L\eta_t\eta_{t + 1}) &\le 0 
    \\
    L\eta^2_{t + 1} - \eta_{t + 1}
    &\le 
    L\eta_t \eta_{t + 1} 
    \\
    \eta_{t + 1}(L\eta_{t + 1} - 1) 
    &\le L\eta_t\eta_{t + 1}
    \\
    \eta_t > 0 
    \implies 
    L\eta_{t + 1} - 1 &\le 
    L\eta_t 
    \\
    \eta_{t + 1} &\le \eta_t + L^{-1}. 
\end{aligned}
$$

To satisfies the equality, reader should verify that $\eta_{t} = (t - 1)/(2L)$ one of the options. And there are not many other options for the choice of the stepszies for the equality to be satisfied. 

##### **The algorithm it reduces to**
> With the choice of $\tilde \eta_{t} = \eta_t = t/(2L)$ in the definition of the Generic AG PPM form, we have the algorithm: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \frac{t + 1}{2L} \nabla f(y_t), 
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t), 
>     \\
>     y_{t + 1} &= 
>     \left(
>         \frac{2}{t + 3}
>     \right)x_{t +1} + 
>     \left(
>         1 - \frac{2}{t + 3}
>     \right)z_{t + 1}. 
> \end{aligned}
> $$
> For the basecase, we make $y_0 = x_0$. 

**Observations**

If we set $t = -1$ onto the formulas, then we have $y_0 = x_0$, which gives the base case; 
so $z_0$ is undefined. 
Therefore the first three updates are $(y_0, x_0, z_0) = (x_0, x_0, x_0 - L^{-1}\nabla f(z_0))$. 



#### **Scenario 2 | Similar Triangle I**
This similar triangle approach will recover the original Nesterov acceleration sequence method proposed back in 1983. 
It is called a similar triangle approach because it employed the following conditions on top of the Triangular Generic Form of AG: $\tilde\eta_{t + 1} = \eta_t + L^{-1}$. 
This stepsize allows us to change updates so that $x_{t + 1} = z_{t + 1} + L\eta_t (z_{t + 1} - z_t)$, $\nabla f(y_t)$ is now nullified. 
To start, substituting the definition of $z_{t +1} = z_{t} - L^{-1}\nabla f(y_t), z_t$ into the above expression then we have: 

$$
\begin{aligned}
    x_{t + 1} &= y_t - L^{-1}\nabla f(y_t) 
    + L \eta_t y_t - \eta_t \nabla f(y_t) - L\eta_t z_t
    \\
    &= 
    (1 + L\eta_t)y_t - (\eta_t + L^{-1})\nabla f(y_t) - L\eta_t z_t
    \\
    &= \eta_t Lz_t + x_t -(\eta_t + L^{-1}) \nabla f(y_t)  - L\eta_t z_t
    \\
    &= x_t - (\eta_t + L^{-1})\nabla f(y_t). 
\end{aligned}
$$

This new choice for $\tilde \eta, \eta$ conveys the following updates: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
    \\
    x_{t + 1} &= z_{t + 1} + L\eta_t (z_{t + 1} - z_t)
    \\
    y_{t + 1} &= 
    (1 + L\eta_{t + 1})^{-1}
    (
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}
    ). 
\end{aligned}
$$

this algorithm will allows us to reduce to the classical form of Accelerated Gradient by 

$$
\begin{aligned}
    y_{t + 1} &= (1 + L\eta_{t + 1})^{-1} (x_{t + 1} + L\eta_{t + 1}z_{t + 1})
    \\
    &= (1 + L\eta_{t + 1})^{-1} (
        z_{t + 1} + L\eta_t (z_{t + 1} - z_t) + L\eta_{t + 1} z_{t + 1}
    )
    \\
    &= 
    (1 + L\eta_{t + 1})^{-1} (
        (1 + L\eta_{t + 1})z_{t + 1} + L\eta_t(z_{t + 1} - z_t)
    )
    \\
    &= z_{t + 1} + (1 + L\eta_{t + 1})^{-1}L\eta_t (z_{t + 1} - z_t), 
\end{aligned}
$$

which allows us to get rid of $x_{t + 1}$, simplifying it into the classical acceleration form: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1}\nabla f(y_t)
    \\
    y_{t + 1} &= z_{t + 1} + (1 + L\eta_{t + 1})^{-1}L\eta_t (z_{t + 1} - z_t). 
\end{aligned}
$$


##### **The Similar Triangle Geometry**
> At each step of the momentum algorithm, we have triangle $(y_t, z_t, z_{t + 1})$ and triangle $(x_t, z_t, x_{t + 1})$ similar to each other. 

**Demonstration**

1. Observe that $y_t = (1 + L\eta_t)^{-1}(x_t + L\eta_t z_t)$ is a convex combination between $x_t, z_t$. Hence $z_t, y_t, x_t$ are three collinear points. Additionally, we have $y_t - x_t = L\eta_t (z_t - y_t)$, hence $\Vert y_t - x_t\Vert/\Vert z_t - y_t\Vert = L\eta_t$. 
1. By the algorithm, we have $z_{t + 1} - y_t = - L^{-1} \nabla f(y_t)$, and $x_{t + 1} - x_t = - \tilde \eta_{t + 1} \nabla f(y_t)$, hence vector $z_{t + 1} - y_t$ parallels to $x_{t + 1} - x_t$. 
2. Finally, with update $x_{t +1} - z_{t + 1} = L\eta_t (z_{t +1} - z_t)$, we have three colinear points $(z_t, z_{t + 1}, x_t)$ with $\Vert z_{t + 1} - z_t\Vert/\Vert z_{t +1 } - z_t\Vert = L\eta_t$. 

From the above results, we can conclude that triangle $(y_t, z_t, z_{t + 1})$ is similar to $(x_t, z_t, x_{t + 1})$ because they share colinear points $z_t, y_t, x_t$ and $z_t, z_{t + 1}, x_{t + 1}$, and their sides $z_{t + 1} - y_t$ parallels to $x_{t + 1} - z_t$. 

The visual understanding of the situation allows us to duduce the upper bound because it creates a different way of eliminating the cross terms in the upper bounds of $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$. 
The next claim will clarify the sitaution. 

#### **Claim 4.1 | Recovering Nesterov Original Form**
> With the choice of $\tilde\eta_{t + 1} = \eta_t + L^{-1}$ we will be able to recover the classical Nesterov acceleration algorithm which is first proposed back in 1983. 
> This interpretation links the stepsize choices of $\eta_t$ with the momentum stepsize choices, providing extensive amount of intutions. 

**Demonstrations**

Start with the consideration of Lypunov analysis on PPM formulation of the Accelerated gradient. 
With $x_{t +1} - x_t = L\tilde\eta_{t+1}(z_{t + 1} - y_t)$ from the updates of $y_t$, we have 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^\text{AG} &\le 
    - \frac{1}{2}\Vert x_{t+1 } - x_t\Vert^2 + 
    \frac{\tilde\eta_{t +1}L}{2}\Vert z_{t+1} - y_t\Vert^2
    \\
    &= 
    - \frac{1}{2}\Vert L \tilde \eta_{t+} (z_{t+1} - y_t)\Vert^2 + 
    \frac{\tilde\eta_{t +1}L}{2}\Vert z_{t+1} - y_t\Vert^2
    \\
    &= 
    \left(
        \frac{L^2\tilde\eta_{t + 1}^2}{2}
         + 
        \frac{\tilde \eta_{t +1}}{2}
    \right)
    \Vert z_{t+1} - y_t\Vert^2
    - 
    \langle 
        \tilde \eta_{t+ 1} \nabla f(y_t), x_{t+1} - z_{t+1}
    \rangle. 
\end{aligned}
$$

This completes the analysis for $\Upsilon_{1, t + 1}^\text{AG}$ with $\tilde\eta_{t+1}$. 
Next we consider 
$$
\begin{aligned}
    \Upsilon_{2, t + 1}^{\text{AG}} &= 
    \langle \nabla f(y_t), z_{t+1} - y_t\rangle
    + 
    \frac{L }{2} \Vert z_{t+1} - y_t\Vert^2 + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle \nabla f(y_t), z_{t + 1} - z_t\rangle
    + 
    \frac{L }{2} \Vert z_{t+1} - y_t\Vert^2
    \\
    &= 
    \langle \nabla f(y_t), L^{-1}\eta_t^{-1}(x_{t+1} - z_{t + 1})\rangle
    + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
\end{aligned}
$$

Here, we made use of the assumption that $\tilde \eta_{t + 1} = \eta_t + L^{-1}$, it allowed for updates $x_{t + 1} = z_{t + 1} + L\eta_t (z_{t + 1} - z_t)$, as demonstrated previously. 
Therefore, the upper bound for the Lyapunov function evaluates to 

$$
\begin{aligned}
    & \Upsilon_{1, t + 1}^{\text{AG}} + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)\Upsilon_{2, t + 1}^{\text{AG}}
    \\
    &\quad \le 
    \left(
        - \frac{L^2\tilde \eta_{t + 1}^2}{2}
        + \frac{\tilde\eta_{t+1}L}{2}
    \right)
    \Vert z_{t+1} - y_t\Vert^2
    - 
    \langle \tilde \eta_{t+1} \nabla f(y_t), x_{t+1} - z_{t + 1}\rangle
    \\
    & \qquad + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)\left(
        \langle \nabla f(y_t), L^{-1}\eta_t^{-1}(x_{t+1} - z_{t + 1})\rangle
        + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \right). 
\end{aligned}\tag{$[*]$}
$$

Next, we consider coefficient for the term $\Vert z_{t+1} - y_t\Vert$, if it's non-positive then we have

$$
\begin{aligned}
    - \frac{1}{2}\left(
        L^2 \tilde\eta_{t+1}^2 - \tilde\eta_{t+1}L 
    \right) + 
    \frac{L}{2}\left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right) &\le 0
    \\
    - \left(
        L\tilde \eta_{t + 1}^2 
        - 
        \tilde\eta_{t + 1}
    \right) + 
    \sum_{i = 1}^{t}\tilde \eta_i 
    &\le 0
    \\
    -L \tilde \eta_{t+1} + 
    \sum_{i = 1}^{t + 1} \tilde \eta_i 
    &\le 0
    \\
    \sum_{i = 1}^{t + 1}\tilde \eta_i 
    &\le L \tilde \eta_{t + 1}^2. 
\end{aligned}
$$

We would also want the coefficient for the cross product term to be zero in $[(*)]$ making: 

$$
\begin{aligned}
    -\tilde \eta_{t + 1} + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)L^{-1}\eta_t^{-1} 
    &= 0
    \\
    \sum_{i = 1}^{t}\tilde \eta_i 
    &= 
    L \eta_t \tilde \eta_{t + 1}. 
\end{aligned}
$$

Substituting the above expression into the inequality then it satisfies

$$
\begin{aligned}
    \tilde \eta_{t + 1} + \sum_{i = 1}^{t} \tilde \eta_i 
    &\le L \tilde \eta_{t + 1}^2
    \\
    \tilde \eta_{t + 1} + L\eta_t \tilde \eta_{t + 1}
    &\le L \tilde \eta_{t + 1}^2
    \\
    1 + L\eta_t &\le L \tilde\eta_{t + 1}. 
\end{aligned}
$$

Observe that with $\tilde \eta_{t + 1} = \eta_t + L^{-1}$ the inequality is an equality. 
Finally, to recover the momentum stepsizes for the classical Nesterov accelerated gradient, we consider the following: 
$$
\begin{aligned}
    L \sum_{i = 1}^{t + 1} \tilde \eta_i 
    &= L \tilde \eta_{t + 1} + L \sum_{i = 1}^{t} \tilde \eta_i 
    \\
    &= 
    L \tilde \eta_{t + 1} + L (L \eta_t \tilde \eta_{t + 1}) 
    \\
    &= L \tilde \eta_{t + 1} + L \eta_t (L \eta_t + 1)
    \\
    &= L (\eta_t + L^{-1}) + L\eta_t (L \eta_t + 1)
    \\
    &= (L\eta_t + 1)^2, 
\end{aligned}
$$

Simultaneously we have 

$$
\begin{aligned}
    L \sum_{i = 1}^{t + 1} \tilde \eta_i 
    &= L^2 \eta_{t + 1} \tilde \eta_{t + 1}
    \\
    &= L \eta_{t + 1}(1+ L \eta_{t + 1}), 
\end{aligned}
$$

combining yields: 

$$
\begin{aligned}
    (L\eta_t + 1)^2 
    &= L\eta_{t + 1}(1 + L \eta_{t + 1})
    \\
    &= L\eta_{t + 1} + L^2 \eta_{t + 1}^2
    \\
    \iff 
    (L\eta_t + 1)^2 + 1/4 &= 
    1/4 + 2(1/2)L \eta_{t + 1} + (L \eta_{t + 1})^2
    \\
    \iff 
    (L\eta_t + 1)^2 + 1/4 &= 
    (L \eta_{t + 1} + 1/2)^2. 
\end{aligned}
$$

With $a_t = L\eta_t + 1 = L \tilde \eta_{t + 1}$ this is 
$$
\begin{aligned}
    a_t^2 + 1/4 &= (a_{t + 1} - 1/2)^2 
    \\
    a_t^2 + 1/4 &= a_{t + 1}^2 + 1/4 - a_{t + 1}
    \\
    a_t^2 + a_{t + 1} &= a_{t + 1}^2. 
    \\
    \implies 
    a_{t + 1} &= 
    \frac{1 + \sqrt{1 + 4a_t^2}}{2}
\end{aligned}
$$

Recall that the momentum coefficients as described through the PPM is: 

$$
\begin{aligned}
    (1 + L \eta_{t+ 1})^{-1}L\eta_t = L\eta_t / a_{t + 1} = (a_t - 1)/a_{t + 1}. 
\end{aligned}
$$

And this is a full recovery of the Nesterov sequence. 
Finally, we present equivalent forms of the algorithms using the obtained sequence. 


**Remarks**

This derivation only leave a single choice for the stepsize parameter. 
We are not sure if there could be more choices for the parameters that assures convergence rate of the algorithm. 


#### **Scenario 3 | Similar Triangle II**   

In the previous scenario II, we choose the stepsize so that $x_{t + 1}$ can be projected into the correct position by $z_{t + 1}$ to allow colinearity for points $z_t, x_{t +1}, x_{t + 1}$. 
In this scenario, we choose the stepsize so that $z_{t +1}$ is a convex combinations of the point $x_{t+1}, z_t$, so that we still have the similar triangle as in the previous scenario. 


---
### **Some more Nuanced Results**

Results in this part are not coming from literatures, and they are my own works at testing the ideas presented by Ahn and in their works. 
Before we start, we list some of the specific type of accelerated gradient method. 
In any cases below, we are optimizing with convex functions. 

#### **Def 5.1 | Chambolle Dossal (2015)**
> When $f$ is differentiable and convex, we define the following algorithm 
> $$
> \begin{aligned}
>     y_n &= \left(
>         1 - \frac{1}{t_{n + 1}}
>     \right)z_{n} + \left(
>         \frac{1}{t_{n + 1}}
>     \right)x_{n}
>     \\
>     z_{n + 1} &= y_n - L^{-1} \nabla f(y_n)
>     \\
>     x_{n + 1} &= z_n + t_{t +1} (z_{n + 1} - z_n), 
> \end{aligned}
> $$
> where $t_n = (n + a - 1)/a$ for all $a > 2$. 
> Then the above algorithm is a form of accelerated gradient where the iterates converges to a minimizer. 

**Remarks**

In the context of Chambolle, Dossal, the gradient descent step for $z_{n + 1}$ is produced by the forward backward splitting operator of the gradient of sum of smooth non-smooth function. 


#### **Def 5.2 | Ryu's Chapter 12**
> In chapter 12 of Ryu's book, an accelerated gradient method is presented as 
> $$
> \begin{aligned}
>     z_{t + 1} &= y_t + L^{-1}\nabla f(y_t), 
>     \\
>     x_{t + 1} &= x_t + (t + 1)(2L)^{-1}\nabla f(y_t), 
>     \\
>     y_{t + 1} &= \left(
>         1 - \frac{2}{t + 2} 
>     \right)z_{t + 1} + 
>     \left(
>         \frac{1}{t + 2}
>     \right)x_{t + 1}. 
> \end{aligned}
> $$

**Observations**

It is important to talk about the initial conditions of the algorithm. 
This algorithm is equivalent to the algorithm discussed scenario I, not a similar triangule. 


#### **Claim 5.3 | Chambolle and Dossal's Variant doesn't fit the Framework**
> The variety of accelerated gradient presented by Chambolle Dossal for convergence of the iterates, doesn't fit the accelerated gradient PPM form: 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$
> This is true because if there is a generic representation $x_{t + 1} = z_{t + 1} + \alpha_{t + 1}(z_{t + 1} - z_t)$ for some $\alpha_{t + 1} \in \R$ where $x_{t + 1}$ is produced from the accelerated gradient PPM generic form, then it must be that $a_{t + 1} = L\eta_t$, so $\tilde \eta_{t + 1} = \eta_t + L^{-1}$ is the only choice to make similar triangle. 

**Proof**

This comes from the consideration 

$$
\begin{aligned}
    x_{t + 1} &= z_{t + 1} + \alpha_{t + 1}(z_{t + 1} - z_t)
    \\
    &= 
    y_t + L^{-1}\nabla f(y_t) + \alpha_{t + 1} (
        y_t + L^{-1}\nabla f(y_t) - z_t
    )
    \\
    &= y_t + (L^{-1} + \alpha_{t + 1}L^{-1})\nabla f(y_t)
    + \alpha_{t + 1}y_t - \alpha_{t + 1}z_t
    \\
    &= (1 + \alpha_{t + 1})y_t 
    + L^{-1}(1 + \alpha_{t + 1})\nabla f(y_t) - \alpha_{t + 1}z_t. 
\end{aligned}
$$

Now we find $z_t$ in terms of $y_t, x_t$ using the updates of $y_t$, from the previous iterations which yields: 

$$
\begin{aligned}
    (1 + L\eta_t) y_t &= x_t + L\eta_t z_t
    \\
    (1 + L\eta_t)y_t - x_t &= L\eta_t z_t
    \\
    ((L\eta_t)^{-1} + 1)y_t - (L\eta_t)^{-1}x_t
    &= z_t, 
\end{aligned}
$$

substituting back we have

$$
\begin{aligned}
    x_{t + 1} &= 
    (1 + \alpha_{t + 1})y_t 
    + L^{-1}(1 + \alpha_{t + 1})\nabla f(y_t)
    - \alpha_{t + 1} 
    \left(
        ((L\eta_t)^{-1} + 1)y_t - (L\eta_t)^{-1}x_t
    \right)
    \\
    &= 
    \left(
        (1 + \alpha_{t + 1}) - \alpha_{t +1} ((L\eta_t)^{-1} + 1)
    \right)y_t 
    + 
    (1 + \alpha_{t + 1})L^{-1}\nabla f(y_t) 
    + 
    \alpha_{t + 1}(L\eta_t)^{-1} x_t. 
\end{aligned}
$$

If, $x_{t +1}$ were to have representation in the form of $x_t = y_t - \tilde\eta_{t + 1} \nabla f(y_t)$, then it must be that $(1 + \alpha_{t + 1}) - \alpha_{t +1} ((L\eta_t)^{-1} + 1) = 0$, and $\alpha_{t + 1} (L\eta_t)^{-1} = 1$, inevitably making $\alpha_{t + 1} = L\eta_t$. 

**Remarks**

So, what exactly does the Dossal and Chambolle variants fit into, requires some more investigation. 
It's mentioned in the writings by Chambolle and Dossal that, the algorithm they derived was related to the momentum acceleration method applied to some type of maximal monotone operator. 