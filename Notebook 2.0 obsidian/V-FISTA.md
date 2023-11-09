[Proximal Gradient with Momentum Accelerations](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20with%20Momentum%20Accelerations.md)


---
### **Intro**

The method of V-FISTA is a modified version of FISTA for strongly convex function. The original FISTA algorithm may not attain linear convergence under strong convexity. Fixing the momentum constant for the FISTA algorithm to attain linear converge for strongly convex function (And later, it's shown that for PL and Quasi-Strong Convex function). 

This method V-FISTA, is a variant for the sum of smooth and non-smooth function with a fixed momentum term. It's described in 10.7.7 in Amir's Beck's First method method, and it attains a rate of linear convergence. It's a non-smooth adaptation of the original fixed step Nesterov Momentum method for strongly convex function. 

The story is long. We will point to relevant resources of fronter research whenever the context allow.

---
### **The V-FISTA Algorithm**

The algorithm accepted parameters

- $f$, a $L$-Lipschitz Smooth, $\sigma > 0$ strongly convex function. 
- $T_{1/L} \overset{\Delta}{=}\underset{L^{-1}g}{\text{prox}}\circ [I - L^{-1}\nabla f]$, or $T$ for short. 
- $g$ is a convex and prox friendly function. 
- $\kappa = L/\sigma$ is the condition number. 

Then the algorithm is defined by the following recurrences relations 

$$
\begin{aligned}
    y^{(0)} &= T y^{(0)} 
    \\
    x^{(1)} &= Ty^{(0)}
    \\
    \forall k \ge 1\quad 
    y^{(k + 1)} &= x^{(k)} + \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}
    \left(
        x^{(k)} - x^{(k + 1)}
    \right)
    \\
    x^{(k + 1)} &= T_{1/L} y^{(k)}, 
\end{aligned}
$$

This algorithm s a variant of FISTA to achieve linear convergence rate when the function admit a strong convexity index $\sigma$. 

**Remarks**

Frontier research by Necoera et al[^1], extend the linear convergence to Lipschitz smooth, but not necessarily strong convex functions.

[^1]: I. Necoara, Yu. Nesterov, and F. Glineur, “Linear convergence of first order methods for non-strongly convex optimization,” Math. Program., vol. 175, no. 1, pp. 69–107, May 2019, doi: 10.1007/s10107-018-1232-1. 

### **Thm | Linear Convergence Rate of the Objective Value of the Algorithm**
> If the assumption listed for the algorithm is met, let $x^{k}$ be the sequence produced by the V-FISTA algorithm, Then for any minimizer $x^*$, and $k\ge 0$ we have 
> $$
> \begin{aligned}
>   F\left(x^{(k)}\right) - F_{\text{opt}} \ge 
>   \left(
>     1 - 1/\sqrt{\kappa}
>   \right)^k \left(
>       F(x^{(0)}) - F_{\text{opt}} + \sigma/2 \Vert x^{(0)} - x^* \Vert^2
>   \right), 
> \end{aligned}
> $$
> achieving Nesterov Optimal Convergence rate. 

For more information about what it means to have Nesterov Optimal Convergence for the class of Strongly convex function, see [Nesterove Lower Convergence Bnd For Strongly Convex Functions](AMATH%20516%20Numerical%20Optimizations/Convergence%20Rate%20Lower%20Bnd%20for%20S-CVX%20Func.md) for more information. This theorem is stated as theorem 10.7.7 in Amir Becks [^2]. In the next section, we provide a proof that is different from Beck, a bit more generalized. Amir Beck's original proof is short and not insightful, lacking in the interpretability of the algorithm, our proof mitigate it somewhat but still retains the same frameworks and set of formulas, claims for support. For, a better proof that is created from the ground up see Nesterov[^3] algorithm 2.2.7, read the whole chapter for best understanding. Finally, attempts at capturing the essence of momentum method had been attempted using the Idea of Proximal Point Methods, by [^4], and the frameworks of mirror descent and linear coupling [^5]. By the time the excerpt is created, I, the writer only have limited understanding of these topics. There is no further descriptions, besides the fact that these analysis are highly relevant to understand the family of Nesterov accelerations for convex smooth functions. 

[^2]: A. Beck, First-Order Methods in Optimization | SIAM Publications Library. in MOS-SIAM Series in Optimization. SIAM. Accessed: Oct. 19, 2023. [Online]. Available: https://epubs.siam.org/doi/book/10.1137/1.9781611974997

