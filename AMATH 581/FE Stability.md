The stability analysis for the Forward Euler for a very simple differential equation. 

Prereq: [[IVP]]
Needs this to understand the forward Euler Scheme. 

---

The Stability of the scheme is highly dependent on the input, the equations we are trying to solve numerically, and the scheme we are using for the equations. This is why skills for analyzing the stability of a scheme given a problem is important. 

An scheme is stable for a particular problem if the simulation is **not sensitive to perturbations on the initial conditions.**

Consider a first order differential equation of the form: 

> $$y' = \lambda y + \beta t$$

If we are going to apply the Forward Euler Scheme onto this problem then we will have the following: 

$$y_{n+1} = y_n + \Delta t f(t, y_n)$$

$$y_{n+1} = y_n + \Delta t(\lambda y_n + \beta t_n)$$

$$y_{n+1} = y_n + \Delta t \lambda y_n + \Delta t\beta t_n$$

$$y_{n+1} = y_n(1 + \Delta t \lambda) + \Delta t \beta t_n$$

Now, we assume that the stepping scheme is evaluated in a finite amount of time. 

And then for this particular recurence, it's not hard to find out that it has the close form solution of: 

$$y_n = (1 + \Delta t\lambda)^n y_0 + \sum_{i = 0}^n (1 + \Delta t\lambda)^i\beta t_n$$

Notice that, for any initial perturbation applied to the initial condition, say reassigning the value of $y_0$ as $y_0 = y_0 + \epsilon$, then the only term that can magnify it is the term $1 + \Delta t\lambda$

And for it to be stable, we must use make sure that the $\Delta t$ satisfy the following constraint: 

$$|1 + \lambda \Delta t| < 1$$

Given any equations  of this form, with a lambda parameter, we can just use this to solve for the time step constant $\Delta t$ such that the FE scheme is stable. (Ignoring the runoff error!)

---


#### Stability of Backwards Euler

