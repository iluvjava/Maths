Adams Bashforth,  Adam Moulton Method
Multi-stepping schemes requires serveral pre-established points to make one future time step, this is a feature from the derivative using the integral method with the taylor approximation and finite difference. 


Contents: 
* Forward Integrations and Finite Difference Analysis 
* Multi-step method 
* Predictors

---

### Integration 

IVP given as 
> $$y' = f(t, y)$$

Where $y$ could be a vector 

Conside solving the problem with intergrations like: 

$$
y'(s) = \frac{d}{dt}\int_{t_0}^s f(t, y(t))dt
$$

Which is saying that: 

$$
y(s) = \int_{t_0}^s f(t, y(t))dt
$$

Since we are interested in next time-step of the ODE, so what we are essentially doing is: 

$$
y_{t_n + 1} = \int_{t_n}^{t_{n+ 1}} f(t, y(t))dt
$$

And if this can be solved analytically, then we are good, however this is not always the case. 

But the key here is to use approximation for the integral, with a polynomial and some finite differences, which will be useful later. Currently it looks not much different from the taylor series's method for analyzing things. 

* Approximating using the constant
$$f(t, y(t)) \approx f(t_n, y_n)$$
Instead of using the $y(t)$, let's just use the $y_n$ from the previous time step as our point of evalution. 
$$y_{n+1} = y_n + \int_{t_n}^{t_{n+1}} f(t_n, y_n) dt$$
$$y_{n+1} = y_n + f(t_n, y_n)(t_{n+1} - t_n)$$
which is just the Euler's Method 

---

### Adam's Method

In this section we use the following notations: 
$$f_n = f(t_n, y(t_n))$$ $$\Delta t = t_{n + 1} - t_{n}$$

Consider the approximation of the $f(t_n, y(t_n))$ interms of the following polynomials: 

>$$ f_n + \frac{f_n - f_{n-1}}{\Delta t}(t - t_n)$$

Then the time stepping schecme involves solving the following: 

> $$y_{n + 1} = y_n + \int_{t_n}^{t_{n + 1}} 
f_n + \frac{f_n - f_{n-1}}{\Delta t}(t - t_n) dt$$

Which in the end will give us: 

> $$y_{n+1} = y_n + \frac{\Delta t}{2}(3f_n - f_{n - 1})$$

This is an explicit scheme named: "**Adams Bashforth**" 

Now we develop the implicit time stepping schcme using this approximation: 

> $$f_n + \frac{f_n - f_{n+1}}{\Delta t}(t - t_n)$$

Not much changed but this time we use the future time stepping to improve our scheme here. 

and the equation we are trying to solve here will be: 

> $$y_{n + 1} = y_n + \int_{t_n}^{t_{n + 1}} 
f_n + \frac{f_n - f_{n+1}}{\Delta t}(t - t_n) dt$$

and after solving it we have the time stepping scheme: 

> $$y_{n+1} = y_n + \frac{\Delta t}{2}(f_{n + 1} + f_n)$$

And notice that, the term $f_{n + 1}$ is going to need $y_{n + 1}$, which is the next time step we need for things. 

In this case, we have an implicit method and this method in particular is called: "**Adams Moulton**"

> Problem: It seems like Heun's Method looks the same I am not sure which is which and why this is the case. 

#### Extra Notes

Becaue the Adams Bashforth scheme requires 2 points as for starting it, we might just need to to use Euler for the first iteration and then use this scheme to start the iterations. 

![[Adam B.M Derivation.jpg]]

---

### Multi_Stepping and Predictors 

We can combine both of the implicit and the explicit time steppingg scheme together to get best of the both worlds.

Assume that we have previous 2 points, $y_{n - 1}$ and $y _{n}$, then we can use the explicit method to get the future time step as: 

$$y^p_{n + 1} = y_n + \frac{\Delta t}{2}(3f_n - f_{n - 1})$$

Now with the predict future time step, which might be unstable for certain functions, we are going to use this forthe implicit scheme to re-evaluate the value for $y_{n + 1}$, and this is will be given as: 

$$y_{n + 1} = y_n + \frac{\Delta t}{2} (f(t_{n + 1}, y^p_{n + 1}) + f_n)$$

And then this new $y_{n + 1}$ is gotten from the predicted: $y_{n + 1}^n$ from the explicit method. This is going to be a bit faster comparing just directly using the explicit method for the problem. 

This Multi-Stepping schcme has an accuracy that varies a lot, and the `ode311` is one of the multi-stepping method that uses this principle, and when the ODEs gets challenging, it's going to make the $\Delta t$ smaller. 


---
### Predictor Corrector

Any explicit scheme combined with an explicit scheme's predictor is a valid predictor corrector method. 

And hence we also have the option to combine the forward and the backward Euler together to get a predictor corrector method. 

This is the Backwards Euler: 

$$y_n = y_{n - 1} + \Delta tf(t_{n}, \tilde{y}_n)$$

And then we can substitute the $\tilde{y}_n$ with a farward Euler: 

$$
\tilde{y}_n = y_{n - 1} + \Delta tf(t_{n - 1}, y_{n - 1})
$$

So it will look like this: 

$$y_n = y_{n - 1} + \Delta tf(t_{n}, y_{n - 1} + \Delta tf(t_{n - 1}, y_{n - 1}))$$

Then the average of the predictor and the solution from the implicit method will be used for the new time step. 

The analysis goes hard after this point, and it's better to use a concrete functions to analyze how well this method works for certain equations. 