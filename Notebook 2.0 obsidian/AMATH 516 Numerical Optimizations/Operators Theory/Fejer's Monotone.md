[[Operators for Optimizations CENTRAL HUB]]

---
### **Intro**

Fejer monotone is a type of strong generalization to a monotone sequence in Banach Spaces. 

#### **Definition-1 | Fejer Montone Sequence**
> A sequence $(x_n)_{n\in N}$ is fejer monotone wrt to the set $\emptyset \neq C \subseteq X$ when: 
> $$\forall c \in C, k \in \N: \Vert x_{k + 1} - c\Vert \le \Vert x_k - c\Vert. $$

**Observations**: 

The points in the sequences, is getting closer, to very elements in the set $C$. This is a very strong type of convergence, especially for the set $C\subseteq X$. We explicitly assume that, the set $X$ is some type of Banach space. 
Traditionally, in the realm of real analysis, a monotone increasing sequence $x_n$ approaches $\sup_{n\in N}x_n$, but observe that, a monotone increasing sequence approaches $C = [\sup_{n\in \N}x_n, \infty)$. We hence showed that our observation is ok. 

The convergence is strong. If $(x_n)_{n\in \mathbb N}$ is Fejer monotone, it would mean that $d_C(x_n)$ is a monotone sequence too, however, the converse is not true, since Fejer monotone asserts the monotone conditions for all the points in the set $C$. 


----
### **Theorems and Discussions**

We list some of the useful theorems for this specific type of monotone convergence. 
The definition may seems simple but the consequences are profound and they characterizes fixed point iterations in practical applications and problems. 

#### **Thm-1 | Uniqueness of Cluster Points in the Set**

> Let $(x_k)_{k\in \N}$ be Fejer-Monotone w.r.t a nonempty subset $C$ of $X$, then $(x_k)_{k\in \N}$ is bounded; moreover, $(x_k)_{k\in \N}$ converges to a point in $C\iff (x_k)_{k\in \N}$ has a cluster point in $C$. 

**Observations**

The convergence of $x_k$ to a cluster point in $C$, is strong convergence if we assume that the set $X$ is the Hilbert space. 


**Proof**

The $\implies$ direction is clear (Because the limit of the sequence is a cluster point). From the other direction, Let $\bar x \in C$ be a cluster point then exists subsequence $x^{(n_k)}$ such that $\lim_{k\rightarrow \infty} \Vert x^{(n_k)} - \bar x\Vert = 0$. For any $\epsilon > 0$, using Fejer Monotonicity we have: 

$$
\begin{aligned}
    \exists N_\epsilon: k > N_\epsilon \implies (\epsilon \ge \Vert x^{(n_k)}  - \bar x\Vert \ge \Vert x^{(m)} - \bar x\Vert \; \forall m \ge n_k), 
\end{aligned}
$$

therefore, it means that $\Vert x^{(m)} - \bar x\Vert \rightarrow 0$ and the sequence is Cauchy, and hence it converts to a point $\bar x$ in $C$. Alternatively, we may also prove it this way. 

**Alternative Proof**

For the $\impliedby$ direction, consider any $\bar x \in C$, then monotonicity, the real sequence $\Vert x^{(n)} - \bar x\Vert$ is bounded below and monotone, therefore it has a limit. 
This limit exists for all value of $\bar x \in C$. 
Fix a $\bar x \in C$ and let it be the cluster point we have $\lim_{k\rightarrow \infty} \Vert x^{(n_k)} - \bar x\Vert = 0$, hence, the real sequence has sub sequential limit. 
Since $\bar x \in C$, the sub-sequential limit must be the same as the monotone limit (the sub-sequential limit of the norm must equals to the limit of the monotone convergence by definition of a convergence. )! 
Therefore, we have $\lim_{n\rightarrow } \Vert x^{(n)} - \bar x\Vert = \lim_{k\rightarrow \infty} \Vert x^{(n_k)} - \bar x\Vert = 0$, hence the sequence converges to $\bar x$ strongly. 


**Remarks**

