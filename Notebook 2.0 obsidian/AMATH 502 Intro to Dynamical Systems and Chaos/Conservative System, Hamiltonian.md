Some of the differential systems are conservative, and that is really cool because that means it can only have centers as its fixed points. 

This helped a lot with the stability analysis of the 2d Non-linear system. 

[[2D Non-Linear System]]

For this part, we are interested in a particular example of the conservative system as an example, and then we will define the following concepts for conservative system in general, discuss something useful about it. 

1. Conservative Quantity of the system.
2. Conservative system defined via conservative quantity of the  system.
3. The potential function.

Another name for Conservative system is: Hamiltonian System.

---

### Intro
One of the system that we are going to consider here is: 

$$
\begin{cases}
    x' = y \\ 
    y' = \frac{-1}{m}\frac{dV}{dx}
\end{cases}
$$

And this comes from the newton's law: 

$$
mx'' = -\frac{dV}{dx}
$$
Where $V(x)$ is a potential function, such that, for each point associated with $x$, we have a potential value, and the change in potential energy is the force. In this case, $V(x)$ just needs to be a "well-behaved" function. 

**Note** For higher dimension, I am guessing the expression will look like: 

$$
m \frac{d^2x}{dt^2} = -\nabla V
$$

From this assumption, we can derive the energy function for the system, which can be: 

$$
\begin{align*}\tag{1}
    mx'' + \frac{dV}{dx} &= 0 \\ 
    mx'x'' + x'\frac{dV}{dx} & = 0\\ 
    m \frac{d}{dt}\left(
        \frac{(x')^2}{2}
    \right) + 
    \frac{d}{dt}\left(
        V(x)
    \right) &= 0
    \\
    \frac{m(x')^2}{2} + V(x) &= C
\end{align*}
$$

And this is the energy function. If we were given the value of $C$, and the position, or the speed, with the potential function, we would have uniquely idenfied a solution for the system. (Explicitly wrt to time variable)

And we will also have an energy function which is given by this level function: 

$$
E(x,x') = \frac{m(x')^2}{2} + V(x)
$$


---
### Definition 1: Conserve Quantity

> A conserve quantity is a **real valued function** that is continuous, and its value unique identify one of the energy status of a solution of the system. 

This means that, the level curve: $E(x, y) = C$ cannot be lied within some opened set. If that is not the case, then one region could potentially identify infinitely many solutions for the system. 

### Definition 2: Conserved System

> Any system with a conserved quantity is called a conservative system.

---
### Fixed Points of Conservative System


**Claim**: If we have a fixed point for the potential function, say $x^*$, then the point $(x^*, 0)$ will be a fixed point for the energy function. 

**Proof:**: 

The gradient of the Energy function is given as: 

$$
\nabla E(x, y) = 
\begin{bmatrix}
    \frac{dV}{dx} \\[0.5em] my
\end{bmatrix}
\quad \frac{dV(x^*)}{dx} = 0
$$
And then we have: 

$$
\nabla E(x^*, 0) = \begin{bmatrix}
 0\\ 0
\end{bmatrix}
$$

Therefore it's a fixed point. 

#### What type of fixed point is it for the Energy Function? 

Let's take a look at the Hessian of the Energy, at that very same point: 
 
$$
\nabla^2 E(x, y) = 
\begin{bmatrix}
    \frac{d^2V}{dx^2} & 0 \\[0.5em] 
    0 & m
\end{bmatrix}
$$

And we should also consider the Jacobian of the system which is like: 
$$
\begin{bmatrix}
0& 1 
\\
\frac{d^2V(x)}{dx^2}\frac{-1}{m} & 0
\end{bmatrix}
$$


#### Corollary: 

Take not that, depending on the curvature of the potential function, the Critical point of the Energy function associated with $(x^*, 0)$ is either a saddle point (Not a stable state), or it's a local Minimum. 

When the fixed point is a local minimum of the center, then it has to be a Neutrally Stable center, because the solution cannot crosses each other (Hence cannot go close to the fixed points and decreases the energy).


---
### General Form: 

$$
\begin{cases}
    x' &= \frac{\partial H}{\partial y} \\ 
    y' &= -\frac{\partial H}{\partial x}
\end{cases}
$$

Note: This is not just a 2D system, x, and y could be like: vectors of the same size. 

The keep properties here that gives us the conserved quantity for the system is that: Given any trajectory that is the solution of the system, the scalar function $H(x(t), y(t))$ is giving us a conserved quantity.

$$
\frac{dH(x, y)}{dt} = \partial_x (H(x, y)) x'(t) + \partial_y(H(x, y)) y'(t)
$$
$$
\frac{dH(x, y)}{dt} = \partial_x (H(x, y))\partial_y(H) - \partial_y(H(x, y))\partial_x (H)
$$
$$
\frac{H(x, y)}{dt} = 0
$$

And hence, if I move around any trajectories that are the solutions of the system, we can see that, the $H$ is a conserved quantity for the system. 

