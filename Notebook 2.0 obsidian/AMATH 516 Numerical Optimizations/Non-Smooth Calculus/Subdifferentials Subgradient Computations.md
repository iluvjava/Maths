 * [[Subgradient Definition]]
* [[Characterizing Functions for Optimizations]]

---
### **Intro**

We introduce a simple theorem and then we are going fully hardcore about it using materials in \<First Order Method in Optimizations\> by SIAM. Before we start, there are 2 types of subgradient: 

* **Strong Subgradient**: All the possible subgradient at a point given the function. 
* **Weak Subgradient**: Just a subset of all the possible subgradient. 

The weak subgradient is relative easier to find. 

---
### **Theorem: Subdifferential for Separable Summations**

> Suppose a function is in the form of $f: \mathbb E_1 \times \mathbb E_2 \cdots \mathbb E_n \mapsto \mathbb {\bar R}$, written as $\sum_{i =1}^{n}f_i(x_i)$ where $x_i\in \mathbb E_i$, then the subdifferential of the function is: 
> 
> $$
> \partial[f](x_1, x_2, x_3,\cdots, x_n) = \partial[f_1](x_1)\times \partial [f_2](x_2)\times \cdots \times \partial [f_n](x_n)
> $$

**Proofs**

This proof is direct from the separable property of euclidean inner product. Let $(x_1, x_2), (y_1, y_2)\in \mathbb E_1\times \mathbb E_2$ then $\langle (x_1, x_2), (y_1, y_2)\rangle = \langle x_1, y_1\rangle + \langle x_2, y_2\rangle$. Therefore let's consider $x, y\in \mathbb E_1\times \mathbb E_2\times \cdots \times \mathbb E_n$ as a list of points, then consider the following direct decomposition of the vector group coordinate wise: 

$$
\begin{aligned}
    \\
    \text{let}:&\; \mathbf{e}_{i}:=  (\cdots, \mathbf 1, \cdots)\in \mathbb E_i 
    \\
    &
    x = x_1 \mathbf{\hat e}_1 + x_2 \mathbf{\hat e}_2 + \cdots +x_n \mathbf{\hat e}_n \; \text{where}: x_1\in \mathbb E_1, x_2\in \mathbb E_2, \cdots, x_n \in \mathbb E_n
    \\
    &
    y = y_1 \mathbf{\hat e}_1 + y_2 \mathbf{\hat e}_2 + \cdots +y_n \mathbf{\hat e}_n \; \text{where}: y_1\in \mathbb E_1, y_2\in \mathbb E_2, \cdots, y_n \in \mathbb E_n
    
    \\
    \forall 1\le i \le n& : 
    f_i(y_i) - f_i(x_i) \ge \langle \partial [f](x_i), y_i - x_i\rangle
    \\
    \implies & \partial [f](x_i)\in \mathbb E_i \implies \sum_{i = 1}^{n}\partial[f](x_i)\mathbf{\hat e}_i = \bigotimes_{i = 1}^{n}\partial[f](x_i)
    \\
    \implies &
    \sum_{i = 1}^{n}f_i(y_i) - f_i(x_i)
    \ge 
    \langle \partial[f](x_i)\mathbf{\hat e_i}, (y_i - x_i) \mathbf{\hat e_i}\rangle
    \\
    \implies & 
    f(y) - f(x) \ge \left\langle 
        \bigotimes_{i = 1}^n\partial[f](x_i), \sum_{i = 1}^{n}(y_i - x_i)\mathbf{\hat e_i}    
    \right\rangle
    \\
    \implies & f(y) - f(x)\ge 
    \left\langle 
        \bigotimes_{i = 1}^n\partial[f](x_i), y - x
    \right\rangle
\end{aligned}
$$


**Source:** 

Unassigned Exercises in AMATH 516 FALL 2021

---
### **Theorem: Smooth Plus Nonsmooth**

> Let $f, g$ be 2 proper functions, and suppose that $f$ is smooth and differentiable at the point $x$, then: 
> $$
>   \partial [f + g](x)  = \nabla [f](x) + \partial [g](x)
> $$

**Proofs**: 
The proof is direct from the definition of smooth gradient and non-smooth gradient. The little $o(\Vert x - y\Vert)$ sums up for both the equality of smooth function gradient and subgradient, and it combines into a new subgradient. And that subgradient translate to the direct sum of $\nabla[f](x)$ and $\partial [g](x)$. 

**Source**: Unassigned exercise from AMATH 516. 

---
### **Theorem: Subgradient of Pointwise Maximum of Functions**

> Suppose a function is in the form of a pointwise maximum of countably many function: $f(x):= \max_{i\in [n]}f_i(x)$ for all $f_i$ that are convex. Then the strong subgradient of the function is: 
> $$
> \begin{aligned}
>     & I(x):= \{i\in[n]: f_i(x) = f(x)\}
>     \\
>     & \partial [f](x) = \text{cvxh}
>     \left(
>         \bigcup_{i\in I(x)}\partial [f_i](x)
>     \right)
> \end{aligned}
> $$
> The weak subgradient is to choose any $i\in I(x)$, and choose any $g\in \partial[f_i](x)$ and that will work: $g\in \partial[f](x)$. 

