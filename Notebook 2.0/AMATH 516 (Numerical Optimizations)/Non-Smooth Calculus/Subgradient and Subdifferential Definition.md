* [[Normal Cone]]
* [[Characterizing Functions for Optimizations]]
* [[Convex Sets]]

---

### **Intro**

Previous coverage of the same thing but for beginner: [[Subgradient]]. Materials take with reference from Chapter 3 of \<First Order Method for Optimizations\> by SIAM. 


**Defintion: Subgradient**

> Let $f$  be convex proper function mapping from $\mathbb E$ to $\mathbb {\bar R}$, a vector $g$ is referred to as sub-differential to the point $x\in \text{dom}(f)$ when: 
> 
> $$
>     f(y) \ge f(x) + \langle g, y - x\rangle \quad \forall y\in \mathbb E
> $$
> 
> Define the set of all Sub-gradient at $x$ to be: $\partial[f]_{x}$And when $x\not\in \text{dom}(f)$ we defined $\partial [f]_x = \emptyset$. 

**Proof**

The proof follows directly from the fact that a convex function has a convex epigraph, and using [[Strict Separations Theorem]] for convex set, one is able to separate anything in the epigraph with anything that is outside of the epigraph using elements from the subgradient $g$. 

$\text{epi}(f)$ is cvx and closed, if $\text{epi}(f)$ is a singleton, then $\partial[f](x) = \{(g, -1): g\in \mathbb E\}$. Otherwise, $\text{epi}(f)$ is not singleton. Since the set is convex, by strict separation we have: 

$$
\begin{aligned}
    & \forall (y, \beta) \not\in \text{epi}(f)\; 
    \exists (x, f(x)) \in \text{bd}\circ \text{epi}(f), g\in \partial [f](y):
    \\
    &
    \langle (y, \beta), (g, -1)\rangle \le \delta \le \langle (g, -1), (x, f(x))\rangle
    \\
    & 
    \langle y, g\rangle - \beta \le \langle g, x\rangle - f(x)
    \\
    & 
    \langle g, y - x\rangle - \beta \le -f(x)
    \\
    & 
    f(x) \ge \beta + \langle g, x - y\rangle
    \\
    &
    (y, \beta)\not \in \text{epi}(f) \implies \beta \le f(y)
    \\
    \implies & 
    f(x) \ge f(y) + \langle g, x - y\rangle
\end{aligned}
$$

Which demonstrates the geometric interpretations for the subgradient of a convex function. 






**Remarks**

The definition in this case is not consistent with the definition of gradient of smooth function when $f$ nonconvex. To mitigate this, below is another definition of subgradient and **subdifferential** that generalize the idea to nonconvex, non-smooth functions. 

Geometrically, it's looking for a point that is on the boundary of $\text{epi}(f)$ and then separate the graph using a line defined via $g$. And if such a line is perpendicular, then there is no subgradient for the function for that point. And for all seriousness, it can happen convex function at the exterior of their domain. 

For convenience of notation, one has the choice of writing the definition of subgradient directly with: 

$$
\begin{aligned}
    f(y) \ge f(x) + \langle \partial[f]_x,y - x\rangle
\end{aligned}
$$

And that is enough to understand what people are saying. 

**Definition: Generalized Gradient**

> Let $f$ be $\mathbb E \mapsto \mathbb{\bar R}$, let $g$ be part of the sub-gradient, and let $x\in \text{dom}(f)$, then: 
> 
> $$
> \begin{aligned}
>     f(y) \ge f(x) + \langle g, y - x\rangle + o(\Vert y - x \Vert) \quad \forall y \in \mathbb E
> \end{aligned}
> $$
> 
> And if $x\not\in \text{dom}(f)$, then there is no gradient, and we define the set of generalized **subdifferential** to be the set of all sub-gradient, noted as: $\bar\partial[f]_x$. 

Where the little $o$ notation is a limit in disguise, in this case it has the property: $\lim_{x \rightarrow \infty}\frac{o(\Vert y - x\Vert)}{\Vert y - x\Vert} = 0$. 

**Remarks:**

The supporting tagent line is now only a limiting behaviors for the given function, and now it's consistent with the gradient definition for ordinary smooth function. In fact, I will state my opinions here without proof: 

$$
\partial [f](x)\subseteq\bar{\partial}[f](x) 
$$

Is true for the above definition. Whenever it's not mentioned whether $f$ is convex or not, please stick with the second definition regardless whether there is a bar or not. 

Regardless of the fact that it's called the generalized gradient, the function $-|x|$ doesn't have generalized gradient at the point $x = 0$. 


### **Notations**

A good notations should be clear about several things when taking the derivative of a function: 
* What variables are we raking the derivtive with? 
* What varlues are we putting into the derivative functions? 

For example: $\partial [f(Ax + b, u)](u = x^+), \partial [f(Ax + b, u)]_{u = x^+}$: Taking the derivative of $f$ wrt to $u$ at the point $x^+$. This notation is adopted by me because it's much clearer compare to some of the textbooks out there. 


---
### **Optimality on Sub-Gradient for Convex Functions**

On almost trivial results from the above definition is that if $x^+$ is a minimizer for the convex function $f(x)$, then $\mathbf 0 \in \partial [f]_{x^+}$ because: 

$$
f(y) \ge f(x^+) \quad \forall y\in \mathbb E
$$

And it can be viewed that $g = \mathbf 0$, directly interpreted from the definition of the subgradient. 

---
### **Normal Cone and Generalized Subgradient**

**Theorem Statement:**

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, consider a point where $f(x)$ is finite, then the equivalence hold.
> $$
>   v \in \partial [f](x)\iff (v, -1)\in N_{\text{epi}(f)}(x, f(x))
> $$

**Remarks**: 




#TODO:FILL THIS IN! 






