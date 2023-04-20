---
alias: Variational Directional Derivatives
---
- [Subgradient Introduction](Subgradient%20Introduction.md), 
- [Epigraph](../Background/Epigraph.md), 
- [Support Function](../CVX%20Analysis/Support%20Function.md), 

---
### **Intro**

Subderivative is a number, not a vector. It tells how the function changes given a specific direction and a point in the domain of the function. The idea of a subderivatives is complicated. Here, we present an overview from Dmitry, but still list the sources for its variants, generalizations for a complete treatment of the topic. 

* Dimitry's AMATH 516 Course Notes. 
  * Section 3.5.2, page 68. 
* \<Variational Analysis by Rockafellar\>
  * 8.A, Page: 299. 
* \<Modern Nonconvex Nondifferentiable Optimizations\> by Ying Cui
  * This book has a very detailed classifications of different types of subderivatives. 
  * 4.1, page 150. 
* \<First Order Methods in Optimizations\>
  * Section 3.3 starts talking about directional derivatives. pg: 44


---
### **Dimitri's Variational Definition**

From Professor's Demitri's standpoint, we understand the scope when the definition of subderivative (directional derivative) is most applicable, and why when the function is not Lipschitz Continuous, we have to consider another type of derivative that preserves the closedness. 

> Consider any augmented real function $f$ at a point $x$ where $f(x)$ is finite, the direction derivative in the direction of $u$ is given as: 
> $$
> \begin{aligned}
>   d[f](x|u) = \lim\inf_{\substack{\tau \searrow 0 \\ v\rightarrow u}}
>     \frac{f(x + \tau v) - f(x)}{\tau}
> \end{aligned}
> $$

**Notations**

For more complex expression such as $f(Ax + b)$ in the direction of $u$, we use the notation $[f(Ax + b)]'(x|u)$. 

**Remarks**:
Immediately Observe the Equivalence to the tangent cone definitions [Tangent Cone](../Background/Tangent%20Cone.md) on the epigraph of the function: 

$$
\begin{aligned}
	\text{epi}(f'(x|\cdot)) = N_{\text{epi}(f)}((x ,f(x)))
\end{aligned}
$$

Such a definition is suitable for all type of real-valued functions, and just like what Dimitri's did for the subgradient, this definition of subderivative is much more generalized, and when $f$ is *Lipchitz Continuous* on a neighborhood of points (A characterization of convex functions), the above definition is Equivalent to the usual definition: 

> Consider any $f$ that is an augmented real function and it's Lipschitz continuous around the point $x$, then the directional derivative in the direction of $u$ is: 
> $$
> \begin{aligned}
>      f'(x|u) = \lim_{\tau \searrow 0}\frac{f(x + \tau u) - f(x)}{\tau}
> \end{aligned}
> $$

We skip the proof for this remark item. I need to point out that, any function that is locally Lipschitz is true for all close, convex, lsc function at the $\text{ri}.\text{dom}(f)$. Hence, under this case, we have the subderivative equals to above. See [Convex Directional Derivatives](Convex%20Directional%20Derivatives.md). 


---
### **Lack of Closedness**

One prime example is the indicator function of a closed unit disk in $\mathbb R^2$. Let $\delta(x)$ be the function, then we consider its directional derivative at the point $x = (1, 0)$ along the direction of $(0, 1)$. Let $\bar x$ be the point that we are taking the derivative and $u$ be the direction, then the limit: $\lim_{\tau \searrow 0}(f(\bar x + \tau u) - f(\bar x))/\tau = \infty$ because the ray: $\bar x + \mathbb R_+(u)$ just lay outside of the disk which is always infinity. Therefore, we consider a different definition of subderivative, where, the ray itself is also converging to $u$ in addition to taking the infimum on the sequence of limit points.

**Why closedness is a concern here for the subderivative of Non-Lipschitz function in Dimitry's writing?**

He didn't say and I don't know. 

---
### **Theorem: Subderivative is Supporting the Subgradient Set**

> Let $f$ be any augmented real valued convex proper function, then for any $x\in \text{int}\circ \text{dom}(f)$, Then the direction derivative along the direction $u$ is the support function on the subgradient set $\partial[f](x)$: 
> 
> $$
> \begin{aligned}
>    f'(x|u) = \sup_{y\in \partial [f](x)}\langle y, u \rangle = \delta^\star_{\partial [f](x)}(u)
> \end{aligned}
> $$

**Proofs**:

#UNFINISHED 

**Remarks**:

Observe that the theorem is only limited to closed and convex function. For other types of functions this is not true and we will need new theories for them. 

**Source**:
There are multiple sources talking about this thing under different names. Dimintry's AMATH 516 course note it's in: Theorem: 3.50, Page 72. In \<First Order Methods in Optimizations\> it's referred to as *The Max Formula* for theorem 3.26 at pg: 47. 