It converges strongly, since it's converging only by the norm. 


#### **Thm-1.1 | Uniquness of Weak Cluster Point in $C$**
> Let $x_n$ in $X$ be a Fejer Monotone sequence wrt $C\neq \emptyset$. 
> Then $x_n\rightharpoonup x \in C$ if and only if every weak sequential clusters points are in the set $C$. 

**Observations**

We relax the conditions so that we are in infinite dimnsional spaces. 
And in infinite dimension, we only requires weak cluster points. 

**Proof**

The direction ($\implies$) is direct because the unique weak convergence limit is in the set $C$. 
For ($\impliedby$), given that $x_n$ is F-monotone then it must be bounded and in infinite dimension Hilbert space, a bounded sequence must have a weakly converging subsequence. 
Therefore, lets take $c_1, c_2 \in C$ to be 2 weak cluster points that is in $C$ by assumptions. 
Then $(\Vert x_n - c_i\Vert^2)_{n \in \mathbb N}$ converges to a limit in $\mathbb R$ for $i \in \{1, 2\}$ because the sequence os Fejer Monotone. 
Then 

$$
\begin{aligned}
    & \exists \lambda_1 : \Vert x_n - c_1\Vert^2 - \Vert x_n - c_2\Vert \rightarrow \lambda_1
    \\
    & 
    = \Vert c_1\Vert^2 - \Vert c_2\Vert^2 - 2\langle c_n, c_1 - c_2\rangle
    \\
    \implies 
    &
    -2\langle x_n, c_1 - c_2\rangle \rightarrow \lambda_1 - \Vert c_1\Vert^2 + \Vert c_2\Vert^2 =: \lambda_2
    \\
    & 
    \langle x_n, c_2 - c_2\rangle \rightarrow -\lambda_2/2. 
\end{aligned}
$$

Using the weak convergence, we choose $c_{k_n}\rightharpoonup c_1$ and $x_{l_n}\rightharpoonup c_2$. 
Then consider 

$$
\begin{aligned}
    \lim_{n\rightarrow \infty}\langle x_{k_n}, c_2 - c_1\rangle 
    &= 
    \langle c_1, c_2 - c_1\rangle = -\lambda_2/2
    \\
    \lim_{n\rightarrow \infty}\langle x_{l_n}, c_2 - c_1\rangle 
    &= 
    \langle c_2, c_2 - c_1\rangle = -\lambda_2/2, 
\end{aligned}
$$


subtracking we would have $\langle c_2 - c_1, c_2 - c_1\rangle = 0$ and therefore we have $c_2 = c_1$. 
The weak limit has to be unqiue in this case. 




#### **Thm-2 | A Slightly Weaker Version in Finite Euclidean Space**
> In finite dimensional Euclidean space, let $C\subseteq \mathbb R^n$ be non-empty. 
> Suppose that for all $c \in C$ the sequence $\Vert x^{(n)} - c\Vert$ is convergent in $\mathbb R$, and the cluster point of the sequence $(x^{(n)})_{n \in \mathbb N}$ is in $C$, then the sequence converges to a limit in $C$. 


**Proof**

The norm of the sequence $\Vert x^{n} - c\Vert$ converging $\mathbb R$ for all $c \in C$. 
Hence the sequence is bounded in norm. 
Since the space is complete and finite dimensional, by Bozano Weierstrass theorem, there exists a subsequence $x^{(n_k)}$ that converges. 
Suppose that there are 2 such sub-sequential limit points $y, z$ in $C$, we want to show that they are the same point. 
We first show that, $\langle x^{(n)}, y - z\rangle$ are the same for all subsequences by using the paralellogram identity $\langle x, y\rangle = \frac{1}{4}(\Vert x + y\Vert^2 - \Vert x - y\Vert^2)$, consider any 2 points $y, z \in C$ then: 

