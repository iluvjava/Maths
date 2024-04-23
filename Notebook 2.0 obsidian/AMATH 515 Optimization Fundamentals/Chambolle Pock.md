Chambolle Pock [[Interior Points]]. 
Firstly, we are going to look at some basics for the Chambolle Pock Method. 
We are going to show that: 

1. $(I + T)^{-1}$ is Firmly Non Extensible (Firmly Non Extensible) 
2. Prof that convergence of the fixed point iterations. 
3. Understand the trick involving the matrix: $P$. 

How does the fact that the iterations converges due to the fact that the operator is a monotone operator. 

**Reference Resources**: 
A first-order primal-dual algorithm for convex problems with applications to imaging.

---
### **Chambolle-Pock: Preque**

**Lemma 1**

Prox gradient and linear offset: 

$$
\widetilde{h}(x) = h(x - b)\implies 
\underset{\lambda, \tilde{h}}{\text{prox}}(z) = 
\underset{\lambda, \widetilde{h}}{\text{prox}}(z - b) + b
$$

And the algorithm is going to operates for the problem set without $b$ and $c$. 

---
### **Chambolle-Pock: Optimality conditions to Fixed Points Iterations**
Consider the primal and the dual problem set: 

> $$
> \min_x \left\lbrace
>     g(x) + h (Ax)
> \right\rbrace \quad 
> \max_z \left\lbrace
>     -h^*(z) - g^*(-A^Tz)
> \right\rbrace
> $$

We make the assumption that both function $f(x)$ and $g(x)$ are non-smooth, sub-differential will be needed. 

The optimality condition is obtained by taking the sub-differential on the primal problem:

$$
\underbrace{0 \in \partial g(\bar{x}) + A^T\bar{z}}_{\text{Conditioin (1)}} \quad \text{Where: } \bar{z} \in \partial h(A\bar{x})
$$

$$
z\in \partial h(A\bar{x}) \underset{\text{Fenchel}}{\implies} A\bar{x}\in \partial h^*(\bar{z}) \implies 
\underbrace{
0 \in -A\bar{x} + \partial h^*(\bar{z})}_{\text{Condition (2)}}
$$

And then, so then we want the conditions for optimality using the Lagrangian: 

$$
\begin{bmatrix}
    0 \\ 0
\end{bmatrix} \in 
\begin{bmatrix}
    \partial g(\bar{x}) + A^T\bar{z} 
    \\
    \partial h^*(\bar{z}) - A\bar{x}
\end{bmatrix}
$$

And we have a weird non-lin operator sitting there, it's like: 

$$
T = \begin{bmatrix}
    \partial g & \\
    & \partial h^*
\end{bmatrix} + 
\begin{bmatrix}
    0 & A^T \\ 
    -A & 0
\end{bmatrix} \implies \begin{bmatrix}
    0 \\ 0
\end{bmatrix} \in T \begin{bmatrix}
    \bar{x} \\ \bar{z}
\end{bmatrix}
$$

Interestingly, there is another operator $(I + T)^{-1}$ involving $T$ such that a fixed point iterations with such a operator will find the optimality solution for expression. 

$$
\bar{w} \in (I + T)^{-1}\bar{w}\implies \bar{w} \in (I + T)\bar{w} \iff 0 \in Tw
$$

If we find the fixed point of the system, when we have a optimal solution to the system. 

----
**Question**:
1. Why does it have a fixed point?
2. Why does it have to converge to the fixed point?
3. How to implement it efficiently? Spoiler: Refinement $P$: $w^+ = (I + P^{-1}T)w$

**Spoiler: The Algorithm**: 
$$
x^+ = \underset{\gamma, g}{\text{prox}} \left(
    x - \gamma A^Tz 
\right)
$$

$$
z^+ = \underset{\gamma, h^*}{\text{prox}}\left(
    z - \gamma A(x - zx^+)
\right)
$$

This will solve the primal and dual pair listed above in this section. 

**Some Theories for the Problem**

1. The operator $T$ is said to be Monotone
2. $(I + T)^{-1}$ is called well-behaved. The fixed point iterations will converge in this case. 


---
### **Def: Monotone Operator**

$$
\langle x - y, Tx - Ty\rangle \ge 0 \quad \forall  x, y
$$

