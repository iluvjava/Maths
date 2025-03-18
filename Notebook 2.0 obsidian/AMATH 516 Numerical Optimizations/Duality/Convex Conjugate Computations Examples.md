---
alias: Fenchel Conjugate Examples

---
Here, I will summarize some of the examples we had for convex conjugates of different functions.
They will be from HW, some of the notes for the courses, the goal is to make it more organized, and everything in place so we have references for the future. 

- [Convex Conjugation Introduction](Convex%20Conjugation%20Introduction.md)


Major References: The HW for AMATH 515. 

### **Intro**

Here we will be packing a bunch of good examples with proofs, so it can serve as a good references for when looking for Fenchel Conjugates for functions. Most of them will be coming straight from the HW problems for the class. 
Fenchel transform is possible for non-convex function, but in that case, we don't generate identity after double conjugacy of the function. 
When the function is convex, proper and close, we get 2 directions for conjugacy between classes of functions, using the [Biconjugate Theorem](Biconjugate%20Theorem.md). 


#### **Def-1: Fenchel Conjugate Transform** 

> Given scalar function $f(x)$, preferably convex, the Fenchel conjugate is denoted as $f^*(x)$, sometimes $f^{\star}(x)$, and it's given by: 
> $$
> f^{\star} (z) = \sup_x \left\lbrace
>     z^Tx - f(x)
> \right\rbrace
> $$

We divides the examples into different types, We list the results and prove each of the examples. The demonstrations will be a foldable in Obsidian Notebook for better view. 

---
### **The Identity Function For Convex Conjugate $\frac{1}{2}\Vert x\Vert_2^2$**

$$
\left(
    \frac{1}{2}\Vert x\Vert_2^2
\right)^\star = 
    \frac{1}{2}\Vert x\Vert_2^2
$$

Proof is trivial, skipped. Just use calculus of the gradient, and then the definition of the Fenchel Conjugate then the solution will be natural. 

---
### **Linear Functions $c^Tx$**

The dual of linear function is indicator of a singleton, the singleton is the vector that defines the linear function. 

$$
[c^Tx + d|x]^\star(z) = \delta_0(z - c) + d
$$

**Demonstration:**
> [!tip]-
> $$
> \begin{aligned}
>     [\langle c, x\rangle + d|x]^\star (z) &= 
>     \sup_{y\in \mathbb R^n}
>     \left\lbrace
>        \langle y, z\rangle - \langle c, z\rangle - d
>     \right\rbrace
>     \\
>     &= 
>     \sup_{y\in \mathbb R^n}
>     \left\lbrace
>        \langle y- c, z\rangle - d
>     \right\rbrace
>     \\
>     &= 
>     \begin{rcases}
>         \begin{cases}
>             \infty & y \neq c
>             \\
>             -d & y = c
>         \end{cases}
>     \end{rcases} = \delta_{\{c\}}(z)
> \end{aligned}
> $$
> When $y\neq c$, we may always choose a vector pointing in the direction of $z = t(y - c)$, and then choosing $t\rightarrow \infty$, hence, no upper bound for the expression under this case. 

**Remarks**: 

A geometric argument is that, the only way to support the linear vector using a affine minorants is a line that has the same slope as that objective function, other supporting minorants will wedge out of the function, giving us $\infty$. 


---
### **The Natural Log: $-\ln(x) + \delta_{\mathbb R_{++}}(x)$**

$$
[-\ln(x) + \delta\{\mathbb R_{++}\}]^\star(z) = -1 - \ln(-z) + \delta\{\mathbb R_-\}(z)
$$


**Demonstration**

> [!tip]-
> 
> From the definition of Fenchel Conjugate of a convex function, we have: 
> $$
> \sup_{x>0} \left\lbrace
>     zx + \ln(x)
> \right\rbrace, 
> $$
> 
> Take note that the function is concave down, and the primal variable is only defined as $x > 0$, it's not defined otherwise. Here we can consider taking the derivative on the thing and figure out the extrema. 
> 
> $$
> \partial_x[zx + \ln(x)] = z + \frac{1}{x} = 0 \implies x = \frac{-1}{z} > 0.
> $$
> 
> Positivity constrain on $x$ means that dual variable $z<0$ all the time. Substituting it back to the original expression we have: 
> 
> $$
> \sup_{x} \left\lbrace
>     zx + \ln(x)
> \right\rbrace = 
> -1 + \ln \left(
>     \frac{-1}{z}
> \right) =
> -1 + \ln(1) -\ln(-z) = -1 - \ln(-z), 
> $$
> 
> When $z\ge0$, then choosing $x\rightarrow \infty$ makes $zx + \ln(x) \rightarrow \infty$, therefore, the dual is of form: $-1 - \ln(-z) + \delta\{\mathbb R_-\}(z)$. 

