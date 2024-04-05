1. [Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)
2. [Lipschitz Continuity](Lipschitz%20Continuity.md)
3. [Characterizing Functions for Optimizations](Characterizing%20Functions%20for%20Optimizations.md)


---
### **Intro**

The projection of a point onto a set $Q\subseteq\mathbb{R}^n$ is the closest point to the set $Q$, measured under 2 norm: 

$$
\text{proj}_Q(y) := 
\left\lbrace
    x\in \mathbb{R}^n: \Vert x - y\Vert_2 = \inf_{x\in Q}
    \Vert x - y\Vert_2
\right\rbrace
$$

And the dist to the set $Q$, which is useful as a similar concept to the set projection is defined as: 

$$
\text{dist}_Q(y):= 
    \inf_{x\in Q}\Vert x - y\Vert_2
$$


**Remark**

Reader please observe that, $\inf$ is implicitly taking the closure of the set $Q$ over the space, therefore it's sometimes possible that $x\in \text{bd}(Q)$, as a consequence, $\text{proj}_Q(y) = \emptyset$. **Be careful**. In some literatures, $\Pi_Q(x)$ is used to denote the projection of a vector $x$ onto a set $Q$. 

---
### **Projection Existence**

> If the set $Q$ in a finite Euclidean subspace is closed, the projections of any vector $y$ in the Euclidean space is non-empty. 

**Proof** 

Firstly, recall [Existence of a Minimizer](Existence%20of%20a%20Minimizer.md). Given $x$, the function $\min_{y\in C}\Vert x- y \Vert$ is coercive. The epigraph of the function will be closed because closedness is preserved under addition ([Closedness Preserving Operations of Epigraph](Closedness%20Preserving%20Operations%20of%20Epigraph.md)), and in this case the minimization problem can be phrased as the sum of 2 closed functions: 

$$
\min_{y\in C}\Vert x - y\Vert = \min_{y}\left\lbrace
    \delta_C(y) + \Vert x - y\Vert
\right\rbrace
$$

Where, the activation function is closed, and the distance function is also closed. Since the function is closed and coercive, it has minimizers. 

**Remarks**

The the existence of convex set projection in the Hilbert Space, visit [Hilbert Space Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Hilbert%20Space%20Introduction.md). 


#### **Theorem | Unique Projection of Convex Sets**

> In the case of a closed convex set, the projection is also a singleton. 

**Proof:** See [Convex Sets Projection Obtuse Angle Theorem](Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md)

**Remarks:**

With the additional assumption that $C$ is a convex set, we obtain the fact that **the distance function is also a convex function** because it's the infimum convolution between 2 proper convex function, one real valued, the other one is augmented real valued, see [Convexity Preserving Operations for Functions](Convexity%20Preserving%20Operations%20for%20Functions.md). 


---
### **Convex Projections**

> For any closed, convex, non-empty set $Q$ in the finite Euclidean space, the projection (it's a singleton set) of any points on to the set to the point itself make an obtuse angle with all the other points in the set $Q$. Mathematically: 
> $$
> \begin{aligned}
>     \forall y \exists z: \{z\} &= \underset{Q}{\text{proj}}(y)
>     \\
>     \text{AND: }
>     \langle y - z, x - z\rangle &\le 0 \quad \forall x \in Q
> \end{aligned}
> $$

**Remarks**: 

This is a property of convex set, not projection in general, the proof is listed in [Convex Sets Projection Obtuse Angle Theorem](Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md). 
In addition, the projections function of a set if L1 Lipschitz when the set $Q$ is convex, for more information about that visits: [Convex Projection is L1 Lipschitz](Convex%20Projection%20is%20L1%20Lipschitz.md). 


----
### **The Distance Function to $Q$ is L1 Lipschitz**

> For any set $Q$, the function $\text{dist}_Q(y)$ is L1-Lipschitz. More specifically: 
> $$
>     |\text{dist}_Q(x) - \text{dist}_Q(y)| \le \Vert x - y\Vert
> $$

**Proof**

The proof only requires the triangular inequality of the norm, the properties of infimum, and the definition of the distance function. 
Denote $\text{dist}_Q = d_Q$ for short, then consider 

$$
\begin{aligned}
    d_Q(x) &= \inf_{z \in C} \Vert x - z\Vert
    \\
    &\le \Vert x - z\Vert \; \forall z \in Q
    \\
    &\le \Vert x - y\Vert + \Vert y - z\Vert \; \forall z \in Q
    \\
    \iff
    d_Q(x) 
    &\le 
    \Vert x - y\Vert + \inf_{z \in Q} \Vert y - z\Vert 
    \\
    d_Q(x)
    &\le  \Vert x - y\Vert + \inf_{z \in Q} \Vert y - z\Vert. 
    \\
    d_Q(x) &\le \Vert x - y\Vert + d_Q(y)
\end{aligned}
$$

Therefore, we have $d_Q(x) - d_Q(y) \le \Vert x - y\Vert$, since the statement is still true if we swap $x, y$, and therefore, we would have $|d_Q(x) - d_Q(y)| \le \Vert x - y\Vert$. 

**Remarks**

It works for any functions that has a triangular inequality to it. 
This would mean any metric would work. 
There is no assumption about the convexity of the set $Q$. 

---
### **The Projection Operator onto Convex set is Firmly-Nonexpansive**

The following properties makes convex projection easier to deal with. 

#### **Thm | Convex Projection Operator is Firmly Non-expansive**
> Let $Q\subseteq \mathbb R^n$, let $C$ be a closed non-empty convex set, then the projection operator $\Pi_Q$ is firmly nonexpansive characterized by the inequality: 
> $$
> \langle x - y, \Pi_Qx - \Pi_Q y\rangle \ge \Vert \Pi_Qx - \Pi_Q y\Vert^2_2. 
> $$

**Proof**

See the example in [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md). 

**Remarks**

This claim is only true with standard Euclidean Spaces and the set $Q$ is convex.


---
### **Strict Separations of Convex Sets**

You can separate strictly, any 2 convex sets that are not intersecting with each other. [Strict Separations Theorem](Strict%20Separations%20Theorem.md). 



---
### **Projections Equivalences**

There exists several equivalent ways of describing the conditions of a point being projected onto a set $Q$, and a point $\bar{x} \in \text{proj}_Q(\bar x + \lambda v)$. 

1. $v \in N_Q(\bar{x})$
2. $\bar x \in \arg\max_{x\in Q}\langle v, x\rangle$
3. $\text{proj}_Q(\bar{x} + \lambda x) = \bar x \; \forall\lambda \ge 0$
4. $\exists \lambda \ge 0 : \text{proj}_Q(\bar x + \lambda v) = \bar x$


---
### **Convex Sets and the Distance Function**

Distance function is blind to the closedness of the set. 

**Claim**: 

> If the distance $d_Q(x)$ function for some $Q$ set is convex, it won't mean that the set $Q$ is going to be a convex set. 

**Proof**

Consider $C = \{x: \Vert x\Vert \le 1\}\setminus \{\mathbf 0\}$. where, $C$ is not convex, but $\text{cl}(C)$ is, hence $d_{\text{cl}(C)} = d_{C}$ would be a better statement to put. $D$ is convex when $\text{cl}(C)$ is convex. 

