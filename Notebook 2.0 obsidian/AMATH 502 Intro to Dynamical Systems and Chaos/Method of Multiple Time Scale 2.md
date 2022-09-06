We are going to apply the method of multiple tine scale here for the Van Der Pol Oscillator. 

[[Method of Multiple Time Scale 1]]

---

### Review

From previous part, we know that the multiple time scale method model second order differential system using the assumption that: 
$$
x''= L(x, x', \epsilon)
$$

And the assumption that it's continuous for $\epsilon$. 

And with this assumption, we will have the long time scale, short time scale for modeling the long term behavior and the oscillator behavior of the system, and the time scale factor will look like this: 
$$
\frac{d}{dt} = \partial_\tau + \epsilon\partial_T
$$
$$
\frac{d^2}{dt^2} = \partial_\tau^2 + 2\epsilon\partial_T \partial_\tau + \epsilon^2\partial_T^2
$$
And this is the operator that we are going to use. 

Note: 
It's hinted in the Storgaz notes that, with 2 time scale, we can only model the system all the way up to $\mathcal{O}(\epsilon)$, if any higher, we will need to make 3 times scale, 4 time scale ect. 


### Van Der Pol Osc
Here we are modeling the Van Der Pol Oscillator, a weakly linear oscillatory system. 

We are interested in using the 2 time scale method to approximate the behavior of the limit cycles for small value of $\epsilon$. 

The system is given by: 
$$
x'' + x + \epsilon (x^2 - 1)x' = 0
$$

And, getting the first order perturbations term for $x$ with 2 time scale, we have: 
$$
x = x_0 + \epsilon x_1
$$
$$
x' = (\partial_\tau + \epsilon \partial_T)(x_0 + \epsilon x_1)
$$
$$
x' = \partial_\tau x_0 + \epsilon \partial_\tau x_1 + \epsilon\partial_Tx_0 + \mathcal{O}(\epsilon^2)
$$
$$
x'' = (\partial_\tau^2 + 2\epsilon\partial_T \partial_\tau + \epsilon^2\partial_T^2)(x_0 + \epsilon x_1)
$$
$$
x'' = \partial_\tau x_0 + 2\epsilon \partial_\tau \partial_T x_0 + \epsilon \partial_\tau^2 x_1 + \mathcal{O}(\epsilon^2)
$$

Substituting it in, and we have a long expression that is like: 
$$
(\partial_\tau^2 x_0 + 2\epsilon \partial_\tau \partial_T x_0 + \epsilon \partial_\tau^2 x_1) + (x_0 + \epsilon x_1) + \epsilon(x^2 - 1)(\partial_\tau x_0 + \epsilon \partial_\tau x_1 + \epsilon\partial_T x_0) = 0
\tag{1}
$$

Collecting the $\epsilon^0$ term from (1), we have the system: 
$$
\partial_\tau x_0 + x_0 = 0 \tag{2}
$$
And this means that the solution of the system can be written as: 
$$
x_0 = R(T)\cos(\tau + \phi(T))
$$
We choose to merge the $\sin$ and $\cos$ so we can better analyze the oscillator behavior of the system. (And we also know that the limit cycles is approximately a cycles.)

Collecting the $\epsilon$ term from (1), we will have the system: 

Note: When actually doing this, it might be better to just write it with table form, so we can have a way to track the coefficients of the terms better. 

$$
2\partial_\tau \partial_t x_0 + \partial_\tau^2 x_1 + x_1 + (x^2 - 1) \partial_\tau x_0 = 0
$$
$$
2\partial_\tau \partial_t x_0 + \partial_\tau^2 x_1 + x_1 + (x_0^2 + 2\epsilon x_1 x_0 + \epsilon^2 x_1^2 - 1) \partial_\tau x_0 = 0
$$
$$
2\partial_\tau \partial_t x_0 + \partial_\tau^2 x_1 + x_1 + (x_0^2 + 2\epsilon x_1 x_0 + \epsilon^2 x_1^2 - 1) \partial_\tau x_0 = 0
$$
$$
2\partial_\tau \partial_t x_0 + \partial_\tau^2 x_1 + x_1 + (x_0^2 + 1) \partial_\tau x_0 = 0
$$
$$
\partial_\tau^2x_1 + x_1 = -2\partial_\tau\partial_t x_0 - (x^2 - 1)\partial_\tau x_0
\tag{3}
$$
For system (3) substitute in $x_0$ and then apply the different operators after some math, most of them taking the derivative and collecting the like terms for the trig functions.
$$
\partial_\tau^2 + x_1 = 
2R'\sin(\tau + \phi) + 2R\phi'\cos(\tau + \phi) + R^3 \cos^2(\tau + \phi)\sin(\tau + \phi) - R\sin(\tau + \phi)
$$
However, we should write everything in $\sin(\tau + \phi), \cos(\tau + \phi)$ so we can start cancelling out the resonance for the system. Let's make the substitution that: $\theta = \phi + \tau$, then we will have: 
$$
\cos^2\theta\sin\theta  = \frac{1}{4}\sin(3\theta) + \frac{1}{4}\sin\theta
$$
Substituting it back to the original equation, so everything will be in the standard basis form, we have: 
$$
\partial_\tau^2 + x_1 = 
2R'\sin(\theta) + 2R\phi'\cos(\theta) + R^3 (\frac{1}{4}\sin(3\theta) + \frac{1}{4}\sin\theta) - R\sin(\theta)
$$

Collecting coefficients for $\cos(\theta)$; we will have: 
$$
2R \phi ' = 0 \tag{4}
$$
At the same time: 
$$
2T' = \frac{1}{4}R^3 - R \tag{5} \implies R' = \frac{R}{8}(4 - R^2)
$$
Observe the fact that, we have gotten a easy to solve system(solve the second one and then substitute it back into the first one) in the polar coordinates, and this is amazing, because the system (5) is giving us a fixed point at $R = 0$ and a fixed point at $R = 2$. 

Let's ignore the case when $R = 0$. 

Then it's not hard to see that, if I set $R = 2$ for expression (4), then we will have: 
$$
4\phi' = 0 \implies \phi(T) = \phi_0
$$
This quantity is not changing, and it's going to be a constant. This is another good news because it's telling us that this is a legit circle, not just a fixed point, nor some other kind of weird shit, it's a circle with radius 2, rotating at constant angular speed. 

Because we are interested in the long term behavior, let $t\rightarrow \infty$, and then we set $R(T) = 2$, which can give us expression for $x$, so it's like: 

$$
x(t) = 2\cos(t + \phi_0) + \mathcal{O}(\epsilon)
$$
Boom, this is the approximated solutions for the system, first order. 
