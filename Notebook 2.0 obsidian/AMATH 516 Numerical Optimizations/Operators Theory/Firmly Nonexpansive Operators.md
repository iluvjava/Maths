[Introduction to Operators for Optimizations](Introduction%20to%20Operators%20for%20Optimizations.md), 

---
### **Non-Expansive Operators**
Non-expansive is a subset of operator that has a Lipschitz constant of one. 
There are a lot of generalizations for this character for operators. 
Here we starts with the slightly stronger characterization of all Lipschitz-1 Operator. 

#### **Def | nonexpansive operators**

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
### **Convex Fixed Point Set**

Nonexpansive operator has a fixed point set that is convex. 

#### **Def | Fixed Point Set**
> When $f$ is non-expansive and domain of $F$ is $\mathbb R$, then the set of fixed point of the operator is: 
> 
> $$
> \text{fix}(F) = 
> \begin{aligned}
>    \left\lbrace
>        x\in \text{dom}(F)| x = F(x)
>    \right\rbrace = 
>    (I - F)^{-1}(0), 
> \end{aligned}
> $$

#### **Thm | The set of fixed point for an non-expansive operator is a closed and convex set**

> Assuming that $F$ is non-expansive, then the fixed point of the operator has to be a convex set. In the case when $F$ is a contraction, the set of fixed point will have to be a singleton. 

**Proof**: 

When the fixed point set is empty, it's convex. 
Otherwise we suppose that $x, y \in \text{fix}(F)$ in the fixed point set of the operator $T$, with $\theta \in [0, 1]$, and then we will show that $z = \theta x + (1 - \theta)y$ will again have to be a fixed point of the operator as well, additionally it has to on the line segment for all valid $\theta$, this is true because: 

$$
\begin{aligned}
    & \Vert Fz - x\Vert_2 = (1 - \theta)\Vert y - x\Vert_2
    \\
    & \Vert Fz - y\Vert_2 = \theta \Vert y - x\Vert_2
    \\
    \implies &
    \Vert x - y\Vert_2 = \Vert x - Fz + Fz - y\Vert_2 \le 
    \Vert Fz - x\Vert_2 + \Vert Fz - y\Vert_2 = \Vert x - y\Vert_2, 
\end{aligned}
$$

and the last line suggest that the point $Fz$ must lies on the line segment $[0, 1]$ because the equality of the triangle inequality is satisfied from the last expression, for all value of $\theta\in [0, 1]$, implying the fact that the set $X$ has to be a convex set. 

**References**: 

[Primer on Monotone Operators](../../MATH%20999%20Paper%20Reviews%20and%20Frontier%20Mathematics/References%20Sep%202022/Primer%20on%20Monotone%20Operators.pdf), The Primer on Monotone Operator Paper. 


---
### **Characterization of Firmly Nonexpansiveness**

A set of expressions are equivalent for all firmly nonexpansive operators. 

#### **Thm | Equivalences of Nonexpansiveness**

> Let $T: D\mapsto X$, where $D\subseteq X$, the the following are equivalent: 
> 1. $T$ is firmly nonexpansive. 
> 2. $I - T$ is firmly nonexpansive (direct from the symmetry of the definition)
> 3. $\textcolor{red}{\forall x, y\in D}: \Vert Tx - Ty\Vert^2 \le \langle x-y, Tx - Ty\rangle$ a slightly stronger type of Monotonicity for Nonexpansive operators. (An Important Characteristics for Sure). The norm is any norm. 
> 4. $2T - I$ is nonexpansive. 

**Observations**:

(1) if and only if (2) by a direct observations that the definition of a firmly nonexpansive operators has symmetry for $I - T$, $T$. Before the proof we abbreviate things using $a: x-y, b = Tx - Ty$. 

**Proof: $(1)\iff (3)$** 

Starting with an identity for 2 norm, we have: 

$$
\begin{aligned}
    \Vert a\Vert^2 - (\Vert b\Vert^2 + \Vert a - b\Vert^2) = 2(\langle a, b\rangle - \Vert b\Vert^2), 
