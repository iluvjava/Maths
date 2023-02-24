For Optimality, Convexity means a problem that is easier to solve because of the lack of a multiple Local Minimal, and non-convexity will mean harder to solve problem in general. 
1. Convexity of functions
2. Convexity of sets
3. Some illustrative examples.

---
### **Convex Set**
A set is said to be convex if any convex combinations of 2 arbitrary elements from the set are inside of the set as well. 

For this class, we are exclusively talking about $\mathbb{R}^n$. 

A set $C$ is said to be convex if: 
$$
\forall x, y \in C: \lambda x + (1-\lambda)y \in C \text{ where } \lambda \in (0, 1)
$$

**Examples**: 
1. Planes,
2. Lines,
3. Half-spaces(System of Linear Inequalities) are convex.
4. Normal Balls ($||x||_p \forall p \geq 1$)

(These are going to be **useful short cuts** for convex analysis)

**Properties**: 
The intersection of 2 convex set is going to be another convex set. $C_1, C_2$ are convex --> $C_1 \cap C_2$ is convex. Bruh, the proof is trivial and it's skipped here. 


---
### **Convex Function** 
Here, we are going to see how we can start killing classes of function with the definition of Convexity for Functions and Sets.

Similarly, a function can be called convex too if: 

$$
f(\lambda x + (1 - \lambda)y) \leq \lambda f(x) + (1 - \lambda)f(y)
$$

Where $f:U \mapsto (-\infty, +\infty)$ and $\lambda \in [0, 1]$

Simply put: The function is convex if every secant line on the graph lies above the graph. Boom, nice and simple, just as its name suggested. 

### **Epigraph: From Sets to Functions**
The Epigraph of a function is a collection of points that **lies above the function**, and hence the definition can be written as: 
$$
\text{epi}(f) := \left\lbrace
\begin{bmatrix}
\alpha \\ x
\end{bmatrix}: 
f(x) \leq \alpha
\right\rbrace
$$

Definition (Linked to the convex set):
>A function is convex if its epigraph forms a convex set. 

Therefore, using the definition of convex set, we can say that: 
$$
\lambda \begin{bmatrix}f(x) \\ x\end{bmatrix} + (1 - \lambda)\begin{bmatrix}
f(y) \\ y
\end{bmatrix}
\in 
\text{epi}(f) \quad \forall \lambda \in (0, 1)
$$

And notice that, **there are 2 parts involved here**, the domain of the function and the range of the function, assuming that the domain of is well defined and it's convex, then we can proceed with the definition that: 
> $$
> f(\lambda x + (1 - \lambda) y) \leq \lambda f(x) + (1 - \lambda)f(y)
> $$
>$$
>f(x + \lambda(y - x)) \le f(x) + \lambda f(y - x)
>$$

**Observe**: 
The if the function is in $\mathbb{R}^{n}$ then we can say that the epigraph of the function is going to be in $\mathbb{R}^{n + 1}$.

---
### **Examples of Convex Functions**
**Example 0**: Norms are convex function 
A norm satisfies that (Which is coming from the axioms, [[../../AMATH 584 Numerical Linear Algebra/Matrix Theory/Norm, for Beginners]]):
1. $||x + y||\leq \Vert x\Vert + \Vert y \Vert$
2. $\Vert ax \Vert = |a|\Vert x \Vert$

So then: 

$$
\Vert \lambda x + (1 - \lambda)y\Vert  \le |\lambda|\Vert x\Vert 
+
|1 - \lambda|\Vert y\Vert 
$$
Which is directly, the definition of convexity, and hence norm (with $p \le 1$) is convex. 

**Example 1**: $\max(f_1, f_2)$: 
Suppose that $f_1, f_2$ are convex functions, then it can be said that $\max(f_1, f_2)$ is also a convex function.

This is true because, $\max(f_1, f_2)$ equals to $\text{epi}f_1(x) \cap \text{epi}f_2(x)$, and the intersection of 2 convex set (These 2 Epigraphs) is still going to be convex, therefore $\max(f_1, f_2)$ is still going to be a convex function. 

**Example 2**: The Convex Indicator Function
$$
\delta_c(x) = \begin{cases}
0 & x \in C \\ \infty & x\not\in C
\end{cases}
$$
Where the domain of the function $C$ is denoted to be a convex set. 

Proof sketch: Make the argument that the cylinder above it is going to be a convex set. 


**Example 3**: Affine Linear Functions
The affine linear function is defined to be: 
$$
f(x)= a + b^Tx
$$
However, take notice on the realization that:
$$
L(y) = f(x) + \nabla f(x)^T(y - x) = a + b^Tx - b^Tx + b^Ty
$$
Using the LHS of the definition on convexity of the function we need to figure out: $L(\lambda x + (1 - \lambda)y)$, which is giving us: 
$$
L(\lambda y + (1 - \lambda)y) = f(x) + \nabla f(x)^T((1 - \lambda)(y - x))
$$

Now let's take a look at $\lambda L(x) + (1 - \lambda) L(y)$. Which is giving us: 
$$
\lambda f(x) + (1 - \lambda)f(x) + (1 - \lambda)\nabla f(x)^T(y - x)
$$
Simplifying, we have: 
$$
f(x) + (1 - \lambda)\nabla f(x)^T(y - x)
$$

And notice that, they are the same. Please take note of the exploitation of the $\nabla$ here, it's very useful

**Observe**: 
For affine linear function, the equality is strictly satisfied here. 

---
### **Extra Comments**
Things about the convex functions and their proofs has been investigated in the HW1 section. 

---
### **Operations that Preserves Convexity**
Convexity functions, or convexity of sets will be preserved under some certain set of operations, and in that case, it can be exploited for proof, and constructing more and more convex functions. 

Here is a list of convex rules from Wiki: [wiki](https://www.wikiwand.com/en/Convex_function)

First: $f$ is concave if and only if $-f$ is convex. 

1. Non-negative weighted sums: 
	* let $w_i$ to be positive for $1\le i \le n$, then the linear combinations of positive weight over the set of convex functions: $f_i$ are still convex. $\sum_{i = 1}^{n} w_if_i$ is still a convex function. 
	* This property can be extended to infinite sum, integral, and expected value as well (with the assumption that it exists)

2. Element wise maximum: let $\{f_i\}_{i\in I}$ be a collection of convex functions, then, $g(x):= \sup_{i \in I}\{f_i{(x)}\}$ is still going to be a convex function. 
	* **Danskin's Theorem**: if $f(x,y)$ is convex in $x$ then $g(x) = \sup_{y\in C}f(x, y)$ is convex in $x$, even if $C$ is not a convex set. 


