- [Operators for Optimizations CENTRAL HUB](Operators%20for%20Optimizations%20CENTRAL%20HUB.md), 
- [Lipschitz Operator in Euclidean Space](Lipschitz%20Operator%20in%20Euclidean%20Space.md)

---
### **Non-Expansive Operators**
Firmly Non-expansive is a subset of operator that has a Lipschitz constant of one. 
All properties of the non-expansive operators are applicable to the class of firmly non-expansive operators. 
There are many subcategories of firmly non-expansive operator and we will only discuss the properties of the class of the firmly non-expansive operator. 



#### **Def | Sub Categories of Nonexpansive Operators**

> Let $D$ be a subset of $\mathbb E$, then let $T: D \mapsto \mathcal H$, then $T$ is: 
> 1. f is *firmly non-expansive* if $\forall x, y\in D$, we have 
>     $$
>     \Vert Tx - Ty\Vert^2 + \Vert (I - T)x- (I - T)y\Vert^2 \le \Vert x - y\Vert^2
>     $$
> 2. f is *non-expansive* if it is Lipschitz continuous with parameter $L = 1$. 
> 3. f is *quasi-non-expansive* if 
>     $$
>     \forall x \in D, y \in \text{Fix}(T) \; \Vert Tx - y\Vert \le \Vert x - y\Vert
>     $$
> 4. And f is *strict-quasi-non-expansive* when: 
>     $$
>     \forall x \in D \setminus \text{Fix}(D), y\in \text{Fix}(T)\; 
>     \Vert Tx - y\Vert < \Vert x - y\Vert
>     $$

Immediately observe that (i) => (ii) => (iii), (i) => (iv). 


**References**: 

Chapter 4 of the Mono Operator book from Heinz. 


---
### **Characterization of Firmly Nonexpansiveness**

A set of expressions are equivalent for all firmly nonexpansive operators. 
The following reveals that there are some tight links between firmly nonexpansive operators and nonexpansive operator. 

#### **Theorem | Equivalences of Nonexpansiveness**

> Let $T: D\mapsto X$, where $D\subseteq X$, then the following are equivalent: 
> 1. $T$ is firmly nonexpansive. 
> 2. $I - T$ is firmly nonexpansive (direct from the symmetry of the definition)
> 3. $\textcolor{red}{\forall x, y\in D}$, it has 
> $$ 
> \begin{aligned}
>    \Vert Tx - Ty\Vert^2 &\le \langle x-y, Tx - Ty\rangle
>     \\
>     &= 1/2(\Vert Tx - y\Vert^2 + \Vert Ty - x\Vert^2 - \Vert Tx - x\Vert^2 - \Vert Ty - y\Vert^2). 
> \end{aligned}    
> $$ 
> 4. $2T - I$ is nonexpansive. This operator is also known as the reflector of $T$, then $T$ is firmly non-expansive. 

**Observations**:

$(1) \iff (2)$ because the definition of firmly nonexpansive operators is the same for $I - T$, $T$. 
Before the proof we abbreviate things using $z: x - y, z' = Tx - Ty$. 
(3) is a slightly stronger type of Monotonicity of Nonexpansive operators.

**Proof: $(1)\iff (3)$** 

Starting with an identity for 2-norm, we have: 

using it we have: 
$$
\begin{aligned}
    \iff 
    0 &\le \Vert z\Vert^2 - (\Vert z'\Vert^2 + \Vert z - z'\Vert^2)
    \\
    &= \Vert z\Vert^2 - (2\Vert z'\Vert^2 + \Vert z\Vert^2 - 2\langle z, z'\rangle)
    \\
    & = 2\langle z, z'\rangle - 2\Vert z'\Vert^2
    \iff (3). 
\end{aligned}
$$

**Proof $(3)\iff (4)$**

It has: 

$$
\begin{aligned}
    (3)\iff 
    0 &\le 4(\langle z, z'\rangle - \Vert z'\Vert^2)
    \\
    &= 2\langle z, 2z'\rangle - \Vert 2z'\Vert^2
    \\
    &= 2\langle z, 2z'\rangle - \Vert 2z'\Vert^2 - \Vert z\Vert^2 + \Vert z\Vert^2
    \\
    &= - \Vert 2z' - z\Vert^2 + \Vert z\Vert^2 
    \iff (4). 
\end{aligned}
$$



**References**: 

Theorem 22.3, Professor Heinz's Lecture notes

---
### **Fixed Point Convergence of Firmly Nonexpansive operators**