---
### **Conjugate of Indicator Function of Any Set**

Let $Q\subseteq X$ to be a subspace of some spaces, we show that the conjugate of the indicator function on $Q$ is the support function on $Q$. More specifically, we have the expression: 

$$
\begin{aligned}
    \delta^\star_Q(y) = \sigma_Q(y). 
\end{aligned}
$$

> [!tip]-
> 
> **Demonstrations**
> This is direct from the definition because $\sup_{x\in X}\{\langle x, y\rangle - \delta_Q(x)\} = \sup_{x\in Q}\{\langle x, y\rangle\} = \sigma_Q(y)$ by the definition of a support function. See [Support Function](../CVX%20Analysis/Support%20Function.md) for more context for it. 

---
### **The Exponential on $\mathbb R$**

We find the conjugate of $\exp(x)$ on the whole domain, we verify that 

$$
\begin{aligned}
    \exp^\star(y) &= 
    \begin{cases}
        +\infty & y< 0, 
        \\
        0 & y = 0, 
        \\
        y\ln(y) - y & y > 0.
    \end{cases}
\end{aligned}
$$

**Demonstration**

> [!tip]-
> $$
> \begin{aligned}
>     \exp^\star(y) &= \sup_{z\in \mathbb R}
>     \left\lbrace
>        zy - \exp(z)
>     \right\rbrace
>     \\
>     &= 
>     \sup_{z\in \mathbb R}
>     \left.
>     \begin{cases}
>         zy - \exp(z) & y < 0
>         \\
>         -\exp(z) & y = 0
>         \\
>         zy - \exp(z) & y > 0
>     \end{cases}
>     \right\rbrace, 
> \end{aligned}
> $$
> 
> 1. Case $y = 0$, we have $\sup_{z\in \mathbb R}(-\exp(z)) = 0$. 
> 2. Case $y < 0$, we take $z \rightarrow -\infty$ then $zy - \exp(x)$ approaches $\infty$, hence it's $\infty$. 
> 3. Case $y> 0$, max of $zy - \exp(z)$ can be obtained by setting the derivative to zero because it's a concave function, solving $y - \exp(z) = 0$ we obtain $z = \ln(y)$, substituting to get $y\ln(y) - y$, hence, we obtain the conjugate as stated above. 

---
### **Infinity Norm Ball Indicator Function** $\delta_{\mathbb{B}_\infty}(x)$


Assuming that we are in $\mathbb R^n$. Define the indicator of a unit, infinity norm ball to be: 

$$
\begin{aligned}
    \delta_{\mathbb{B}_\infty}(x) &:= \begin{cases}
    0 & \Vert x\Vert_\infty \le 1
    \\
    \infty & \text{else}
    \end{cases}
    \\
    [\delta_{\mathbb B_\infty}]^\star(z)
    &= 
    \Vert z\Vert_1. 
\end{aligned}
$$


**Demonstrations**: 
Using the definition of the Convex Conjugate, we consider evaluating the expression: 

> [!tip]-
> $$
> \begin{aligned}
>     \sup_{x}\left\lbrace
>     z^Tx - \delta_{\mathbb{B}_\infty}(x)
>     \right\rbrace &= 
>     \sup_{\Vert x\Vert_\infty \le 1}\left\lbrace
>     z^Tx
>     \right\rbrace
>     \\
>     &= \sum_{i = 1}^{n}\text{sign}(z_i)z_i 
>     \\
>     & = \sum_{i = 1}^{n}|z_i| = \Vert z\Vert_1. 
> \end{aligned}
> 
> $$
> 
> To maximize, choose $x_i = -\text{sign}(z_i)$, then the maximal absolute value of all $x_i$ is still less than one, but it's swapping the sign of $z_i$, forcing it to positively accumulates the sum. 


---
### **2-Norm Ball Indicator Function**

The 2-norm indicator function is a multi-variable function in $\mathbb{R}^n$, its definition and dual is given below: 

