- [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)
- [A Better Proof for FISTA Convergence](A%20Better%20Proof%20for%20FISTA%20Convergence.md)

---
### **Intro**

To understand this file, we must first read [PPM AG Preludes](PPM%20AG%20Preludes.md). 
In this file: 
1. Introduce a (Proximal Point Method) PPM interpretation of (Accelerated Proximal Gradient) APG
2. Show that several of real world algorithms can be fit into this form by changing specific parameters on the definition. 

In this file, let the ambience space be $\R^n$. 
$\Vert \cdot\Vert$ is 2-norm unless stated to be something else. 

---
### **Generic Forms**

To list out the generic representation different type of algorithms, we list the following assumption sets. 

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

#### **Assumption set 5**
> Let $Q \subseteq \R^n$, let $\Vert \cdot\Vert$ be any norm on $\R^n$. 
> 1. $h = f + g$
> 2. $g: Q \mapsto \overline \R$ to be a convex function. 
> 3. $f$ is L-Smooth wrt to norm $\Vert \cdot\Vert$
> 3. Let $\Xi : Q \mapsto \overline \R$ 
>   * be a function that is strongly convex to $\Vert \cdot\Vert$. 
>   * Be differentiable on $\text{int} Q$
> 4. Let $D_\Xi(,)$ be a Bregman Divergence induced by $\Xi$. 
> 


#### **Def | S-CVX PPM AG**
> Let $h = f + g, \mathcal G_L, \mathcal T_L$ and parameter $L \ge \mu \ge 0$ be given by Assumption Set 3. 
> Define the lower bouding function at $x$: 
> $$
> \begin{aligned}
>     l_h(z; x) = h(\mathcal T_L x) + \langle \mathcal G_L (x), z - x\rangle
>     + 
>     \frac{L}{2}\Vert x - \mathcal T_L (x)\Vert^2 + \frac{\mu}{2}\Vert z - x\Vert^2
> \end{aligned}
> $$
> For any sequence of $\tilde \eta_t, \eta_t$ and parameter $L \ge \mu \ge 0$, we define the following algorithm. 
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

#### **Def | S-CVX Generic AG**
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


#### **Def | Generic AG**
> Let $h = f + g, \mathcal G_L, \mathcal T_L, L$ be given by Assumption Set 4. 
> This algorithm is a special case of S-CVX Generic AG and it's obtained by setting $\mu = 0$: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t + \tilde \eta \mathcal G_L (y_t)
>     \\
>     z_{t + 1} &= y_t - L^{-1}\mathcal G_L (y_t)
>     \\
>     y_{t + 1} &= (1 + L \eta_{t + 1})^{1}(L\eta_{t + 1}z_{t + 1} + x_{t + 1})
> \end{aligned}
> $$

#### **Def | Generic Similar Triangle Form**
> Let $h = f + g, \mathcal G_L, \mathcal T_L, L$ be given by Assumption Set 3. 
> Let iterates $(x_t, y_t, z_t)$ be given by S-CVX Generic AG. 
> If in addition, the stepsizes $\eta_t, \tilde \eta_t$ satisfies equality 
> $$\tilde\eta_{t} = \eta_t + L^{-1} + L^{-1} \mu \tilde\eta_{t},$$
> then 
> $$
>   x_{t + 1} = z_{t + 1} + 
>   \frac{L\eta_t}{1 + \mu \tilde \eta_{t}} 
>   (z_{t + 1} - z_t). 
> $$ 

#### **Def | Chambolle, Dossal 2015**
> Let $h = f + g, \mathcal G_L, \mathcal T_L, L$ be given by Assumption Set 3. 
A similar triangle form is defined through the iterates $(y_n, x_n, z_n)$ and the sequence $(t_n)_{n \in \N}$ via the recurrences for all $n \in \N$: 
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

#### **Def | Generic Nestrov's Momentum Form**
> Let $h = f + g, \mathcal G_L, \mathcal T_L$ and parameters $L$ be given by Assumption Set 3. 
> Then the momentum form of the algorithm has iterates satisfying the recurrences: 
> $$
> \begin{aligned}
>     z_{t + 1} &= y_t - L^{-1}\mathcal G_L(y_t)
>     \\
>     y_{t + 1 } &= z_{t + 1} + \theta_{t + 1}(z_{t + 1} - z_t)
> \end{aligned}
> $$
> For some $\theta_{t + 1} \ge 0$. 


#### **Def | Generic Accelerated Mirror Descent (AMD) PPM Form**

#### **Def | Generic S-CVX APPM**





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



---
### **Misc notes about the Generic form**

In this section, we demonstrate, discuss, about the generic form listed in the previous section. 


#### **Remarks on Nes (2.2.7)**

For a faithful derivations of the above algorithm along with its convergence framework work, visits [Nesterov Estimating Sequence](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md) for the gory details about the above algorithm. 

#### **Remarks on Generic Nestrov's Momentum Form (Def 1.4)**

This form fits [V-FISTA](V-FISTA.md), and [A Better Proof for FISTA Convergence](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md).
This algorithm is the popular and compacted version of accelerated gradient. 
When it's generically phrase, it may be refers to be the "extrapolated gradient" accelerated method, distinguishing it from the Poly Momentum Counter part. 


---
### **Analysis of these forms**

See [PPM AG Forms Analysis](PPM%20AG%20Forms%20Analysis.md) for more information. 