Let's talk about system that involves 2 state variables. 

This is going to be very interesting and it will be nothing like what we see in 1D
Prereq: [1D Stability](1D%20Stability.md)

---
### Intro: 

To start with, we need to look at 2D autonomous Linear system. 


$$
\begin{align}
x_1' &= ax_1 + bx_2\\
x_2' &= cx_1 + dx_2
\end{align}
$$

Where all the constants are real number and this is a system that can be expressed with matrices like: 

$$
x' = Ax
$$

Nice and easy. 

---
### 2D Linear System
2 Facts for Linear system: 
1. **Principals of Super Position**: if $z$ and $y$ both solve the linear system, then the linear combinations of these 2 solutions are going to solve the system as well. 
2. $x = \mathbf{0}$ is always a fixed point. This is obvious cause this is a linear system. 

#### Example 1: Spring Mass system
The system is like: 

$$
mx'' + hx = 0
$$

Using the Newton's law of motions. And for a second order ODEs, we can write it as a system of ODEs, nice and easy, which is giving us a system with the matrix: 

$$
A = \begin{bmatrix} 
	0 & 1 \\ 
	-\omega^2 & 0
\end{bmatrix}
$$

See more in [Canonical Form](../AMATH%20581%20Scientific%20Computing/Canonical%20Form.md) on how to reduce higher order system in a Autonomous multi-variable system. 

We are interested in understanding the system qualitatively. Phase portrait for the 2D system, we will have 2D plane as the basis for the Phase Portrait. 

* There is one fixed point: $x = \mathbf{0}$
* And the vector field represented by $A$ is just the phrase portrait of the system. 
* For this system, it's just arrows swirling clock-wise around the origin. 

#### Taking Look at the Fixed Points

**Stable Fixed point** (Subtly Different From 1D): 
1. Stable Fixed point that is not asymptoptically stable. For this instance, the $x = \mathbf{0}$ is going to be the **Stable Fixed point** but **none of the solution is going to approach it**. 
	* This is stable, but it's not **Asymptotically Stable**.  
	* It will also oscillate. 

---
## Definitions and Keywords
Here, we are going to get introduced to a series of keywords and definitions that will get used a lot throughout the discussion for the 2D system. And we will focusing on understand linear system, because this is the key for us to analyze other system under a local scope. 

* Stability for the 2D system. 
	1. Lyapunov Stability
	2. Attractive Fixed Point
	3. Asymptotic Stability
* Classification of Linear System
	1. Two Real Eigenvalues (Looking at the fixed point at $x = \mathbf{0}$)
		* $\lambda_1, \lambda_2 > 0$ --> Unstable Node
		* $\lambda_1, \lambda_2 < 0$ --> Stable Node
		* $\lambda_1\lambda_2 < 0$ --> Saddle Points
			1. Stable Manifold
			2. Unstable Manifold
		* $\lambda_1, \lambda_2$ conjugate complex --> Spirals and Centers.
			* $\alpha < 0$ Damped Oscillations spiral inwards. Asym Stable. 
			* $\alpha > 0$ Oscillations Spiral Outwards. Asym Unstable. 
			* $\alpha = 0$ Periodic Oscillations. Neutral Stable
		* $\lambda_1$ has geometric multiplicity of 2 --> Degenerate
			* Eigenspace can be Linear Independent --> Star Configuration
			* Eigenspace cannot be linear independent --> stable/unstable degenerate node. (Rotating but not quiet, stability depends on the sign of $\lambda$)

---
### Stability, Attractiveness of Fixed Points

These definitions are more general, and it can be applied to stuff that is not linear. 


* Lyapounov Stability: 
	A fixed point $x^*$ is Lyapounov Stable if all trajectory starts near it, stays there. 
	> For all $x(t)$ with $x_0$ close to $x^*$ as $t \rightarrow \infty$, $|x(t) - x^*|$ is bounded. 
	
	Like planetary motions. 