[^3]: Y. Nesterov, Lectures on Convex Optimization, vol. 137. in Springer Optimization and Its Applications, vol. 137. Cham: Springer International Publishing, 2018. doi: 10.1007/978-3-319-91578-4.

[^4]: K. Ahn and S. Sra, “Understanding Nesterov’s Acceleration via Proximal Point Method.” arXiv, Jun. 02, 2022. doi: 10.48550/arXiv.2005.08304.

[^5]: Z. Allen-Zhu and L. Orecchia, “Linear Coupling: An Ultimate Unification of Gradient and Mirror Descent.” arXiv, Nov. 07, 2016. doi: 10.48550/arXiv.1407.1537.

---
### **The Prox Grad Lemma**

We recall the prox grad lemma used in the proof of FISTA. We will apply the same proof for V-FISTA algorithm. 

#### **Thm | Prox Grad 2 Points Lemma**
> With $f = g + h$, where $h$ is convex, closed and proper, with $g$ be $L$-Lipschitz smooth with a constant of $L$, let $y\in \mathbb E$, defining $y^+ = T(y)$ being the proximal gradient step, then for any $x\in \mathbb E$, we have: 
> 
> $$
> \begin{aligned}
>   f(x) - f(y^+) \ge \frac{L}{2}\Vert x - y^+\Vert^2 - \frac{L}{2}\Vert x - y\Vert^2 + D_g(x, y),
> \end{aligned}
> $$
> Where $D_g(x, y):= g(x) - g(y) - \langle \nabla g(y), x -y\rangle$ is the Bregman Divergence for the smooth part of the sum: $g$. 


This theorem is extracted from the proof of proximal gradient in [Proximal Gradient Convergence Rate](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20Convergence%20Rate.md). 

Under the strong convexity assumption, the above claim becomes stronger using the lower bound $D_g(x, y) \ge \sigma/2\Vert x - y\Vert^2$ because function $g$ is a strongly convex function. 

---
#### **The Proof Preparations of the Linear Convergence of V-FISTA**

The following proof was adapted from the proof of theorem 10.7.7 in Amir Beck's Book[^2]. For the proof we will assume a slightly weaker version of the algorithm, with several quantities to simplify the conditions for us. Consider the following recurrences for the Generic Algorihm algorithm. 


#### **Fixed Step Generic Algorithm**
> We define the generic recurrences for the fixed step FISTA algorithm. 
> $$
> \begin{aligned}
>     y^{(0)} &= x^{(0)} 
>     \\
>     x^{(0)} &= T_L y^{(0)}
>     \\
>     \forall i \ge 1: & 
>     \\
>     y^{(i)} &= x^{(i)} + \theta_i (x^{(i)} - x^{(i - 1)}) 
>     \\
>     x^{(i + 1)} &= T_L y^{(i)}
>     \\
> \end{aligned}
> $$

where $\theta_k = (t_k - 1)/(t_k + 1)$. The parameters, $\theta_k$, and $t_k$ will be determined as we go over the proof. We assume $t_{-1} = 1$.  We start with the prox grad lemma 

$$
\begin{aligned}
    F(x) - F\circ T(y) &\ge 
    \frac{L}{2}\Vert x - T (y)\Vert^2 - \frac{L}{2}\Vert x - y\Vert^2 + D_g(x, y)
    \\
    & \triangleright \text{ strong convexity of g makes }
    D_g(x, y) \ge \frac{\sigma}{2}\Vert y - x\Vert^2
    \\
    & \ge \frac{L}{2}\Vert x - Ty\Vert^2 - \frac{L - \sigma}{2}\Vert x - y\Vert^2. 
\end{aligned}\tag{[1]}
$$

With $k\ge 0$, make a sequence $(t_k)_{k\in \mathbb N}$, we consider quantities 
- $x = t^{-1}_k\bar x + (1 - t^{-1}_k)x^{(k)}, y = y^{(k)}$
- $\bar x \in \underset{x}{\text{argmin}} F(x)$ and $F(\bar x) = F_{\text{opt}}$. 

We analyze the RHS of (\[1\]) with the above quantities then 