$$
\begin{aligned}
    2 \langle x^{(n)}, y - z\rangle &= 
    \langle x^{(n)}, y\rangle - \langle x^{(n)}, z\rangle
    \\
    &= 
    \frac{1}{2}(
        \Vert x^{(n)} + y\Vert^2
        -
        \Vert x^{(n)} - y\Vert^2
        -
        \Vert x^{(n)} + z\Vert^2
        + 
        \Vert x^{(n)} - z\Vert^2
    )
    \\
    &= 
    \frac{1}{2}
    \left(
        \Vert x^{(n)}\Vert^2 + \Vert y\Vert^2 + 2\langle x^{(n)}, y\rangle
        -
        (\Vert x^{(n)}\Vert^2 + \Vert x\Vert^2 + 2\langle  x^{(n)}, z\rangle)
    \right.
	    \\
	    &\quad\;
	    +
	\left.
	    \Vert x^{(n)} - z\Vert^2
	    - \Vert x^{(n)} - y\Vert^2 \right)
    \\
    &= \frac{1}{2}(
        \Vert y\Vert^2 - \Vert x\Vert^2 + 2\langle x^{(n)}, y - z\rangle + 
        \Vert x^{(n)} - z\Vert^2
        - \Vert x^{(n)} - y\Vert^2
    )
    \\
    \iff 
    \langle x^{(n)}, y - z\rangle &= 
    \frac{1}{2}(
        \Vert y\Vert^2 - \Vert x\Vert^2+ 
        \Vert x^{(n)} - z\Vert^2
        - \Vert x^{(n)} - y\Vert^2
    ).
\end{aligned}
$$

since the sequence $\Vert x^{(n)} - y\Vert$ converges in $\mathbb R$, any subsequence has $\lim_{k\rightarrow \infty} \langle x^{(n_k)}, y - z\rangle = \Vert y\Vert^2 - \Vert x\Vert^2$, because which is fixed, therefore, consider again the use of B.W theorem and 2 subsequences indexed with $n_k, m_k$ converging to 2 different cluster point $\bar x, x^+ \in C$ we have equality between the 2 limits: 

$$
\begin{aligned}
    & \lim_{k\rightarrow \infty} \langle x^{(n_k)}, \bar x - x^+\rangle = \
    \lim_{k\rightarrow \infty} \langle x^{(m_k)}, \bar x - x^+\rangle
    \\
    \iff & 
    \langle \bar x, \bar x - x^+\rangle = \langle x^+, \bar x - x^+\rangle 
    \\
    \iff & \langle \bar x - x^+, \bar x - x^+\rangle = 0
    \\
    \iff & \Vert \bar x - x^+\Vert = 0, 
\end{aligned}
$$

where we make use of the fact that inner product of an inner product space is a continuous mapping. 
See [Inner Product Space](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Inner%20Product%20Space.md) for more information. 
Therefore, all sub-sequential limit points of the sequence are the same, therefore, the sequence has a unique limit and it converges. 

**Remark**

Intuitively, if the sequence approaches the set $C$ for all points and gets very close, it can't have too much room to wiggle. 
This theorem is weaker compare to the first theorem in the sense that, in finite Euclidean space, the Fejer monotonicity can be removed at the cost of removing the "if and only if" relations between the two parts. 

#### **Thm | Convergence wrt to the closed Convex hull**
> Let $C\subseteq X$ be nonempty and $x_n$ F-Monotone convergence wrt to $C$, then it's also F-Monotone converges wrt to $\text{cl.cvxh}(C)$, the convex hull of the set. 

**Proof**

Let $x_n$ be Fejer Montone convergence wrt to the set $C$. 
Consider the equivalence: 

$$
\begin{aligned}
    \forall n \in \mathbb N, c \in C \iff 
    \left[
        \Vert x_n - c\Vert^2 \le \Vert x_n - c\Vert^2 
        \iff 
        \langle c, x_n - x_{n + 1}\rangle \le 
        \Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2
    \right], 
\end{aligned}
$$

and the above characterzation is equivalent to the definition of Fejer Monotone convergence of the sequence. 
Let $c_k \rightarrow \overline c$, be a sequence in $C$ that converges to $\overline c \in \text{cl}(C)$, then from the above we have 