* Attractive fixed point: 
	Starts near it will approach it as $t\rightarrow \infty$. 
	> For all $x(t)$, $t > 0$ with $x_0$ close to $x^*$, $\lim_{t\rightarrow\infty} x(t) = x^*$
	
	Like magnets. 
	
* Asymptoptically Stable: 
	Stable and attractive. 

Note: Attractive doesn't mean stable, consider multiple points that are stable, or the case where it's periodic. This also means that, a set of fixed points (or a fixed region) can also be fit into the above definition. 

---
### Eigenvalue Classification of Linear System. 

#### Two Real Positive Eigenvalues 
$\lambda_1 > \lambda_2 > 0$

The absolute value of the solution is going to infinite, All the trajectory are going way from origin, all the way to infinity. 

$$
x(t) = c_1 \exp(\lambda_1 t) + c_2 \exp(\lambda_2 t)
$$

Asymptotically Speaking, it's going in the $\lambda_1$ eigenvector's direction, asymptotically. 

That means the origin is **Unstable **,  which is called an **Unstable Node**. 

#### Two Real Eigenvalues That are Both Negative
$\lambda_1, \lambda_2 < 0$

It's very similar to the previous case, it's heading towards the origin. All the trajectories are in reverse compare to the previous case. 

Now the origin is **Stable**, and this is called a **Stable Node**. 

#### Two Distinct Read Eigenvalues, Opposite Signs. 

$\lambda_1\lambda_2 > 0$.  It's approaching the fixed points in the eigenvector corresponding to the negative eigenvalues, and it's going away from the fixed point in the direction of the eigenvector of the positive eigenvalue. 

This is called a **Saddle Point**, and it's **Unstable**

##### Manifolds

Assuming that $\lambda_1 > 0$ and $\lambda_2 < 0$ with eigenvalues $v_1$ and $v_2$

**Stable Manifold**: is the collection of points that approach the fixed points as $t\rightarrow \infty$. 

$$
\text{span}\{v_2\}
$$

**Unstable Manifold**: is the collection of points that approach the fixed points as $t\rightarrow -\infty$

$$
\text{span}\{v_1\}
$$

**Note**: All points that approaches the fixed points (Both forwards and backwards) are the points that lies exactly on the one of the Eigenvectors of the matrix. 

#### Complex Eigenvalues 

Let's say that $\lambda_1 = \alpha + \beta_i$ and $\lambda_2 = \alpha - \beta_i$, And the system will be like: 

$$
c_1\exp(\alpha)\exp(i\beta t)v_1 + c_2\exp(\alpha)\exp(-i\beta t)v_2
$$

And notice that the only growth and decay depends on $\alpha$. 
* $\alpha  = 0$
When $\alpha$ is 0, then there is only oscillations for the system. 

This is called **Centers**, and they are examples of Lyaponouv Stability, another name for this type of stability is **Neutrally Stable**. 
* $\alpha > 0$
Then it will circulates and goes away the from the origin. 

This is called: **Spiral Unstable**. 

* $\alpha < 0$
All the Trajectories are circulating and going into the origin. And this is called **Stable**. 

#### Two Real Eigenvalues are the same

In this case, we have linear independent eigen spce for the system, and this is an **unstable node**, or it's called **Unstble Star** or **Stable Star** depending on the signs of the real eigenvalues. 

#### Two Real Eigenvalues but Only one Eigenvector

This is called a stable degenerate node. And the origin is **Asymptotically Stable**. However, they spin around and never really passes the eigenvector on the phase portrait. 

Origin is Asymptotically stable, and the node is **Stable Degenerate Node** or **Unstable Degenerate Node**. 

#### Eigenvalues are Zero

$$
A = 
\begin{bmatrix}
 1 & 1 \\ -1 & -1
\end{bmatrix}
$$

**Sheer Flow**. It's just here for completeness.