$$
\begin{aligned}
    x - T(y) &=  t^{-1}_k \bar x + (1 - t^{-1}_k) x^{(k)} - T y^{(k)}
    \\
    &= t^{-1}_k \bar x + (1 - t^{-1}_k) x^{(k)} - x^{(k + 1)}
    \\
    &= t^{-1}_k\left(
        \bar x + (t_k - 1)x^{(k)} - t_kx^{(k + 1)}
    \right)
    \\
    &= t^{-1}_k \left(
        \bar x + t_k \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
    \right)
    \\
    x - y &= t^{-1}_k \bar x + (1 - t_k^{-1}) x^{(k)} - y^{(k)}
    \\
    &= t^{-1}\left(
        \bar x + (t_k - 1)x^{(k)} - t_k y^{(k)}
    \right)
    \\
    &= t^{-1}_k\left(
        \bar x + t_k \left(
            x^{(k)} - y^{(k)}
        \right) - x^{(k)}
    \right), 
\end{aligned}
$$

with the the RHS of expression (\[1\]) makes 

$$
\begin{aligned}
    \frac{L}{2} \left\Vert
       t^{-1}_k\left(
        \bar x + t_k \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
        \right)
    \right\Vert^2 - 
    \frac{(L - \sigma)}{2}
    \left\Vert
        t^{-1}_k\left(
            \bar x + t_k \left(
                x^{(k)} - y^{(k)}
            \right) - x^{(k)}
        \right)
    \right\Vert^2. 
\end{aligned}
$$

The LHS of (\[1\]) can be bounded using strong convexity of $F$.


