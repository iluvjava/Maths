- [Operators for Optimizations CENTRAL HUB](Operators%20for%20Optimizations%20CENTRAL%20HUB.md)
- [Multivalued Functions, Set-valued Mappings](Multivalued%20Functions,%20Set-valued%20Mappings.md)

---
### **Intro**

Let the space of the monotone operators. 
Most of the materials are from Heinz's book Convex Analysis and Monotone Operator, and his teaching of MATH 565 in the university of British Columbia, 2024 Term 2 winter. 


#### **Definition | Monotone Operator**

> An operator $T:  X \mapsto 2^X$ is a monotone operator if for all $x, y \in \mathbb E$ we have $\inf\langle y - x, Ty - Tx\rangle \ge 0$. 

**Observations**

The reader should consider the case when $T$ is a function mapping from $\mathbb R \mapsto \mathbb R$ as a single valued mapping. 
It can be viewed as a multi-valued mapping that always maps to a singleton set. 
$f: \R \rightarrow \R$ is an operator from a set to the set of singletons enumerating each element of the reals. 
In this case, the definition of monotonicity is equivalent to the function being monotone. 

The monotone relations specifies an inequality for direction of veoctor $y - x$ and the set of vector $v \in Tx, u \in Tx$. 
It's specifies that the vector $u - v$ lies in the positive half space defined via $x - y$. 


**Remarks**

A monotone operator doesn't imply: 
1. Continuity of any kind. 
2. Singled value property of any kind. 
3. Subjectivity of any kind. 

The operator defines non-smooth objects in convex analysis, such as subgradient and generalized Lagrangian of convex programming problem.


#### **Thm | Another Equivalent Definition of Monotone Operator**
> $A$ is monotone (as defined above) is equivalent to the condition that 
> $$
> \begin{aligned}
>     \forall (x, u) \in \text{gph}A, (y, v) \in \text{gph} A: 
>     \Vert y - u\Vert^2 + \Vert x - v\Vert^2 \ge 
>     \Vert x - u\Vert^2 + \Vert y - v\Vert^2. 
> \end{aligned}
> $$

**Proof**

This is equivalent by considering that: 

$$
\begin{aligned}
    \Vert y - u\Vert^2 + \Vert x - v\Vert^2 
    &\ge 
    \Vert x - u\Vert^2 + \Vert y - v\Vert^2
    \\
    \iff
    - \langle y, u\rangle - \langle x, v\rangle
    &\ge 
    - \langle x, u\rangle - \langle y, v\rangle
    \\
    \iff
    \langle - y, u\rangle + 
    \langle - x, v\rangle + 
    \langle x, u\rangle + 
    \langle y, v\rangle &\ge 0
    \\
    \iff 
    \langle x, u - v\rangle + \langle y, v - u\rangle
    &\ge 0
    \\
    \iff 
    \langle x - y, u - v\rangle &\ge 0.
\end{aligned}
$$

That, is just the definition of being a monotone operator. 
It's equivalent because the process is revertible. 
On the first $\iff$, we have all the norms squared cacelling out from both sides of the inequalities. 


**Remarks**

This characterizations opens a new view on monotonicity of an operator. 
The convex hull of points $x + u, y + v, x, y$, are 4 corners of some shape in Hilbert space. 
T vector $\Vert y - u\Vert^2, \Vert x - v\Vert^2$ are the diagonals. 
$u - x, v - y$ are on the convex hull of this shape. 
Therefore, it's saying that the squared sum of the diagonals are longer than the squared sum of sides. 

See the proof of projection operator being monotone in the examples section at the end. 
It's an example that illustrate the use of this equivalent property. 



#### **Definition | Maximally Monotone**
> Mapping $A: X \mapsto 2^{X}$ is maximally monotone if $B: X \mapsto 2^X$ and satisfies $\text{gph}(A)\subseteq \text{gph}(B)$ then it must be $A = B$. 


---
### **Existence and Equivalent Definitions of Maximally Monotone operators**

We need to show that a maximally monotone operator exists, and then we show an equivalent definition. 


#### **Definition | Maximally Monotone Equivalent Definition**
> The operator $T: X \mapsto 2^X$ is a maximally monotone operator if and only if any $(x, x^*)$ that satisfies $\forall (y, y^*)\in \text{gph}(T)$ we have $\langle x - y, x^* - y^*\rangle \ge 0$ if and only if $(x, x^*)\in \text{gph}(T)$. 

