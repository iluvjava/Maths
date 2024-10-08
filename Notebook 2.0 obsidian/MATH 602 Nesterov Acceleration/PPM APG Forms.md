- [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)
- [A Better Proof for FISTA Convergence](A%20Better%20Proof%20for%20FISTA%20Convergence.md)

---
- [**Intro**](#intro)
  - [**Assumptions Set 1**](#assumptions-set-1)
  - [**Assumption Set 2**](#assumption-set-2)
  - [**Assumption Set 3**](#assumption-set-3)
  - [**Assumption Set 4**](#assumption-set-4)
  - [**Assumption Set 5**](#assumption-set-5)
- [**Generic Forms**](#generic-forms)
  - [**Def | SC PPM APG**](#def--sc-ppm-apg)
  - [**Def | Generic SC APG**](#def--generic-sc-apg)
  - [**Def | Generic APG**](#def--generic-apg)
  - [**Def | SC Generic Similar Triangle**](#def--sc-generic-similar-triangle)
  - [**Def | Generic Nestrov's Momentum Form**](#def--generic-nestrovs-momentum-form)
  - [**Def | Generic Accelerated Mirror Descent (AMD) PPM Form**](#def--generic-accelerated-mirror-descent-amd-ppm-form)
  - [**Def | Generic SC PPM APPM**](#def--generic-sc-ppm-appm)
  - [**Def | Generic PPM APPM**](#def--generic-ppm-appm)
- [**Nesterov AG form appeared as in the literatures**](#nesterov-ag-form-appeared-as-in-the-literatures)
  - [**Definition | Nes 2.2.7**](#definition--nes-227)
  - [**Definition | Nes 2.2.19**](#definition--nes-2219)
  - [**Def | Chambolle, Dossal 2015**](#def--chambolle-dossal-2015)
  - [**Def | V-FISTA**](#def--v-fista)
- [**Misc Remarks about the Generic form**](#misc-remarks-about-the-generic-form)
  - [**Remarks on SC PPM APG**](#remarks-on-sc-ppm-apg)
  - [**Remarks on Generic AGP**](#remarks-on-generic-agp)
  - [**Remarks on Nes (2.2.7)**](#remarks-on-nes-227)
  - [**Remarks on Generic Nestrov's Momentum Form**](#remarks-on-generic-nestrovs-momentum-form)
  - [**Remarks on Chambolle Dossal 2015**](#remarks-on-chambolle-dossal-2015)
- [**Necessary Derivations of these forms**](#necessary-derivations-of-these-forms)
  - [**Demonstration for: SC PPM APG**](#demonstration-for-sc-ppm-apg)
- [**Analysis of these forms**](#analysis-of-these-forms)


---
### **Intro**

To understand this file, we must first read [PPM Interpretation of APG Algorithm Preludes](PPM%20Interpretation%20of%20APG%20Algorithm%20Preludes.md). 
In this file: 
1. Introduce a (Proximal Point Method) PPM interpretation of (Accelerated Proximal Gradient) APG
2. Show that several of real world algorithms can be fit into this form by changing specific parameters on the definition. 

In this file, let the ambience space be $\R^n$. 
$\Vert \cdot\Vert$ is 2-norm unless stated to be something else. 

#### **Assumptions Set 1**
> 1. $h = f + g$. 
> 2. $f, g$ are convex and $f$ is $L$-Lipschitz smooth, with $L$ being any Lipschitz constant that is larger than the smallest global lipschitz constant of the gradient. 
> 3. $T_L = [I + L^{-1}\partial g]\circ [I - L^{-1}\nabla f]$ is the proximal gradient operator. 
> 4. $\mathcal G_L = I - \mathcal T_L$ is the gradient mapping operator. 


#### **Assumption Set 2**
> Assume assumption 1, in addition, assume that $f$ is strongly convex with $\mu > 0$. 


#### **Assumption Set 3**
> Assume assumption 1, in addition, assume that $f$ is strongly convex with $\mu \ge 0$. 

#### **Assumption Set 4**
> Assume assumption Set 3, in addition assume that $\mu = 0$. 

#### **Assumption Set 5**
> Let $Q \subseteq \R^n$, let $\Vert \cdot\Vert$ be any norm on $\R^n$. 
> 1. $h = f + g$
> 2. $g: Q \mapsto \overline \R$ to be a convex function. 
> 3. $f$ is L-Smooth wrt to norm $\Vert \cdot\Vert$
> 3. Let $\Xi : Q \mapsto \overline \R$ 
>   * be a function that is strongly convex to $\Vert \cdot\Vert$. 
>   * Be differentiable on $\text{int} Q$
> 4. Let $D_\Xi(,)$ be a Bregman Divergence induced by $\Xi$. 


---
### **Generic Forms**

To list out the generic representation different type of algorithms, we list the following assumption sets. 


#### **Def | SC PPM APG**
> Let $h = f + g, \mathcal G_L, \mathcal T_L$ and parameter $L \ge \mu \ge 0$ be given by Assumption Set 3. 
> Define the lower bouding function for any $x \in \R^n$, we have for all $z \in \R^n$: 
> $$
> \begin{aligned}
>     l_h(z; x) = h(\mathcal T_L x) + \langle \mathcal G_L (x), z - x\rangle
>     + 
>     \frac{L}{2}\Vert x - \mathcal T_L (x)\Vert^2 + \frac{\mu}{2}\Vert z - x\Vert^2
> \end{aligned}
> $$
> For any positive sequence of stepsizes $(\tilde \eta_t)_{t \in \N}, (\eta_t)_{t \in \N}$, and any initial iterates $x_0 = y_0$, let parameter $L \ge \mu \ge 0$, we define an algorithm such that iterates $(x_t, y_t)_{t \in \N}$ is given by: 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>     l_h(x; y_t) + \frac{1}{2\tilde \eta_{t}} 
>     \Vert x - x_t\Vert^2
>     \right\rbrace
>     \\
>     &= (\mu\tilde \eta_{t} + 1)^{-1} 
>     (\mu\tilde \eta_{t}y_t + x_t - \tilde \eta_{t}\mathcal G_L(y_t))
>     \\
>     y_{t + 1}&= 
>     \argmin{x}
>     \left\lbrace
>         h(\mathcal T_L y_t) + \langle \mathcal G_L(y_t), x - y_t\rangle + \frac{L}{2}\Vert x -y_t\Vert^2
>         + \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace
>     \\
>     &= (1 + L \eta_{t +1})^{-1}(L\eta_{t + 1}(y_t - L^{-1}\mathcal G_L(y_t)) + x_{t + 1})
> \end{aligned}
> $$

#### **Def | Generic SC APG**
> Let $h = f + g, \mathcal G_L, \mathcal T_L$ be given by Assumption Set 3. 
> Define an algorithm satisfying the following conditions for its iterates $(w_t, x_{t + 1}, z_{t + 1}, y_{t + 1})$. 
> $$
> \begin{aligned}
>     w_{t} &= (\mu\tilde \eta_{t} + 1)^{-1}(\mu \tilde \eta_{t} y_t + x_t) 
>     \\
>     x_{t + 1}&= w_t - \tilde \eta_{t}(\mu\tilde \eta_{t} + 1)^{-1} \mathcal G_L(y_t)
>     \\
>     z_{t + 1}&= y_t - L^{-1}\mathcal G_L(y_t)
>     \\
>     y_{t + 1} &= (1 + L\eta_{t + 1})^{-1}(L\eta_{t + 1}z_{t + 1} + x_{t + 1}). 
> \end{aligned}
> $$


#### **Def | Generic APG**
> Let $h = f + g, \mathcal G_L, \mathcal T_L, L$ be given by Assumption Set 4. 
> This algorithm is a special case of SC Generic AG and it's obtained by setting $\mu = 0$: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \tilde \eta_{t} \mathcal G_L (y_t)
>     \\
>     z_{t + 1} &= y_t - L^{-1}\mathcal G_L (y_t)
>     \\
>     y_{t + 1} &= (1 + L \eta_{t + 1})^{-1}(L\eta_{t + 1}z_{t + 1} + x_{t + 1})
> \end{aligned}
> $$

#### **Def | SC Generic Similar Triangle**
> Let $h = f + g, \mathcal G_L, \mathcal T_L, L$ be given by Assumption Set 3. 
> Let iterates $(x_t, y_t, z_t)$ be given by SC Generic AG. 
> If in addition, the stepsizes $\eta_t, \tilde \eta_t$ satisfies equality 
> $$\tilde\eta_{t} = \eta_t + L^{-1} + L^{-1} \mu \tilde\eta_{t},$$
> then 
> $$
>   x_{t + 1} = z_{t + 1} + 
>   \frac{L\eta_t}{1 + \mu \tilde \eta_{t}} 
>   (z_{t + 1} - z_t). 
> $$ 


#### **Def | Generic Nestrov's Momentum Form**
> Let $h = f + g, \mathcal G_L, \mathcal T_L$ and parameters $L$ be given by Assumption Set 3.
> Define a positive sequence of parameters $(\theta_t)_{t \in \N}$
> Then the momentum form of the algorithm has iterates satisfying the recurrences for all $t \in \N \cup \{0\}$: 
> $$
> \begin{aligned}
>     z_{t + 1} &= y_t - L^{-1}\mathcal G_L(y_t)
>     \\
>     y_{t + 1 } &= z_{t + 1} + \theta_{t + 1}(z_{t + 1} - z_t)
> \end{aligned}
> $$
> For some $\theta_{t + 1} \ge 0$. 


#### **Def | Generic Accelerated Mirror Descent (AMD) PPM Form**

#### **Def | Generic SC PPM APPM**

#### **Def | Generic PPM APPM**



---
### **Nesterov AG form appeared as in the literatures**

In here we present how some of the literatures present the method of Nesterov's AG method.

#### **Definition | Nes 2.2.7**
> Described in Nesterov ^[Y. Nesterov, Lectures on Convex Optimization, vol. 137. in Springer Optimization and Its Applications, vol. 137. Cham: Springer International Publishing, 2018. doi: 10.1007/978-3-319-91578-4.] (2.2.7), is an accelerated gradient method. 
> Here we faithfully resented it as the way it is in the book.
> Let $f$ be a $L$ Lipschitz smooth and $\mu\ge 0$ strongly convex function. 
> Choose $x_0$, $\gamma_0 > 0$, set $v_0 = x_0$, for iteration $k\ge 0$ it: 
> 1. Computes $\alpha_k \in (0, 1)$ by solving $L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 2. Set $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 3. Choose $y_k = (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)$. Compute $f(y_k)$ and $\nabla f(y_k)$. 
> 4. Find $x_{k + 1}$ such that $f(x_{k + 1}) \le f(y_k) - (2L)^{-1} \Vert \nabla f(y_k)\Vert^2$. 
> 5. Set $v_{k + 1} = \gamma_{k+1}^{-1}((1 - \alpha_k)\gamma_kv_k + \alpha_k \mu y_k - \alpha_k \nabla f(y_k))$. 

#### **Definition | Nes 2.2.19**
> Described in Nesterov's 2018 textbook, (2.2.20) is the same as (2.2.7) but simplified into a less intimidating representation. 
> $$
> \begin{aligned}
>     & \text{0. Choose any $x^{(0)} \in \mathbb R^n, \alpha_0 \in (0, 1),  y^{(0)} = x^{(0)}$}. 
>     \\
>     & \text{1. the k th iteration $k \ge 0$ is }
>     \\
>     & \quad 
>     \begin{aligned}
>         & \text{(a.) } x^{(k + 1)} = y_k - L^{-1}\nabla f(y^{(k)})
>         \\
>         & \text{(b.) } 
>         \alpha_{k + 1} \in (0, 1) \text{ s.t: }
>         \alpha_{k + 1}^2 = (1 + \alpha_{k + 1})\alpha_k^2 + q_f \alpha_{k + 1}
>         \\
>         & \text{(c.) } 
>         \beta_k := \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}
>         \\
>         & \text{(d.) }
>         y^{(k + 1)} = x^{(k + 1)} + \beta_k\left(
>             x^{(k + 1)} - x^{(k)}
>         \right)
>     \end{aligned}
> \end{aligned}
> $$

#### **Def | Chambolle, Dossal 2015**
> Let $h = f + g, \mathcal G_L, \mathcal T_L, L$ be given by Assumption Set 3. 
> A similar triangle form is defined through the iterates $(y_n, x_n, z_n)$ and the sequence $(t_n)_{n \in \N}$ via the recurrences for all $n \in \N$: 
> $$
> \begin{aligned}
>     z_{n + 1} &= y_n - L^{-1}\mathcal G_L(y_n)
>     \\
>     x_{n + 1} &= z_n + t_{n} (z_{n + 1} - z_n), 
>     \\
>     y_{n + 1} &= \left(
>         1 - \frac{1}{t_{n + 1}}
>     \right)z_{n + 1} + \left(
>         \frac{1}{t_{n + 1}}
>     \right)x_{n + 1}. 
> \end{aligned}
> $$
> Where the sequence $t_n$ satisfies $t_{n + 1}^2 - t_n^2 \le t_{n + 1}$. 


#### **Def | V-FISTA**
> With $h = f + g, \mathcal G_L, \mathcal T_L$ and parameters $L \ge \mu > 0$  be given by Assumption Set 2. 
> Then V-FISTA is presented as: 
> $$
> \begin{aligned}
>     z_{t + 1} 
>     &= y_t - L^{-1}\mathcal G_L(y_t)
>     \\
>     y_{t + 1} &= z_{t + 1} + 
>     \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}
>     (z_{t +1} - z_t). 
> \end{aligned}
> $$
> Where the condition number $\kappa = L/\mu$. 



---
### **Misc Remarks about the Generic form**

In this section, we demonstrate, discuss, about the generic form listed in the previous section. 

#### **Remarks on SC PPM APG**
This is very similar to algorithm presented in section 6 of Ahn and Sra's paper on understanding Nesterov acceleration method via proximal point method. 
It admits alternative representations: 

$$
\begin{aligned}
    w_{t} &= (\mu\tilde \eta_{t + 1} + 1)^{-1}(\mu \tilde \eta_{t + 1} y_t + x_t) 
    \\
    x_{t + 1}&= w_t - \tilde \eta_{t + 1}(\mu\tilde \eta_{t + 1} + 1)^{-1} \mathcal G_L(y_t)
    \\
    z_{t + 1}&= y_t - L^{-1}\mathcal G_L(y_t)
    \\
    y_{t + 1} &= (1 + L\eta_{t + 1})^{-1}(L\eta_{t + 1}z_{t + 1} + x_{t + 1}). 
\end{aligned}
$$



#### **Remarks on Generic AGP**
Setting $\mu = 0$ in SC PPM APG yields generic APG. 


#### **Remarks on Nes (2.2.7)**

For a faithful derivations of the above algorithm along with its convergence framework work, visits [Nesterov Estimating Sequence](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md) for the gory details about the above algorithm. 

#### **Remarks on Generic Nestrov's Momentum Form**

This form fits [V-FISTA](V-FISTA.md), and [A Better Proof for FISTA Convergence](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md).
This algorithm is the popular and compacted version of accelerated gradient. 
When it's generically phrase, it may be refers to be the "extrapolated gradient" accelerated method, distinguishing it from the Polyak Inertia algorithm. 


#### **Remarks on Chambolle Dossal 2015**

When $t^2_{n + 1} - t_n^2 = t_{n + 1}$, then this recovers the FISTA algorithm as in Amir Beck's work for FISTA. 


---
### **Necessary Derivations of these forms**

#### **Demonstration for: SC PPM APG**
The functions inside of "argmin" is easy to solve because they are just quadratic functions. 
We write it here for future verifications and a peace of the mind. 

$$
\begin{aligned}
    x_{t + 1} &= \argmin{x}\left\lbrace
        \langle \mathcal G_L(y_t), x - y_t\rangle 
        + 
        \frac{\mu}{2}\Vert x - y_t\Vert^2 +  
        \frac{1}{2\tilde \eta_{t}}\Vert x - x_t\Vert^2
    \right\rbrace
    \\
    \iff 
    \mathbf 0 & = 
    \mathcal G_L(y_t) + \mu(x - y_t) + \tilde \eta_{t}^{-1}(x - x_t)
    \\
    &= 
    \mathcal G_L(y_t) + (\mu + \tilde \eta_{t}^{-1}) x - \mu y_t - \tilde \eta_{t}^{-1} x_t
    \\
    \iff 
    (\mu + \tilde \eta_{t}^{-1})x 
    &= 
    \mu y_t + \tilde \eta_{t}^{-1} x_t - \mathcal G_L(y_t)
    \\
    \implies 
    x &= (\mu + \tilde \eta_{t}^{-1})^{-1 }
    (\mu y_t + \tilde \eta_{t}^{-1} x_t - \mathcal G_L(y_t)). 
\end{aligned}
$$

We can make the assumption that $\mu + \eta_{t}^{-1} > 0$ because $\tilde\eta_t > 0$. 
Similarly for $y_{t + 1}$, it's solving a simple quadratic minimization problem, yielding: 

$$
\begin{aligned}
    \mathbf 0 &= \mathcal G_L(y_t) + L(x - y_t) + \eta_{t + 1}^{-1}(x - x_{t + 1})
    \\
    &= (L + \eta_{t + 1}^{-1})x - L y_t - \eta_{t + 1}^{-1}x_{t + 1} + \mathcal G_L(y_t) 
    \\
    (L + \eta_{t + 1}^{-1})x &= 
    Ly_t + \eta_{t + 1}^{-1} x_{t + 1} - \mathcal G_L(y_t)
    \\
    \implies 
    x &= 
    (L\eta_{t + 1} + 1)^{-1}(L\eta_{t + 1}(y_t - L^{-1}\mathcal G_L(y_t)) + x_{t + 1}). 
\end{aligned}
$$

We had verified the results for the peace of the mind. 

---
### **Analysis of these forms**

See [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md) for more information. 