It's kinda like the old properties from the convex differential characterization. [[../AMATH 516 Numerical Optimizations/CVX Analysis/Gradient, Hessian Characterization of Convex Functions]], but in this case, we have the sub-differential. Recall that Alpha strongly convex has the property that $(\nabla f(x) - \nabla f(y))^T(y - x)\ge \alpha ||y - x||^2$

**Example**

If $f$ is convex, then $\partial f$ is monotone. 

**Example**

> Skew-Symmetric Matrix is Monotone Operator. $A^T = -A$

Proof: Skipped. 

Think one of the component of the $T$ operator. 

**Fact**

$T$ is a monotone operator. 

---
### **Def: Non Expansive Operator**

let $S$ be the operator.

This is related to the Liptiz Continuity, which is going to have the properties that: 

$$
\left\Vert
     Sx - Sy
\right\Vert \le \left\Vert
     x - y
\right\Vert
$$

Then the operator $S$ is called Non-Expansive. 

Notice that this is looking like the fixed point iterations in Numerical Analysis, Which is very interesting. 

**Def: Firmly Non Expansive**

Let $S$ be the operator

$$
\left\Vert
     Sx - Sy
\right\Vert^2 + \left\Vert
     (I - S)x - (I - S)y
\right\Vert^2 \le \left\Vert
     x - y
\right\Vert^2
$$

---
### **Recap**
$$
\min_x \left\lbrace
    g(x) + h(x- b) - c^Tx
\right\rbrace
$$

$$
\max_{z} \left\lbrace
    -z^Tb - h^*(z) - g^*(-A^Tz + c)
\right\rbrace
$$

However, for the same of Chambolle Pock, we are considering the dual primal pairs in the form of: 

$$
\min_x\left\lbrace
    g(x) + h(Ax)
\right\rbrace 
\quad 
\max_z\left\lbrace
    -h^*(z) - g^*(-A^Tz)
\right\rbrace
$$

And in the end we will use the lemma to introduce back the vector $b, c$ to solve the general form of the primal and dual problems. 

---
### **Chambolle Pock**
Previously, we have the optimality conditions for the Chambolle Pock, given by: 

$$
\begin{bmatrix}
    0 \\0
\end{bmatrix}\in
\underbrace{
\left(
    \begin{bmatrix}
        \partial g & \\ & \partial h^* 
    \end{bmatrix}
    +
    \begin{bmatrix}
        & A^T\\ -A &  
    \end{bmatrix}
\right)
}_{T}
\underbrace{
\begin{bmatrix}
    \bar{x} \\ \bar{z}
\end{bmatrix}}_{\bar{w}}
$$

And notice that, there are 2 types of iterations we will be looking trough: 

$$
w^+ = (I + T)^{-1}w 
$$

$$
w^+ = (I + P^{-1}T)w
$$

The first one if the easy one and the second one is the tricky one. 

And, it's shown in the previous lecture and in the HW that the operator $T$ **is monotone**, meaning that : 
$$
\langle x - y, u - v\rangle\ge 0 \quad \forall x, y \quad  u\in Tx, v\in Ty
$$

Notice that, $Tx, Ty$ is set, this is true when we had the sub-gradient of the function in the $T$ operator. 

---
### **Theorem 1**

If $T$ is monotone then $S = (I + T)^{-1}$ is Firmly Non Expansive (FNE). Where $I$ is the identity operator. 

Consider picking $x, u\in Sx$, and choose $y$ so that $v\in Sy$. 

So then: 

$$
u\in (I + T)^{-1}x \quad x\in (I + T)u = u + Tu \implies x - u\in Tu
$$

Follow by a similar token, we will have the formulation that: 

$$
v \in S y \quad y \in (I + T)v = v + Tv \implies y - v \in Tv
$$

By the property that the operator $T$ is a monotone operator, we have the statement that: 

$$
\langle u - v, (x - u) - (y - v)\rangle \ge 0 \tag{1}
$$

Where we "susbtitute" the $Tx, Ty$ with the elements in the set, $x - u$, $y - v$

Ok, check this out: 

$$
(I - S)x =  x - Sx \implies x - u\in x - Sx = (I - S)x
$$

Similarly we can have: 

$$
(I - S)y = y - Sy \implies y - v \in y - Sy = (I -S)y
$$

Hence (1) can be written as: 