$$
\begin{aligned}
    \delta_{\mathbb{B}_2}(x) &:= \begin{cases}
    0 & \Vert x\Vert_2 \le 1
    \\
    \infty & \text{else}
    \end{cases}
    \\
    \delta_{{\mathbb B}_\infty}(y)
    &= 
    \Vert y\Vert
\end{aligned}

$$

**Demonstrations**: 

> [!tip]-
> 
> By definition we have:  
> $$
> \begin{aligned}
>     \delta_{\mathbb{B}^2}^*(z) &= \sup_{x}\left\lbrace
>     z^Tx - \delta_{\mathbb{B}^2}(x)
>     \right\rbrace
>     \\
>     \sup_{\Vert x\Vert_2 \le 1} \left\lbrace
>     z^Tx
>     \right\rbrace &= \Vert z\Vert, 
> \end{aligned}
> $$
> 
> Choose $x = \hat{z}$, a unit vector that points to the same direction as the vector $z$, it then reaches the upper bound, giving us the expression at the end. 


---
### **Any Norm Ball Indicator Function**

The dual an indicator function of any norm ball is, the dual norm, and vice verse, the dual of any norm function, is the indicator function of the dual norm ball. We define $\mathbb B = \{x: \Vert x\Vert \le 1\}$, then we have: 

$$
\delta^\star_{\mathbb B}(y) = \Vert y\Vert_\star
$$

**Demonstrations**: 
> [!tip]-
> $$
> \begin{aligned}
>     \delta^\star_\mathbb B (y) &= 
>     \sigma_{\mathbb B}(y) = 
>     \sup_{x\in \mathbb B}\{
>         \langle y, x\rangle
>     \} = \Vert y\Vert_\star, 
> \end{aligned}
> $$
> 
> at the first equality, we make use of the previous examples of the dual on indicator function of sets, the second equality is the definition of support function, and the last equality is the definition of dual norm, see [Dual Norm](../Background/Dual%20Norm.md) for more information. 


---
### **The Equality Indicator Function: $\delta_0$**

Let us be in $\mathbb R^n$, then $\delta_{\mathbf 0}(x)$ is the indicator function for the singleton set $\{\mathbf 0\}$. Recall that the dual of the linear function is the indicator of the vector representing the affine function, using the bi-conjugate function we have: 

$$
\begin{aligned}
    \delta_{\mathbf 0}^\star(y) = \langle \mathbf 0, y\rangle \equiv 0, 
\end{aligned}
$$

which is the zero function. 

---
### **The Positivity Indicator** $\delta_+(x)$

Let $\delta_+(x)$ be a mapping from $\mathbb{R}^n$ to $\mathbb{R}$, and let $\le, \ge$ be vectorized operator on all elements of a vector. The function basically forces all of its input to be in $\mathbb{R}_+$, else the function will just be undefined. 

$$
\begin{aligned}
    \left(
        \delta_+(x)
    \right)^\star(z)
    &= 
    \begin{cases}
        0 & z \le 0
        \\
        \infty & \text{else}
    \end{cases}
    \\
    &= \delta_-(x) 
    \\
    \text{where }
    \delta_+ &= \delta_{\mathbb R^n_+}
\end{aligned}
$$

**Demonstration:**

> [!tip]-
> $$
> \begin{aligned}
>     \left(
>         \delta_+(x)
>     \right)^\star(z)
>     &= 
>     \sup_x \left\lbrace
>         z^Tx - \delta_+(x)
>     \right\rbrace
>     \\
>     &= \sup_{x \ge \mathbf{0}} \left\lbrace
>         z^Tx
>     \right\rbrace
> \end{aligned}
> $$
>
> * Consider $\exists z_i: z_i > 0$, then choose $x_i > 0$, then consider $\lim_{x_i\rightarrow \infty} z^Tx = \infty$
> * Else, $\forall z_i, z_i \le 0$, which means that $x = \mathbf{0}$ maximizes $z^Tx$. 
> It's now shown. 



---
### **Indicator of a Cone, $\delta_{K}$**



---
### **Conjugate of $f(\lambda x)$**

Assume that $f^\star(x)$ is known already, we want to express $(f(\lambda x)^\star)$ using $f^\star(x)$

$$
\begin{aligned}
    \left(
        f(\lambda x)
    \right)^\star
    &= 
    f^\star \left(
        \frac{z}{\lambda}
    \right)
\end{aligned}
$$

