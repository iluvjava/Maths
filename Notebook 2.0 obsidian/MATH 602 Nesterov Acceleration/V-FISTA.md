[Proximal Gradient with Momentum Accelerations](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20with%20Momentum%20Accelerations.md)


---
### **ToC for VS Code**
- [**ToC for VS Code**](#toc-for-vs-code)
- [**Intro**](#intro)
- [**The V-FISTA Algorithm**](#the-v-fista-algorithm)
- [**Thm | Linear Convergence Rate of the Objective Value of the Algorithm**](#thm--linear-convergence-rate-of-the-objective-value-of-the-algorithm)
- [**The Prox Grad Lemma**](#the-prox-grad-lemma)
  - [**Thm | Prox Grad 2 Points Lemma**](#thm--prox-grad-2-points-lemma)
  - [**The Proof Preparations of the Linear Convergence of V-FISTA**](#the-proof-preparations-of-the-linear-convergence-of-v-fista)
  - [**Fixed Step Generic Momentum Algorithm**](#fixed-step-generic-momentum-algorithm)
- [**Necessary Assumptions for Linear Convergence**](#necessary-assumptions-for-linear-convergence)
- [**The Precise Conditions Under Which Assumption Set 1 are Satisified**](#the-precise-conditions-under-which-assumption-set-1-are-satisified)
  - [**Thm | Fixed Sequence Solutions for the Above Inequalities**](#thm--fixed-sequence-solutions-for-the-above-inequalities)
  - [**Discussion | When the Stepsizes are not fixed**](#discussion--when-the-stepsizes-are-not-fixed)
  - [**Thm | Non Fixed Stepsize Momentum Method**](#thm--non-fixed-stepsize-momentum-method)
- [**One Open Question**](#one-open-question)
- [**Reduction to FISTA**](#reduction-to-fista)
- [**Are these just Lyapunov Analysis?**](#are-these-just-lyapunov-analysis)


### **Intro**

The method of V-FISTA is a modified version of FISTA for strongly convex function. The original FISTA algorithm may not attain linear convergence under strong convexity. Fixing the momentum constant for the FISTA algorithm to attain linear converge for strongly convex function (And later, it's shown that for PL and Quasi-Strong Convex function). The linear convergence rate for FISTA with momentum is a magnitude better than momentum descent, it's Optimal in Nesterov's sense as well. For more about what Nesterov meant for an algorithm to be optimal, see [Nesterove Lower Convergence Bnd For Strongly Convex Functions](MATH%20602%20Nesterov%20Acceleration/Convergence%20Rate%20Lower%20Bound%20for%20S-CVX%20Func.md) for more information. 

This method V-FISTA, is a variant for the sum of smooth and non-smooth function with a fixed momentum term. It's described in 10.7.7 in Amir's Beck's First method method, and it attains a rate of linear convergence. It's a non-smooth adaptation of the original fixed step Nesterov Momentum method for strongly convex function. 

The story is long. We will point to relevant resources of frontier research whenever the context allow.

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
    y^{(k)} &= x^{(k)} + \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}
    \left(
        x^{(k)} - x^{(k + 1)}
    \right)
    \\
    x^{(k + 1)} &= T_{1/L} y^{(k)}, 
\end{aligned}
$$

This algorithm s a variant of FISTA to achieve linear convergence rate when the function admit a strong convexity index $\sigma$. In practice, one can estimate the quadratic growth parameter (the strong convexity index) of $\sigma$ using the formula: 
$$
\frac{\langle \nabla g(x^{(k + 1)}) - \nabla g(x^{(k)}), x^{(k + 1)} - x^{(k)}\rangle}{\Vert x^{(k + 1)} - x^{(k)}\Vert^2}. 
$$

Empirical experiment shows that the convergence is very good with this estimation. 


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

For more information about what it means to have Nesterov Optimal Convergence for the class of Strongly convex function, see [Nesterove Lower Convergence Bnd For Strongly Convex Functions](MATH%20602%20Nesterov%20Acceleration/Convergence%20Rate%20Lower%20Bound%20for%20S-CVX%20Func.md) for more information. 
This theorem is stated as theorem 10.7.7 in Amir Becks [^2]. In the next section, we provide a proof that is different from Beck, a bit more generalized. 
Amir Beck's original proof is short and not insightful, lacking in the interpretability of the algorithm, our proof mitigate it somewhat but still retains the same frameworks and set of formulas, claims for support. 
For, a better proof that is created from the ground up see Nesterov[^3] algorithm 2.2.7, read the whole chapter for best understanding. 
Finally, attempts at capturing the essence of momentum method had been attempted using the Idea of Proximal Point Methods, by [^4], and the frameworks of mirror descent and linear coupling [^5]. 
By the time the excerpt is created, I, the writer only have limited understanding of these topics. 
There is no further descriptions, besides the fact that these analysis are highly relevant to understand the family of Nesterov accelerations for convex smooth functions. 

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

The following proof was adapted from the proof of theorem 10.7.7 in Amir Beck's Book[^2]. For the proof we will assume a slightly weaker version of the algorithm, with several quantities to simplify the conditions for us. Consider the following recurrences for the Generic Algorithm. 


#### **Fixed Step Generic Momentum Algorithm**
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

where $\theta_k = (t_k - 1)/(t_k + 1)$. The parameters, $\theta_k$, and $t_k$ will be determined as we go over the proof. $t_{0} = 1$ is the base case for $t_k$ sequence, it represents the fact that there is no accelerations involved on the first step of the algorithm, its value depends on what it we want it to be. We start with the prox grad lemma 

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

With $k\ge 0$, a positive sequence $(t_k)_{k\in \mathbb N}$, we consider quantities 

- $\bar x \in \underset{x}{\text{argmin}} F(x)$ and $F(\bar x) = F_{\text{opt}}$. 
- $x = t^{-1}_{k + 1}\bar x + (1 - t^{-1}_{k + 1})x^{(k)}, y = y^{(k)}$. 


We analyze the RHS of (\[1\]) with the above quantities then 

$$
\begin{aligned}
    x - T(y) &=  t^{-1}_{k+1} \bar x + (1 - t^{-1}_{k+1}) x^{(k)} - T y^{(k)}
    \\
    &= t^{-1}_{k+1} \bar x + (1 - t^{-1}_{k+1}) x^{(k)} - x^{(k + 1)}
    \\
    &= t^{-1}_{k + 1}\left(
        \bar x + (t_{k+1} - 1)x^{(k)} - t_{k+1}x^{(k + 1)}
    \right)
    \\
    &= t^{-1}_{k + 1} \left(
        \bar x + t_{k+1} \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
    \right)
    \\
    x - y &= t^{-1}_{k+1} \bar x + (1 - t_{k+1}^{-1}) x^{(k)} - y^{(k)}
    \\
    &= t^{-1}_{k + 1}\left(
        \bar x + (t_{k+1} - 1)x^{(k)} - t_{k+1} y^{(k)}
    \right)
    \\
    &= t^{-1}_{k + 1}
    \left(
        \bar x + t_{k+1} \left(
            x^{(k)} - y^{(k)}
        \right) - x^{(k)}
    \right), 
\end{aligned}
$$

with the the RHS of expression (\[1\]) makes 

$$
\begin{aligned}
    \frac{L}{2} \left\Vert
       t^{-1}_{k + 1}\left(
        \bar x + t_{k + 1} \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
        \right)
    \right\Vert^2 - 
    \frac{(L - \sigma)}{2}
    \left\Vert
        t^{-1}_{k + 1}\left(
            \bar x + t_{k + 1} \left(
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
    &= F\left(t_{k + 1}^{-1}x^{(k)} + (1 - t^{-1}_{k + 1})\bar x\right) - 
    F\left(x^{(k + 1)}\right)
    \\
    &\le 
    t_{k + 1}^{-1}F_{\text{opt}}
    + 
    (1 - t_{k + 1}^{-1})F\left(x^{(k)}\right)
    - 
    \frac{\sigma}{2}t^{-1}_k\left(1 - t^{-1}_{k + 1}\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2 
    - F\left(x^{(k + 1)}\right)
    \\
    &= 
    t_{k + 1}^{-1} \left(
        F_{\text{opt}} - F\left(x^{(k)}\right)
    \right) + F\left(x^{(k)}\right) - F\left(x^{(k + 1)} \right)
    -
    \frac{\sigma}{2}t^{-1}_{k + 1}\left(1 - t^{-1}_{k + 1}\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2 
    \\
    & \triangleright  \text{ for better notation make }\delta_k = F\left(x^{(k)}\right) - F_{\text{opt}}
    \\
    &= -t_{k + 1}^{-1}\delta_k + \delta_k  - \delta_{k + 1} 
    -
    \frac{\sigma}{2}t^{-1}_{k + 1}\left(1 - t^{-1}_{k + 1}\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2
\end{aligned}
$$

With that we present (\[1\]) in full and do some minimal alterations. 


$$
\begin{aligned}
    & (1-t_{k + 1}^{-1})\delta_k  - \delta_{k + 1} 
    -
    \frac{\sigma}{2}t^{-1}_{k + 1}\left(1 - t^{-1}_{k + 1}\right)
    \left\Vert 
        x^{(k)} - \bar x
    \right\Vert^2 
    \\
    &\ge \frac{L}{2} \left\Vert
       t^{-1}_{k + 1}\left(
        \bar x + t_{k + 1} \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
        \right)
    \right\Vert^2 - 
    \frac{(L - \sigma)}{2}
    \left\Vert
        t^{-1}_{k + 1}\left(
            \bar x + t_{k + 1} \left(
                x^{(k)} - y^{(k)}
            \right) - x^{(k)}
        \right)
    \right\Vert^2. 
    \\
    & \triangleright \text{ Multiplying $t_{k + 1}^2$ both sides}
    \\
    & (t_{k + 1}^2 - t_{k + 1})\delta_k - t_{k + 1}^2\delta_{k + 1}
    - \frac{\sigma}{2}(t_{k + 1} - 1)
    \left\Vert
        x^{(k)} - \bar x
    \right\Vert^2 
    \\
    &\ge 
    \frac{L}{2} \left\Vert
        \bar x + t_{k + 1} \left(
            x^{(k)} - x^{(k + 1)}
        \right) - x^{(k)}
    \right\Vert^2 - 
    \frac{(L - \sigma)}{2}
    \left\Vert
        \bar x + t_{k + 1} \left(
            x^{(k)} - y^{(k)}
        \right) - x^{(k)}
    \right\Vert^2
    \\
    & \triangleright \text{re-arranging}, 
    \\
    & 
    (t_{k + 1}^2 - t_{k + 1})\delta_k - t_{k + 1}^2\delta_{k + 1} 
    \underbrace{
        - 
        \frac{\sigma(t_{k + 1} - 1)}{2}
        \left\Vert
            x^{(k)} - \bar x
        \right\Vert^2 
        + 
        \frac{L - \sigma}{2}
        \left\Vert
            \bar x + t_{k + 1}\left( x^{(k)} - y^{(k)}\right) - x^{(k)}
        \right\Vert^2
    }_{-R_k}
    \\
    &\ge 
    \frac{L}{2}\left\Vert 
        \bar x + t_{k + 1}
        \left(x^{(k)} - x^{(k + 1)}\right) - x^{(k)}
    \right\Vert^2, 
\end{aligned}\tag{[2]}
$$

To make further progress, we must simplify the notations. Make the following quantities to simplify the algebra. 

- $s^{(k)} = x^{(k)} - x^{(k - 1)}$, the velocity vector. 
- $e^{(k)} = x^{(k)} - \bar x$, the error vector at the kth iteration. 
- $\theta_k = (t_k -1)/(t_k + 1)$, which is the momentum step size. 
- $u^{(k)} = \bar x + t_{k}(x^{(k - 1)} - x^{(k)}) - x^{(k - 1)}$, the error term extrapolated with the velocity. We define $u^{(0)} = \bar x - x^{(0)}$. 
- $R_k$, this quantity is underbraced in (\[2\]), it has importance in the proof. 

These quantities simplify expression (\[2\]), they also made appearances in the proof [A Better Proof for FISTA Convergence](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md), making it more manageable, consider third term on the LHS of (\[2\]), using these above quantities we have 

$$
\begin{aligned}
    &\quad \frac{L - \sigma}{2}
    \left\Vert
        \bar x + t_{k + 1}\left( x^{(k)} - y^{(k)}\right) - x^{(k)}
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
        \bar x - x^{(k)} - t_{k + 1}\theta_k s^{(k)}
    \right\Vert^2
    \\
    &= \frac{L - \sigma}{2}\left\Vert e^{(k)} + t_{k + 1}\theta_k s^{(k)}\right\Vert^2, 
\end{aligned}
$$

And observe directly that $u^{(k + 1)}$ is exactly $\bar x + t_{k + 1}(x^{(k)} - x^{(k +1)}) - x^{(k)}$, the term inside the norm on the only quantity on the RHS (\[2\]). $u^{(k)}$ has representation by $e^{(k)}, x^{(k)}$. 

$$
\begin{aligned}
    u^{(k)} &= \bar x + t_{k}\left(x^{(k - 1)} - x^{(k)} \right) - x^{(k - 1)}
    \\
    &= \bar x + (t_{k} - 1)\left(
        x^{(k - 1)} - x^{(k)}
    \right) + 
    \left(
        x^{(k - 1)} - x^{(k)}
    \right) - x^{(k - 1)}
    \\
    &= \bar x + 
    (t_{k} - 1)\left(x^{(k - 1)} - x^{(k)}\right)
    - x^{(k)}
    \\
    &= - e^{(k)} - (t_{k} - 1)s^{(k)}, 
\end{aligned}
$$

and directly, one may also realize that

$$
\begin{aligned}
    u^{(k)} &= \bar x - x^{(k - 1)} + t_{k - 1}(x^{(k - 1)} - x^{(k)})
    \\
    &= -e^{(k - 1)} - t_{k}s^{(k)}, 
\end{aligned}
$$

with these simplifications, we will be able to write down an abstract form of expression ([2]), 

$$
\begin{aligned}
    R_k &=  
    \frac{\sigma(t_{k + 1} - 1)}{2}
    \left\Vert e^{(k)}\right\Vert^2
    - 
    \frac{L - \sigma}{2}\left\Vert e^{(k)} + t_{k + 1}\theta_k s^{(k)}\right\Vert^2
    \\
    t_{k + 1}(t_{k + 1} - 1)\delta_k - R_k
    &\ge 
    t_{k + 1}^2\delta_{k + 1} + \frac{L}{2}\left\Vert u^{(k + 1)}\right\Vert^2. 
\end{aligned}\tag{[3]}
$$

---
### **Necessary Assumptions for Linear Convergence**

To assert linear convergence perfectly, we would need to derive it based on (\[3\]), we will make assumptions along the way until we see that it can produce a linear convergence rate as the upper bound. We will deal with the assumptions later. This generic appraoch applied for different convergence rate we want, by making assumptions to arrive at the convergence rate then deal with the list of assumptions later. To attain linear convergence, the way shown in Amir Beck [^2] can be generalized by saying

$$
\begin{aligned}
    t_{k + 1}^2\delta_{k + 1}  + 
    \frac{L}{2}\left\Vert
        u^{(k + 1)}
    \right\Vert^2 
    - 
    C_k
    \left\Vert
         u^{(k)}
    \right\Vert^2
    &\le
    t_{k + 1}(t_{k + 1} - 1)\delta_k - R_k
    -
    C_k
    \left\Vert
        u^{(k)}
    \right\Vert^2
    \\
    & \triangleright \text{ Assume:  $R_k + C_k\left\Vert
        u^{(k)}
    \right\Vert\ge 0$ then, } 
    \\
    t_{k + 1}^2\delta_{k + 1} + \frac{L}{2}\left\Vert
        u^{(k + 1)}
    \right\Vert^2 
    - C_k
    \left\Vert
        u^{(k)}
    \right\Vert^2
    & \le 
    t_{k + 1}(t_{k + 1} - 1)\delta_k
    \\
    &\triangleright \text{ dividing by $t_{k + 1}^2$, re-arrange}
    \\
    \delta_{k + 1}
    &\le 
    (1 - t_{k + 1}^{-1}) \delta_k + \frac{C_k}{t_{k + 1}^{2}}\left\Vert
        u^{(k)}
    \right\Vert^2 -
    \frac{L}{2t^2_{k + 1}}\left\Vert
        u^{(k + 1)}
    \right\Vert^2. 
\end{aligned}
$$

At this point, to have a nice cancellation when unrolling the recurrence, let's propose that $\frac{C_k}{t_{k + 1}^2} = \frac{L(1 - t^{-1}_{k + 1})}{2t_{k}^2}$ so 

$$
\begin{aligned}
    \delta_{k + 1} &\le 
    (1 - t_{k + 1}^{-1})\delta_k + 
    \frac{L(1 - t_{k + 1}^{-1})}{2t_{k}^2} \left\Vert
        u^{(k)}
    \right\Vert^2 - \frac{L}{2t_{k + 1}^2}\left\Vert u^{(k + 1)} \right\Vert^2
    \\
    \delta_{k + 1} &\le 
    (1 - t_{k + 1}^{-1})\left(
        \delta_k + \frac{L}{2t_{k}^2}\left\Vert
            u^{(k)}
        \right\Vert^2
    \right) 
    - \frac{L}{2t_{k + 1}^2}\left\Vert u^{(k + 1)}\right\Vert^2
    \\
    & \triangleright \text{ unrolling recursion yield }
    \\
    \delta_{k + 1}
    &\le 
    \left(
        \prod_{i = 0}^{k} (1 - t_k^{-1})
    \right)\left(
        \delta_0 + \frac{L}{2t_0^2}\left\Vert
            u^{(0)}
        \right\Vert^2
    \right). 
\end{aligned}
$$

To make good convergence rate, $t_k\in (-1, 1)$. Further analysis will elimiate more options for the sequence of $t_k$. There is a list of assumptions we made

$$
\begin{aligned}
\begin{cases}
    \frac{C_k}{t_{k + 1}^2} = \frac{L(1 - t^{-1}_{k + 1})}{2t_{k}^2}
    \\
    R_k + C_k\left\Vert
        u^{(k)}
    \right\Vert^2 \ge 0
\end{cases}
\end{aligned}
$$

We call these **Assumptions set 1**. 

---
### **The Precise Conditions Under Which Assumption Set 1 are Satisified**

Observe that, 

$$
\begin{aligned}
    R_k + C_k\left\Vert
        u^{(k)}
    \right\Vert^2 &\ge 0
    \\
    \frac{\sigma(t_{k + 1} - 1)}{2}
    \left\Vert e^{(k)}\right\Vert^2
    - 
    \frac{L - \sigma}{2}
    \left\Vert e^{(k)} + 
        t_{k + 1}\theta_k s^{(k)}
    \right\Vert^2 
    + 
    \frac{Lt_{k + 1}(t_{k + 1} - 1)}{2t_k^2} 
    \left\Vert u^{(k)}\right\Vert^2 &\ge 0
    \\
    \triangleright 
    \text{ Dividing out by }\frac{L - \sigma}{2}, \text{ recall }u^{(k)} = -e^{(k)} - (t_{k} - 1)s^{(k)}&
    \\
    \frac{\sigma(t_{k +1} - 1)}{L - \sigma}
    \left\Vert e^{(k)}\right\Vert^2
    - 
    \left\Vert e^{(k)} + 
        t_{k + 1}\theta_k s^{(k)}
    \right\Vert^2 
    + 
    \frac{Lt_{k + 1}(t_{k + 1} - 1)}{t^2_k(L - \sigma)}
    \left\Vert 
        e^{(k)} + (t_{k} - 1)s^{(k)}
    \right\Vert^2
    &\ge  0
    \\ \triangleright 
    \text{ Vector quantities }e^{(k)}, s^{(k)} \text{share the same superscript, we may ignore it.}
\end{aligned}
$$

expanding each term, should have these quantities from the coefficients of $\langle s, e\rangle, \Vert s\Vert^2, \Vert e\Vert^2$ to work with. 

$$
\begin{aligned}
    - \Vert e + t_{k + 1}\theta_k s\Vert^2
    &= - \left(
        \Vert e\Vert^2 + t_{k + 1}^2\theta_k^2 \Vert s\Vert^2 + 
        2\theta_k t_{k + 1}\langle e, s\rangle
    \right)
    \\
    \frac{Lt_{k + 1}(t_{k + 1} - 1)}{t_k^2(L - \sigma)} \Vert 
        e + (t_k - 1)s
    \Vert^2
    &= 
    \frac{Lt_{k + 1}(t_{k + 1} - 1)}{t_k^2(L - \sigma)} 
    \left(
        \Vert e\Vert^2 + (t_k -1)^2 \Vert s\Vert^2 + 2(t_k - 1)\langle e, s\rangle
    \right)
    \\
    \frac{\sigma (t_{k + 1} - 1)}{L - \sigma}
    \Vert e\Vert^2 & 
\end{aligned}
$$

each of the terms $\Vert e\Vert^2, \Vert s\Vert^2, \langle e, s\rangle$, has their coefficients. These are their coefficients, make $q = \sigma/L$, we simplify and get 

$$
\begin{aligned}
    \Vert e\Vert^2 \text{ has: } &
    \quad 
    \frac{\sigma (t_{k + 1} - 1)}{L - \sigma} 
    + 
    \frac{Lt_{k + 1}(t_{k + 1} - 1)}{t_k^2(L - \sigma)} - 1
    \\
    & = (t_{k + 1} - 1)\left(
        \frac{q}{1 - q} + \frac{t_{k + 1}}{t_k^2(1 - q)}
    \right) - 1
    \\
    &= 
    \frac{t_{k + 1} - 1}{1 - q}\left(
        q + \frac{t_{k + 1}}{t_k^2}
    \right) - 1
    \\
    \Vert s\Vert^2 \text{ has: } & 
    \quad 
    \frac{Lt_{k + 1}(t_{k + 1} - 1)}{t_k^2 (L - \sigma)}(t_k - 1)^2
    - t_{k + 1}^2 \theta_k^2
    \\
    &= 
    \frac{t_{k + 1}(t_{k + 1} - 1)}{t_k^2 (1 - q)}(t_k - 1)^2
    - t_{k + 1}^2\left(
        \frac{t_k - 1}{t_k + 1}
    \right)^2
    \\
    &= 
    (t_k - 1)^2
    \left(
        \frac{t_{k + 1}(t_{k + 1} - 1)}{t_k^2(1 - q)}
        - 
        \frac{t_{k + 1}^2}{(t_k + 1)^2}
    \right)
    \\
    \langle s, e\rangle \text{ has: } &
    \quad 
    \frac{2Lt_{k + 1}(t_{k + 1} - 1)}{t_k^2(L - \sigma)}(t_k -1)
    -2\theta_kt_{k + 1}
    \\
    &= 2(t_k - 1)t_{k + 1}
    \left(
        \frac{t_{k + 1} - 1}{t^2_k(1 - q)}
        -
        \frac{1}{t_k + 1}
    \right), 
\end{aligned}
$$

To statisfy the assumption, it would be great to have the coefficients for $\langle s, e\rangle$ to be zero, and the coefficients of $\Vert e\Vert^2, \Vert s\Vert^2$ to be a positive quantities. 


#### **Thm | Fixed Sequence Solutions for the Above Inequalities**
> With the suggested value of $t_k = t_{k -1} = \sqrt{L / \sigma}$, it can make the coefficients of $\Vert e\Vert^2, \Vert s\Vert^2$ to be larger than zero, and for the cross term to be equal to zero. 

**Proof**

For the cross terms to be zero and $t_k = t_{k + 1}$ then it will be the case that 

$$
\begin{aligned}
    \frac{t_{k + 1} - 1}{t^2_k(1 - q)}
        -
    \frac{1}{t_k + 1} &= 0
    \\
    & \triangleright\;  t_{k + 1} = t_k
    \\
    \frac{t - 1}{t^2(1 - q)} &= \frac{1}{t + 1}
    \\
    t^2(1 - q) 
    &= t^2 - 1
    \\
    t^2q &= 1
    \\
    t &= \pm \sqrt{\frac{L}{\sigma}}. 
\end{aligned}
$$

We now make use of the above equality to show that the coefficient of $\Vert s\Vert^2$ is a positive number if we choose $t = \sqrt{L / \sigma}$. The coefficient of $\Vert s\Vert^2$ contains $(t_k - 1)^2$, a positive quantity that won't affect the sign, considering only the inner quantities we have 

$$
\begin{aligned}
    \frac{t(t - 1)}{t^2(1 - q)} - \frac{t^2}{(t + 1)^2} 
    &\ge 0
    \\
    \triangleright \; \text{using }\frac{t - 1}{t^2(1 - q)} &= \frac{1}{t + 1}
    \\
    \frac{t}{t + 1} - \frac{t^2}{(t + 1)^2} &\ge 0
    \\
    \frac{t}{t + 1} \left(
        1 - \frac{t}{t + 1}
    \right) &\ge 0
\end{aligned}
$$

with $t = \sqrt{L/\sigma}\ge 1$, we would have $1 > t/(t + 1) >0$, and therefore, the above is a positive quantity. Next, the coefficient of $\Vert e\Vert^2$ is zero because 

$$
\begin{aligned}
    \quad \frac{t-1}{1 - q}\left(
        q + \frac{1}{t}
    \right) - 1
    &= 
    \frac{tq + 1 - q - 1/t}{1 - q} - 1
    \\
    &= \frac{\sqrt{L/\sigma}(\sigma/L) + 1 - q - \sqrt{\sigma/L}}{1 - q} - 1
    \\
    &= 0. 
\end{aligned}
$$

And therefore, choosing the algorithm step size to be $t = \sqrt{L/\sigma}$ will solve it with linear convergence rate. Since the sequences is now fixed, we will have the convergence rate of $(1 - \sqrt{\sigma / L})$ by substituting the value of $t$. 


**Remarks**

In this remarks we propose speculations and imaginations. The quantity $\langle e^{(k)}, s^{(k)}\rangle$ can have different signs, therefore, the equality of 

$$
\begin{aligned}
    \frac{t_{k + 1} - 1}{t_k^2(1 - q)} = \frac{1}{t_k + 1},
\end{aligned}\tag{[4]}
$$

must hold for designing an algorithm that actually works. This is a fixed point iteration. 


#### **Discussion | When the Stepsizes are not fixed**

When the stepsizes is not fixed, we can start with some initial value $t_k$, perform an iteration on the equality that makes the coefficient of $\langle e, s\rangle =0$. However, it remains to be show that all sequences generated by (\[4\]). 

$$
\begin{aligned}
t_{k + 1} = \frac{t_k^2(1 - q)}{t_k + 1} + 1, 
\end{aligned}
$$

still makes the ceofficients of $\Vert s\Vert^2, \Vert e\Vert^2$ greater than zero. And for that to be true, $t_k$ must satisfy that 

$$
\begin{aligned}
    \begin{cases}
        t_{k + 1} \ge t_k + 1 - t_k^2 q 
        \\
        t_{k + 1} \le t_k + 1.     
    \end{cases}
\end{aligned}
$$

That is the condition that the fixed point map must satisfy to preserve the same linear convergence rate. From the previous derivation it should be clear that the fixed point iteration on the mapping produces a sequence that converges to $\sqrt{L/\sigma}$. 

**Justifications**

The non-negativity conditions for the coefficients of $\Vert e^{(k)}\Vert^2, \Vert s^{(k)}\Vert^2$ places restrictions on the successive difference on the sequence $t_k$. Considers the coefficient for $\Vert e^{(k)}\Vert^2$ e then have 

$$
\begin{aligned}
    \frac{t_{k + 1} - 1}{1 - q} 
    \left(
        1 + \frac{t_{k + 1}}{t_k^2}
    \right)
    -1
    &\ge 0 \quad \triangleright\;  ([4]) \iff 
    \frac{t_{k + 1}-1}{1 - q}
    = \frac{t_k^2}{t_k + 1}
    \\
    \frac{t_k^2}{t_k + 1}\left(
        q + \frac{t_{k + 1}}{t_k^2} 
    \right) 
    &> 1
    \\
    \triangleright \; t_k &\ge 1
    \\
    t_k^2 q + t_{k + 1} &\ge t_k + 1
    \\
    t_{k + 1} &\ge t_k + 1 - t_k^2 q.
\end{aligned}
$$

similarly, the non-negatvity constraints for $\Vert s^{(k)}\Vert^2$ would yield 

$$
\begin{aligned}
    (t_k - 1)^2 
    \left(
        \frac{t_{k + 1}(t_{k + 1} - 1)}{t_k^2(1 - q)}
        -
        \frac{t_{k + 1}^2}{(t_k + 1)^2}
    \right) & 
    \ge 0
    \quad \triangleright \; [(4)] 
    \iff \frac{t_{k + 1} - 1}{t_k^2(1 - q)}
    = 
    \frac{1}{t_k + 1}
    \\
    (t_k - 1)^2 \left(
        \frac{t_{k +1}}{t_k + 1} - 
        \frac{t_{k + 1}^2}{(t_k +1)^2} 
    \right)
    &\ge 0 \quad \triangleright \; \text{using } (t_k-1) > 0 
    \\
    \frac{t_{k + 1}}{t_k + 1} &\ge 
    \frac{t_{k + 1}^2}{(t_k + 1)^2}
    \\
    \frac{1}{t_k + 1} & \ge 
    \frac{t_{k + 1}}{(t_k + 1)^2}
    \\
    1 &\ge 
    \frac{t_{k + 1}}{t_k + 1}
    \\
    t_k + 1 &\ge t_{k + 1}.
\end{aligned}
$$

However the above is redundant because if $\langle s, e\rangle$ has zero coefficient it would mean 

$$
\begin{aligned}
    \frac{t_{k + 1} - 1}{t_k^2(1 - q)}
    -
    \frac{1}{t_k + 1} &= 0
    \\
    t_{k + 1} - 1 - 
    \frac{t_k^2(1 - q)}{t_k + 1} &= 0
    \\
    t_{k + 1} &= 1 + 
    \frac{t_k^2(1 - q)}{t_k + 1}
    \\
    & \le 1 + t_k^2/(t_k + 1)
    \\
    &\le 1 + t_k^2/t_k = 1 + t_k
\end{aligned}
$$


#### **Thm | Non Fixed Stepsize Momentum Method**
> A fixed point iterations on (\[4\]) would generate a sequence such that Assumption Set 1 is satisfied. 


**Proof**

A proof would required that, a fixed point iterations generated based on equation (\[4\]) would yield a sequence of $t_k$ such that the inequality above is true. 


---
### **One Open Question**

Does estimating the momentum sequence $t_k \approx \sqrt{\kappa}$, still give a sub linear convergence rate of $1/k^2$??? If so, how close does the estimation has to be? 

---
### **Reduction to FISTA**

If, the proof is correct, the reader should be convinced by the fact that if $\mu = 0$, then we will have the convergence rate being $(1/k^2)$ for the algorithm and the choices of stepsize $t_k$ will be limited. 
This is a call back to the convergence rate of FISTA. 


---
### **Are these just Lyapunov Analysis?**


