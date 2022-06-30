[[Topological Basics for Optimizations]]
[[Lipschitz Continuity]]
[[Characterizing Functions for Optimizations]]

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

Reader please observe that, $\inf$ is implicityly taking the closure of the set $Q$ over the space, therefore it's sometimes possible that $x\in \text{bd}(Q)$, as a consequence, $\text{proj}_Q(y) = \emptyset$. **Becareful**.

---
### **Projection Existence**

> If the set $Q$ in a finite Euclidean subspace is closed, the projections of any vector $y$ in the Euclidean space is non-empty. 

**Proof** 

Firstly, recall [[Existence of a Minimizer]]. Given $x$, the function $\min_{y\in C}\Vert x- y \Vert$ is coersive. The epigraph of the function will be closed because closedness is preserved under addition ([[Closedness Preserving Operations of Epigraph]]), and in this case the minimization problem can be phrased as the sum of 2 closed functions: 

$$
\min_{y\in C}\Vert x - y\Vert = \min_{y}\left\lbrace
    \delta_C(y) + \Vert x - y\Vert
\right\rbrace
$$

Where, the activation function is closed, and the distance function is also closed. Since the function is closed and coersive, it has minimizers. 


**Theorem: Unique Projection of Convex Sets**

> In the case of a closed convex set, the projection is also a singleton. 

**Proof:** See [[Convex Sets Properties]]


---
### **Convex Projections**

> For any closed, convex, non-empty set $Q$ in the finite Eulidean space, the projection (it's a singleton set) of any points on to the set to the point itself make an abstuse angle with all the other points in the set $Q$. Mathematically: 
> $$
> \begin{aligned}
>     \forall y \exists z: \{z\} &= \underset{Q}{\text{proj}}(y)
>     \\
>     \text{AND: }
>     \langle y - z, x - z\rangle &\le 0 \quad \forall x \in Q
> \end{aligned}
> $$

**Remarks**: 
This is a property of convex set, not projection in general, the proof is listed in [[Convex Sets Properties]]. In addition, the projections function of a set if L1 Lipschitz when the set $Q$ is convex, for more information about that vists: [[Convex Projection is L1 Lipschitz]]




----
### **L1 Lipschitz**

> For any set $Q$, the function $\text{dist}_Q(y)$ is L1-Lipschitz. More specirically: 
> $$
>     |\text{dist}_Q(x) - \text{dist}_Q(y)| \le \Vert x - y\Vert_2
> $$

**Proof**

The proof is constructed by 3 points, consider $x, y\in \mathbb{E}$, and $z \in Q$, the choice is arbitrary. Then, the distance of the points $x, y$ can be expressed in relation to any other points: 

$$
\begin{aligned}
    \text{dist}_Q(x) \le& \Vert x - z\Vert_2
    \\
    \text{dist}_Q(x) \le& \Vert x - z\Vert_2 \le \Vert x - y\Vert_2 + \Vert y - z\Vert_2
    \\
    \implies \text{dist}_Q(x) \le& \Vert x - y\Vert_2 + \Vert y - z\Vert_2
    \\
    \text{dist}_Q(y) \le&
    \Vert y - x\Vert_2 + \Vert x - z\Vert_2
\end{aligned}
$$

The first line is by definition of $\text{dist}$, the second and third statement made use of the point $z$, the third one is a consequence of the first 2 statements and the last statement is by a similar argument but for the point $y$. Taking the difference between the last 2 statements, one can come out and get: 

$$
\begin{aligned}
    \left|\text{dist}_Q(x) - \text{dist}_Q(y)\right|
    &\le 
    \Vert y - z\Vert_2 - \Vert x - z\Vert_2
    \\
    \Vert y - z\Vert_2 - \Vert x - z\Vert_2 
    &\le \Vert x -y\Vert_2
    \\
    \implies
    \left|\text{dist}_Q(x) - \text{dist}_Q(y)\right|
    &\le 
    \Vert x - y\Vert_2
\end{aligned}
$$

The absolute value of the distance is then bounded by the differences between these points. This is true simply because that the distance between the 2 is always positive. 


**Remarks**: 

In addition to being L1 Lipschitz, the function is also convex, it's convexity can be directly derived using [[Convexity Preserving Operations of Functions]] as an example to illustrate the infimal convolution theorem. 


