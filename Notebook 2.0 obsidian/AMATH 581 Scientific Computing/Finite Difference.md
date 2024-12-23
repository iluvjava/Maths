The story behind finite difference is a bit complicated, so here is just a quick reference for things, in case that I forgot or something. 
[[Taylor Series]]

---
### **Order 2 Methods**
**Forward, Backward**: 

$\mathcal{O}(\Delta t^2)$ forward and backwards difference schemes for $f'(t)$ and $f''(t)$. 

$$
\begin{aligned}
	f'(t) &= \frac{3f(t) -  4f(t\pm \Delta t) + f(t \pm 2\Delta t)}
	{\pm 2\Delta t}  + \mathcal{O}(h^2)
	\\
	f''(t) &= \frac{2f(t) - 5f(t \pm \Delta t) + 4f(t \pm 2\Delta t) - f(t \pm 3\Delta t)}
	{\Delta t^2} + \mathcal{O}(h^2)
\end{aligned}
$$

Or, you can use the Sympy (python module) to look for finite difference in a quick and dirty way (Solve it algebraically to get the right formula for points of interests). 

**Proof**: 

Use Taylor series. 

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
See [here](https://www.youtube.com/watch?v=scQ51q_1nhw) for more. Finite difference it's a special case of Newton's Interpolation. 


---
### **Practical Concern over IEEE Floating Point Arithmetic**

When actually computing the finite difference on the computer, there is a certain threshold for the discretization of the domain. See [[Computer Bad at Maths]] for more relevant discussion. 