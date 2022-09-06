* [[Characterizing Functions for Optimizations]]
* [[Convex Hull, Convex Span]]
* [[Set Addition]]
* [[Caratheodory Theorem]]
* [[Cone]]
* [[Polar Cone]]

---
### **Intro**

**Definition: Support Functions**

> A support function is parameterized by a set $C\subset \mathbb E$. And it's defined as: 
> 
> $$
> \begin{aligned}
>     \delta_C^{\star}(x) := \sup_{y\in C} \left\lbrace
>         \langle y, x\rangle
>     \right\rbrace
> \end{aligned}
> $$

**Remarks**

When the set $C$ is not closed, the $\sup$ operator is closing it automatically. The function is convex because its the sum of 2 proper convex functions wrt $y$, $\langle y, x\rangle$ which is convex and real-valued, and $\delta_C$ the indicator function which is augmented real and proper, using [[Convexity Preserving Operations of Functions]], this is just taking the maximum of convex functions pointwise, therefore the resulting function is convex. 

When dealing with the support function for analysis purposes, keep in mind these good properties: 
* It's convex 
* $\delta_{C}^\star \equiv \delta^\star_{\text{cl}(C)}\equiv \delta^\star_{\text{cvxh}(C)}$
* $\delta^\star_{A + B} \equiv \delta^\star_{A} + \delta^\star_{B}$
* Positive Homogeneous: $\alpha\delta_C^\star(x) = \delta_C^\star(\alpha x)\;\forall \alpha \ge 0$
  * Its epigraph is a cone, literally. 
* It's sub-additive: $\delta_C^\star(x_1 + x_2) \le \delta_C^\star(x_1) + \delta_C^\star(x_2)$
* Support function of set $C$ is the conjugate of the indicator function of the same set. For more about conjugation, see: [[Convex Conjugation]] for more. 

We will prove some of the properties that are not trivial to prove. 

---
### **Theorem: Convexity of Support Functions**

> The support function of any nonempty $C$ is closed and convex. 

**Proof**: 

It's closed because of the $\sup$ in the definition. To characterize the convexity of the function we consider $\lambda \in [0, 1]$: 

$$
\begin{aligned}
    \delta_C^\star(\lambda x_1 + (1 - \lambda)x_2) &= \sup_{y\in C}\left\lbrace
        \langle \lambda x_1 + (1 - \lambda)x_2, y\rangle
    \right\rbrace
    \\
    &= \sup\left\lbrace
        \langle \lambda x_1, y \rangle
        + 
        \langle (1 - \lambda)x_2, y\rangle
    \right\rbrace
    \\
    &\le 
    \lambda\sup_{y_1}\langle x_1, y_1\rangle + (1 - \lambda)\sup_{y_2}\langle x_2, y_2\rangle
    \\
    &= \lambda\delta_{C}^\star(x_1) + (1 - \lambda)\delta_C^\star(x_2)
\end{aligned}
$$

Therefore it's convex. 


---
### **Support Functions Equivalence Under Convex or Closure or Both**

> For any set $C$, these functions are equivalent: 
> $$
>   \delta_{C}^\star \equiv \delta^\star_{\text{cl}(C)}\equiv \delta^\star_{\text{cvxh}(C)}
> $$
> Suppose that $x\in \mathbb R^k$. 

**Proof**: 

The first inequality is easy because $C\subseteq\text{cl(C)}$ by def, and hence the $\sup$ of them yields $\delta_C^\star(x) \le \delta_{\text{cl}(C)}^\star(x)$, the other inequality $\delta^\star_{C}(x) \ge \delta_{\text{cl}(C)}^\star(x)$ by the property of $\sup$. 

For the proof of the second equality, recall the [[Caratheodory Theorem]] for convex set. Let $x$ be arbitrary. Using the fact that the set $\text{cvxh}(C)$ is closed set, the supremum can be obtained by the set $\{y_n\}_{n \ge 1}$ such that $\lim_{n\rightarrow \infty}\langle x, y_n\rangle = \delta_{C}^\star(x)$. Then for any $y_n$, it can be supported by $\{z_i\}_{i = 1}^{k + 1}$ using the Caratheodory Theorem (Note, the supports can be less than $k - 1$): 

$$
\begin{aligned}
    & \forall y_n \exists \lambda^{(n)} \in \Delta_{k + 1}, \{z_i^{(n)}\}_{i}^{k + 1}: 
    \sum_{i = 1}^{k + 1} \lambda_i^{(n)}z_i^{(n)} = y_n
    \\
    \implies &
    \forall n: \langle x, y_n\rangle = 
    \sum_{i = 1}^{k + 1}\lambda_i^{(n)} \langle z_i^{(n)}, x\rangle
    \\
    &\le
    \sum_{i= 1}^{k + 1}\lambda_i^{(n)}\sup_{z_i^{(n)}\in C}\langle z_i^{(n)}, x\rangle
    \\
    &= \sum_{i = 1}^{k + 1}\delta_{C}^\star(x)
    \\
    \implies 
    \delta_{\text{cvxh(C)}}^{\star}(x) &\le \delta_C^\star(x)
\end{aligned}
$$

The diretion whre $\delta_{C}^\star(x) \le \delta_{\text{cvxh}(C)}^\star(x)$ is obvious.Using the previous results we obtain the equivalence between all these 3 functions. 

**Remarks**

The magic here is the function inside of the sup can be superpositioned, and we take advantage of the properties of convex hull to support any points that are in convex hull using points from the original set $C$. 


---
### **Example 1: Support Function of Finite Sets**

> Given a nonempty convex set of vector in $C\subset \mathbb E$: $\{b_i\}_{i = 1}^n$, the support function of the set is: $\delta_C^\star(y) = \max_{i\in [n]}\{\langle y, b_i\rangle\}$. 

proof: Too easy skipped

---
### **Example 2: Support Function for a Cone**
> Given a non-empty cone: $K$, the support function of the cone is: $\delta^\star_K(x) \equiv \delta_{K^\circ}(x)$. It's the activation function on the polar of the cone. 

Proof: Too easy skipped

---
### **Example 3: Supporting Polyhedral Cone**

> Suppose a polyhedral cone $K = \{x: Ax \le \mathbf 0\}$, then it's polar is $\{A^Ty: y\ge \mathbf 0\}$, which means that the support function of $K$ is the indicator function of the polar cone: 

$$
\begin{aligned}
    \delta_K^{\star}(x) = \delta_{\{A^Ty: y\ge \mathbf 0\}}(x)
\end{aligned}
$$


---
### **Example 3:Supporting the Unit Simplex**

**Def: Simplex**
> $$
>     \Delta_n := \text{cvxh}\left\lbrace
>         \mathbf e_1, \mathbf e_2, \cdots, \mathbf e_n
>     \right\rbrace
> $$
> It's the convex hull of all the standard basis vectors. 

**Proof**: 

Because the set is finite, we can apply example 1 to obtain: $\max_{i\in [n]}\{y_i\}$, which is just $\Vert y\Vert_\infty = \delta_{\Delta_n}(y)$. 


---
### **Example 4: Supporting the Affine Space**