$$
\begin{aligned}
    \langle c_k , x_{n} - x_{n + 1}\rangle &\le 
    \Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2
    \\
    \implies 
    \lim_{n\rightarrow \infty}
    \langle c_k , x_{n} - x_{n + 1}\rangle
    & \le 
    \lim_{n\rightarrow \infty}
    \Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2
    \\
    \langle \overline c, x_n - x_{n + 1}\rangle
    &\le \Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2. 
\end{aligned}
$$

This is from the continuity of norm and inner product of Hilbert space. 
Next, for every points in the $\text{cvxh}(C)$, it is represetned as $c_1, \cdots, c_k$ of set $C$, and $\lambda_i > 0$  with $\lambda_1 + \cdots + \lambda_k = 1$, and with that we have 

$$
\begin{aligned}
    \langle c_i, x_n - x_{n + 1}\rangle &\le 
    \Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2 \quad \forall i = 1, \cdots, k
    \\
    \sum_{i = 1}^{k}\lambda_i \langle c_i, x_n - x_{n + 1}\rangle 
    &\le 
    \sum_{i = 1}^{k} \lambda_i (\Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2)
    \\
    \left\langle 
        \sum_{i = 1}^{k} \lambda_i c_i, x_n - x_{n + 1}
    \right\rangle
    &\le 
    \Vert x_n\Vert^2 - \Vert x_{n + 1}\Vert^2. 
\end{aligned}
$$

And therefore, the sequence is also F-Monotone wrt point $\sum_{i = 1}^{k}\lambda_i c_i$, which is an arbitrary element from the $\text{cvxh}(C)$. 
By the sequence, we can conclude that $x_n$ is Fejer monotone wrt $\text{cl.cvxh}(C)$, the closed convex hull of $C$. 



#### **Thm | Convergence of the Shadow Sequence**
> Let $x_n$ be Fejer Monotone wrt to $C\subseteq X$ that is non-empty, closed and convex.  
> Then $\Pi_C$ converges strongly to some point. 

**Observations**

Although convergence is never assured, but the projected sequence of a F-monotone seequence is sufficient to produce a sequence that converges strongly. 

**Proof**

Consider: 

$$
\begin{aligned}
    \Vert \Pi_C x_n - \Pi_C x_{n + m}\Vert^2 
    &= 
    \Vert \Pi_C x_n - x_{m + n} + x_{m + n} - \Pi_C x_{m + n}\Vert^2
    \\
    &= 
    \Vert \Pi_C x_n - x_{n + m}\Vert^2 + 
    \Vert x_{m + n} - \Pi_C x_{m + n}\Vert^2
    -2 \langle \Pi_C x_n - x_{m + n}, x_{m + n} - \Pi_C x_{m + n}\rangle
    \\
    &\le 
    \Vert \Pi_C x_n - x_n\Vert^2 + d_C(x_{m + n})^2 
    \\
    &\quad 
    + 2 \left\langle 
        (\Pi_C x_n - \Pi_C x_{m + n}) + 
        (\Pi_C x_{m + n} - x_{m + n}), 
        x_{m + n} - \Pi_C x_{m + n}
    \right\rangle
    \\
    &= d_C(x_n)^2 + d_C(x_{m+ n})^2
    \\
    &\quad 
    + 2 \langle \Pi_C x_n - \Pi_C x_{m + n}, x_{m + n} - \Pi_C x_{m + n}\rangle
    - 2  \Vert \Pi_C x_{m + n} - x_{m + n}\Vert^2. 
\end{aligned}
$$

Observe that the cross term admit the point $\Pi_C x_n \in C$, therefore we may apply the obtuse angle theorem for the point $x_{m + n}$ using the fact that $C$ is a closed and convex set, then the cross term is less than zero and therefore we have 

$$
\begin{aligned}
    \Vert \Pi_C x_n - \Pi_C x_{n + m}\Vert^2 
    & \le 
    d_C(x_n)^2 + d_C(x_{m + n})^2 - 2d_C(x_{m + n})^2
    \\
    &= d_C(x_n)^2 - d_C(x_{m + n})^2. 