\end{aligned}
$$

using it we have: 
$$
\begin{aligned}
    (1) &\iff 
    \Vert b\Vert^2 + \Vert a - b\Vert^2 \le \Vert a\Vert^2 
    \\
    &\iff 
    0 \le \Vert a\Vert^2 - (\Vert b\Vert^2 + \Vert a - b\Vert^2)
    \\
    &\iff 
    0 \le 2(\langle a, b\rangle - \Vert b\Vert^2)
    \\
    & \iff 
    \Vert b\Vert^2 \le \langle a, b\rangle \iff (3). 
\end{aligned}
$$

**Proof $(3)\iff (4)$**

We directly make use of the identity that: 

$$
\begin{aligned}
    \Vert a\Vert^2 - \Vert 2b - a\Vert^2 &= 4(\langle a, b\rangle - \Vert b\Vert^2),
\end{aligned}
$$

from the definition of nonexpansiveness, we have $\Vert 2b - a\Vert \le \Vert a\Vert$, iff $0 \le \Vert a\Vert^2 - \Vert 2b - a\Vert^2$ iff $0 \le 4(\langle a, b\rangle - \Vert b\Vert^2) \iff \Vert b\Vert^2 \le \langle a, b\rangle$, and now the arguments are complete. We have $(3)\iff (4)$. 

**References**: 

Theorem 22.3, Professor Heinz's Lecture notes

---
### **Fixed Point Convergence of Firmly Nonexpansive operators**

The convergence of fixed point would require the use of [Fejer's Monotone](Fejer's%20Monotone.md) convergence type and the assumption of finite Euclidean spaces. 

#### **Thm | A Fixed Point Iteration on Nonexpansive Operator Converges Weakly**

> Let $T: \mathcal H \mapsto \mathcal H$ be a nonexpansive operator, then the fixed point iteration on the operator would converges to a point in the $\text{Fix} T$, a fixed point set of the operator. 

**Proof**

Let $y = \bar x \in \text{Fix} T$, and let $x = x^{(k)}$ be from the fixed point iteration sequence then the firmly nonexpansive operator definition becomes: 

$$
\begin{aligned}
    \Vert Tx^{(k)} - \bar x\Vert^2 + \Vert x^{(k)} - x^{(k + 1)} - \bar x + \bar x\Vert 
    & \le \Vert x^{(k)} - \bar x\Vert^2
    \\
    \implies 
    \Vert x^{(k +1)} - \bar x\Vert^2 + \Vert x^{(k)} - x^{(k + 1)}\Vert^2
    &\le \Vert x^{(k)} - \bar x\Vert^2 \leftarrow [[0]]
\end{aligned}
$$

As a consequence of \[\[0\]\], we have the fact that the iteration $x^{(k)}$ is monotonically decreasing wrt to the set $\text{Fix}(T)$, giving us the claim $\Vert x^{(k + 1)} - \bar x\Vert \le \Vert x^{(k)} - \bar x\Vert$, by removing the second term on the LHS of the inequality. 
By monotonicity and Bozano Weierstrass, we have the limit $\lim_{k\rightarrow \infty} \Vert x^{(\sigma(k))} - \bar x\Vert = L$. 
Next we show that the limit of the sequence converges to a fixed point set of the operator $T$. 

$$
\begin{aligned}
    {[[0]]} \implies 
    \Vert x^{(k)} - x^{(k + 1)}\Vert^2 &\le 
    \Vert x^{(k)} - \bar x\Vert^2 - 
    \Vert x^{(k + 1)} - \bar x\Vert^2
    \\
    \implies 
    \sum_{i = 0}^{\infty}
    \Vert x^{(i)} - x^{(i + 1)}\Vert^2 &\le 
    \Vert x^{(0)} - \bar x\Vert^2 - \underbrace{\lim_{k \rightarrow \infty}\Vert x^{(k)} - \bar x\Vert^2}_{ < \Vert x^{(0)} - \bar x\Vert}
    \\
    \implies \sum_{i = 0}^{\infty}
    \Vert x^{(i)} - x^{(i + 1)}\Vert^2 & \text{ has a limit}
    \\
    \implies \lim_{k\rightarrow \infty} \Vert x^{(i)} - x^{(i + 1)}\Vert^2 &= 0, 