**Justification:**
> [!tip]-
> $$
> \begin{aligned}
>     \left(
>         f(\lambda x)
>     \right)^\star
>     &= 
>     \sup_x\left\lbrace
>         z^Tx - f(\lambda x)
>     \right\rbrace
>     \\
>     &= 
>     \sup_y \left\lbrace
>         z^T\left(
>             \frac{y}{\lambda}
>         \right) - f(y)
>     \right\rbrace
>     \\
>     &= 
>     \sup_y \left\lbrace
>         \left(
>             \frac{z^T}{\lambda}
>         \right)y  - f(y)
>     \right\rbrace
>     \\
> 	&= 
> 	f^\star\left(
> 		\frac{z}{\lambda}
> 	\right)
> \end{aligned}
> $$

---
### **Conjugate of $\alpha f(x)$**

Let $\alpha > 0$, and let $\lambda \in \mathbb R$, and let $f:X\mapsto \mathbb{\bar R}$, then, $(\alpha f)^\star = \alpha f^\star(y/\alpha)$. 

**Demonstrations**: 
> [!tip]-
> Directly from the definition we have: 
> 
> $$
> \begin{aligned}
>     (\alpha f)^\star(y) &= \sup_{x\in X}\left\lbrace
>        \langle x, y\rangle - \alpha f(x)
>     \right\rbrace
>     \\
>     \alpha > 0 \implies 
>     &= \alpha\sup_{x\in X}\left\lbrace
>        \langle x, y/\alpha\rangle - f(x)
>     \right\rbrace
>     \\
>     & = \alpha f^\star\left(\frac{y}{\alpha} \right), 
> \end{aligned}
> $$
> 
> and we are done. 


---
### **Conjugate of $\alpha f(\lambda x + b) + \langle a, x\rangle$**

We consider the conjugate of several simple composition and derive it to show where things go. We assume that $\alpha > 0$ and $\lambda \neq 0$, they are scalars and $a, b$ are vectors. The result is stated here: 

$$
\begin{aligned}
    \left[
        \alpha f(\lambda x + b) + \langle a, x\rangle
    \right]^\star (y) 
    &= 
    \alpha f^\star\left(
        \frac{\lambda}{\alpha}(y - a)
    \right) - \left\langle 
        b, \lambda \frac{y - a}{\alpha} 
    \right\rangle
\end{aligned}
$$

Observe that the linear offset wedge out a linear term in the dual. other type of transformation won't introduce extra terms for the resulting conjugate.

**Demonstrations**
> [!tip]-
> $$
> \begin{aligned}
>     & \quad \sup_{x\in X}\left\lbrace
>         \langle y, x\rangle - \alpha f(\lambda x + b) - \langle a, x\rangle
>     \right\rbrace
>     \\
>     \alpha > 0
>     \implies 
>     & = 
>     \alpha \sup_{x\in X} 
>     \left\lbrace
>         \left\langle x, \frac{y - a}{\alpha}\right\rangle
>         - f(\lambda x + b)
>     \right\rbrace
>     \\
>     &= 
>     \alpha 
>     \sup_{x\in X} 
>     \left\lbrace
>         \left\langle \lambda^{-1}x, \frac{y - a}{\alpha}\right\rangle
>         - f(x + b)
>     \right\rbrace
>     \\
>     &= 
>     \alpha
>     \sup_{x\in X} 
>     \left\lbrace
>         \left\langle \lambda^{-1}x - b, \frac{y - a}{\alpha}\right\rangle
>         - f(x)
>     \right\rbrace
>     \\
>     &= 
>     \alpha
>     \sup_{x\in X} 
>     \left\lbrace
>         \left\langle \lambda^{-1}x, \frac{y - a}{\alpha}\right\rangle
>         - f(x)
>     \right\rbrace - \left\langle b, \frac{\lambda(y - a)}{\alpha} \right\rangle
>     \\
>     &= 
>     \alpha f^\star\left(\frac{\lambda(y - a)}{\alpha}\right) 
>     - 
>     \left\langle b, \frac{\lambda(y - a)}{\alpha}\right\rangle, 
> \end{aligned}
> $$
> 
> I hope this exam serves a good references in the future. 


---
### **Conjugate over Translation**
Let $f: \mathbb R^n \mapsto \mathbb{\bar R}$, then the conjugate of the function $f(x + b)$ with $b$ being a vector is: $f^\star(y) - \langle b, y\rangle$. 

**Demonstrations**

