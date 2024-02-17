[Linear Mapping in Banach Space](Linear%20Mapping%20in%20Banach%20Space.md)

---
### **Intro**

Bounded linear functionals are, representable as a vector in the dual spaces. 
As an introduction we remind the readers that, linear operators form a vector space. Denote $\mathcal B(X, Y)$ to be the set of bounded linear operator mapping from $X$ to $Y$ which are vector spaces. 
For linear mapping between Banach space $X, Y$ to be a vector space itself, we define field $\mathbb K$, together with the addition rules and scalar vector multiplication rules. 
Let $T_1, T_2\in \mathcal B(X, Y)$ and $\alpha \in \mathbb K$, for any $x\in X$ then 
$$
\begin{aligned}
    [T_1 + T_2](x) &:= T_1(x) + T_2(x)\in X
    \\
    \alpha [T_1](x) &:= \alpha T_1(x).
\end{aligned}
$$

It's left as an exercise for the reader to verify the 7 axioms of vector spaces using the above definition of airthematic operation. 
However, we also assumed that the linear mapping is bounded and hence a norm on the linear mapping exists. 
Therefore it's also a Banach space. 
The norm for an operator is defined in the pre-requisite. 
Let $\mathbb K$ denotes sets for type of scalars: $\mathbb K \in \{\mathbb R, \mathbb C\}$, either reals or complex. 


### **Def-1 | Dual Spaces**

> Let $T\in \mathcal B(X, Y)$ be a bounded linear mapping. $T$ is in a vector space and it has the operator norm. The vector space with the norm is the dual space. 

**Observations**

The zero operator $\mathbb O$ is the linear mapping that maps everything to the element $\mathbf 0\in Y$. 


**References**: 

Chapter 2 of the Kryzig's textbook for introductory functional analysis. 

---
### **Vectorizing Linear Functionals**

We let $f\in \mathbb (X, \mathbb K)$ a bounded linear functional. Let $\{e_i\}_{i\in \mathcal I}$ be a set of basis vector of the space $X$, and $\mathcal I$ is just an index set for the basis, and this set is indexed by using $\mathcal I(n)$. $\mathcal I$ can be countable finite, or, finite. We consider: 

$$
\begin{aligned}
    x &= \sum_{i \in \mathcal I}^{} x_i e_i
    \\
    f(x) &= f\left(\sum_{i \in \mathcal I}^{} x_i e_i\right)
    \\
    f(x) &= \sum_{ i \in \mathcal I}^{} x_i f(e_i), 
\end{aligned}
$$

which is hinting that, it seems to be enough to only have $(f(e_1), f(e_2), \cdots)$ to represent any linear functionals $f$. And that gives us a vector representations. To further our investigation, we consider formulating the following linear transformation applied onto the linear functional: $f(x)$: 

$$
\begin{aligned}
    T f:= (f(e_{\mathcal I(1)}), f(e_{\mathcal I(2)}), \cdots )
\end{aligned}
$$

### **Claim-1 | $T$ is Bijective**
> The mapping $T: \mathcal (X, \mathbb K) \mapsto X'$ is a bijective mapping. We denote $X'$ to be the norm of the dual space. 

To be bijective, it has to be surjective(onto) and injective(one-2-one). For a linear operator, it's injective if and only if $\text{null}(T) = \{\mathbf 0\}$. We wish to show that $Tf = \mathbf 0 \iff f = \mathbb O$. 
- the $\implies$ direction is obvious. 
- For $\impliedby$ suppose that $Tf = \mathbf 0$, we have $f(e_{i}) = 0$ for all $i \in \mathcal I$, then, that would mean every $x\in X$ will have $f(x) = \mathbf 0$, $\{e_i\}_{i\in \mathcal I}$ is a basis. Therefore, $f = \mathbb O$. The mapping $T$ is injective. 

Next, we show that $T$ is surjective. Let $(y_{\mathcal I(1)}, y_{\mathcal I(2)}, \cdots )y\in X'$ be a number in the dual space, then we may define $f(e_{\mathcal I(i)}) = y_i$, which will uniquely define the linear functional $f \in \mathcal (X, \mathbb R)$. Therefore, the mapping $T$ is a bijective mapping. 

#### **The Norm of the Dual Space**

> Let $\Vert \cdot\Vert_{\star}$ denote the dual space, the normed vector spaces for all the linear functionals in $\mathcal B(X, \mathbb K)$, then the norm is defined to be $\Vert Tf\Vert = \Vert f\Vert_\star$. 
>

#### **The Dual Space**
> $X'$ is a dual space and it's the normed space for all the bounded linear functionals in $\mathcal B(X, \mathbb K)$. The norm is the operator norm for the linear functionals. Sometimes it's also denoted using $X^\star$. 

---
### **Important Theorems**

We develop some theorems first. We put it here and cite it but we will not prove it. 


#### **Thm-1 | Completeness of the Dual Space (2.10-2)**

> If $Y$ is a Banach space, then $\mathcal B(X, Y)$ is a Banach space. 

**Proof**: 

Skipped 

#### **Thm-2 | Dual Space is Complete (2.10-3)**
> The dual space $X'$ of $X$ is complete, hence a Banach space, regardless of whether the norm space $X$ is complete or not. 

**Proof** Skipped. 

**Remarks**
In brief, the set of all bounded linear operator is a closed set. 

---
### **Illustrative Examples**

The concept of a dual space is more illusive. We illustrate it with some examples. 

#### **Example-1 | Euclidean with 2-Norm**
> The space $(\mathcal R^n, \Vert \cdot \Vert)$ where the norm is the 2-Norm, is a self dual. Meaning that all linear functionals in the space of $\mathbb R^n$ can be represented as a vector in $\mathbb R^n$ that the norm of the operator equals to the norm of the linear functionals. 

