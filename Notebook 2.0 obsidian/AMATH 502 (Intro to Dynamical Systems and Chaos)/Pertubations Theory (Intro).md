Here we are going to look at some of the ideas that helps with identifications of limit cycles. 

Quick Reference: 
[Online Resources](http://www.math.lsa.umich.edu/~rauch/558/perturbation.pdf)

---

### Intro
We are going to change the differential system by a little bit using a parameter: $\epsilon$ and we will assume that, the solutions of the system will get changed smoothly too. 

Then consider the taylor series expansion on the solution wrt to $t, \epsilon$, where $\epsilon$ is a parameter tweaks on the original system, with initial condition defines on $t = 0$: 

$$
y(t, \epsilon) = \sum_{j = 0}^{\infty}\left(
        \frac{\partial^j y(t, 0)}{\partial \epsilon^j}\frac{\epsilon^j}{j!}
    \right)
$$

And this is saying that, the solutions of the perturbed system  will be a function that is related to the previous solution for the unperturbed system (with $\epsilon = 0$)

Notice that, here, we make the assumption that the unperturbed system is easier to solve. Or else we will not get easier solution when we perturbed the system at all. 

Here we will show that regular perturbation theory is going to fail for the Damped Harmonic Oscillator example because of resonance building up on solutions for the unperturbed system. 


---
### Example: Damped Harmonic Oscillator: Resonance Build Up

> $$
> x'' + 2\epsilon x' + x = 0
> $$

When Unperturbed, the system is a homogeneous linear system. Let's also assume that the initial conditions are like: 

$$
x(0) = 0 \quad x'(0) = 1
$$

And the analytical solution of the system is: 

$$
x = \frac{1}{\sqrt{1 - \epsilon^2}}\exp(-\epsilon t) \sin 
\left(
    t\sqrt{1 - \epsilon^2}
\right)
$$

Using perturbation theory, and saying that we are only interested in the zero and first order expansion of unperturbed solutions then: 

$$
x = x_0(t) + \epsilon x_1(t)
$$

Then obviously: 

$$
x' = x_0'(t) + \epsilon x_1'(t) \quad x'' = x_0''(t) + \epsilon x_1''(t)
$$

Firstly, let's sat $\epsilon = 0$ and solve for the zeroth order function and then the system will look like:  

$$
x_0''(t) + \epsilon x_1''(t) + 2\epsilon(x_0'(t) + \epsilon x_1'(t)) + x_0(t) + \epsilon x_1(t) = 0
$$

$$
x''_0(t) + x_0(t) + \epsilon (2x_0'(t) + x_1''(t) + x_1(t)) + 2\epsilon^2 x_1'(t) = 0
$$

And the initial conditions for the system will look like: 

$$
x_0(0) + \epsilon x_1(0) = 0 \quad x_0(0) + \epsilon x_1''(0) = 1
$$

And then we will be able to set up a system for $x_0(t)$ and solving it will give us: 

$$
\begin{cases}
    x_0'' + x_0 = 0 
    \\
    x_0(0) = 0
    \\
    x'(0) = 1
\end{cases}
$$


And in this case, this is a homogeneous system with a unique solutions which is giving us the solution: 

$$
x_0(t) = \sin(t)
$$


And then we will be able to substitute it into the 

Substituting the solution into the system, and looking terms with $\epsilon$ (Which is the first order), we will have another system that solve for the $x_1$, which is: 

$$
\begin{cases}
    x_1'' + x_1' = -2x_0' = -2\cos(t)
    \\
    x_1(0) = 0
    \\
    x_1'(0) = 0
\end{cases}
$$

And then, we will be able to solve this system and get the solution that: 

$$
x_1(t) = -t\sin(t)
$$

And now, please observe that, this is a system that will be blowing up as $t\rightarrow \infty$ which is not what happen for the damped harmonic oscillator. 

This is called **Resonance**, which is building up and failing the Regular Perturbation theory. 

---

### Method of Multiple Scale: 2 Timing 

Here, we will introduced the idea of looking at the composition of the functions from the unperturbed solutions using different time scale. 

The idea here is that, if we view the solutions for the Damped Harmonic Oscillator consisting of 2 actions, the decay and the oscillation, and we can also realize the fact that they are on very different time scale (Or, independent with each other.)

Then we will be able to overcome the problem of resonance. 