\end{aligned}
$$

Such a limit would imply the strong convergence of the sequence $x^{(i)} - x^{(i + 1)}$, or $x^{(i)} - Tx^{(i)}$. Therefore we have 

$$
\begin{aligned}
    \lim_{i\rightarrow \infty} x^{(i)} - Tx^{(i)} &= \mathbf 0
    \\
    \implies 
    \lim_{i\rightarrow \infty} x^{(i)} &= 
    \lim_{i\rightarrow \infty} Tx^{(i)}
    \\
    T\text{ is continuous}\implies 
    \lim_{i\rightarrow \infty} x^{(i)} &= 
    T\left (\lim_{i\rightarrow \infty} x^{(i)}\right), 
\end{aligned}
$$

Next, from the subsequential convergence of $x^{(\sigma(i))}$, there exists a cluster point $x^+$ for the sequence, and by Fejer Monotonicity, the subsequential limit equals to the limit above and therefore $\lim_{i\rightarrow\infty} x^{(\sigma(i))} = x^+ =Tx^+$. 
Therefore, $x^+$ is also a fixed point for the operator $T$. 


**Remarks**

The firmly nonexpansive operator is a special case for the averaged operator. See [Averaged Mapping](Averaged%20Mapping.md) for a proof of the same behaviors for the averaged operators. Additionally, read theorem 5.13 for a proof in the weak convergence results for firmly non-expansive operators in Hilbert space. It hinges on the fact that a closed and bounded sets in Hilbert space is sequentially compact. 



---
### **Properties of Nonexpansive Operators**

Some properties of these operators are stated. 

#### **Thm | Composition of Firmly Nonexpansive operator is still Firmly Nonexpansive**
> Let $T_1, T_2$ be firmly nonexpansive operator, then $T_2\circ T_1$, denoted as $T_2T_1$, then $T_2T_1$ is nonexpansive, and we have 
> $$
> \begin{aligned}
>     \frac{1}{2}\Vert (I - T_2T_1)x - (I - T_2T_1y)\Vert^2 
>     &\le 
>     \Vert x - y\Vert^2 - \Vert T_2T_1x - T_2T_1y\Vert^2, 
> \end{aligned}
> $$

**Proof**

With this we make $a = x -y, b - T_1x - T_1y$, and $c = T_2T_1x - T_2T_1y$. 
$T_1$ is fimrly nonexpansive therefore 

$$
\begin{aligned}
    \Vert T_1x - T_1 y\Vert^2 + 
    \Vert (I - T_1)x + (I - T_1)y\Vert^2 
    &\le 
    \Vert x - y\Vert^2, 
\end{aligned}
$$

$T_2$ is fimrly nonexpansive, let the firmly nonexpansive definition be defined on $T_1x, T_2y$ then it yields: 

$$
\begin{aligned}
    \Vert T_2T_1x - T_2 T_1y\Vert^2 
    &\le 
    \Vert T_1x - T_1y\Vert^2 -
    \Vert (I - T_2)T_1x + (I - T_2)T_1y\Vert^2 
    \\
    &\le 
    \Vert x - y\Vert^2 - 
    \Vert (I - T_1)x + (I - T_2)y\Vert^2 
    - 
    \Vert (I - T_2)T_1x + (I - T_2)T_1x\Vert^2, 
\end{aligned}
$$

which we just replaced the term $\Vert T_1x - T_1 y\Vert$ from the part before the above. 
Then the above can be summarized in form 

$$
\begin{aligned}
    \Vert c\Vert^2 &\le \Vert a\Vert^2 - \Vert a - b\Vert^2 - \Vert b - c\Vert^2
    \\
    \Vert a - b\Vert^2 + \Vert b - c\Vert^2 & < \Vert a\Vert^2 - \Vert c\Vert^2, 
