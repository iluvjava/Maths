Here we are going to investigate some the idea of Multiple Time Scale. Which is a better way of doing Perturbations 

[[Intro to Pertubations Theory]]

---

### Operators, Different Time Scales 

Now, we model the motions in 2 different time scale: 

$$
\tau = t \quad T = \epsilon t
$$
Where $\tau$ grows way faster than $T$ when $\epsilon >> 0$

with this assumption, we can say that: 

And let's assume that the solution to the system is like: 

$$
x(\tau, T)
$$
And the function governing the motions in the short and long time period is separate and don't affect each other. 

$$
\frac{dx}{dt} = \frac{\partial x}{\partial\tau}\frac{d\tau}{dt}  + \frac{\partial x}{\partial T}\frac{dT}{dt} = \frac{\partial x}{\partial \tau} + \epsilon \frac{\partial x}{\partial T}
$$

Which can be conveniently put into a linear operator form as: 
$$
\frac{dx}{dt} = \partial_\tau + \epsilon \partial_T
$$

And the second derivative wrt to $t$ is going to be: 

$$
\frac{d^2}{dt^2}
(\partial_\tau + \epsilon \partial_T)(\partial_\tau + \epsilon \partial_T) = 
\partial_r^2 + 2\epsilon\partial_\tau\partial_T + \epsilon^2\partial_T^2
$$

And notice that, the operator is commutable as long as the function we are assuming is continuously changing wrt to the perturbation. 

And these 2 are the operator we are going to use for the taking the derivative on the function. 

### The Damped Harmonic Oscillator

Here, we are going to look at the Damped Harmonic Oscillator again and use the idea of multiple time scale. The harmonic oscillator is set to be: 

$$
x''  + 2\epsilon x' + x = 0
$$


With the assumption on the initial condition that: $x(0, 0) = 0$, the perturbated system can be summarized to be: 

$$
x_0(0, 0) = x_1(0, 0) = x_2(0, 0) \cdots  = 0
$$

However, the initial condition that $x'(0) = 0$ can be summarized as: 

$$
(\partial_\tau + \epsilon \partial_T)(x_0 + \epsilon x_1 + \epsilon^2 x_2 \cdots ) = 1
$$

And this is like polynomials and we need to collect all the like terms using $\epsilon$. 

$$
\frac{\partial x_0}{\partial \tau} = 1 \quad \partial_Tx_0 + \partial_Tx_1 = 0 \quad \partial_T x_1 + \partial_T x_2 = 0 \quad \cdots
$$

Now we have the initial conditions, let's take a look at the perturbed system: 

$$
(\partial_\tau^2 + 2\epsilon\partial_\tau\partial_T + \epsilon^2\partial_T^2)(x_0 + \epsilon x_1)  + 2\epsilon (\partial_\tau + \epsilon \partial_t)(x_0 + \epsilon x_1) + x_0 + \epsilon x_1 = 0 
\tag{1}
$$

Notice that, for the expansion of perturbed solution, we only kept all the way up to first order. 

Expanding, we an have the perturbed system represented as: 

$$
\partial_\tau x_0 + 2\epsilon \partial_\tau\partial_Tx_0 + \epsilon \partial_\tau^2x_1 + x_0 + \epsilon x_1 + 2\epsilon \partial_\tau x_0 + \mathcal{O}(\epsilon^2) = 0 \tag{2}
$$

And, some of the term of expansion on (1) has been pushed into $\mathcal{O}$, because we are only looking at the the first order perturbation expression for the perturbed system. 

#### Zero Order Solution

Starting 0 th order perturbed system, we have system: 

$$
\partial_\tau^2 x_0 + x_0 = 0
$$

Homogenous second order linear system, and notice that: 

$$
x_0 = A(T)\cos(\tau) + B(T)\sin(\tau) \quad x_0(0, 0) = 0 
\tag{3}
$$

Notice that the integration constant is wrt the long time scale. Assuming that, it's somewhat changing wrt to the long time scale factor $T$. 

#### Cancelling Resonance and find Integration Constants

Using (1), the perturbed first order system, include everything up to $\epsilon$ gives system: 

$$
\partial_\tau^2x_1 + x_1 = -2\partial_T\partial_\tau x_0 - 2 \partial_\tau x_0 \tag{4}
$$

Observe: LHS are first order perturbed, RHS are zero first perturbed. 

Substitute (3) into (4) gives: 

$$
\partial_\tau^2x_1 + x_1 
= 
2(A + A')\sin(\tau) + 2(B + B' \cos(\tau)
$$
Notice: $\partial_T A = A'$ and $\partial_T B = B'$

Assume: No resonance exists on time scale $t$, then, RHS in expression (4) is zero, means: 

$$
A' + A = 0 \quad B' + B = 0
$$

Means: 

$$
A = A_0 \exp(-T), B = B_0\exp(-T)
$$

Now, we only have constant to determine, using initial condition: 

$$
x_0(0, 0) = 0 \quad \partial_\tau x_0(0, 0) = 1
$$

Get: $A_0 = 0, B_0 = 1$

Substitute back into (3) get: 

$$
x = \exp(-\epsilon t)\sin(t) + \mathcal{O}(\epsilon)
$$

And this, is the first order perturbation approximation for the damped Harmonic Oscillator. 


---
### Summarization

1. Use multiple time scale operator to transform the system with perturbation basis function. 
2. Solve the system wrt to different degree of $\epsilon$.
	1. Solve for $x_0$ on zeroth degree. 
	2. Solve for $x_1$ on first degree. 
3. Separate out the Harmonics on the Trigs, and set the $x_1$ RHS to be zero, reducing the resonance. 
4. Solve for undetermined coefficients for the $x_0$ system. 