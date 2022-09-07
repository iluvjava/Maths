It's some what related to: [Intro to Pertubations Theory](../AMATH%20502%20Intro%20to%20Dynamical%20Systems%20and%20Chaos/Intro%20to%20Pertubations%20Theory.md)

---
### **Intro**

Boundary Layers, Interior Layer is a phenomena associated with the bahaviours of boundary value problems when it's perturbed in such a way that produces stiffness to the solution of the problem. 

These type of problems are hard to solve numerically and they motivates more advanced method of solving steady state solution numerically, e.g: Non-uniform/adaptive grid points method. 

---
### **1D Heat Flow**

Consider the BVP: 

$$
\begin{cases}
    u(0, t) = \alpha(t)
    \\
    u_t + au_x  = \kappa u_{xx} + \psi
\end{cases}\tag{0}
$$

$a$ is the flow speed, $\kappa$ is the heat conductivity on the rod and. Here, we assume that the heat source is at $x = 0$. When the system is not time dependent, meaning $\alpha(t)\equiv \alpha$, then steady state solution exists for the problem. 

The critical quantities: $\kappa, a$

* When $\kappa = 0, a\neq 0$, the system is a 2nd order system, and it would need 2 boundary conditions to work. We need the boundary conditions: $u(1, t) = \beta(t)$. This is true because heat equations simply requires both of these boundaries conditions. 
* When $a = 0$, this is just the normal heat equation, without any flows of the fluid and stuff like that. 

Now suppose that boundary conditions, and the source function $\psi$ are not time dependent, then we can intuitively reason that the steady state solution is simply solving the ODE system: 

$$
\begin{cases}
    au'(x) =\kappa u''(x) + \psi(x)
    \\
    u(0) = \alpha, u(1) = \beta
\end{cases}\tag{1}
$$


### **Dampped Harmonic Oscillator**

A harmonic oscillator who's speed is dampped by some kind threshold: 

$$
\begin{cases}
    \epsilon u'' + u(u - 1) = 0 & x\in[a, b]
    \\
    u(a) = \alpha, u(b) = \beta
\end{cases}\tag{2}
$$

This is a second order system when $\epsilon \neq 0$, requiring 2 boundary conditions to determine a unique solutions for the ODE problems. 


---
### **Boundary Layer: The Steady State Problem and Pertubations of Peclet Numbers**

The ratio: $\epsilon=\kappa/a$ determines the appearance of the boundary layers. When float speed is high and heat conductivity is small, the ratio is close to zero, and that is when the solution perturbes fundamentally and has stiffness in it. When $\epsilon$ is small, (1) is referred to as a <u>*singularly Perturbed Equation*</u>. in contrast, if $a$ is perturbed from zeros while $\kappa$ remains relatively large, system (1) is referred to as a <u>*regular perturbations*</u>. Adding small cofficients to the higher order of derivative might be a bad idea. 

**Intuitions**

When $\epsilon > 0$, this is 2nd order ODE and it has 2 boundaries conditions to satisfies, but when $\epsilon >> 0$, it's very close to a first order ODE but with that constraints, it will have to still satisfies the B.C for 2 of the boundaries conditions, which is problematic. 

In fact, the analytical solution for the system is here, stated as (2.90) in the textbook(Finite Difference Method for Ordinary and Partial Differential Equations). 

$$
    u(x)=\alpha+x+(\beta-\alpha-1)\left(\frac{e^{x / \epsilon}-1}{e^{1 / \epsilon}-1}\right) \tag{3}
$$


---
### **Interior Layers: Damped Harmonic Oscilator**

The problem is phrased as: 

