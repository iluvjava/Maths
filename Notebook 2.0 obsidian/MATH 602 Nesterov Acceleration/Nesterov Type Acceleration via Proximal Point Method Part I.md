---
tags:
  - LEGACY
---
- [Convex Proximal Point Method, Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Convex%20Proximal%20Point%20Method,%20Part%20I.md)


---
### **TOC for VS Code**
- [**TOC for VS Code**](#toc-for-vs-code)
- [**Toc for Obsidian Notebook**](#toc-for-obsidian-notebook)
- [**Intro**](#intro)
- [**The Classic, Original Nesterov Accelerations via PPM**](#the-classic-original-nesterov-accelerations-via-ppm)
  - [**Algorithm | PPM Formulation of Nesterov Accelerations**](#algorithm--ppm-formulation-of-nesterov-accelerations)
  - [**Algorithm | AGM Triangular Form I**](#algorithm--agm-triangular-form-i)
  - [**Thm | Equivalences Between the two Forms**](#thm--equivalences-between-the-two-forms)
  - [**Thm 1 | INEQ1 AGM**](#thm-1--ineq1-agm)
  - [**Thm 2 | INEQ2 AGM**](#thm-2--ineq2-agm)
- [**The Convergence Theorem**](#the-convergence-theorem)
  - [**Thm | Stepsize Sequence for Optimal Convergence Rate of The AGM Triangular Form I**](#thm--stepsize-sequence-for-optimal-convergence-rate-of-the-agm-triangular-form-i)
- [**Why is it Called A similar Triangle Form?**](#why-is-it-called-a-similar-triangle-form)
- [**What Specific Algorithm do we Get**](#what-specific-algorithm-do-we-get)
- [**The Nesterov Similar Triangle Form II, III**](#the-nesterov-similar-triangle-form-ii-iii)


### **Toc for Obsidian Notebook**
```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```

### **Intro**

We use the descent inequality and Lyapunov frameworks proposed in [Convex Proximal Point Method, Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Convex%20Proximal%20Point%20Method,%20Part%20I.md) to derive the method for a specific form of the accelerated gradient. 
We will also prove the convergence rate of the method and deduce the optimal step sizes. 
Before we start, we set up the stage by setting up some quantities that are useful for our derivations later. 

- $f:\R^n \mapsto \overline \R$ is a convex function. 

In this file, we: 
- Introduce the similar triangle form of the Nesterov accelerations method. 
- Derive the convergence rate of the Nesterov accelerations method and optimal stepsizes using the PPM formulations and the Lyaponouv function. Recall results [Nesterov Lower Convergence Bounds for Lipschitz Smooth Functions](../../MATH%20602%20Nesterov%20Acceleration/Convergence%20Rate%20Lower%20Bnd%20for%20Lip%20Functions.md), and we show method proposed in this file can achieve that convergence rate. 

This file has the same goal as the file [Nesterov Acceleration Sequence Method](../../MATH%20602%20Nesterov%20Acceleration/Nesterov%20Original%20Conception%20of%20Momentum%20Method.md). 
For discussion in this file, we reference works by Ahn and Sra ^[K. Ahn and S. Sra, “Understanding nesterov’s acceleration via proximal point method.” arXiv, Jun. 02, 2022. doi: 10.48550/arXiv.2005.08304.
]
The newer derivations using PPM understanding of Nesterov Triangular Form is magnituded easier to understand and follow, and it provides insights into the matter. 

---
### **The Classic, Original Nesterov Accelerations via PPM**
In this section, we discuss the relations between the classic Nesterov accelerated momentum and the PPM method. 
Our goal is to derive the Nesterove accelerations method, derive its convergence rate, and the sequence of stepsizes that achieves the optimal convergence rate. 

#### **Algorithm | PPM Formulation of Nesterov Accelerations**
> Let $x_0\in \R^n$, $y_0 = x_0$, run 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x \in \R^n} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{1}{2\eta_{t + 1}}\Vert x - x_t\Vert^2
>     \right\rbrace & \text{([4.8a])}
>     \\
>     y_{t + 1} &= \argmin{x \in \R^n}
>     \left\lbrace
>         \hat l_f(x; y_t) + \frac{1}{2\eta_{t + 1}} \Vert x - x_{t+ 1}\Vert^2
>     \right\rbrace, & \text{([4.8b])}
> \end{aligned}
> $$
> with $l_f(x; y_t) = f(y_t) + \langle \nabla f(y_t), x - y_t\rangle$, $\hat l_f (x; y_t) = l(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2$. 


#### **Algorithm | AGM Triangular Form I**
> The nesterov triangular has recurrenced based on $(x_t, y_t, z_t)$, with $x_0 = y_0 = z_0$. 
> $$
> \begin{aligned}
>     y_t &= \frac{L^{-1}}{L^{-1} + \eta_t}x_t + 
>     \frac{\eta_t}{L^{-1} + \eta_t} z_t , 
>     & \text{([4.9a])}
>     \\
>     x_{t + 1} &= x_t - \eta_{t + 1} \nabla f(y_t), 
>     & \text{([4.9b])}
>     \\
>     z_{t + 1} &= y_t - L^{-1}\nabla f(y_t). 
>     & \text{([4.9c])}
> \end{aligned}
> $$


#### **Thm | Equivalences Between the two Forms**
> Using the PPM formulations, we d ocan derive the AGM triangular form I.  

**Proof**

Solving (\[4.8a\]) and (\[4.8b\]) we denote $x_{t + 1}$ as the update for (\[4.8a\]) and $y_{t + 1}$ for (\[4.8b\]). 
We skip the routine algebra here and the reader should check that we have 

$$
\begin{aligned}
    x_{t + 1} &=  x_t - \eta_{t + 1} \nabla f(y_t), 
    \\
    y_{t + 1} &= 
    \left(
        \frac{L \eta_{t + 1}}{L \eta_{t + 1} + 1} 
    \right)y_t + 
    \left(
        \frac{1}{L\eta_{t + 1} + 1}
    \right) 
    x_{t + 1} + 
    \left(
        \frac{-\eta_{t + 1}}{1 + L \eta_{t + 1}}
    \right)\nabla f(y_t). 
\end{aligned}
$$

With $\beta_t = (L\eta_t + 1)^{-1}$, we substite $x_{t + 1}$ in the HRS for $y_{t + 1}$, so that we have 


$$
\begin{aligned}
    y_{t + 1} &= L\eta_{t + 1} \beta_t y_t + 
    \beta_t x_{t + 1} - \eta_{t + 1}\beta_t\nabla f(y_t) 
    \\
    &= L\eta_{t+ 1}\beta_{t + 1}(y_t - L^{-1}\nabla f(y_t)) + \beta_{t +1}x_{t + 1}, 
\end{aligned}
$$

with the substituting of $z_{t + 1} = y_t - L^{-1}\nabla f(y_t)$, which occurs before $y_{t + 1}$ we would have for all $t = 0, 1, 2\cdots$

$$
\begin{aligned}
    \begin{cases}
        x_{t + 1} = x_t - \eta_{t + 1} \nabla f(y_t) 
        & \text{([4.9a])}
        \\
        z_{t + 1} = y_t - L^{-1}\nabla f(y_t) 
        & \text{([4.9b])}
        \\
        y_{t + 1} = L\eta_{t + 1}\beta_{t + 1}z_{t + 1}  + \beta_{t  + 1} x_{t + 1}    
        & \text{([4.9c])}, 
    \end{cases}    
\end{aligned}
$$

and the above representation is the same as the AGM Triangular Form I, change the index for (\[4.9c\]) in the last line to $t$ so that it comes before (\[4.9a\]), and expand the definition for $\beta_{t + 1}$ then we have the AGM Triangular Form I. 

**Remarks**

This above algorithm can also be transformed into the classic exptrapolated gradient form as proposed by Nesterov, however, the parameter of the accelerated momentum is complicated, and it requires further assumptiosn on the stepszie parameter $\eta_{t + 1}$. 

#### **Thm 1 | INEQ1 AGM**
> If we execute algorithm: AGM Triangular Form I, for convex and differentiable $f: \R^n \mapsto \overline \R$ with a $L$-Lipschitz gradient, Let $(\eta_t)_{t \in \N}$ be strictly positive,then we can obtain following bound on the Lyponouv function: 
> $$
> \begin{aligned}
>     & \eta_{t + 1}(f(z_{t + 1}) - f(x_*)) + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
>     - \frac{1}{2}\Vert x_* - x_t\Vert^2 
>     \\
>     &\le 
>     \left(
>         \frac{\eta_{t + 1}^2}{2} - \frac{\eta_{t + 1}}{2L} 
>     \right)\Vert \nabla f(y_t)\Vert^2 + 
>     L \eta_{t} \eta_{t + 1} \langle \nabla f(y_t), z_t - y_t\rangle \quad \forall t \in \N, 
> \end{aligned}
> $$
> Where $x_* \in \argmin{x} f(x)$ and we assume it exists, and $(x_t, y_t, z_t)$ are generated by the AGM Triangular Form I. 

**Proof**

Let $\phi_t(x) = \eta_{t + 1}(f(y_t) + \langle \nabla f(y_t), x - y_t\rangle)$, which is a convex function. 
By convexity and $L$-Lipschitz smoothness of $f$, we have the inequalities: 

$$
\begin{aligned}
    \eta_{t + 1} l_f(x; y_t) = 
    \phi_t(x) 
    &\le \eta_{t + 1} f(x) 
    \le 
    \phi_t(x)  + \frac{\eta_{t + 1}L}{2} \Vert x - y_t\Vert^2. 
\end{aligned}
$$

By convexity of $\phi_t$, the PPM Descent Inequalities are

$$
\begin{aligned}
    \phi_t(x_{t + 1}) - \phi_t(x_*) + 
    \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    - \frac{1}{2}\Vert x_* - x_t\Vert^2
    &\le 
    -\frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 \quad \forall x^* \in \R^n. 
\end{aligned}\tag{$[*]$}
$$

~~The above inequality can be viewed as a consequence of ([4.8a]).~~
By the definition of $\phi_t(x)$, we have that

$$
\begin{aligned}
    \phi_t(x_{t + 1}) 
    &= \eta_{t + 1}
    \left(
        f(y_t) + \langle \nabla f(y_t), z_{t + 1} - y_t\rangle 
        + 
        \langle \nabla f(y_t), x_{t + 1} - z_{t + 1}\rangle
    \right)
    \\
    & \quad \text{By Smoothness: }
    \left\lbrace
        \begin{aligned}
            f(z_{t + 1}) - \langle \nabla f(y_t), z_{t + 1} - y_{t} \rangle - f(y_t)
            &\le 
            \frac{L}{2}\Vert z_{t + 1} - y_t \Vert^2, 
            \\
            -(\langle \nabla f(y_t), z_{t + 1} - y_t \rangle + f(y_t))
            &\le 
            \frac{L}{2}\Vert z_{t + 1} - y_t \Vert^2 - f(z_{t + 1}). 
        \end{aligned}
    \right.
    \\
    \implies 
    \phi_t(x_{t + 1}) & \ge 
    \eta_{t + 1} 
    \left(
        f(z_{t + 1}) - \frac{L}{2} \Vert z_{t + 1} - y_t\Vert^2
        + 
        \langle \nabla f(y_t), x_{t + 1} - z_{t + 1}\rangle
    \right) \leftarrow ([\star]). 
\end{aligned}
$$

That is a lower bound and an upper bound would be $\phi_t(x) \le \eta_{t + 1}f(x) \;\forall x$, refer to it as ([$\star *$]). 
Substiting ([$\star$]), ([$\star *$]) into ($\star$) yields: 

$$
\begin{aligned}
    & 
    \eta_{t + 1}(f(z_{t + 1}) - f(x_*)) 
    + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2
    - \frac{1}{2}\Vert x_* - x_t\Vert^2
    \\
    &\le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
    \eta_{t + 1}
    \left(
        \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
        + 
        \langle \nabla f(y_t), z_{t + 1} - x_{t + 1}\rangle
    \right). \leftarrow ([\star*])
\end{aligned}
$$

$f(z_{t + 1})$ comes from RHS of ([$\star$]). 
Other terms in RHS of ([$\star$]) is put as negative as it moves to the RHS of ([$\star*$]). 
To investigate futher, we split the inner product term on RHS of $([\star*])$. 
So, 

$$
\begin{aligned}
    \langle \nabla f(y_t), z_{t + 1} - x_{t + 1}\rangle 
    &= 
    \langle 
    \nabla f(y_t), (z_{t + 1} - y_t)+ (y_t - x_t)
    + (x_t - x_{t + 1})
    \rangle. 
    \\
    \text{from 4.9}: &
    \left\lbrace
    \begin{aligned}
        & 
        x_{t + 1} - x_t = -\eta_{t + 1} \nabla f(y_t)  
        \\
        &
        z_{t + 1} - y_t = L^{-1} \nabla f(y_t) 
    \end{aligned}
    \right\rbrace , 
    \\
    &= 
    \langle \nabla f(y_t), 
    -L^{-1} \nabla f(y_t) + (y_t - x_t) + \eta_{t + 1} \nabla f(y_t) 
    \rangle
    \\
    &= 
    - L^{- 1} \Vert \nabla f(y_t) \Vert^2 + 
    \langle \nabla f(y_t), y_t - x_t\rangle + 
    \eta_{t + 1} \Vert \nabla f(y_t)\Vert^2. 
\end{aligned}
$$

Substitute above back to RHS of $([\star*])$, we obtain the inequality: 

$$
\begin{aligned}
    & 
    \eta_{t + 1}(f(z_{t + 1}) - f(x_*)) 
    + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2
    - \frac{1}{2}\Vert x_* - x_t\Vert^2
    \\
    &\le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
    \eta_{t + 1}
    \left(
        \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
        + 
        \langle \nabla f(y_t), z_{t + 1} - x_{t + 1}\rangle
    \right)
    \\
    &= 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
    \eta_{t + 1}
    \left(
        \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
        - L^{- 1} \Vert \nabla f(y_t) \Vert^2 + 
    \langle \nabla f(y_t), y_t - x_t\rangle + 
    \eta_{t + 1} \Vert \nabla f(y_t)\Vert^2
    \right)
    \\
    &= 
    \left(
        \frac{-\eta_{t + 1}^2}{2} + \frac{\eta_{t + 1}}{2L} - 
        \frac{\eta_{t + 1}}{L} + \eta_{t + 1}^2 
    \right)\Vert \nabla f(y_t)\Vert^2 
    + 
    \eta_{t + 1} \langle \nabla f(y_t), y_t - x_t\rangle
    \\
    &= 
    \left(
        \frac{\eta_{t + 1}^2}{2} - \frac{\eta_{t + 1}}{2L}
    \right) 
    \Vert \nabla f(y_t)\Vert^2  + 
    \eta_{t + 1} \langle \nabla f(y_t), y_t - x_t\rangle. 
\end{aligned}
$$

Use ([4.9a]), we have update relation $y_t - x_t = L \eta_t(z_t - y_t)$ (**The algebra skipped here is not bad.**). 
Which simplifies the above futher 

$$
\begin{aligned}
    &= 
    \left(
        \frac{\eta_{t + 1}^2}{2} - \frac{\eta_{t + 1}}{2L}
    \right) 
    \Vert \nabla f(y_t)\Vert^2  + 
    \eta_{t + 1} \langle \nabla f(y_t), L\eta_t(z_t - y_t)\rangle
    \\
    &=
    \left(
        \frac{\eta_{t + 1}^2}{2} - \frac{\eta_{t + 1}}{2L}
    \right) 
    \Vert \nabla f(y_t)\Vert^2  + 
    L \eta_{t + 1} \eta_t\langle \nabla f(y_t), z_t - y_t\rangle, 
\end{aligned}
$$

And this completes the proof of AGM INEQ1. 


**Remark**

We didnt' use the condition that $x_*$ is a minimizer, this inequality is true for all $x_*$. 
It is unclear why it's stated as such in the original paper. 
It could be the artifacts of something else, and this provide potential directions for generalizations of the proof as well. 

Let's rethink how some of the conditions are made use in the proof for the derivations. 
1. $\phi_t$ has to be a lower bounding function, and it has to be convex in order to make use of the Descent lemma of PPM for convex function. 
2. $f$ just has to be smooth, convexity is not used for INEQ1 AGM, but it's used in INEQ2 AGM, which is the next theorem. 

At (\[*\]), the strategy differs from the analysis of PPM on gradient descent. 

#### **Thm 2 | INEQ2 AGM**
> With the exact same assumption used in Thm 1 for deriving INEQ1, we have additionally the inequality: 
>
> $$
> \begin{aligned}
>     f(z_{t + 1}) - f(z_t) &\le 
>     - \frac{1}{2L} \Vert \nabla f(y_t)\Vert^2
>     + 
>     \langle \nabla f(y_t), y_t - z_t\rangle, 
> \end{aligned}
> $$
> for all $t \in \N$. 

**Proof**

Start by considering 

$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &= f(z_{t + 1}) - f(y_t) + f(y_t) - f(z_t). 
\end{aligned}\tag{$[\star]$}
$$

By update $z_{t + 1} = y_t - L^{-1}\nabla f(y_t)$, and smoothness of $f$, we have inequalities: 

$$
\begin{aligned}
    0 \le f(z_{t + 1}) - f(y_t) - \langle \nabla f(y_t), z_{t +1} - y_t\rangle
    &\le 
    \frac{L}{2}\Vert z_{t + 1} - y\Vert^2
    \\
    \langle \nabla f(y_t), z_{t +1} - y_t\rangle 
    \le f(z_{t + 1}) - f(y_t) 
    &\le  \langle \nabla f(y_t), z_{t +1} - y_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y\Vert^2
    \\
    \text{ substitue: } z_{t + 1} - y_t 
    &= - L^{-1} \Vert z_{t + 1} - y\Vert^2, \text{ we get: }
    \\
    -L^{-1} \Vert \nabla f(y_t)\Vert^2 
    \le 
    f(z_{t + 1}) - f(y_t) &\le 
    \underbrace{
        - L^{-1} \Vert \nabla f(y_t)\Vert^2 + 
        \frac{1}{2L} \Vert \nabla f(y_t)\Vert^2
    }_{
        = - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2
    }. 
\end{aligned}
$$

Substituting the above back into ([$\star$]), we have inquality

$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &\le - \frac{1}{2L} \Vert \nabla f(y_t)\Vert^2
    + f(y_t) - f(z_t), 
\end{aligned}
$$

because $f$ convex we have $f(z_t) - f(y_t) \ge \langle \nabla f(y_t), z_t - y_t\rangle$, giving us 
$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &\le - \frac{1}{2L} \Vert \nabla f(y_t)\Vert^2
    + 
    \langle \nabla f(y_t), z_t - y_t\rangle. 
\end{aligned}
$$

and this is AGM INEQ2. 

**Remarks**

That is the role of (\[4.9b\]) in the proof of the above 2 theorems? 


---
### **The Convergence Theorem**

The eastalishment of Thm 1, 2, which are INEQ1 AGM, INEQ2 AGM, allows us to select for a specific stepsizes sequence $\eta_t$ such that the method of Nesterov Similar Triangle Form I has convergence of $f(z_t)$. 
This is stated by the following theorem: 

#### **Thm | Stepsize Sequence for Optimal Convergence Rate of The AGM Triangular Form I**
> For all $t \in \N$ we define the RHS of INEQ1 AGM, INEQ2 AGM as: 
> $$
> \begin{aligned}    
>     \Upsilon_{1, t + 1}^{\text{AGM}} 
>     &:= 
>     \left(
>         \frac{\eta_{t + 1}^2}{2} - 
>         \frac{\eta_{t + 1}}{2L}
>     \right) \Vert \nabla f(y_t)\Vert^2 
>     + 
>     L \eta_{t} \eta_{t + 1}\langle \nabla f(y_t), z_t - y_t\rangle, 
>     \\
>     \Upsilon^{\text{AGM}}_{2, t + 1} &:= 
>     - \frac{1}{2L} \Vert \nabla f(y_t)\Vert^2 + 
>     \langle \nabla f(y_t), y_t - z_t\rangle. 
> \end{aligned}
> $$
> Next we define the Lyaponouv function for the algorithm as 
> $$
> \begin{aligned}
>     \Phi_t := \left(
>         \sum_{i = 1}^{t}\eta_i
>     \right)(f(z_t) - f(z_*)) + \frac{1}{2} \Vert x_t - x_*\Vert^2, 
> \end{aligned}
> $$
> and for the base case we define $\Phi_0 = \frac{1}{2}\Vert x_0 - x_*\Vert^2$. 
> Here we assume that $x_*$ is a minimizer for $f$. 
> Finally, with the choice of $\eta_t = t/(2L)$, the algorithm of AGM Triangular Form I achieved convergence rate $\mathcal O(t^{-2})$. 

**Observations**

It's $(1/2)\Vert x_t - x_*\Vert^2$ and not $\frac{1}{2}\Vert z_t - x_*\Vert$, this distinguishes it from the simple gradient descent case where similar analysis occurred. 

**Proof**

Directly we consider the quantities: 

$$
\begin{aligned}
    \Phi_{t + 1} - \Phi_t 
    &= 
    \left(
        \sum_{i = 1}^{t + 1} \eta_i
    \right)(f(z_{t + 1}) - f(x_*)) + 
    \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2 
    - 
    \left(
        \sum_{i = 1}^{t} \eta_i
    \right)(f(z_{t}) - f(x_*))
    - 
    \frac{1}{2}\Vert x_{t} - x_*\Vert^2 
    \\
    &= 
    \left(
        \eta_{t + 1} + \sum_{i = 1}^{t} \eta_i 
    \right)\left(
        f(z_{t + 1}) - f(z_t) + f(z_t) - f(z_*)
    \right) + 
    \frac{1}{2} \Vert x_{t + 1} - x_*\Vert^2 
    \\
    &\quad 
    - \left(
        \sum_{i = 1}^{t} \eta_i 
    \right)(f(z_t) - f(x_*))
    - \frac{1}{2}\Vert x_t - x_*\Vert^2 
    \\
    &= 
    \left(
        \sum_{i = 1}^{t}\eta_i
    \right)\left(
        f(z_{t + 1}) - f(z_t)
    \right) + 
    \underbrace 
    {
        \color{red}
        {
            \eta_{t + 1} (f(z_t) - f(x_*))
            + 
            \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2 - 
            \frac{1}{2}\Vert x_t - x_*\Vert^2. 
        }
    }_{
        \le \Upsilon_{1, t+1}^{\text{AGM}}, \text{ by INEQ1 AGM}
    }
    \\
    \implies 
    \Phi_{t + 1} - \Phi_t
    &\le 
    \Upsilon_{1, t+1}^{\text{AGM}}
    + 
    \left(
        \sum_{i = 1}^{t} \eta_i
    \right)(f(z_{t + 1}) - f(z_t)) 
    \\
    &\le
    \Upsilon_{1, t+1}^{\text{AGM}}
    + 
    \left(
        \sum_{i = 1}^{t} \eta_i
    \right)\Upsilon_{2, t + 1}^{\text{AGM}}. 
\end{aligned}
$$

And on the last line, we used the INEQ2 AGM inequality and the fact that $f(z_*)$ is a minimum, so we also use $\eta_{n + 1}(f(z_{t + 1}) - f(z_*)) \le 0$ to get the inequality. 
For the algorithm to work, one way is to assure the monotone convergence of the sequence $\Phi_t$ for a suitable choice of stepsize sequence $(\eta_t)_{t \in \N}$. 
To do that we invoke the definition of $\Upsilon_{1, t + 1}^{\text{AGM}}, \Upsilon_{2, t + 1}^{\text{AGM}}$, so: 

$$
{\small
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AGM}} 
    + 
    \left(
        \sum_{i = 11}^{t}\eta_i
    \right)
    \Upsilon_{2, t + 1}^{\text{AGM}}
    &= 
    \left(
        \frac{\eta_{t + 1}^2}{2} - \frac{\eta_{t + 1}}{2L}
    \right)\Vert 
        \nabla f(y_t)
    \Vert^2 + 
    L\eta_t \eta_{t + 1} \langle \nabla f(y_t), z_t - y_t\rangle 
    \\
    &\quad+ 
    \left(
        \sum_{i = 1}^{t} \eta_i
    \right)\left(
        - \frac{1}{2L} \Vert \nabla f(y_t)\Vert^2 + 
        \langle \nabla f(y_t), y_t - z_t\rangle
    \right)
    \\
    &= 
    \left(
        \frac{\eta_{t + 1}^2}{2} 
        - \frac{1}{2L} \sum_{i = 1}^{t + 1}\eta_i
    \right)\Vert \nabla f(y_t)\Vert^2 
    + 
    \left(
        \sum_{i = 1}^{t}\eta_{i} - L\eta_t\eta_{t + 1}
    \right)\langle \nabla f(y_t), y_t - z_t\rangle 
    \\
    &\le 0. 
\end{aligned}
}
$$

To satify the inequalities, the sequence of stepsizes $\eta_t$ should set the stepsize inner prodcut to be zero and setting the gradient $\Vert \nabla f(y_t)\Vert^2$ to be non-positive. 
Which gives us 

$$
\begin{aligned} 
    \begin{cases}
        \sum_{i = 1}^{t} \eta_i = L\eta_t\eta_{t + 1}, 
        \\
        L \eta_{t + 1}^2 - \sum_{i = 1}^{t + 1} \eta_i \le 0. 
    \end{cases}
\end{aligned}
$$

Substituting the sum from the first inequality into the second inequality it yields: 

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

Now, observe that we may **suggests** the stespzies to be $\eta_{t} = t/(2L)$, so that the inequality is satisfied, alternatively, $\eta_{t} = t/L$, works too (but it will break the equality $\sum_{i = 1}^{t}\eta_i = L\eta_t\eta_{t + 1}$). 
To derive the convergence rate, we use $\Phi_t$ and do $\forall t \in \N$

$$
\begin{aligned}
    \Phi_{t + 1} - \Phi_t 
    &\le 0 
    \\
    \implies 
    \Phi_{t + 1} \le \Phi_0 
    &= \frac{1}{2} \Vert x_0 - x_*\Vert^2 
    \\
    \left(
        \sum_{i = 1}^{t}\eta_i
    \right)(f(z_t) - f(x_*)) 
    + 
    \frac{1}{2}\Vert x_t - x_*\Vert^2 
    &\le 
    \frac{1}{2}\Vert x_0 - x_*\Vert^2 
    \\
    \implies 
    \left(
        \sum_{i = 1}^{t}\eta_i
    \right)(f(z_t) - f(x_*)) 
    &\le 
    \frac{1}{2}\Vert x_0 - x_*\Vert^2 
    \\
    f(z_t) - f(x_*) &\le 
    \frac{1}{2}\left(
        \sum_{t = 1}^{t}\eta_i
    \right)^{-1}
    \Vert x_0 - x_*\Vert^2, 
\end{aligned}
$$

with $\eta_t = t/L$, the convergence rate of $f(z_t) - f(x_*)$ is in the class of $\mathcal O(t^{-2})$. 
As testified by Nesterov's seminal works, this convergence rate is optimal for all Convex Lipschitz Smooth function $f$. 


**Remarks**

I am still not sure where we used the fact that $x^*$ is the minimizers, except at the very last step where we need it to derive the convergence rate of the optimal gap $f(z_t) - f(x_*)$ where it only makes sense to have $x_*$ to be the minimizer. 


---
### **Why is it Called A similar Triangle Form?**

Consider $([4.9a])$, which gives 

$$
\begin{aligned}
    y_t &= \frac{L^{-1}}{L^{-1} + \eta_t}x_t + \frac{\eta_t}{L^{-1} + \eta_t} z_t
    \\
    &= \frac{1}{1 + L\eta_t} x_t + 
    \frac{L\eta_t}{1 + L \eta_t} z_t
    \\
    \iff 
    (1 + L\eta_t)y_t
    &= 
    x_t + L\eta_t z_t
    \\
    \iff 
    y_t - x_t &= 
    L\eta_t(z_t - y_t), \text{collinear vectors}. 
    \\
    \implies 
    \frac{\Vert y_t - x_t \Vert}{\Vert z_t - y_t\Vert} &= L\eta_t, 
\end{aligned}
$$

for all $t \in \N$. 
The triangle is with vertices $(y_t, z_t, z_{t + 1})$, and $(x_t, z_t, x_{t + 1})$. 
With $y_t - x_t = L\eta_t(z_t - y_t)$, we have 3 points $y_t, x_t, z_t$ all lies on the same line. 
By $([4.9b])$ we have $x_{t + 1} - x_t = -\eta_{t + 1}\nabla f(y_t)$, and $z_{t + 1} - y_t = -L^{-1} \nabla f(y_t)$, therefore the vector $z_{t + 1} - y_t$ are collinear with $x_{t + 1} - x_t$. 
However, the vector $z_t - z_{t + 1}$, and $z_{t + 1} - x_{t + 1}$ may not align. 
See the image below for an illustrations. 
![](../../Assets/Pasted%20image%2020240516224535.png)

The author argue that, by aligningthe vector $z_t - z_{t + 1}$ with $z_{t + 1} - x_{t + 1}$, we can get two more Nesterov Accelerations method, which is variants of the Nesterov Trianglular Form I, but with a different sequence that also makes the algorithm converges at the same rate. 
To achieve that, we are presented with only two choices: 
1. Modify $x_{t + 1}$. In which we choose $\eta_{t + 1}$ carefully to allow that. 
2. Modify $z_{t + 1}$. In which we choose a different stepsizes to for $z_{t + 1}$ on the method of gradient descent to allow that. 

---
### **What Specific Algorithm do we Get**

If we substitute the choice of stepsize, we will obtain a form of nesterov accelerated method that I never seen before. 



---
### **The Nesterov Similar Triangle Form II, III**

We repeat the same proof ideas, but proving several variants of Nesterov using one single formulations of PPM and the ideas of similar triangle. 


See [Nesterov Type Acceleration via Proximal Point Method Part II](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20II.md) for more stories. 



