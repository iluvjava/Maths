Using finite difference to demonstrate the problem of roundoff error and truncation error

prereq: [[Taylor Series]], [[Finite Precision Arithmetic]]

---

#### Finite Difference

Consider the simple formula for forward difference: 

$$ f_{n+1}' =\frac{f_{n+ 1} - f_n}{\Delta t} + \mathcal{O}(\Delta t^2)$$, where $f_{n} = f(t_n)$, $f_{n+1} = f(t_n + \Delta t)$. The numerator: $f_{n+1} - f_n$ generates an error of $|2\epsilon|$, where the epsilon is the machine epsilon for the underlying floating point standards. Using the remainder of the Taylor series we can get the error as $\frac{M\Delta t^2}{2}$(assuming that the second derivative of the function is bounded over the interval of approximations), this is the analytical error of the scheme. Combining both of the these types of errors together we will get that: 

$$E = \left\vert \frac{2\epsilon}{\Delta t} + \frac{M\Delta t^2}{2}\right\vert,$$

Now, to find the best $\Delta t$ such that the error is minimized, we will have to take the derivative on this thing and then find the minimum. Taking the derivative on this thing gives: 

$$\frac{dE}{dt} = \left\vert 
	\frac{-2\epsilon}{\Delta t^2} + M\Delta t
\right\vert
=0
$$

And solving the equation will get us the optimal value for $\Delta t$, which is: 
$$
\Delta t^* = \left(
	\frac{2\epsilon}{M}
\right)^{\frac{1}{3}}$$


This is the optimal $\Delta t$ to use when using the first order, finite difference, anything less than this value, the upper bound for error will begins to bounce back due to the round off and the truncation erros shadowing the error in the anlalytical formula. 