$$
\begin{cases}
    \epsilon u'' + u(u' - 1) = 0 & x \in [a, b]
    \\
    u(a) = \alpha, u(b) = \beta
\end{cases}\tag{4}
$$

A singular perturbations occured as $\epsilon$ goes from $0$ to $\neq 0$. Consider $\epsilon = 0$, we have the ode: 

$$
u(u' - 1) = 0 \tag{5}
$$

Either one of the boundary conditions $u(a) = \alpha$ or $u(b) = \beta$ would suffice the problem. The solution to (5) would be $u(x) \equiv 0, u(x) = x +C$, where $C$ is a non-paramaterized constant. Depending on which of the boundary condition is imposed for (5), the solution to the system is: 

$$
\begin{cases}
    u(x) = x + \alpha - \alpha & u(a) = \alpha 
    \\
    u(x) = x - \beta + b & u(b) = \beta
\end{cases}\tag{6}
$$

Under the case when $\epsilon$ is small, the both boundary conditions need to be satisfied, and in that case there will have to be a jump from linear the smooth linears in expression (6). 

**Philosophy Time**

We dont't know what is the solution, nor we are going to know where the interior layer is at eaxactly without solving it. Let's instead consider another form of the function $u$, and then substitute it into (6) and test out some of the characteristics this function must possess. 

Assume the form: 

$$
\begin{aligned}
    u(x) &= W((x - \bar{x})/\epsilon^k) 
    \\
    u'(x) &=\epsilon^k W'((x - \bar{x})/\epsilon^k)
    \\
    u''(x) &= \epsilon^{2k}W''((x - \bar{x})/\epsilon^k)
\end{aligned}\tag{7}
$$

Substitute it back to the original differential equation, we have: 

$$
\begin{aligned}
    \epsilon \epsilon^k W(\xi) + W(\xi)(\epsilon^{k - 1}W'(\xi) - \epsilon^{2k - 1}) 
    &= 0
    \\
    W''(\xi) + W(\xi) (\epsilon^{k - 1}W'(\xi)- \epsilon^{2k - 1}) 
    &= 0
    \\
    \text{Where: }\xi = \frac{(x - \bar{x})}{\epsilon^k}
\end{aligned}\tag{8}
$$

For any $x \neq \bar{x}$, when $\epsilon \rightarrow 0$, $\xi \rightarrow \pm \infty$, Therefore, $W(\xi)$ will have to satisfies boundary conditions whenever $\xi \rightarrow \infty$. Here is the expected characteristics for function $W$: 

$$
\begin{aligned}
    & \lim_{\xi \rightarrow -\infty} W(\xi) = \bar{x} + \alpha - a
    \\
    &  \lim_{\xi \rightarrow \infty} W(\xi) = \bar{x} + \beta - b
\end{aligned}\tag{9}
$$

**Warning:** 

I skipped the argument for (9), because I don't understand both professor's Greenbaum's Explanations and the textbook's explanation. But on a high level, we transform the ODE problem from one that is in term of $u(x)$ to another one that is in $W(\xi)$, which assists us to look for parameters $k$. 

<u><i>Skipping a lot of math</i></u>

Now that we have decided that $k = 1$, and we have the problem and the solution pair given as: 

$$
\begin{cases}
    W''(\xi) + W(\xi)(W'(\xi) - \epsilon) = 0 & 
    \\
    W(\xi) = w_0 \tanh\left(
        \frac{w_0\xi}{2}
    \right) & 
\end{cases}
$$

With system (8) with the boundary conditions given in (9), $w_0$ satisfies: 

$$
\begin{cases}
w_0 = \frac{1}{2}(a - b + \beta - \alpha)
\\
\bar{x} = \frac{1}{2}(a + b - \alpha - \beta)    
\end{cases}
$$

Observe that boundary layer centered at $\frac{1}{2}(a +b - \alpha - \beta)$. Combining the inner and outter solution, $W$ is the solution within the boundary layer, combining it with the solution outside we have: 

$$
\tilde{u}(x) = x - \bar{x}  + w_0 \tanh\left(
    \frac{w_0(x - \bar{x})}{2\epsilon}
\right)
$$



