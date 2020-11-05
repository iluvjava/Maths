We will need to know something about the [[Complex Functions]] before we talk about this. 

---
### Intro
It's not true that among all the complex functions, that we can take the derivative directly on it, because, they are mult-variable functions after all, and it's kind a coincidence for one variable differential to exist for it. However, when the normal rules of differentials applied to complex number just like real number, and it applies for a open region along that point, then Analyticity is true for that functions. 


###  Cauchy Riemann Conditions

The Cauchy Riemann Conditions is a quick way of checking whether a complex function satisfies Analyticity at a point on the complex plane. 

Ok, so, the key here is to model the complex function in its real and imaginary parts, and that means the function can be phrased like this: 

$$
f(x, y) = u(x, y) + iv(x, y)
$$
And at the same time, we need to assure that, when approaching a point in the complex plane from both the imaginary and real direction, the limit must matches. 

$$
\lim_{\Delta x \rightarrow 0}
\frac{f(x + \Delta x, y) - f(x)}
{\Delta x} = f'(z) = \partial_x u + i\partial_x v
$$

$$
\lim_{\Delta y \rightarrow 0}\frac
{f(x, y + \Delta y) - f(x, y)}
{i \Delta y} = f'(z) = \partial_y v - i \partial_y u
$$

Then, a function is differential at a point $z_0$ if the Cauchy-Riemann equations is satisfied, so it has to be the following: 

$$
\partial_x u= \partial_y v \hspace{2em} \partial_x v = - \partial_y u
$$

Notice that, this conditions is sufficient to prove a given function is differentiable if  **all partial derivative of the $f(x)$ are continuous at that point**, Remember we need a point $z_0$ to determine whether the Analiticity of the function. 

**Note**: 

Substitute the value of $z_0$ in the end, after we have the derivative, because some pathological function can have limit at the x, y direction when approaching a point, but failed to have the same limit when it approaches that points along some kind wacky curve or shit like that. 

#### Conjugate Differential (A Short Cute)

So, for the Analyticity of a function, there is a shortcut for verifying this, more prominently, if a function involves some kind of derivative, then it's probably not differentiable at the query point.

Conveniently, the following is true: 

> $$\frac{\partial f}{\partial z^*} = 
> \frac{1}{2}\left( 
\partial_x f + i \partial_y f
\right) = 0
> $$

This is just the above Cachy Riemann Conditions, but expressed in terms of partial the derivative of the function wrt the conjugate of the complex number. 

This can be very simple to do if the function can be expressed as some conjugate and the number itself. 