**Observations**

Mathematically we have the equivalence 

$$
\begin{aligned}
    & 
    T: X \mapsto 2^X \text{ is max mono} \iff 
    [
        (x, x^*) \text{ monotonically relates to } (y, y^*) \in \text{gph} T
        \iff 
        (x, x^*) \in \text{gph} T
    ]
    \\
    & \text{Where monotonic relations relative to a monotone operator means: }
    \\
    & 
    (x, x^*) \text{ monotonically relates to } (y, y^*) 
    \iff 
    \forall (y, y^*) \in \text{gph} T: \langle x - y, x^* - y^*\rangle \ge 0
\end{aligned}
$$

Take note that taking the negations on $\iff$ of the state can make many more equivalent statement as the above statements. 
Some different ways of saying the same thing could occastionally be useful. 



**Demonstrations**

Proving $\impliedby$ by a contrapositive argument. 
If $T$ is not maximally monotone, then there exists a proper monotone operator $\tilde T$ such that $\text{gph}T \subsetneq \text{gph}\tilde T$. 
And there would exists a point $p=(x, x^*) \in \text{gph}(\tilde T)$, so that by monotonicity of $\tilde T$, we have $\forall (y, y^*) \in \text{gph}(T)$, $\langle x - x^*, y - y^*\rangle \ge 0$. 
Because $\text{gph}(T)\subseteq \text{gph}(\tilde T)$. 

To show $\implies$, it can be done by the definition of a maximally monotone operator, or a contrapositive argument as well. 

**Remarks**

This equivalent characterizations hinted at the another way of describing $Ax$ for all $x \in \text{dom}A$ where $A$ is maximally monotone. 
$x_A \in Ax$ would be all the point such that all other points in $\text{gph} A$ are monotinically related to $(x, x_A)$. 
Which is expressed as 

$$
\begin{aligned}
    Ax = \bigcap_{(y, v)\in \text{gph } A}
    \left\lbrace
        u \in X \; |\;  \langle x - y, u - v\rangle \ge 0
    \right\rbrace. 
\end{aligned}
$$

And as a consequence, $Ax$ is the insetsection of half spaces, therefore $Ax$ must also be a convex set as well. 


#### **Thm | Maximal Extension of Monotone Operators**
> For all monotone operator $A: X \mapsto 2^X$, there exists a maximal monotone operator $B$ such that $\text{gph}(A)\subseteq \text{gph}(B)$.

**Proof**

The proof is quite involved, and it may be moved to its own file instead of appearing in here. 

**Remarks**

The proof is very similar to [Hahn Banach Theorem and its Corollaries](Hahn%20Banach%20Theorem%20and%20its%20Corollaries.md). 
The extension of a monotone operators requires a very similar constructions.


---
### **Properties of Maximal Monotone Operators**
There are useful properties of maximal monotone operators. 

#### **Theorem | Sum of Max Mono Operators is Mono**
> Let $A, B$ be montone operator on $X$. Show that $A + B$ is montone on $X$. 

**Proof**
Directly we consider from the definition of a monotone operator called $A + B$. Take 2 points from the operator $(x, x^*) \in [A + B](x), (y, y^*) \in [A + B](y)$ then we would check 

$$
\begin{aligned}
    & \langle x - y, x^* - y^*\rangle
    \\
    &
    \begin{cases}
        \exists x_A \in Ax, x_B \in B x : x^* = x_A + x_B
        \\
        \exists y_A \in Ay, y_B \in By: y^* = y_A + x_B
    \end{cases}
    \\
    \implies 
    &= \langle x - y, x^* - y^*\rangle 
    \\
    &= 
    \langle x - y, x_A + x_B - (y_A + y_B)\rangle
    \\
    &= \langle x - y, x_A - y_A\rangle + \langle x - y, x_B - y_B\rangle, 
\end{aligned}
$$

using the monotonicity of both operator $A$ and $B$, the above quantity has a positive sum.

**Remarks**

