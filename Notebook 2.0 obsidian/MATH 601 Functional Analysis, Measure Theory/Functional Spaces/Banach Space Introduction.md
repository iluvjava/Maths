[[Vector Space]], [[Metric Space Introduction]], 
[Norm, for Beginners](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Norm,%20for%20Beginners.md)

---
### **Banach Space**

[Banach space](https://mathworld.wolfram.com/BanachSpace.html) is a complete, normed, [Vector Space](Vector%20Space.md). It is already a [Metric Space Introduction](Metric%20Space%20Introduction.md). It's a set of elements that can form a complete  vector space with a norm calculations.  **Note**: The "complete" in this context is referring to closure under Cauchy Sequence, not interpreted as "complete with". If a vector space is normed, but it's not complete, them we just refer to it as "normed space". 

In this section we introduces basics facts and theorems about Banach Spaces and we show some illustrating examples for those concepts. Bear in mind that Banach space is just vector spaces but fancier. 

**Banach Spaces should have**:
- Vector space with a norm (not necessarily from inner product), that must be continuous. The continuity is a consequence of the Triangular Inequality, the expression is the consequence: $|\Vert x\Vert - \Vert y \Vert|\le \Vert x- y\Vert$, which is the 1-Lipschitz continuity for the norm function.
- The vector space is complete (Topological Property)

**Banach is a Metric Space**
> The metric $d(x, y)$ for Banach Space is define as $\Vert x - y\Vert$. The space $X$ is a vector space. 

**Banach But not Hilbert**
> It's implied from the definition, that, there exists instances of Banach Space that is not Hilbert Space. Such a space would have norm that is not defined via inner product, unlike a [Hilbert Space Introduction](Hilbert%20Space%20Introduction.md) where it has its norm defined via the inner product of elements. 

**Lacks of Inner Product**
> The definition doesn't said anything about  using inner product in the space to define the norm metric. The norm can be independent of the inner product.

**Normed Vector Space but Not Banach**
> These are incomplete normed vector spaces. For examples: $(\Q, |\cdot|), (C[0, 1], \Vert \cdot\Vert_1), (C[0, 1], \Vert \cdot\Vert_2)$. They are incomplete vector spaces. For more details see [Examples for Metric Space](Examples%20for%20Metric%20Space.md). They have completions for their spaces as $\R, L^1[0, 1], L^{2}[0, 1]$. 

**The Euclidean Space**
> The space ($\R^n, d(x, y):= \Vert x - y\Vert$) is an example of a Banach space because $\mathbb R^n$ is complete, and the p-norm for all the vector there are all equivalent metrics. 

For more information about norm in the real finite vector space, see [Norm, for Beginners](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Norm,%20for%20Beginners.md) for more information. 

**Subspace of a Banach Space**
> $(Y, \Vert \cdot\Vert)$ is a subspace of $(X, \Vert \cdot\Vert)$ when, $Y\subseteq X$, and $X$ is also a closed vector space. Then it's a subspace of the Banach space, and it will still be a Banach space. 

**Proof**
Don't know where is the proof but this seems legit. 

**Remarks**: 
If, $Y\subseteq X$ doesn't form a vector space, then it's definitely possible for $Y$ to be not a Banach space at all. 

---
### **Norm as a Metric**

Before we dive deeper, we show that norm is a special type of metrics that contains extra properties that general metric space might not process. These properties are paired up together with some of the computations in vector spaces. 

Suppose that $d(x, y) = \Vert x - y\Vert$ is the metric for our vector space then: 
1. $|\Vert x\Vert - \Vert y\Vert| \le \Vert x - y\Vert$. 
2. $\Vert \cdot\Vert$ is a continuous mapping. And it's has a Lipschitz constant of 1. 
3. For all $x, y, z\in X$, $\alpha > 0$ we have: 
    $$
    \begin{aligned}
        d(x + a, y + a) &= d(x, y)
        \\
        d(\alpha x, \alpha y) &= |\alpha| d(x, y),
    \end{aligned}
    $$
    it experiences translational and scaling invariance. This metric space reflect the underlying topology of Euclidean spaces.

#### **Def | Equivalent Norms**
> Equivalent Metric strengthens in Banach space due to the properties of norms, using the any of the 2 equivalence norm defintion in metric space we can derive that, 2 norm $\Vert \cdot\Vert_a$ and $\Vert \cdot\Vert_b$ are equivalence if for all $x \in X$, we have: 
> $$
> \begin{aligned}
>     \exists \alpha, \beta \in \mathbb R: 
>     \alpha \Vert x\Vert_a \le \Vert x\Vert_b \le \beta \Vert x\Vert_b, 
> \end{aligned}
> $$
> and vice versa. 

---
### **Lemma | Riesz Lemma (2.4-5)**

The following is about Normed space in general, not just Banach space, please note this fact. 

> Let $Y, Z$ be a subspace of a normed space $X$. Let $Y$ be a closed proper linear subspace of $Z$, Then for every $\theta \in (0, 1)\subseteq \mathbb R$, there exists $z\in Z$ such that $\Vert z\Vert = 1$, and $\Vert z - y\Vert \ge \theta$ for all $y\in Y$. 

**Observations**: 


The lemma says that it's possible to identify a unitary vector $z$ from the set $Z\setminus Y$ such that it barely touches the closed linear subspace $Y$, infinite dimension or not, meaning it's fundamentally possible to point away from all points in linear subspace $Y$, with just barely the same amount of distance as the size of the vector: $z$. 

**Proof**:

$$
\begin{aligned}
    & Y \in \text{cl}(Y) \cap Y \subsetneq Z \implies Z \setminus Y \neq \emptyset
    \\
    \text{let }& v \in Z \setminus Y
    \\
    & a = \inf_{y\in Y} \Vert v - y\Vert
    \\
    & Y = \text{cl}(Y)\implies \exists y^+\in Y : \Vert v - y^+\Vert = a.
\end{aligned}
$$

At this step, we had made a minimizers $y^+$ that is closest to the element $v$ that has been lifted up from $Y$, the closed set while still remains in $Z$, in a Hilbert space (a stronger version of a normed vector space), this would become a projection. From the definition of $\inf$ we have: 

$$
\begin{aligned}
    & 
    \forall \theta \in (0, 1)\; \exists y_0 \in Y: 
    a \le \Vert v - y_0\Vert \le a / \theta
    \\
    \text{let: }
    &
    z = \frac{v - y_0}{\Vert v - y_0\Vert} = c(v - y_0) \text{ s.t: }\Vert z \Vert = 1. 
\end{aligned}
$$

The $z$ vector is a vector pointing from a point $y_0$ to the vector $v$. Choose $y \in Y$, arbitrary, we have: 

$$
\begin{aligned}
    \Vert z - y \Vert &= \Vert c(v - y_0) - y\Vert 
    \\
    &= c\Vert v - y_0 - c^{-1}y\Vert
    \\
    &= c \left\Vert v - \underbrace{(y_0 + c^{-1}y)}_{\in Y}\right\Vert
    \\
    [1]\implies 
    &\ge ca = \frac{a}{\Vert v - y_0\Vert} \ge \frac{a}{ a/ \theta} = \theta , 
\end{aligned}
$$

and hence the proof is complete. At \[1\] we used the fact that $a$ is the minimum distance going from the vector $v$ to the subspace $Y$. 

**Remarks**: 

Geometrically it means, it's possible to find a point $x\in Z\setminus Y$ such that, it's lifted with $1 - \epsilon$ distance away from the whole subspace, and it has a norm of $1$. This is possible for infinite dimensional spaces. 

**References:**

This is listed as 2.4-5 in Kreyzig's textbook, but I would suggest looking into [here](http://mathonline.wikidot.com/riesz-s-lemma) on math-dot for a better exposition of the proof. 