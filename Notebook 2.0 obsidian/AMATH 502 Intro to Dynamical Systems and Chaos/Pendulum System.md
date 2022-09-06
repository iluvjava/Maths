In this file, we are going to look at 2 examples of the non-linear pendulumn problem, the linear and the non linear and non-linear damped, we will use: 

1. [[2D Non-Linear System]]
2. [[Conservative System, Hamiltonian]]
To study the behavior of the system, and when studying the non-linear system without damping, we will introduce the idea of: 

1. Heteroclinic Orbit
2. Homoclinic Orbit

---

### The System 

Linear pendulum system is just the non-linear one with the angle very close to zero. And this is the non-linear pendulum system: 

$$
\theta'' + \frac{g}{L}\sin\theta = 0 \quad \theta \in [-\pi, \pi)
$$

And we can view the system periodically, allowing us to take all the real values for the variable $\theta$

Putting the 2nd order system into a 2D system, we will have: 

$$
\begin{bmatrix}
    \theta \\ v
\end{bmatrix}'
=
\begin{bmatrix}
    v \\ 
    \frac{-g}{L}\sin\theta
\end{bmatrix}
$$

And substitution is $\theta' = v$. 

---
### Non-Linear System is Conservative (Not Damped)

The system is conservative if we can find the potential function. Take note that: 

$$
v' = \frac{g}{L}\sin\theta = \frac{d}{d\theta} \left(
-\frac{g}{L}\cos\theta
\right)
$$

And hence, we have a way of representing the forces wrt to the angle, which is: 

$$
\theta'' = \frac{d}{d\theta} \left(
-\frac{g}{L}\cos\theta
\right)
$$

So then the potential function wrt to $\theta$ is looking like: 

$$
V(\theta) = \frac{g}{L}\cos(\theta)
$$

Another way to find it is integrating with an integrator, giving me: 

$$
\begin{align}
    \theta'' + \frac{g}{L}\sin\theta &= 0 \\
    \theta'\theta'' + \theta'\frac{g}{L}\sin\theta &= 0 \\
    \frac{d}{dt}\left(
        \frac{(\theta')^2}{2} + \frac{g}{L}\cos\theta
    \right) &= 0 \\
    \frac{(\theta')^2}{2} + \frac{g}{L}\cos\theta &= E
\end{align}
$$

And in this case, we also identified the energy function, which is the LHS of the equation. 

---
### Fixed Points of the System (Not damped)

Fixed point happens when $V'(\theta) = 0$, which means that $\sin(\theta) = 0$, which means that: $\theta = 0, \pm\pi$, and periodically, it's really the same point for $\pm \pi$. 

In addition for $V'(\theta) = 0$, we also need to make the pendulum stationary, meaning that: $v = 0$. 

Therefore the fixed points of the system will be: 

$$
p_1 = \begin{bmatrix}
    0 \\ 0 
\end{bmatrix}\quad 
p_2 = \begin{bmatrix}
    \pm \pi \\ 0
\end{bmatrix}
$$

And then the Jacobian is going to be: 

$$
J = 
\begin{bmatrix}
    0 & 1 \\ 
    \frac{-g}{L}\cos\theta & \theta
\end{bmatrix}
$$

Substituting the fixed points we will have the matrices: 

$$
J(p_1) = \begin{bmatrix}
    0 & 1 \\ \frac{-g}{L} & 0
\end{bmatrix} \quad 
J(p_2) = \begin{bmatrix}
    0 & 1 \\ \frac{g}{L} & 0
\end{bmatrix}
$$

Notice that for $J(p_1)$, the eigenvalues are: $\pm i\sqrt{g/L}$ meaning that it is a stationary fixed point. However, as summarized in: [[2D Non-Linear System]]. In the case of Linear analysis giving us the result of a neutrally stable center, we should not trust the result. 

**Question**: Should we trust the result of linear analysis? 

**Answer**: Yes, because we showed that the system is conservative, and when it's conservative, all centers will have to be Neutrally stable! 

Let's consider the other fixed point: $J(p_2)$ which gives us the eigenvalues: $\pm \sqrt{g/L}$, and it has corresponding eigenvectors: 

$$
v_1 = \begin{bmatrix}
    \sqrt{L/g} \\ 1
\end{bmatrix}\quad 
v_2 = \begin{bmatrix}
-\sqrt{L/g}& \\1
\end{bmatrix}
$$

And so this is a saddle node, with $v_1$ being the unstable manifold, and $v_2$ being the stable manifold. 

![[phase-portrait-non-linear-pendulumn.png]]

**Definition:**

Notice that, because of the periodicity of the fixed points $\pm \pi$, we might consider the fact that: The stable and unstable manifold is meeting itself at the same point. Which is very interesting. **That is all a Homoclinic Orbit** (Disregard what wiki thinks this is stated by prof because we are viewing this system as periodic) 

**Homoclinic Orbit**: The orbit on the phase portrait is coming backing and meeting it's tail 

**Heteroclinic Orbit**: This is an orbit that connects one fixed point to another. 

**Question:**Are there basin of attraction in this system? 
**Answer:** No, there aren't, because regardless of where we started we are not going to meet a fixed point. 

**Question:** Are there seperatrix?
**Answer:**Yes, the Separatrix is colored in blue on the phase portrait. 
