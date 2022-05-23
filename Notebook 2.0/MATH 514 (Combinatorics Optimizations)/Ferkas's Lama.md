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

Take note that, if $Ax = b$ with $x \ge \mathbf 0$, then $b$ is in the cone of all the columns of the matrix $A$ (some columns might be forced to be multiplied by zero from $x$). In that case, it's impossible to have $y^TA\ge \mathbf 0$ ($y$ lying on one side of all columns of $A$) such that a hyperplane defined by $y$ separates vector $b$ and columns of $A$. 

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


---
### **Extension**

Corollary 2.5(b) From \<A Course in Combinatorial Optimization\>

> Let $P:= \{x|Ax \le b\}$ be non empty then we have 
> $$
> (\forall x \in P: c^Tx \le c_0 ) \iff (y \ge \mathbf 0: y^TA = c^T, y^Tb \le  c_0)
> $$

**Things to Observe**

It's fitting the form of Variant (1) of Ferkas Lemma, but it's having an extra parameter $c_0$ for the separating hypre plane defined by $b$, the plane separates points in the polytope and the vector $b$. 

**Proof**

The $\impliedby$ direction is $y^TA = c^T \implies y^TAx = c^Tx$, but $Ax \le b$  and $y\ge \mathbf 0$ therefore $y^TAx \le y^Tb \le c_0$, so then $c^Tx \le y^Tb \le c_0$. 


To prove $\implies$ we use proof by contraposition, assume that $\nexists [y^T \; y_0]^T\ge \mathbf 0$ such that: 

$$
\begin{aligned}
    \begin{bmatrix}
        y^T & y_0
    \end{bmatrix}
    \begin{bmatrix}
        A & b
        \\
        \mathbf 0 & 1
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        c^T & c_0
    \end{bmatrix}
\end{aligned}
$$

The above expression fits the left condition of the original form of the Ferkas lemma, but with $[y^T \; y_0]$ being a left hand side multiplier to the matrix. By ferkas lamma $\exists [z^T \; z_0]^T$ such that: 

$$
\begin{aligned}
    &\begin{bmatrix}
        A & b \\
        \mathbf 0 & 1
    \end{bmatrix} 
    \begin{bmatrix}
        z \\ z_0
    \end{bmatrix}
    =
    \begin{bmatrix}
        Az + z_0b
        \\
        z_0
    \end{bmatrix}
    \ge 
    \mathbf 0
    \\
    & \text{AND}
    \\
    & \begin{bmatrix}
        c^T & c_0
    \end{bmatrix}
    \begin{bmatrix}
        z \\ z_0
    \end{bmatrix}
    = 
    c^Tz +c_0z_0 < 0
\end{aligned}\tag{1}
$$

Which are the conditions for the right side of Ferkas's Lemma Original form. There are 2 cases for $z_0$, they are $=0$ or $> 0$, under both case we want to show that the condition $c^Tx \le c_0$ is not true. **If $z_0 = 0$ then** $Az\ge \mathbf 0$ and $c^Tz< \mathbf 0$. Let $x\in P$, for all $\lambda\ge 0$, $A(x - \lambda z) = Ax - \lambda Az \le Ax \le b \implies x - \lambda z\in P$. Fix that $x$ and consider: 

$$
\begin{aligned}
    & A(x - \lambda z) = Ax - \lambda Az \le Ax \le b \implies x - \lambda z\in P
    \\
    & c^T(x - \lambda z) = c^Tx - \lambda \underbrace{c^Tz }_{< 0}
\end{aligned}
$$

The last $<0$ on the last line is because of conclusion from (1). The last expression implies that $c^T(x - z\lambda) > c_0$ for a large enough choice of $\lambda$ assumine that $c^Tx \le c_0$ because $-\lambda c^Tz$ is a positive quantity. **For the second case**  if $z_0 > 0$ we can rescale the vector $[z^T \;\;z_0]$ so that it's $[z^T/z_0 \;\; 1]^T$, then $Az + b \ge \mathbf 0$ implies $A(-z)\le b$ implies $-z \in P$; also $c^Tz + c_0 < 0 \implies c^T(-z) - c_0 > 0 \implies c^T(-z) \ge 0$. Which contradicts that $\forall x \in P: c^Tx \le c_0$. 

**Geometric Interpreations**

$\implies$ tells a story that, for a polytope that is bounded on the direction of $c$, then it's possible to find a combinations of the constraints normals pointing towards the same direction as $c^T$ ($y^TA = c^T$) such that $y^Tb\le c_0$. 

This is linked to the duality of Linear programming because the left part of the iff statement is the bounded primal and the right part of the iff is the dual reaching at least as much as what primal is; in this case $c_0$. 
