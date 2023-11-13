- [[Convex Sets Intro]], 
- [[Cone]], 


---- 
### **Intro**

Finite many intersections of Halfspaces has the chancing of producing a polyhedron. The intersection of half spaces can be simply expressed as a linear inequality; as a result one can define the *polyhedra* in following way: 

$$
\begin{aligned}
    P := \{x| Ax \le b\}
\end{aligned}
$$

Where, $\le$ is an element-wise inequality. A closed polyhedra is referred to as a *polytopes*, and the close refers to having a finite space, and the fact that $P$ is a closed set is direct from the definition. 

--- 
### **Vertices**

**Definition | Vertices of a Polytopes**:

> Let $P$ be a polytope, then a point $z\in P$ is called a vertex when: there dosen't exist any $x, y\in P\setminus\{z\}, \lambda \in (0, 1): z = \lambda x + (1 - \lambda)y$. Graphically, a vertex is something on the convex set where it's impossible to wiggle it along a line such that it stills remains inside of the convex set. 


---
### **Vertex Submatrix Rank Theorem**

> Let $P$ be a polydope. If $z\in P$ is a vertex and we assume that $A\in \mathbb R^{m\times n}$, then let $\mathcal I$ be the index sets for the tight constraints, $\mathcal I =\{i: a_i^Tx_i = b_i\}$, then the submatrix $A_{\mathcal I, :}$ has a rank equals to $n$. 


For $\implies$, let $z\in P$ be a vertex; let $\mathcal I := \{i\in [m]: a_i^Tz = b_i\}$ where $a_i$ denotes the $ith$ row for the matrix $A$. Then matrix $A_{\mathcal I, :}$ has all the *right rows*. Let's suppose that $\text{rank}(A_{\mathcal I, :})\le n$, then by definition $\exists v \in \mathbb R^n\setminus\{\mathbf 0\}$ such that $(A_{\mathcal I, :})v = \mathbf 0$. 

$$
\begin{aligned}
    & j \in [m]\setminus \mathcal I, a_j^Tz < b_j \implies 
    \exists \lambda_j > 0: a^T_j(z \pm \lambda_jv)\le b_j
    \\
    \text{choose: } & \lambda := \min\{\lambda_j: j \in [m]\setminus \mathcal I\}
    \implies 
    a_j^T(z \pm \lambda v)\le b_j \quad \forall j \in [m]\ \setminus \mathcal I
\end{aligned}
$$

The first line is using the definition that $\mathcal I$ are all the tight constraints, therefore any constraints not in there has to be loose. Next, we find a $\lambda$ that keeps $z\in P$, and it will be non-zero because the constraints are loose. Next, we consider: 

$$
\begin{aligned}
    & i \in \mathcal I: a_i^T(z \pm \lambda v) = a_i^Tz \pm \lambda a_i^Tv = a_i^T = b_i
    \\
    & x:= x + \lambda v\quad y = z - \lambda v
    \\
    & x, y \in P \setminus \{v\} \text{ convexity}
    \\
    & z = \frac{x}{2} + \frac{y}{2} 
\end{aligned}
$$
And at the last line we derived the contradiction that $z$ must not be a vertex in $P$. For $\impliedby$, we prove by contrapositive and suppose that $v$ is **not a vertex**, then the rank of $A_{\mathcal I, :}$ is not going to be equal to $n$. Choose any $x, y\in P\setminus \{v\}$ then $i\in [m]\implies a_i^Tx \le b_i\wedge a_i^Ty \le b_i$ by def. In addition using convexity we may say: $\exists z = \lambda x + (1 - \lambda)y$. 

**Lemma 1:** 

> $$a_i^Tz = b_i \implies a_i^T(x - y) = \mathbf 0$$

To prove it, consider: 

$$
\begin{aligned}
    & z = \lambda x + (1 - \lambda)y = x + (1 - \lambda)(y - x)
    \\
    & \hspace{1.1em}
    \implies  z - x = (1 - \lambda)(y - x)
    \\
    &
    a_i^T(x - y) > 0 \implies a_i^T(x - z) = (1 - \lambda)a_i^T(x - y) > 0
    \\
    & \hspace{1.1em}
    \implies  a_i^Tx = a_i^Tz + a_i^T(x - z) = b_i + a_i^T(x - z) > b_i
    \\
    & \hspace{2.2em}
    \implies   a_i^Tx \ge 0 \implies x \notin P
    \\
    &
    a_i^T(x - y) < 0 \implies a_i^T(y - z) = \lambda a_i^T(y - x) > 0
    \\
    &\hspace{1.1em}
    \implies
    a_i^T y = a_i^Tz + a_i^T(y - z) = b_i + a_i^T(y - z) > b_i
    \\
    & \hspace{2.2em}
    \implies  a_i^Ty > b_i \implies y \notin P
\end{aligned}
$$

Finally, to make $z$ be a convex combination of $x, y$, then it's not possible that $x = y$, therefore, we have $a_i^T(x - y) = 0$ for all rows of $a_i$ of $A_{\mathcal I, :}$, meaning that $\text{rank}(A_{\mathcal I, :})< n$, because we had a null space for this sub-matrix. The theorem is proven at this point. 

