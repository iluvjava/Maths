[[Polytopes]]
[[Cone]]
[[Strict Separations Theorem]]

In fact, the wiki of this is very good: [wiki](https://en.wikipedia.org/wiki/Farkas%27_lemma)

---
### **Intro**

Ferkas lemma is about the geometry of polytopes and cones. 

> $$
> \exists\; x \ge \mathbf 0: Ax = b \iff 
> \neg (\exists\; y: y^TA\ge \mathbf 0 , y^Tb < 0)
> $$

Take note that, if $Ax = b$ with $x \ge \mathbf 0$, then $b$ is in the cone of all the columns of the matrix $A$. In that case, it's not possible to separate $b$ using a hyperplane $y$. 

**Proof**

We first consider the proof that $\implies$ by assuming that $x \ge \mathbf 0$ with $Ax = b$. For constradiction, further assume that $y: y^TA\ge \mathbf 0$, then: 

$$
\begin{aligned}
    (y^TA)x &\ge \mathbf 0
    \\
    \mathbf 0  &\le 
    y^T(Ax) = y^Tb < 0
\end{aligned}
$$

And we derived a contradiction. Next, we prove that $\impliedby$. And we prove it using contrapositive. We assume that it's not the case that $b$ is in the cone of $Ax$, then we can find a hyperplane to separate the point $b$ and the cone. 

$$
\begin{aligned}
    & b \neq \text{cone}(A)
    \\
    \implies \exists\; H &:= \{y: c^Ty = c_0\} \text{ that separates}
\end{aligned}
$$

The hyperplane doesn't have to be affine and we can let it crosses the origin, we can do this because we have a $\text{cone}(A)$ meaning that $c_0 = 0$ is possible and then we let $b$ in strict negative half and $y$ in non-negative half. 

$$
\begin{aligned}
    & c^Ty \ge \mathbf 0 \; \forall y \in \text{cone}(A)
    \\
    & c^Ty \ge \mathbf 0 \;\wedge \; c^Tb < 0
\end{aligned}
$$

Take note that, $y$ being in the cone on columns of $A$ means that $c^Ta_i \ge 0\;\forall \; i\in [m]$ where $a_i$ is the ith row of the matrix $A$. 


---
### **Variants**


**Variant 1**: 
> $$
> \exists x: Ax \le b \iff 
> \neg( \exists \; y \ge \mathbf 0 : y^TA = \mathbf 0 , y^Tb < 0 )
> $$

We transform the constraints $Ax \le b$ into the same form as the original, and then we match back the parameters for the other statement. Firstly we wish to transforom the polyhedra of the form $Ax \le b$ to the form $Ax' = b', x'\ge \mathbf 0$. To do that, consider the following: 

$$
\begin{aligned}
    & \forall x: Ax \le b \implies \exists! s\ge \mathbf 0: Ax + s = b
    \\
    & \forall x\in \mathbb R^n \;\exists\; x^+, x^- \ge \mathbf 0: 
    x = x^+ - x^- \quad 
    \\
    &\hspace{1.1em} \implies 
        A(x^+ - x^-) + s = b
    \\
    & A' := \begin{bmatrix}
        A & -A & I
    \end{bmatrix}\begin{bmatrix}
        x^+ \\ x^- \\ s
    \end{bmatrix}
    \\
    & x' := \begin{bmatrix}
        x^+ \\ x^- \\ s
    \end{bmatrix}
    \\
    &\hspace{1.1em} \implies 
    A'x' = b , x' \ge \mathbf 0
\end{aligned}
$$

The mapping between $x$ and $x'$ might not be a one to one relations, there are more $x'$ than $x$. Given any $x = x^+ + x^-$, we also have $x = (x^+ - \delta) + (x^- + \delta)$, as long as $|\delta| \le \min(x^+, x^-)$. A vertex $x$ in the original polyhedra might not be able to maps back to a unique vertex in the new polyhedra. After such a transformation, we apply the Ferka's Lemma to the new polyhedra $A'x' = b, x' \ge \mathbf 0$, giving us the conditions: 

$$
\begin{aligned}
    \neg (\exists y \ge \mathbf 0 : y^TA' \ge \mathbf 0 \wedge b^Ty < 0)
\end{aligned}
$$


**Variant 2**
> $$
> \begin{aligned}
>     \exists x\ge \mathbf 0: Ax \le 0 \iff \neg 
>     (
>         \exists y \ge \mathbf 0 :
>         y^TA\ge \mathbf 0, b^Ty < 0
>     )
> \end{aligned}
> $$