$$
\langle u - v, (x - u) - (y - v)\rangle \ge 0 \implies \langle Sx - Sy, (I - S)x - (I-S)y\rangle \ge 0
$$

Notice that, when we do the inner product on sets, we are literally taking all the elements in the set and then make inner products on them. (This class as a weird assumption that all the sets adhere to the sub-differential)

**Note**: HW 3b will complete the proof from this point on showing that the operator is FNE. 

---
### **Theorem: Krasnozelch-Mann** 

#### **Informally**: 

Any Lipchitz 1 (NE) operator can be tweaked so repeated application of it converges to its fixed point. 

This is a general statement, it can be applied to any operator of that kind. 

**Corollary**: 

If it's Firmly Non-Expansive, then we don't have to tweak it to get the fixed point convergence. 

#### **Formally**:

Let $R$ be non-expansive: $\left\Vert
     Rx - Ry
\right\Vert \le \left\Vert
     x - y
\right\Vert$, suppose fix $R$, $\{x: Rx = x\} \neq \emptyset$. For $\lambda \in (0, 1)$, define the "tweak": $R_\lambda w = (1 - \lambda)w + \lambda Rw$ then: 

1. Fix point of $R$ equals to the fixed point of $R_\lambda$
2. $w^+ = R_\lambda w$ will converge to the fixed point of $R$ at a sub-linear rate. 

**Proof**

By HW problem 2(b), we have that for any $\bar{w}$ that is a fixed point of $R$ we will have: 

$$
\left\Vert
     R_\lambda w - \bar{w} 
\right\Vert^2 \le 
\left\Vert
     w - \bar{w}
\right\Vert^2 - \lambda(1 - \lambda) \left\Vert
     Rw - w
\right\Vert^2
$$

Then: 

$$
w_{k + 1} = R_\lambda w_k
$$

Then we can get : 

$$
\lambda(1 - \lambda) \left\Vert
     w_k - Rw_{k}
\right\Vert^2 \ge \left\Vert
     w^k - \bar{w}
\right\Vert^2 - \left\Vert
     w_{k + 1} - \bar{w}
\right\Vert^2
$$

RHS is a circular cancellation. Similar to the analysis of the gradient descent, and this will give us: 

$$
\min_{0\le i \le k} \left\lbrace
    \left\Vert
         w_k - w_{k + 1}
    \right\Vert
\right\rbrace \le \frac{\left\Vert
     w_0 - \bar{w}
\right\Vert^2}{k(\lambda)(1 - \lambda)}
$$

And the big picture contains: 

1. $w_k$ is bounded. 
2. $w_k$ have a unique limit point. 
3. Our detail above gives a sub-linear convergence rate to the limit point.

Any. Liptz. Operator. Can use theorems stated here. 


**Corollary**: 

If $S$ is FNE, KM simplifies to $w^+ = Sw$

HW 3(c): $S$ is FNE iff $2S - I$ is NE by 

Apply KM to $2S - I$, $\lambda = \frac{1}{2}$ 

So when $\lambda = 1/2$, the KM is gonna be like: 

$$
(2S - I)_{\frac{1}{2}} = \frac{1}{2}w + \frac{1}{2} (2S - I)2 = Sw
$$

**Summary**: 

T monotone, then $w^+ = (I + T)^{-1}w$ will converge to fixed point of $(I + T)^{-1}$. 

---
### **Proximal Point Method from Sub-Differential**

Consider closed convex and proper function $f(x)$, probably non-smooth, and the problem $\min_x f(x)$, then it can be said that: 

$$
0 \in \partial f(\bar{x}) \quad \text{Where: } \partial f = T
$$

And $T$ is in fact, Firmly Non-Expansive operator[^1]

Consider the iterative procedure: 

$$
x^+ = (I + \partial f)^{-1}x
\implies
x\in (I + \partial f)x^+ \implies x \in x^+ \partial f(x^+)\implies x - x^+ \in \partial f(x^+)
$$

And, $x - x^+\in \partial f(x^+)$ is the optimal conditions for: 

$$x^+ = \underset{f}{\text{prox}}(x)
 = \underset{y}{\text{argmin}} \left\lbrace
    \frac{1}{2}\Vert x - y\Vert^2 + f(y)
 \right\rbrace
$$

