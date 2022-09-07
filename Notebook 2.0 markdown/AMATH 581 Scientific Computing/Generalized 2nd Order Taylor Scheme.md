Here we will discuss a class of time-stepping scheme found using the Taylor Series expansion of the Ordinary Differential Equations. 
prereq: [Runge Kutta](Runge%20Kutta.md) This is important to understand what this is doing here. 

---

Let's present the following formula for our time stepping scheme: 


> $$
> y(t + h) = y(t) + h\left[Af(t, y(t)) + Bf(t+Ph, y(t) + Qhf(t, y(t))\right]
> $$

Notice that the nested function inside of it can be approximated with a first order taylor series for function with 2 variables (Although in this case the special dimension is a huge vector), And the h is just $\Delta t$. 

Here we simply write $y$ as $y(t)$

$$f(t + Ph, y(t) + Qhf(t, y))
= f(t, y) + Phf_t(t, y) + Qhf(t, y)f_y(t, y)
$$

So we basically have 

$$
y(t + h) = y + h[
	Af(t, y) + 
	B(f(t, y) + Phf_t(t, y) + Qhf(t, y)f_y(t, y))
]
$$

$$
y(t + h) = y + 
	hAf(t, y) + 
	B(hf(t, y) + Ph^2f_t(t, y) + Qh^2f(t, y)f_y(t, y))
$$

$$
y(t + h) = y + 
	hAf(t, y) + 
	Bhf(t, y) + BPh^2f_t(t, y) + BQh^2f(t, y)f_y(t, y)
$$

$$
y(t + h) = y + h(A + B)f(t, y) + BPh^2f_t(t, y) + BQh^2f(t, y)f_y(t, y)
$$

Now the cool thing is, we already fiture out the expansion for the function back in the [Runge Kutta](Runge%20Kutta.md) section where you have: 

> $$y(t + h) = y + hf(t, y) + \frac{h^2}{2}( f_t(t, y) + f(t, y)f_y(t, y)) + \mathcal{O}(h^3)$$

And then we got the following formula that frame the variables $A, B, P, Q$, giving us: 

> $$A + B = 1$$
> 
$$BP = \frac{1}{2}$$
>
$$BQ = \frac{1}{2}$$

It's implied that $P = Q$

And then we can choose different values for $A, B$ to get all different kinds of time-stepping scheme. But the key here will be that, all of the time-stepping scheme developed from this formula will have a local error on the magnitude of $\mathcal{O}(h^3)$. 

#### Heun's Method

>$$ y(t + h) = y + \frac{h}{2}(f(t, y) + f(t + h, y + hf(t, y)))$$

This is when $A = B = \frac{1}{2}$ and $P = Q = 1$

This is a method with local accuracy of $\mathcal{O}(h^3)$ and a quadratic global accuracy. 

**Note**: 
This scheme is the same as the second order Runge Kutta method. 
