[[Complex Functions]]
Let's make the differential of complex function more detailed. 

---
### **Intro**

Complex differentiation at a point is quite a strong condition. We define a complex differentiation first, which is exactly the same as a real differentiation, but with complex numbers and complex function. 

#### **Def | Complex Differentiation at a point**

> A function $f$ is complex differentiable at a point $z_0$ if and only if the following limit is defined and exists as an finite value:
> $$
> \begin{aligned}
>     \lim_{h\rightarrow 0 + 0 i} = \frac{f(z)  - f(z_0)}{z - z_0}. 
> \end{aligned}
> $$

If the limit exist for the region $|z - z_0| > 0$, then it's called Holomorphic around the region $z_0$. 

**Remarks**

Holomorphic around a point is equivalent to analytical around that point. However, being complex differentiable point wise is not enough to conclude that the function is analytical around any, non-singular region of $z_0$. 

---
### **Gradient Field** 

The function can be treated as a real function and apply the rules of derivative, *only if we know that the function is differentiable. We can't trust it when the function is not differentiable. Because the gradient of a function at a point, in value is deceiving. For the basic part, a complex function is differentiable if the following limit exists and it's finite: 

> $$\lim_{|z| \rightarrow 0} 
> \frac{f(z + z_0) - f(z)}{z}
> $$

If such a limit exists then substituting the above representations for $f$ and considering the limit along the real direction, then it will be 

$$
\begin{aligned}
    \lim_{\Delta x \rightarrow 0} \frac{u(x + \Delta x, y) - u(\Delta x, y)}{\Delta x} + i\frac{v(u + \Delta x, y) - v(u, y)}{\Delta x}
    = \partial_x u + i \partial_v = \partial_x f. 
\end{aligned}
$$

Similarly

$$
\lim_{i\Delta y \rightarrow 0} \frac{u(x, y + \Delta y) - u(x, y)}{i\Delta y} - i\frac{v(x, y + \Delta y) - v(x, y)}{i\Delta y} = -i\partial_yu + \partial_yv = \partial_y f
$$


And they have to be equal, giving us: [[Cauchy Riemann Condition]]. This is a necessary conditions for differentiability of complex function. 

#### **Geometrical Interpretation of Differential**

We list them here without justifications

**The modulus** 

of $f'(z)$ has very similar meaning in as the real differential, basically if I go any direction around the point a, what kind of changes in magnitude I will get for the output of the function. 

**The argument** 

of the number $f'(z)$ is actually the quotient between $\text{Arg}(z - a)$ and and $\text{Arg}(f(z) - f(a))$. 

**Note**

There are some complications regarding how the argument of the changes and its differential for a complex multi-valued function, see [[Complex Logarithm]], [[Branch Cut]] for more. 


---
### **Examples**

Fix some complex number $x_0$, 

$$
\begin{aligned}
    f(z) &= z^2
    \\
    f'(z_0) &= \lim_{z\rightarrow z_0} \frac{z^2 - z_0^2}{z - z_0}
    \\
    &= \lim_{z\rightarrow z_0}\frac{(z - z_0)(z + z_0)}{z - z_0}
    \\
    &= \lim_{z\rightarrow z_0} {z + z_0} = 2z_0. 
\end{aligned}
$$

And take notice that, the expression is independent of the way we approaches the point $z_0$ under the complex plane, it works for all possible limiting sequence converging to $z_0$. However, here is another function that is not differentiable according the the definitions of complex differential: 

$$
\lim_{z \rightarrow z_0} \frac{|z - z_0| - |z_0|}{z - z_0}
$$

Take notice that, the numerator is real and the denominator is complex, and this means that, the choice of approaching the $z_0$ will give different complex values for the fraction, which then means that that this is path dependent. 