$$
\begin{aligned}
    F(x) - F\circ T(y)
    &= F(x) - F\left(
        x^{(k + 1)}
    \right) 
    \\
    &= F\left(t_k^{-1}x^{(k)} + (1 - t^{-1}_k)\bar x\right) - 
    F\left(x^{(k + 1)}\right)
    \\
    &\le 
    t_k^{-1}F_{\text{opt}}
    + 
    (1 - t_k^{-1})F\left(x^{(k)}\right)
    - 
    \frac{\sigma}{2}t^{-1}_k\left(1 - t^{-1}_k\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2 
    - F\left(x^{(k + 1)}\right)
    \\
    &= 
    t_k^{-1} \left(
        F_{\text{opt}} - F\left(x^{(k)}\right)
    \right) + F\left(x^{(k)}\right) - F\left(x^{(k + 1)} \right)
    -
    \frac{\sigma}{2}t^{-1}_k\left(1 - t^{-1}_k\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2 
    \\
    & \triangleright  \text{ for better notation make }\delta_k = F\left(x^{(k)}\right) - F_{\text{opt}}
    \\
    &= -t_k^{-1}\delta_k + \delta_k  - \delta_{k + 1} 
    -
    \frac{\sigma}{2}t^{-1}_k\left(1 - t^{-1}_k\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2
\end{aligned}
$$

With that we present (\[1\]) in full and do some minimal alterations. 


$$
\begin{aligned}
    & (1-t_k^{-1})\delta_k  - \delta_{k + 1} 
    -
    \frac{\sigma}{2}t^{-1}_k\left(1 - t^{-1}_k\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2 \ge 
    \\
    &\frac{L}{2} \left\Vert
       t^{-1}_k\left(
        \bar x + t_k \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
        \right)
    \right\Vert^2 - 
    \frac{(L - \sigma)}{2}
    \left\Vert
        t^{-1}_k\left(
            \bar x + t_k \left(
                x^{(k)} - y^{(k)}
            \right) - x^{(k)}
        \right)
    \right\Vert^2. 
    \\
    & \triangleright \text{ Multiplying $t_k^2$ both sides}
    \\
    & (t_k^2 - t_k)\delta_k - t_k^2\delta_{k + 1}
    - \frac{\sigma}{2}(t_k - 1)
    \left\Vert
        x^{(k)} - \bar x
    \right\Vert^2 
    \\
    &\ge 
    \frac{L}{2} \left\Vert
        \bar x + t_k \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
    \right\Vert^2 - 
    \frac{(L - \sigma)}{2}
    \left\Vert
        \bar x + t_k \left(
            x^{(k)} - y^{(k)}
        \right) - x^{(k)}
    \right\Vert^2
    \\
    & \triangleright \text{re-arranging}, 
    \\
    & 
    (t_k^2 - t_k)\delta_k - t_k^2\delta_{k + 1} 
    \underbrace{
        - 
        \frac{\sigma(t_k - 1)}{2}
        \left\Vert
            x^{(k)} - \bar x
        \right\Vert^2 
        + 
        \frac{L - \sigma}{2}
        \left\Vert
            \bar x + t_k\left( x^{(k)} - y^{(k)}\right) - x^{(k)}
        \right\Vert^2
    }_{-R_k}
    \\
    &\ge 
    \frac{L}{2}\left\Vert 
        \bar x + t_k
        \left(x^{(k)} - x^{(k + 1)}\right) - x^{(k)}
    \right\Vert^2, 
\end{aligned}\tag{[2]}
$$

To make further progress, we must simplify the notations. Make the following quantities to simplify the algebra. 

- $s^{(k)} - x^{(k)} - x^{(k - 1)}$, the velocity vector. 
- $e^{(k)} = x^{(k)} - \bar x$, the error vector at the kth iteration. 
- $\theta_k = (t_k -1)/(t_k + 1)$, which is the momentum step size. 
- $u^{(k)} = \bar x + t_{k - 1}(x^{(k - 1)} - x^{(k)}) - x^{(k - 1)}$, the error term extrapolated with the velocity. 
- $R_k$, this quantity is underbraced in (\[2\]), it has importance in the proof. 

These quantities simplify expression (\[2\]), they also made appearances in the proof [A Better Proof for FISTA Convergence](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md), making it more manageable, consider third term on the LHS of (\[2\]), using these above quantities we have 

$$
\begin{aligned}
    &\quad \frac{L - \sigma}{2}
    \left\Vert
        \bar x + t_k\left( x^{(k)} - y^{(k)}\right) - x^{(k)}
    \right\Vert^2
    \\
    & \triangleright \text{ Recall from algorithm: }
    \\
    &\qquad 
    \begin{aligned}
        y^{(k)} &= x^{(k)} + \theta_k(x^{(k)} - x^{(k - 1)})
        \\
        y^{(k)} - x^{(k)} &= \theta_k(x^{(k)} - x^{(k - 1)}) = \theta_k s^{(k)} 
    \end{aligned}
    \\
    &=  \frac{L - \sigma}{2}\left\Vert
        \bar x - x^{(k)} - t_k\theta_k s^{(k)}
    \right\Vert^2
    \\
    &= \frac{L - \sigma}{2}\left\Vert e^{(k)} + t_k\theta_k s^{(k)}\right\Vert^2, 
\end{aligned}
$$

And observe directly that $u^{(k + 1)}$ is exactly $\bar x + t_k(x^{(k)} - x^{(k +1)}) - x^{(k)}$, the term inside the norm on the only quantity on the RHS (\[2\]). And the relations between these quantities

$$
\begin{aligned}
    u^{(k)} &= \bar x + t_{k - 1}\left(x^{(k - 1)} - x^{(k)} \right) - x^{(k - 1)}
    \\
    &= \bar x + (t_{k - 1} - 1)\left(
        x^{(k - 1)} - x^{(k)}
    \right) + 
    \left(
        x^{(k - 1)} - x^{(k)}
    \right) - x^{(k - 1)}
    \\
    &= \bar x + 
    (t_{k - 1} - 1)\left(x^{(k - 1)} - x^{(k)}\right)
    - x^{(k)}
    \\
    &= - e^{(k)} - (t_{k - 1} - 1)s^{(k)}, 
\end{aligned}
$$

and directly, one may also realize that

$$
\begin{aligned}
    u^{(k)} &= \bar x - x^{(k - 1)} + t_{k - 1}(x^{(k - 1)} - x^{(k)})
    \\
    &= -e^{(k - 1)} - t_{k -1}s^{(k)}, 
\end{aligned}
$$

with these simplifications, we will be able to write down an abstract form of expression ([2]), 

$$
\begin{aligned}
    R_k &= - \frac{\sigma(t_k - 1)}{2}
    \left\Vert e^{(k)}\right\Vert^2
    - 
    \frac{L - \sigma}{2}\left\Vert e^{(k)} + t_k\theta_k s^{(k)}\right\Vert^2
    \\
    t_k(t_k - 1)\delta_k - R_k
    &\ge 
    t_k^2\sigma_{k + 1} + \frac{L}{2}\left\Vert u^{(k + 1)}\right\Vert^2. 
\end{aligned}\tag{[3]}
$$

---
### **Necessary Assumptions for Linear Convergence**

To assert linear convergence perfectly, we would need to derive it based on (\[3\]), we will make assumptions along the way until we see that it can produce a linear convergence rate as the upper bound. We will deal with the assumptions later. This generic appraoch applied for different convergence rate we want, by making assumptions to arrive at the convergence rate then deal with the list of assumptions later. 
