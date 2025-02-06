- [Moreau Envelope and Convex Proximal Mapping](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Lower Semi-Continuous](../Background/Lower%20Semi-Continuous.md)

---
### **Intro**

We introduces concepts for the proximal mapping when the function is not necessarily convex. 

**References:**
- Rockafellar and Wetts, pg.20. 

#### **Definition | Moreau Envelope and Proximal Mapping**
> For a $f: \R^n \rightarrow \overline \R$ lsc and proper, let $\lambda > 0$, define the proximal mapping $\prox f: \R^n \rightarrow 2^{\R^n}$, Moreau envelope function $\env_f: \R^n \rightarrow \R$ by 
> $$
> \begin{aligned}
>     \pprox{\lambda f} (y) &:= 
>     \argmin{x}\left\lbrace
>         f(x) + \frac{1}{2\lambda} \Vert x - y\Vert^2
>     \right\rbrace,
>     \\
>     \env_f(y) &:= 
>     \min_{x} \left\lbrace
>         f(x) + \frac{1}{2}\Vert x - y\Vert^2
>     \right\rbrace \le f(y). 
> \end{aligned}
> $$


**Remarks**
This is just Rockafellar and Wetts definition 1.22 in our notations. 


#### **Definition | Prox-bounded, Prox-boundedness**
> $f: \R^n \rightarrow \overline \R$ is prox-bounded if there exists $\lambda > 0, x \in \R^n$ such that $\env_f(x) > \infty$. 
> The supremum of the set of all such $\lambda$, $\lambda_f$ is the prox-boundedness of $f$. 

