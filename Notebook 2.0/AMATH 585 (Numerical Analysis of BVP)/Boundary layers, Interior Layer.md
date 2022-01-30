It's some what related to: [[Pertubations Theory (Intro)]]

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
\end{cases}
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
    u(x)=\alpha+x+(\beta-\alpha-1)\left(\frac{e^{x / \epsilon}-1}{e^{1 / \epsilon}-1}\right)
$$


---
### **Interior Layers: Damped Harmonic Oscilator**





