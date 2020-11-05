The story behind finite difference is a bit complicated, so here is just a quick reference for things, in case that I forgot or something. 

---

#### Order 2: 

$\mathcal{O}(\Delta t^2)$ forward and backwards difference schemes for $f'(t)$ and $f''(t)$. 

$$
f'(t) = \frac{\pm 3f(t) \mp  4f(t\mp \Delta t) \pm f(t \mp 2\Delta t)}
{2\Delta t}
$$

$$
f''(t) = \frac{2f(t) - 5f(t \pm \Delta t) + 4f(t \pm 2\Delta t) - f(t \pm 3\Delta t)}
{\Delta t}
$$

Notice the some of the symmetry here allows us to exploit the super position operator $\pm$ and $\mp$. 


---
#### Newton's Interpolations and Finite Difference 