The convergence of fixed point would require the use of [Fejer's Monotone](Fejer's%20Monotone.md) convergence type and the assumption of finite Euclidean spaces.

#### **Thm | A Fixed Point Iteration on a Firmly Nonexpansive Operator converges weakly**

> Let $T: \mathcal H \mapsto \mathcal H$ be a firmly nonexpansive operator, then the fixed point iteration converges to a point in the $\text{Fix} T$, a fixed point set of the operator. 

**Proof**

The proof consists of the following intermediate steps. 
Suppose that $\bar x \in \text{Fix}\;T$. 

- **Step I**: The sequence $x_k$ has a subsequential limit $x^+$, and $\Vert x_k - \bar x\Vert \rightarrow L \le \Vert x - x_0\Vert$. 
- **Step II**: It can also be showed that $\Vert x_{k + 1} - x_k\Vert \rightarrow 0$. Becaus of subsequential convergence $x^+ \in \text{Fix}\; T$ hence $x_k \rightarrow x^+ \in \text{Fix}\; T$. 

**(Step I)**. In the definition of Firmly Nonexpansive operator, set $y = \bar x \in \text{Fix} T$, and let $x = x^{(k)}$: 

$$
\begin{aligned}
    0 &\le 
    \Vert x_{k} - \bar x\Vert^2 -
    \Vert Tx_{k} - \bar x\Vert^2 - 
    \Vert x_{k} - x_{k + 1} - \bar x + \bar x\Vert 
    \\
    &= \Vert x_{k} - \bar x\Vert^2 
    -
    \Vert x_{k + 1} - \bar x\Vert^2 - \Vert x_{k} - x_{k + 1}\Vert^2
    \\
    &\le 
    \Vert x_{k} - \bar x\Vert^2 
    -
    \Vert x_{k + 1} - \bar x\Vert^2. 
\end{aligned}
$$
Therefore, the sequence $\Vert x_k - \bar x\Vert$ is monotone decreasing and bounded above by $\Vert x_0 - \bar x\Vert$ hence $\Vert x_k - \bar x\Vert$ admits a limit $L$ and has a subsequential limit $x^+$. 

**(Step II)**. Performing a telescoping sum it has: 

$$
\begin{aligned}
    0 &\le 
    \Vert x_{0} - \bar x\Vert^2 - \lim_{k \rightarrow \infty}\Vert x_k - \bar x\Vert^2
    - \sum_{i = 0}^{\infty}
    \Vert x_i - x_{i + 1}\Vert^2 
    \\
    &=
    \Vert x_{0} - \bar x\Vert^2 - L
    - \sum_{i = 0}^{\infty}
    \Vert x_i - x_{i + 1}\Vert^2. 
\end{aligned}
$$

The above implies bounded squared sum, hence $\Vert x_{k + 1} - x_k\Vert \rightarrow 0$. 
It means the strong convergence of the sequence $Tx_{i + 1} - x_i \rightarrow \mathbf 0$ . 

$$
\begin{aligned}
    \lim_{i\rightarrow \infty} x^{(i)} - Tx^{(i)} &= \mathbf 0
    \\
    \iff
    \lim_{i\rightarrow \infty} x^{(i)} &= 
    \lim_{i\rightarrow \infty} Tx^{(i)}
    \\
    \implies 
    \lim_{i\rightarrow \infty} x^{(i)} &= 
    T\left (\lim_{i\rightarrow \infty} x^{(i)}\right). & T\text{ is continuous}
\end{aligned}
$$

Therefore, the subsequential limit $x^+$ exists and it's in $\text{Fix}\; T$. 
By property of Fejer Monotone convergence, the limit is the subsequential limit $x^+$ and it's a fixed point of $T$. 




**Remarks**

The firmly nonexpansive operator is a special case for the averaged operator. See [Averaged Mapping](Averaged%20Mapping.md) for a proof of the same behaviors for the averaged operators. 
Additionally, read theorem 5.13 for a proof in the weak convergence results for firmly non-expansive operators in Hilbert space. 
It hinges on the fact that a closed and bounded sets in Hilbert space is sequentially compact. 



---
### **Properties of Nonexpansive Operators**

Some properties of these operators are stated. 