**Proof**: 
The $\subseteq$ direction is harder than $\supseteq$. 


**Source**: [Stack Exchange Discussion](https://math.stackexchange.com/questions/229025/subgradients-of-function). Original course notes is: [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/subgradients.pdf). 

---
### **Theorem: Subgradient of Affine Transformation**

> The subgradient of the function $f(Ax + b)$ wrt to x is: 
> $$
>   \partial[f(Ax + b)|x](x) = A^T\partial[f](Ax + b).
> $$
> However, the case where $\partial[f(Ax + b)|x](x) \subseteq A^T\partial[f](Ax + b)$ is generally false, and it's true when: 
> (i) The range of $A$ contains a point from $\text{ri}\circ\text{dom}(f)$. 
> (ii)$f$ is polyhedral and the point $\text{ri}\circ\text{dom}f$ is contained in the range of $A$. 

**Proofs of Weak Results**
Here we prove that $A^T\partial [f](Ax + b) \subseteq \partial[f(Ax + b)]_x(x)$. Consider any $g\in \partial[f](Ax + b)$ we have from the definition that: 

$$
\begin{aligned}
    & 
    f(Ay + b) - f(Ax + b) \ge \langle g, Ay + b - (Ax + b)\rangle
    \\
    & 
    f(Ay + b) - f(Ax + b) \ge \langle g, A(y - x)\rangle
    \\
    &
    f(Ay + b) - f(Ax + b) \ge \langle A^Tg, y - x\rangle
    \\
    \implies & 
    A^T g \in \partial [f(Ax + b)]_x(x)
\end{aligned}
$$

**Remarks**

The converse statement has more subtleties and we skip the proof here. For an example showcasing that $A^T\partial [f](Ax + b)\subsetneq \partial [f(Ax + b)|x](x)$, see [[Subgradient Affine Composition]] for more information. 


**Source**: See stack exchange discussions [here](https://math.stackexchange.com/questions/2656013/how-to-prove-the-affine-composition-of-the-subdifferential). For detailed proof on the converse, consult Rockafellar Variational Analysis 23.9. 


---
### **Theorem: Subgradient of Monotone Composition (Weak Results)**

> Define $f(x):= h(f_1(x), f_2(x), \cdots, f_n(x))$, where $h(x_1, x_2, \cdots, x_n)$ is a convex and non-decreasing function in each of its parameter , and $f_i(x)$ are all convex. The weak result stated that: 
> $$
> \begin{aligned}
>     \begin{bmatrix}
>           \\
>           \partial f_1(x)& \partial f_2(x) & \cdots& \partial f_n(x) 
>           \\ \\
>     \end{bmatrix}
>       \partial h(f_1(x), \cdots, f_n(x)) 
> \in \partial [f](x),
> \end{aligned}
> $$

where we abused the notation by using the set to represents any vector whose elements belong to that set. The matrix can be interpreted as a specific element from the union of all possible Jacobi matrix whose colons are made of subgradient vector. 

**Proofs**:

...


**Theorem: Differential Monotone Subgradient Composition**: 

> Let $f$ be convex on X and let G be convex, and increasing on $\R$, suppose that $g$ is differentialble at $f(x)$, then: 
> $\partial (g\circ f)(x) = g'(f(x)) \partial f(x)$. 

**Proofs**: 

....


**Remarks**:

This is a weak result, and such $\langle g, z\rangle$ is not part of the subdifferential. Strong holds in some of these more general settings is equivalent to the validity of a sum and  chain rules for subdifferentials. [^1]

[^1]: Commented by Dimitri on his course notes AMATH 516, 2021 FALL, pg: 97. see in [[../References/Math 516 Convex Analysis 2 - Dmitriy Drusvyatskiy.pdf]]. 


**Source**:

See course notes: [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/subgradients.pdf) for the first one, and then see Heinz's Monotone operator theory textbook for the second rule. 



---
### **Theorem: Subgradient of Simple Summations**

> Let $f_1,f_2$ be 2 convex function such that $\text{ri}(\text{dom})(f_1) \cap \text{ri}(\text{dom})(f_2)\neq \emptyset$, then we have the following strong subgradient theorem: 
> $$
> \partial[f_1 + f_2](\bar x) = \partial[f_1](\bar x) + \partial [f_2](\bar x)
> $$

**Proofs**
The direction $\supseteq$ is direct using the secant line inequality, the other $\subseteq$ is the hard direction. One of the proofs requires: [[Normal Cone Addition]] for assistance. Additionally, when $\text{ri.dom}(f_1) \cap \text{ri.dom}(f_2)\neq \emptyset$, we will have $\supseteq$ instead of equality. 

**Source**: 

A website for lecture notes, see [here](https://maunamn.wordpress.com/8-the-subdifferential-sum-rule/) for more. For a norma general and direct coverage of the theorem, see Rockafellar's convex book theorem 23.8. 


---
### **Tools for Analysis**

Before we go further, we need to make the point that subdifferential on augmented real function is not simple businesses, and we would like to meet one of the pathological instances to show it. The instance comes from Dimitry's Notes for AMATH 516 FALL 2021, and it illustrate that adding subgradient together could be problematic. 