So, for any monotone operator $A$, we would have $A + \{v\}$ being a monotone operator, and $I + A$ being a monotone operator as well using the above theorem. 
The sum of maximally monotone operator may not be maximally monotone. 
Their domain must satisfies certain conditions for their sum to be maximally monotone. 
For the sum of 2 maximally monotone operators, see [mon-sum.pdf (carmamaths.org)](https://carmamaths.org/resources/jon/mon-sum.pdf) for more. 


#### **Theorem | Continuous Monotone Operator is Maximal Monotone**
> Let $A : X \mapsto X$ be a continuous and monotone, then $A$ would be maximal monotone. 

**Proof**

Let $(x, x^*)$ monotonically relate to $\text{gph}(A)$. 
The graph of the operator would be defined through $\text{gph}(A) = \{(y, Ay) \;|\; y \in X\}$, then we can use one point $y \in X$ instead and call the definition of monotone graph we would have 

$$
\begin{aligned}
    \forall y \in X: 
    \langle x - y, x^* - Ay\rangle &\ge 0. 
\end{aligned}
$$

We want to show that $(x, x^*)$ is in $\text{gph}(A)$. 


$$
\begin{aligned}
    & \forall \alpha > 0, y_\alpha := x + \alpha(x^* - Ax)
    \\
    = & 
    \lim_{\alpha \searrow 0}
    x + \alpha(x^* - Ax) = x. 
\end{aligned}
$$

Using $y_\alpha$ instead of $y$, we try with $\alpha > 0$

$$
\begin{aligned}
    \langle x - y_\alpha, x^* - Ay_\alpha\rangle
    &\ge 0
    \\
    -\alpha
    \langle x^* - Ax, x^* - A y_\alpha\rangle &\ge 0
    \\
    \langle x^* - Ax, x^* - Ay_\alpha\rangle &\le 0
\end{aligned}
$$

talking the limit of $\alpha \rightarrow 0$, by continuity of $A$ and the definition of $y_\alpha$, and the inner product on Hilbert spaces, we would have $\langle x^* - Ax, x^* - Ax\rangle \le 0$. 
The only possible way for that is $x^* = Ax$, and therefore, $(x, x^*)\in \text{gph}(A)$. 
The graph would be strongly closed as well since weak convergence is weaker than strong convergence. 

**Remarks**

The assumption that $A$ is continuous is strictly stronger than necessary because the limit we use is the limit of $\alpha(x^* - Ax)$ approaching zero, which is only along the direction of the vector $x^* - Ax$.
This type of continuity is a weaker type called Hemi-Continuity.
See [wiki](https://en.wikipedia.org/wiki/Hemicontinuity) for more information.
Of course, naturally for all linear operator in finite Euclidean spaces, it's maximal monotone if and only if it's monotone.
We used the previous proved theorem and the fact that any linear mapping on finite Euclidean space is a continuous mapping.

#### **Thm | The Inverse of Monotone Operator is Still Monotone**
> Suppose that $A$ is a monotone operator, then $A^{-1}$ is also a monotone operator. 

**Proof**

This is direct. 
The reader should prove this as an exercise. 


#### **Thm | The Graph of a Maximally Monotone Operator is Closed**
> Let $A: X \mapsto 2^X$ be a maximally monotone operator. 
> Let $(x_n, y_n) \in \text{gph}A \; \forall n \in \mathbb N$ such that $x_n \rightharpoonup x$ and $y_n \rightarrow y$, assume $(x, y) \in \text{gph} A$, hence the graph $\text{ gph}(A)$ is closed in $X_\text{weak}$ and $X$. 

**Proof**

Recall [Strong and Weak Convergences Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Strong%20and%20Weak%20Convergences%20Introduction.md) that, let $x_n \rightharpoonup x$ and $y_n \rightarrow y$, then $\langle x_n, y_n\rangle\rightarrow \langle x ,y\rangle$. 
As long as one of the sequence converges strongly, the limit can go through the inner product. 
In our case, consider that 

$$
\begin{aligned}
    (x_n, y_n) &\in \text{gph }A \iff \langle x_n - u, y_n - v\rangle \ge 0 \;\forall (u, v) \in \text{gph} A \quad \text{ by mono of A}, 
    \\
    \implies & 
    \langle x_n - u, y_n - v\rangle \rightarrow \langle x - u, v - v\rangle\ge 0. 
\end{aligned}
$$

Therefore, $(x, y)$ monotonically relate to point $(u, v) \in \text{gph}(A)$, $A$ is maximally monotone asserts that the limit is also in the graph of the monotone operator. 


**Remark**

This works the same if we have $x_n\rightarrow x \wedge y_n \rightharpoonup y$ in the graph of $A$.
To show that we consider applying the same theorem to $A^{-1}$ instead. 
Here we used the fact that $A^{-1}$ is also a maximal monotone operator. 


---
### **Surjectivity of Maximally Monotone Operators**

[Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md) asserts the equivalence of surjectivity of $I + T$ for a maximal monotone operator. 


---
### **Illustrative Examples for Max Monotone, Monotone Operators**

We discuss some examples that can illsutrate the properties of a maximal monotone, or a maximally monotone operators. 

#### **Example | When Square Matrices are Monotone**
> A matrix $A \in \mathbb R^{n\times n}$ be a maximally monotone operator, then the following are equivalent 
> 1. $\langle x, Ax\rangle \ge 0$ for all $x \in \mathbb R^{n}$, equivalently $A$ symmetric positive definite. 
> 2. $A_+:= (1/2)(A^T + A)$ is positive semi-definite, or equivalently $A_+$ is monotone. 
> 3. $A^*$ is monotone. 

**Proof**

(1.) Is directly by the linearity of the opeartor and the definition of a monotone opeartor. 
For (2., 3.), use the property of inner product. 


We take a look at some of the specific examples of monotone operators that are relavent to real world application. 

#### **Example 1.1 | Projection is Monotone**
> Let $C\subseteq X$ be non-empty, then the projection operator onto the set: $\Pi_C$ is a monotone operator. 

**Observations**

We emphasize that convexity of the set $C$ is not assume therefore $\Pi_C$ can be multi-valued and the obtuse angle theorem won't be applicable anymore. 
This theorem is in Hilbert space. 
Therefore, norm that doesn't support inner product won't be compatible. 

**Proof**

Directly by the definition of a projection operator we have: 

$$
\begin{aligned}
    \begin{rcases}
        x^* \in \Pi_C x, 
        \\
        y^* \in \Pi_C y. 
    \end{rcases}\implies
    \begin{cases}
        \Vert x^* - x\Vert \le \Vert x - y^*\Vert, 
        \\
        \Vert y^* - y\Vert \le \Vert y - x^*\Vert. 
    \end{cases}
\end{aligned}
$$

Squaring both sides and then add then up together we have 

$$
\begin{aligned}
    \Vert x^* - x\Vert^2 + \Vert y^* - y\Vert^2 
    &\le 
    \Vert x - y^*\Vert^2 + \Vert y - x^*\Vert^2
    \\
    \Vert x^*\Vert^2 + \Vert x\Vert^2 - 2\langle x^*, x \rangle 
    + 
    \Vert y\Vert^2 + \Vert y^*\Vert^2 - 2\langle y^*, y\rangle
    & \le 
    \Vert x^* \Vert^2 + \Vert y^*\Vert^2 - 2 \langle x, y^*\rangle + 
    \Vert y\Vert^2 + \Vert x\Vert^2 - 2\langle y, x^*\rangle
    \\
    2\langle y^*, x - y\rangle 
        &\le 
    2\langle x^*, x - y\rangle
    \\
    0 &\le \langle  x^* - y^*, x - y\rangle. 
\end{aligned}
$$

In this way, we get that the projection operator is a monotone operator using the minimization property and the inner product endowed by Hilbert space. 



#### **Example 1.2 | Convex Projection is Monotone**
> Let $C$ be a non-empty convex subset of $X$, then the projection onto the set $C$ is firmly-nonexpansive. 

**Observations**

Firmly non-expansive operator is also a monotone operator. 
Compare to the previous example, we added convexity into the operator to get a stronger version of monotonicity of the opeartor. 
For more information, read [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md) for more. 

#### **Example 2 | Subgradient is Monotone**
See [Monotonicity of Subgradient](../Non-Smooth%20Calculus/Monotonicity%20of%20Subgradient.md) for more information.

#### **Example 3 | Subgradient of Convex Function is Maximally Monotone**
> if $f$ is a convex function, then $\partial f$ is a maximally monotone operators. 

**Proof**

Read 31.5.2 of Rockafellar's red convex analysis textbook. 

---