#### **Thm | Composition of Firmly Nonexpansive Operators is 2/3 averaged**
> Let $T_1, T_2$ be firmly nonexpansive operator, then $T_2\circ T_1$, denoted as $T_2T_1$, then $T_2T_1$ has for all $x, y \in \mathcal H$: 
> $$
> \begin{aligned}
>     0 &\le 
>     \Vert x - y\Vert^2 - \Vert T_2T_1x - T_2T_1y\Vert^2 - \frac{1}{2}\Vert (I - T_2T_1)x - (I - T_2T_1y)\Vert^2.
> \end{aligned}
> $$

**Proof**

Let $(x, x') \in \text{gph}\; T_1, (y, y') \in \text{gph}\; T_1$. 
Then there exists $x'', y''$ such that $(x', x'') \in \text{gph}(T_2T_2)$ and $(y', y'')\in \text{gph}\; (T_2T_1)$. 
For cleaner proof, define: 
$$
\begin{aligned}
    z = x - y, z' = x' - y', z'' - x'' - y''. 
\end{aligned}
$$

Because $T_1$ is firmly non expansive, it has from the definition: 

$$
\begin{aligned}
    0 &\le \Vert x - y\Vert^2 - \Vert T_1x - T_1 y\Vert^2 - \Vert x - T_1x - (y - T_1y)\Vert^2
    \\
    &= \Vert x - y\Vert^2 - \Vert x' - y'\Vert^2 - \Vert x - y - (x' - y')\Vert^2
    \\
    &= \Vert z\Vert^2 - \Vert z'\Vert^2 - \Vert z - z'\Vert^2. 
\end{aligned}
$$

From the definition that $T_2$ is a firmly nonexpansive operator it has 