This is call the Proximal Point Method. The fixed point iterative procedure on the operator $(I + \partial f)$ yields the optimal results for the proximal operator on $f$. 

Ok, very very bad news for people who want to use the iterative procedure: $(I + \partial f)^+$ is not easy to implement, it has an inverse operation there, we have to know how to solve the prox to invert the operator.  

---
### **Magic**

Use a "Pre-conditioner" $P$: 

Let $P$ be any positive definite matrix. Define a new inner product:
$$
\langle x, y\rangle_P:= x^TPy
$$

Fact: 
$P^{-1}T$ is monotone wrt to $\langle x, y\rangle_P \iff T$ is monotone. 

Then, we can use iteration: 
$$
w^+ = (I + P^{-1}T)^{-1}w \implies w\in (I + P^{-1}T)w^+
$$
$$
w - w^+ \in P^{-1}Tw^+ \implies w - w^+ \in P^{-1}Tw^+
$$
$$
\implies P(w - w^+) \in Tw^+
$$

For any $P$ that is positive definite. 

---
### **Finally**
Compute $w^+$ via: 

$$
P(w - w^+) \in Tw^+
$$

And the $P$ matrix is: 

$$
P = \begin{bmatrix}
    \frac{1}{\gamma} I & -A^T \\
    -A & \frac{1}{\gamma}I
\end{bmatrix}
$$

Where $\gamma$ can be set to be really hue to make the matrix positive definite. 

$$
P
\underbrace{
\begin{bmatrix}
    x - x^+ \\ z - z^+
\end{bmatrix}}_{w - w^+}
\in 
\underbrace{
\begin{bmatrix}
    A^Tz^+ \partial g(x^+)\\
    -Ax^+ + \partial h^*(x^+)
\end{bmatrix}}_{Tw^+}
\tag{2}
$$

The first row of the above vector and matrix multiplication is given as: 

$$
\frac{1}{\alpha}(x - x^+) - A^T(z - z^+)
\in A^Tz^+ \partial g(x^+)
$$

$$
\frac{1}{\alpha}(x - x^+) - A^Tz + A^Tz^+
\in A^Tz^+ \partial g(x^+)
$$

$$
\frac{1}{\gamma}(x - \gamma A^Tz - x^+) \in \partial g(x^+)
$$

Notice that the above optimality condition is the solution to the proximal problem: 
$$
x^+ = 
\underset{\gamma, g}{\text{prox}}\left(
    x - \gamma A^Tz
\right)
$$

Given the $g$, the prox should have a closed form, if $g()$ is nice. 

Focusing on the second row of the expression (2), we should have: 

$$
-A(x - x^+) + \frac{1}{\alpha}(z - z^+) \in -Ax^+ + \partial h^*(z^+)
$$

Then we should have: 

$$
\frac{1}{\gamma}(z - z^+) - Ax + 2Ax^+ \in \partial h^*(z^+)
$$
$$
\frac{1}{\gamma} (z - \gamma A(x - 2x^+))\in \partial h^*(z^+)
$$

The final iteration is stated as: 

$$
\begin{cases}
    x^+ = \underset{\gamma, g}{\text{prox}}(x - \gamma A^Tz) \\
    z^+ = \underset{\gamma, h^*}{\text{prox}}(z - \gamma A(x - 2x^+))
\end{cases}
\tag{3}
$$

---
### **Augmentation for Other Problem Types**

Introducing the $c, b$ vector. The iteration will become: 

$$
\begin{cases}
x^+ = \underset{\gamma, g}{\text{prox}}\left(
    x - \gamma(A^Tz - c)
\right)
\\
z^+ = \underset{\gamma, h^*}{\text{prox}}\left(
    z - \gamma A(x - 2x^+) - \gamma b
\right)
\end{cases}
$$

The $c, b$ is introduced by directly tweaking the optimality conditions that is coming out from the Lagrangian. 

This iterations solve the mutated version of the problem which looks like: 

> $$
> \min_x \left\lbrace
> g(x) + h(Ax - b) + c^Tx 
> \right\rbrace
> =
> \sup_z \left\lbrace
> -b^Tz - h^*(z) - g^*(-A^Tz - c)
> \right\rbrace \tag{1}
> $$


[^1]: Which I have absolutely not idea why, it's not shown in lecture. 