\end{aligned}
$$


Using the fact that the sequence is F-Monotone, the above would suggest that the distance converges $\lim_{n \rightarrow \infty} d_C(x_n)^2 - d_C(x_{m + n})^2 = 0$ for all $m \in \mathbb N$. 
Since that is the upper bound of the norm squared, we haev that the projected sequence is a Cauchy sequence as well. 


**Remarks**

The strong convergence of the projection point make it possible to track the convergence rate for certain algorithm. 


#### **Thm | Finite Length Trajectory**
> If the set $C$ has non-empty interior and $x_n$ is a convergent sequence then the trajectory for $x_n$ is finite meaning that $\sum_{i = 1}^{\infty} \Vert x_{n} - x_{n -1 }\Vert < \infty$. 


**Proof**

Let $c \in \text{int }(C)$, with $r > 0$, such that $\mathbb B_r(c) \subseteq C$. 
Now set the sequence: 

$$
\begin{aligned}
    c_n := 
    \begin{cases}
        c  & \text{ if } x_n = x_{n + 1}. 
        \\
        c - r \frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert} 
        & 
        \text{else}. 
    \end{cases}
\end{aligned}
$$

clearly, $c_n \in C$, by its definition. 
$x_n$ is F Monotone wrt to $C$, hence we have 

$$
\begin{aligned}
    \Vert x_{n + 1} - c_n\Vert &\le 
    \Vert x_n - c_n\Vert, 
\end{aligned}
$$

assume momentarily that $x_{n + 1} \neq x_n$, we substitute the formula for $c_n$ into the above definition of F Monotonicity which yields: 

$$
\begin{aligned}
    \left\Vert 
        x_{n + 1} - c + 
        r\frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert}
    \right\Vert^2
    & \le 
    \left\Vert
        (x_n - c) + r\frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert}
    \right\Vert^2
    \\
    \Vert x_{n + 1} - c\Vert^2 + r^2 
    + 
    2r \left\langle 
        x_{n + 1}, \frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert}
    \right\rangle
    & \le 
    \Vert x_n - c\Vert^2 + r^2 
    + 
    \left\langle 
        x_n - c, \frac{x_{n + 1} - x_n}{x_{n + 1} - x_n}
    \right\rangle
    \\
    \Vert x_{n + 1} - c\Vert^2 
    + 
    2r \left\langle 
        x_{n + 1}, \frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert}
    \right\rangle
    &\le 
    \Vert x_n - c\Vert^2 + 
     \left\langle 
        x_n, \frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert}
    \right\rangle
    \\
    \Vert x_{n + 1}- c\Vert^2 
    &\le 
    \Vert x_n - c\Vert^2 + 
    2r \left\langle 
        x_n - x_{n + 1}, \frac{x_{n + 1} - x_n}{\Vert x_{n + 1} - x_n\Vert}
    \right\rangle
    \\
    \Vert x_{n + 1}- c\Vert^2 
    &\le 
    \Vert x_n - c\Vert^2 
    + 
    -2r \Vert x_n - x_{n + 1}\Vert
    \\
    2r \Vert x_n - x_{n + 1}\Vert 
    &\le 
    \Vert x_n - c\Vert^2 - \Vert x_{n + 1} - c\Vert^2. 
\end{aligned}
$$


observe that the above inequality asserts that some extra length difference can be put into the difference between $\Vert x_n - c\Vert, \Vert x_{n + 1} - c\Vert$. 
The results here would be trivial if we assumed $x_{n} - x_{n + 1}$, which makes it equivalent to Fejer Montone sequence. 

Next we consider the Telescoping sum of the sequence, which would produce 

$$
\begin{aligned}
    2 r \sum_{n = 0}^{\infty}
        \Vert x_{n} - x_{n + 1}\Vert
    &\le 
    \Vert x_0 - c\Vert^2 - 
    \lim_{n\rightarrow \infty }
    \Vert x_n - c\Vert^2 
    \le \infty. 