$$
\begin{aligned}
    0 &\le 
    \Vert x' - y'\Vert^2 
    - \Vert T_2x' - T_2 y'\Vert^2
    - \Vert x' - T_2x' - (y' - T_2y')\Vert^2
    \\
    &= \Vert x' - y'\Vert^2 
    - \Vert x'' - y''\Vert^2
    - \Vert x' - y' - (x'' - y'')\Vert^2
    \\
    &= (\Vert z'\Vert^2) - \Vert z''\Vert^2 - \Vert z' - z''\Vert^2
    \\
    &\le (\Vert z\Vert^2 - \Vert z - z'\Vert^2) - \Vert z''\Vert^2 - \Vert z' - z''\Vert^2 
    \quad T_1 \text{ Firmly Nonexpansive}
    \\
    &= \Vert z\Vert^2 - (\Vert z - z'\Vert^2 + \Vert z' - z''\Vert^2) -\Vert z''\Vert^2
    \\
    &= \Vert z\Vert^2 - (1/2)(\Vert z -z' - z' + z''\Vert^2 + \Vert z -z' + z' - z''\Vert^2) 
    - \Vert z''\Vert^2
    \\
    &= \Vert z\Vert^2 - (1/2)(\Vert z - 2z' + z''\Vert^2 + \Vert z - z''\Vert^2) 
    - \Vert z''\Vert^2
    \\
    &\le \Vert z\Vert^2 - \Vert z''\Vert^2 - (1/2)\Vert z - z''\Vert^2. 
\end{aligned}
$$

$\blacksquare$


**References**: Heinz's class, proposition 22.8. 

**Remarks**

See [Averaged Mapping](Averaged%20Mapping.md) for more about the class of averaged operators. 

---
### **Examples**

We use matrices to characterize these properties for some examples. 

#### **Example | Nonexpansive Matrices**

The nonexpansiveness is for self mapping $D\mapsto X$  where $D\subseteq X$, therefore a matrix that is nonexpansive will have to be a square matrix first. 

$$
\begin{aligned}
    \Vert Ax - Ay\Vert &\le \Vert x - y\Vert
    \\
    \Vert A(x - y )\Vert^2 &\le \Vert x - y\Vert^2
    \\
    \frac{\Vert A(x - y)\Vert^2}{\Vert x - y\Vert^2} & \le 1
    \\
    \implies \lambda_i(A^TA) &\le 1 \implies |\lambda_i(A)| \le 1 \; \forall i, 
\end{aligned}
$$

Therefore, a matrix is nonexpansive then its eigenvalues are all bounded in absolute value by $1$, and it would mean that $1 - \lambda_i(A^TA) \ge 0$, hence it will be $\lambda_i(I - A^TA)\ge0$. 
The matrix is definitely already symmetric, therefore, if all of its eigenvalues are positive, it's a symmetric positive definite real matrix.

#### **Example | Firmly Nonexpansive Matrices**

Let $x - y = v$ then the definition of firmly nonexpansive operator has:

$$
\begin{aligned}
    v^TA^TAv + v(I - A)^T(I - A)v &\le v^Tv 
    \\
    \text{where: } (I - A)^T (I - A) &= I - A - A^T + A^TA
    \\
    \iff
    v^T(I - A - A^T + 2A^TA) &\le v^Tv
    \\
    \iff 
    \lambda_{\max}( - A - A^T + 2A^TA) &\le 0 
    \\
    \lambda_{\min}(A + A^T - 2A^TA) &\ge 0. 
\end{aligned}
$$

This completes the proof, and we showed that the matrix $A + A^T - 2A^TA$ is positive definite if and only if the matrix $A$ is firmly nonexpansive. 
Take note that these classes of matrices satisfy the conditions:
1. Skew Hermitian matrix. 
2. Symmetric matrix. 

**Remarks**

Results can be strengthen a bit when $A$ is a symmetric matrix, and for application that would imply having a Hessian matrix. 

#### **Example | Projection Operator is Firmly Nonexpansive**: 

> The projection operator for a convex set $C$ is a firmly nonexpansive operator. 

**Proof**

We denote $P$ to be the projection onto some convex set $C$. 
Consider projection of $x, y \in \R^n$, denoted as $x' = Px, y' = Py$. 
Recall [Convex Sets Projection Obtuse Angle Theorem](../CVX%20Geometry/Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md) the Abtuse angle characterization gives: 

$$
\begin{aligned}
    & 
    \left[ (\forall z_1 \in C):
        \langle z_1 - x', x - x'\rangle \le 0
    \right]
    \wedge
    \left[(\forall z_2 \in C):
        \langle z_2 - y', y - y'\rangle \le 0
    \right]
    \\
    & \implies 
    (\forall z_1 \in C, z_2 \in C): 
    \langle z_1 - x', x - x'\rangle + 
    \langle z_2 - y', y - y'\rangle 
    \le 0.
\end{aligned}
$$

Set $z_1 = y', z_2 = x'$, then:

$$
\begin{aligned}
    0 &\ge \langle y' - x', x - x'\rangle + \langle x' - y', y - y'\rangle 
    \\
    &= \langle y' - x', x - x'\rangle - \langle y' - x', y - y'\rangle 
    \\
    &= \langle y' - x', x - x' -(y - y')\rangle
    \\
    &= \langle y' - x', x - y - (x' - y')\rangle
    \\
    &=  \Vert x' - y'\Vert^2 - \langle x ' - y', x - y\rangle. 
\end{aligned}
$$

The above is equivalent to the definition of $P$ being a firmly nonexpansive operator by the fact that $x, y$ are arbitrarily chosen. 

$\blacksquare$

**Remark**: 

If an operator $T$ is idempotent, meaning that $T\circ Tx = x$, and it's also Firmly nonexpansive, then it has to be a projector onto a convex set. The converse of the statement is also true. 

#### **Example | Proximal Mapping of Convex Subgradient is Firmly Nonexpansive**
> let $f$ be convex, proper, and lower semi-continuous, we have the proximal operator of $f$, denoted as $P_f, I - P_f$ being firmly non-expansive operators. 

**Before Proof**

Due to it requires too many facts about this operator, visit [Moreau Envelope and Convex Proximal Mapping](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md) for a coverage of this example. 
Recall from [Subgradient CENTRAL HUB](Subgradient%20CENTRAL%20HUB.md) that the subgradient operator is a monotone operator. Now we make the claim: 

**Proof**: 

let $x, y\in X$ set $p = P_f(x), q = P_f(x)$, then by equivalence characterizations for the singleton element in $P_f$, we have: 

$$
\begin{aligned}
    & x - p \in \partial f(p), y - q \in \partial f(q)
    \\
    \implies &
    \langle x - p - (y - q), p - q\rangle \ge 0 
    \\
    \implies 
    & \langle x - y, p - q\rangle - \Vert p - q\Vert^2 \ge 0
    \\
    \implies 
    & \langle x - y, p - q\rangle\ge \Vert p - q\Vert^2, 
\end{aligned}
$$

which is the definition for firmly nonexpansive operators. 

**Remarks**: 

This is strictly better that just a Lipschitz-1 operator. 


#### **Example | Convex functions with Lipschitz gradient**

> Let $f: \R^n \rightarrow \R$ be a function with $L$ Lipschitz gradient. 
> Then $L^{-1}\nabla f$ is a Firmly nonexpansive operator. 

See [L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](../Properties%20of%20Functions/Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) for more information, a lot of things a involved for this particular type of characterizations. 