> [!tip]-
> Use the previous rule, setting $\alpha = 1 = \lambda$ and $a = \mathbf 0$. 


---
### **Conjugate Over Invertible Affine Transform**

Let $f:X \mapsto \mathbb{\bar{R}}$ be a proper, augmented real function. Let $A$ a bijective linear mapping on $X$, then $(f\circ A)^\star = f^\star\circ (A^{-1})^T$. 

---
### **Conjugation of Parallel Summations**

A function that can be written as the separable sums of several functions has a formula for its dual, which can be useful quite often. The statement is: 

$$
\left[
    \sum_{i = 1}^{n}g(x_i)
\right]^*(z) 
= 
\sum_{i = 1}^{n}
g^\star(z_i)
$$
where $x\in \mathbb R^n$, assume we are in finite Euclidean space, and $z\in \mathbb R^n$ too. 

**Demonstrations**: 
> [!tip]-
> 
> Note that this is a function that is multi-variable scalar function for the sum, and $g(x)$ is simply a $\mathbb{R}\mapsto \mathbb{R}$ function, then by definition of the Fenchel Conjugate we have: 
> 
> $$
> f^*(z) = \sup_{x}\left\lbrace
>     z^Tx - \sum_{i = 1}^{n}g(x_i)
> \right\rbrace
> $$
> 
> Focusing on the second term we have that: 
> 
> $$
> \begin{aligned}
>     &\quad \sup_{x}\left\lbrace
>         \sum_{i = 1}^{n}\left(
>             z_ix_i - g(x_i)
>         \right) 
>     \right\rbrace 
>     \\
>     &= 
>     \sup_{x_1, x_2, \cdots, x_n}\left\lbrace
>         \sum_{i = 1}^{n}\left(
>             z_ix_i - g(x_i)
>         \right) 
>     \right\rbrace 
>     \\
>     &= 
>     \sum_{i = 1}^{n}\left(
>         \sup_{x_i}\left\lbrace
>         z_ix_i - g(x_i)
>     \right\rbrace\right) 
>     \\
>     \implies 
>     f^*(z) &= 
>     \sum_{i = 1}^{n}
>         g^*(z_i)
> \end{aligned}
> $$
> 

---
### **2-Norm Affine Composite $\Vert Ax - b\Vert_2^2$, with Full Rank $A$**

The Dualization procedures can be found using the Fenchel's Identity, this example illustrate this techniques since otherwise it's harder to find the dual of this function. Recall [Fenchel Identity, Inequality](Fenchel%20Identity,%20Inequality.md). 

In this case the sub-gradient will be replaced by gradient. Assume that that matrix $A$ is **full rank**, so that $A^TA$ can be reversed. 

$$
\begin{aligned}
    f(x) &= \frac{1}{2} \Vert Ax - b\Vert^2     
    \\
    \implies
    \nabla [f(x)] &= A^T(Ax - b)
    \\
    \underset{[1]}{\implies}
    z &= \nabla [f](x) = A^T(Ax - b)
    \\
    \implies
    x &= (A^TA)^{-1} (z + A^Tb)
\end{aligned}
$$

\[1\]: We latch on the dual variable to the gradient of the function on the primal variable. 

Using the **Fenchel Identity**, we have: 

$$
x = (A^TA)^{-1} (z + A^Tb) = \nabla f^*(z)
$$

Then take the integral on the gradient defined here, we will have: 

$$
f^*(z) = \frac{1}{2}(z + A^Tb)^T(A^TA)^{-1}(z + A^Tb)
$$

Which we assume that $A^TA$ is invertible, or else this is not going to work out, and we will be **missing a constant that holds some information**. 

**Remarks**: 

The variable $z$ for the conjugate function is the decision variables for th dual problem. 


---
### **Conjugate of Infimal Convolutions** $(f\square g)^\star$

The infimal convolution has epigraphical interpretations that makes the resulting form of the conjugate very beautiful. See [Infimal Convolution and its Properties](../CVX%20Geometry/Infimal%20Convolution%20and%20its%20Properties.md) for more information. 

**Remarks**: 

There are cases where, even we have convex functions $f, g$, the closure property might be broken after the conjugation on the infimal convolution. See: Exercise 21.7 in Heinz's course notes for more information. 

#UNFINISHED 

**References:**
Prof Heinz's Monotone book, Proposition 15.5, and theorem 15.3, for a quick references that only involves convex function, see Prof Heinz's Course notes, Prop 21.1