\end{aligned}
$$

Therefore, the sequence generated has a finite length to it. 



#### **Thm | Ray Convergence towards Linear Subspace**
> Let $C\subseteq X$ be an closed affine space. 
> Let $(x_n)_{n\in \mathbb N}$ be Fejer Monotone wrt to $C$, then $\Pi_C(x_n) = \Pi_C(x_0)$. 

**Observations**

The sequence $x_n$ always projects onto the same point of $x_0$, since $C$ is affine, the sequence follows a perfect straight ray along meet with $C$ at $\Pi_C x_0$.

**Proof**

Consider any $n \in \mathbb N$, and $\alpha \in \mathbb R$, since $C$ is a linear subspace, we make affine combinations $y_\alpha := \alpha\Pi_C x_0 + (1 - \alpha)\Pi_C x_n \in C$. 
Consider: 

$$
\begin{aligned}
    0 &\le 
    \alpha^2 \Vert \Pi_C x_n - \Pi_C x_n\Vert^2 
    \\
    &= \Vert \alpha \Pi_C x_n - \alpha \Pi_C x_0\Vert^2
    \\
    &= \Vert y_\alpha - \Pi_C x_n\Vert^2
    \\
    \text{Nonexpansive }\implies 
    &\le \Vert y_\alpha - x_n\Vert^2
    \\
    &\le 
    \Vert y_\alpha - x_{n - 1}\Vert^2
    \\
    \text{F Mono} \implies 
    &\le 
    \Vert x_0 - y_\alpha\Vert^2. 
\end{aligned}
$$

On the following parts, we consider a sequence of inequality on the above quantity, our goal is trying to re-create the projection operators somewhere in there as well. 

$$
\begin{aligned}
    \Vert x_n - y_\alpha\Vert^2 
    &= 
    \Vert 
        \underbrace{x_0 - \Pi_C x_0}_{\in C^\perp}
        + 
        \underbrace{\Pi_C x_0 - y_\alpha}_{\in C}
    \Vert^2
    \\
    &= 
    \Vert 
        x_0 - \Pi_C x_0
    \Vert^2
        + 
    \left\Vert
        \Pi_C x_0 - y_\alpha
    \right\Vert^2 
    \\
    &= 
    d_C^2(x_0) + \Vert 
        (1 - \alpha)(\Pi_Cx_n - \Pi_C x_0)
    \Vert^2
    \\
    &= 
    d_C^2(x_0) + (1 - \alpha)^2\Vert 
        \Pi_Cx_n - \Pi_C x_0
    \Vert^2
    \\
    &= 
    d_C^2(x_0) + \alpha^2\Vert 
        \Pi_Cx_n - \Pi_C x_0
    \Vert^2 + 
    (1 - 2 \alpha)
    \Vert \Pi_C x_n - \Pi_C x\Vert^2. 
\end{aligned}
$$

Going back to the initially derived inequality, this gives us the expression that 

$$
\begin{aligned}
    0 \le 
    \alpha^2 \Vert \Pi_Cx_n - \Pi_C x_0\Vert^2 
    & \le 
    d_C^2(x_0) + \alpha^2\Vert 
        \Pi_Cx_n - \Pi_C x_0
    \Vert^2 + 
    (1 - 2 \alpha)
    \Vert \Pi_C x_n - \Pi_C x\Vert^2
    \\
    (2\alpha - 1)\Vert \Pi_C x_n - \Pi_C x_0\Vert^2 
    &\le 
    d_C^2(x_0) < \infty, 
\end{aligned}
$$

Taking $\alpha \rightarrow \infty$, then we have that $\Vert \Pi_C x_n - \Pi_C x_0\Vert^2 = 0$, if and only if $\Pi_C x_n = \Pi_C x_0$. 
Therefore, the theorem is now proven. 


---
### **Applications**

Fejer monotone sequence characterizes a weaker type of convergences for the averaged operators. 
See [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md) for more information. 


