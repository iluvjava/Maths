- [[Polytopes and Vertices]]
- [[Introducing Cone]]
- [[Strict Separations Theorem]]

In fact, the wiki of this is very good: [wiki](https://en.wikipedia.org/wiki/Farkas%27_lemma). 

---
### **Intro**

Farkas lemma is about the geometry of polytopes and cones. 

> $$
> \exists\; x \ge \mathbf 0: Ax = b \iff 
> \neg (\exists\; y: y^TA\ge \mathbf 0 , y^Tb < 0)
> $$

Take note that, if $Ax = b$ with $x \ge \mathbf 0$, then $b$ is in the cone of all the columns of the matrix $A$ (some columns might be forced to be multiplied by zero from $x$). In that case, it's impossible to have $y^TA\ge \mathbf 0$ ($y$ is pointing along the same directions of all columns of $A$) such that a hyperplane defined by $y$ (which defined via the rows of $a$) separates vector $b$ and columns of $A$. 

**Observations**

This should remind the reader of the condition [Fredholm Alternative](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Fredholm%20Alternative.md). 

**Proof**

We first consider the proof that $\implies$ by assuming that $x \ge \mathbf 0$ with $Ax = b$. For contradiction, further assume that $y: y^TA\ge \mathbf 0$, then: 

$$
\begin{aligned}
    (y^TA)x &\ge \mathbf 0
    \\
    \mathbf 0  &\le 
    y^T(Ax) = y^Tb < 0. 
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

Observe that $y^TA' = [y^TA \; -y^TA \; y^T] \ge \mathbf 0$, which is saying that $y^TA = \mathbf 0$; the end. 

**Polar Cone Variant**: 

> Consider some $A\in \mathbb R^{m\times n}$, $x\in \mathbb R^n$, and some $c\in \mathbb R^n$, we have: 
> $$
>     (Ax\le \mathbf 0 \implies c^Tx \le 0) \iff (\exists y\ge \mathbf 0: A^Ty = c)
> $$

**Proofs**: 

$\impliedby$ is simple. Choose any $y^TA = c^T \implies y^TAx = c^Tx < 0$ be cause $Ax \le \mathbf 0 \wedge y \ge \mathbf 0$. For the other direction $\implies$, we make a direct proof and it's not trivial. 

**Claim 1**: 

> It's impossible to have $\forall x: Ax \le \mathbf 0 \wedge \langle c, x\rangle = 0$, and in the case which $\exists x: \langle c, x\rangle = 0 \wedge Ax \le \mathbf 0$, then $Ax = \mathbf 0$ too. 
> 
**Proof of Claim 1**: 

If $\forall x: Ax \le \mathbf 0$, then $c \perp a_i$ for some $i$ such that $\langle a_i, x\rangle < 0$. If this is not true for some $i^+\in [m]: \langle a_{i^+}, x\rangle = 0$, then reconsider $x + a_{i^+}$ which might gives $\langle c, a_{i^+}\rangle < 0$.

Else it's the case that $c\perp c_i \quad \forall i \in [m]$, then we choose $x = c$ to have $Ax = \mathbf 0$, but $\langle c, x\rangle$. In both cases, we should end up with a strictly negative $\langle c, x\rangle$.  

Then $\exists x: Ax \le \mathbf 0 \wedge \langle c, x \rangle < 0$. Consider: 

$$
\begin{aligned}
    A &= \begin{bmatrix}
        & a_1^T & \\ & a_2^T& \\  & \vdots & \\ & a_n^T& 
    \end{bmatrix} \quad Ax \le \mathbf 0
    \\
    \tau &= \{i \in [m]: \langle a_i, x\rangle < 0\}, 
    \\
    \implies &
    \forall j\in \tau, \exists y_j = \frac{\frac{1}{|\tau|}\langle c, x\rangle}{\langle a_j, x\rangle} \ge 0
\end{aligned}
$$

By such a choice of $y_j$ where $j\in \tau$, we consider a new choice for $y$ that is defined for all $i\in [m]$: 

$$
\begin{aligned}
    y_i &:= \begin{cases}
        0 & i \not\in \tau
        \\
        \frac{\langle c, x\rangle}{|\tau|\langle a_j, x\rangle} & \text{else}
    \end{cases}
    \\
    \underset{[1]}{\implies} & 
    y^TAx - c^Tx = 0\implies y^TA = c^T
\end{aligned}
$$

\[1\]: comes from summing up all $y_j\langle a_j, x\rangle - \langle c, x\rangle = 0 \;\forall j \in \tau$ and then solves for $y_j$. This completes the proof. Since it's not always the case that $\langle c, x\rangle$ we can always choose some $x$ such that $Ax\le \mathbf 0 \wedge \langle c, x\rangle < 0$, and proving the statement. 

**Remarks:**

The variant of the theorem helps with figuring out the polar of polyhedral cones. 

To clarify, if $\langle c, x\rangle\le 0$ for all $x$ such that $Ax \le \mathbf 0$, then it has to be the case that $y$ is in the cone spanned by rows of $A$. Which is equivalently saying: 

$$
\{x: Ax \le \mathbf 0\}^\circ = \{A^Ty: y\ge \mathbf 0\}
$$

And it helps use looking for the equivalent cones and polar cones in the case of a polyhedral cone. 

**Note**: I don't know how this is related to the Farkast lemma, but it's stated as a variant of Farkas in \<First Order Method in Optimizations\> by SIAM, Lemma 2.28. 

---
### **Extension**

**Corollary 2.5(b)** From \<A Course in Combinatorial Optimization\>

> Let $P:= \{x|Ax \le b\}$ be non empty then we have: 
> $$
> (\exists c_0\forall x \in P: c^Tx \le c_0 ) \iff (\exists y \ge \mathbf 0: y^TA = c^T)\wedge (\exists c_0 \; y^Tb \le  c_0)
> $$

**Things to Observe**

It's fitting the form of Variant (1) of Farkas Lemma, but it's having an extra parameter $c_0$ for the separating hyper plane defined by $b$, the plane separates points in the polytope and the vector $b$. 

**Proof**

The $\impliedby$ direction is $y^TA = c^T \implies y^TAx = c^Tx$, but $Ax \le b$  and $y\ge \mathbf 0$ therefore $y^TAx \le y^Tb \le c_0$, so then $c^Tx \le y^Tb \le c_0$. 


To prove $\implies$ we use proof by contraposition, assume that $\nexists [y^T \; y_0]^T\ge \mathbf 0$ ($y_0$ here padded the inequality) such that: 

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

The above expression fits the left hand condition of the **original form of the Farkas lemma**, but with $[y^T \; y_0]$ being a left hand side multiplier to the matrix. By Farkas lemma $\exists [z^T \; z_0]^T$ such that: 

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

The last $<0$ on the last line is because of conclusion from (1). The last expression implies that $c^T(x - z\lambda) > c_0$ for a large enough choice of $\lambda$ assuming that $c^Tx \le c_0$ because $-\lambda c^Tz$ is a positive quantity. **For the second case**  if $z_0 > 0$ we can rescale the vector $[z^T \;\;z_0]$ so that it's $[z^T/z_0 \;\; 1]^T$, then $Az + b \ge \mathbf 0$ implies $A(-z)\le b$ implies $-z \in P$; also $c^Tz + c_0 < 0 \implies c^T(-z) - c_0 > 0 \implies c^T(-z) \ge 0$. Which contradicts that $\forall x \in P: c^Tx \le c_0$. 

**Geometric Interpretations**

$\implies$ tells a story that, for a polytope that is bounded on the direction of $c$, then it's possible to find a combinations of the constraints normals pointing towards the same direction as $c^T$ ($y^TA = c^T$) such that $y^Tb\le c_0$. 

**Remarks**: 

This theorem is linked to the duality of linear programming because the left part of the iff statement is the bounded primal and the right part of the iff is the dual reaching at least as much as what primal is; in this case $c_0$. 

For one more extension that appeared in AMATH 514, check out: [[Stiemke Theorem]]!!!

---
### **Source**:
Proofs are Taken from: Alexander Schrijver pg 31, 32 , A Course in Combinatorics Optimizations, they are summarized and organized/reinterpreted by Professor Vincent of AMATH 514 at University of Washington, 2022, Spring. 