\end{aligned}
$$

Now recalled the parallelogram rule, we can use it on the above and get 

$$
\begin{aligned}
    2 \Vert a - b\Vert^2 + 2 \Vert b - c\Vert^2 &= 
    \Vert a - b + b - c\Vert^2 + \Vert a - b - b + c\Vert^2
    \\
    &= \Vert a - c\Vert^2 + \Vert a + c - 2b\Vert^2
    \\
    &\ge \Vert a - c\Vert^2, 
    \\
    \implies 
    \Vert a - c\Vert^2 &\le \Vert a\Vert^2 - \Vert c\Vert^2, 
\end{aligned}
$$

and therefore the composition $T_2T_1$ is a nonexpansive operator. 

**References**: Heinz's class, proposition 22.8. 

**Remarks**

See [Hilbert Space Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Hilbert%20Space%20Introduction.md) for more information about the parallelogram law. 

---
### **Nonexpansiveness Examples**

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

Starting directly from the nonexpansiveness of the matrix, we let $x - y = v$ for simplicity then:

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

This completes the proof, and we showed that the matrix $A + A^T - 2A^TA$ is positive definite if and only if the matrix $A$ is firmly nonexpansive. Take note that a Skew Hermitian matrix satisfy the above condition. 

**Remarks**

Results can be strengthen a bit when $A$ is a symmetric matrix, and for application that would imply having a Hessian matrix. 

#### **Example | Projection Operators is Firmly Nonexpansive**: 

The projection operator for a convex set is a firmly nonexpansive operator. We denote $P$ to be the projection onto some convex set, $C$, recall [Convex Sets Projection Obtuse Angle Theorem](../CVX%20Geometry/Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md), the projection point can be characterized as: 

$$
\begin{aligned}
    & \forall x \in X, z\in C: 
    \langle z - Px, x - Px\rangle \le 0
    \\
    & \forall x, y\in X: Px \in C \wedge Py \in C
    \\
    \implies & \forall x, y \in X: 
    \begin{cases}
        \langle Py - Px, x - Px\rangle \le 0
        \\
        \langle Px - Py, y - Py\rangle \le 0
    \end{cases}
    \\
    \implies &
    \forall x, y \in X:  \langle Py - Px, x - Px -(y - Py)\rangle\le 0
    \\
    \iff&
    \forall x,y\in X: 
    \langle Py - Px, Py - Px + x - y\rangle \le 0
    \\
    \iff & 
    \forall x,y\in X: 
    \langle Py - Px, x - y\rangle + \Vert Py - Px\Vert^2 \le 0
    \\
    \iff & 
    \forall x, y\in X: 
    \langle Py - Px, y - x\rangle \ge \Vert Py - Px\Vert^2, 
\end{aligned}
$$

which is the third equivalence characterizations of a firmly nonexpansive operator. Therefore, a convex projection operator is a firmly nonexpansive operator. 

**Remark**: 

If an operator $T$ is idempotent, meaning that $T\circ Tx = x$, and it's also Firmly nonexpansive, then it has to be a projector onto a convex set. The converse of the statement is also true. 

#### **Example | Proximal Mapping is Firmly Nonexpansive**

Due to it requires too many facts about this operator, visit [Moreau Envelope and Proximal Mapping](../Proximal%20Operator/Moreau%20Envelope%20and%20Proximal%20Mapping.md) for a coverage of this example. Recall from [Subgradient Central Hub](../Non-Smooth%20Calculus/Subgradient%20Central%20Hub.md) that the subgradient operator is a monotone operator. Now we make the claim: 

> let $f$ be convex, proper, and lower semi-continuous, we have the proximal operator of $f$, denoted as $P_f, I - P_f$ being firmly non-expansive operators. 

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


#### **Example | Convex Lipschitz Gradient**

The convex function having a global Lipschitz gradient has its gradient operator as a firmly-non-expansive operator. See [L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](../Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) for more information, a lot of things a involved for this particular type of characterizations. 