**Demonstrations**

Let $\{e_i\}_{i = 1}^n$ be a basis for $\mathbb R^n$, then any functional $f\in \mathcal B(X, \mathbb R)$ admits representation: 

$$
\begin{aligned}
    f(x) = \sum_{ i =1}^{n} x_i f(e_i) \quad \forall x \in (x_1, \cdots, x_n) \in \mathbb R^n
\end{aligned}
$$

Recall that $Tf = (f(e_1), f(e_2), \cdots, f(e_n))$ is a vector. We invoke the definition of the operator norm for a linear functionals: 

$$
\begin{aligned}
    & |f(x)| \le \sum_{i=1}^{n} |x_if(e_i)|  = |\langle x, Tf\rangle| \le \Vert x\Vert \Vert Tf\Vert \quad \forall x \in \mathbb R^n \;  \text{ by Cauchy}
    \\
    \implies 
    & \frac{|f(x)| }{\Vert x\Vert} \le \Vert Tf\Vert
    \\
    \text{let } & x_0 = (f(e_1), f(e_2), \cdots, f(e_n)), \text{ so that }\Vert x_0\Vert = \Vert Tf\Vert
    \\
    \implies & |f(x_0)| = \Vert x_0\Vert \Vert T f\Vert
    \\
    \implies & \frac{|f(x_0)|}{\Vert x_0\Vert} = \Vert Tf\Vert, 
\end{aligned}
$$

therefore, the equality is achieved and the operator norm of any $f\in \mathcal B(\mathbb R^n, \mathbb R)$ is the same as the Euclidean norm of $Tf$. The norm didn't change for $Tf$ therefore, the space is a self dual space. 


#### **Example-2 | Inf-Norm, One-Norm Finite Dimensional Space**
> The spaces $(\mathbb R^n, \Vert \cdot\Vert_\infty)$ is dual to $(\mathbb R^n, \Vert \cdot\Vert_1)$. 

**Demonstrations**

We find an upper bound and then push it to the upper bound using a specific vector. 
We verify the results. 
Consider any linear functional, and the special mapping $T$ as defined from before. Consider any $x \in \mathbb R^n$: 

$$
\begin{aligned}
    |f(x)| &= \left|
        \sum_{ i =1}^{n} x_i f(e_i) 
    \right| \le \sum_{ i = 1}^{n} |x_i| |f(e_i)| 
    \\
    & \le \sum_{i = 1}^{n} \Vert x\Vert_\infty |f(e_i)| 
    \\
    &\le \Vert x\Vert_\infty \Vert Tf\Vert_1.
\end{aligned}
$$

This would mean that, the norm of the operator $f$, will be bounded by $\Vert Tf\Vert_1$, the one norm on the vector representation of operator $f$. 
Next we consider a special $x_0$: 

$$
\begin{aligned}
    x_0 &= \text{sign}(Tf) = (\text{sign}(f(e_1)), \text{sign}(f(e_2)), \cdots, \text{sign}(f(e_n)))
    \\
    & \Vert x_0 \Vert = 1 \text{ when } f\neq \mathbb O
    \\
    \implies |f(x_0)| 
    &= \left|
        \sum_{i = 1}^{n} \text{sign}(f(e_i))f(e_i)
    \right|
    \\
    &= \sum_{i = 1}^{n} |f(e_i)| = \Vert Tf\Vert_1, 
\end{aligned}
$$

therefore, equality can be achieved by using $x_0$, and therefore, the norm that is dual to $\Vert \cdot\Vert_\infty$ is $\Vert \cdot\Vert_1$. 
On the last line, we make us of the fact that $\text{sign}(x)x = |x|$. 

#### **Example-3 | Infinity Norm and 1 Norm Sequence Space**
> The spaces $l^\infty$ and $l^1$ are dual spaces to each other. 

#### **Example-4 | The lp Sequence Space**
> Let $p, q$ be conjugate dual to each other, with $p \ge 0$, so that $p^{-1} + q^{-1} = 1$, then the space $l^p$ and $l^q$ are dual spaces to each other. 

---
### **Reflexive Spaces and Double Dual Spaces**
Something important that is not necessarily clear, in Wang's notes, or Kryzig's book. 

#### **Def-2 | The Elements of Double Dual**
> Let $(V, \Vert \cdot\Vert)$ be a normed metric space, then the double dual mapping is defined to be $T_v: V^\star \mapsto \mathbb K$, with $T_v(v^\star) = v(v^\star)$. 

**Observations**

It's somewhat trivial to observe the fact that the mapping is a bounded linear mapping, and by the fact that it's taking from the space $V^\star$, this is an elemen of $V^{\star\star}$. 



#### **Def-3 | Isometry for Normed Metric Space**

> Let $V, W$ be normed spaces with $\Vert \cdot\Vert_W, \Vert \cdot\Vert_V$ be normed spaces, then $T\in \mathcal B(V, W)$ is isometric when for all $v\in V: \Vert Tv\Vert_W = \Vert v\Vert_V$. The distance between $V, W$, seems to be exchangable when linear functional $T$ is used.

#### **Thm-54 | Isometry on Double Dual Spaces**

> Let $T_v:V^\star \mapsto \mathbb K$ be defined the same way as an element of the double dual. Then $T: V\mapsto V^{\star \star}$ sending $v$ to $T_v$, is an isometric for $V^\star, V^{\star\star}$

**Proof**

skipped for now. 
**

**References**

MIT OCW, functional analysis, Theorem 54, example 51. 


---
### **Rietz Representation Theorem**

In the Hilbert space, results of a dual space are strengthened. 

[[Bilinear Form, Rietz Representations]]