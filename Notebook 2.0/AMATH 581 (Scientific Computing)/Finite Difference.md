The story behind finite difference is a bit complicated, so here is just a quick reference for things, in case that I forgot or something. 
[[Taylor Series]]

---
### **Order 2**
**Forward, Backward**: 

$\mathcal{O}(\Delta t^2)$ forward and backwards difference schemes for $f'(t)$ and $f''(t)$. 

$$
f'(t) = \frac{\pm 3f(t) \mp  4f(t\mp \Delta t) \pm f(t \mp 2\Delta t)}
{2\Delta t}
$$

$$
f''(t) = \frac{2f(t) - 5f(t \pm \Delta t) + 4f(t \pm 2\Delta t) - f(t \pm 3\Delta t)}
{\Delta t^2}
$$

Notice the some of the symmetry here allows us to exploit the super position operator $\pm$ and $\mp$. 

Or, you can use the Sympy (python module) to look for finite difference in a quick and dirty way.

**Central**: 
$$
\begin{array}{l}
f^{\prime}(t) &=&[f(t+\Delta t)-f(t-\Delta t)] / 2 \Delta t
	\\
f^{\prime \prime}(t)&=&[f(t+\Delta t)-2 f(t)+f(t-\Delta t)] / \Delta t^{2}
	\\
f^{\prime \prime \prime}(t)&=&[f(t+2 \Delta t)-2 f(t+\Delta t)+2 f(t-\Delta t)-f(t-2 \Delta t)] / 2 \Delta t^{3}
	\\
f^{\prime \prime \prime}(t)&=&[f(t+2 \Delta t)-4 f(t+\Delta t)+6 f(t)-4 f(t-\Delta t)+f(t-2 \Delta t)] / \Delta t^{4}
\end{array}
$$

---
### **Newton's Interpolations and Finite Difference**



---
### **Taylor Series Approach**

$$
y(t + \Delta t); \quad y(t); \quad y(t - \Delta t)
$$

Use Taylor series on these terms to get the expansion, canceling out terms to get the correct order of degree for the scheme. 

If you were given the scheme, then use the Taylor Series to verify it. 