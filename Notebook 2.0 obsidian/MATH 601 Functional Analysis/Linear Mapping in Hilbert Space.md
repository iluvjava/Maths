- [Bilinear Form, Rietz Representations](Bilinear%20Form,%20Rietz%20Representations.md)
- [Hilbert Space Introduction](Functional%20Spaces/Hilbert%20Space%20Introduction.md)
- [Linear Mapping in Banach Space](Linear%20Mapping%20in%20Banach%20Space.md)

---
### **Intro**

The results from Banach space about linear mapping from the Banach space had been strength for the Hilbert Space. We introduce properties of the operators via the definition of a bilinear form and the representation theory. The theories are proved in real spaces, but in complex fields, the Hilbert space shares the similar theories. The theories of adjoin operators a crucial to the idea of [Fredholm Alternative](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Fredholm%20Alternative.md), which underlies the existence of solutions for a linear system. 

**References**: 

We will be taking theorems from Kryzig's textbook, and, Heinz's Monotone Book 1st ed, chapter 2. 

---
### **The Adjoint Operator of a Linear Mapping in a Real Hilbert Space**

The idea of an adjoint operators can be defined via the inner product for Hilbert space. There exists adjoint operators in Banach space, but it's different and would require the use of a dual space. The adjoint operators generalizes transpose of a matrices in finite dimensional Euclidean space perfectly. 

#### **Def | The Hilbert-Adjoint Operators**
> Let $\mathcal H_1, \mathcal H_2$ be Hilbert spaces, and $T:\mathcal H_1 \mapsto \mathcal H_2$ be linear and bounded. The Hilbert adjoint operator denoted using $T^*: \mathcal H_2 \mapsto \mathcal H_1$ is an operator determined by $T$ uniquely such that $\langle Tx, y\rangle = \langle x, T^*y\rangle$ for all $(x, y)\in \mathcal H_1 \times \mathcal H_2$. 

**Observations**

This is a definition, and it also stated the existence and the uniquenss for all such operators, based on the existence of a $T$, linear mapping in Hilbert space which is bounded. 

**Proof**

The operator $T$ induces a bounded by linear form $h(x, y) := \langle y, Tx\rangle$ for all $(x, y)\in \mathcal H_1 \times \mathcal H_2$, and the theorems for bounded bilinear form, we have $\Vert h\Vert = \Vert T\Vert$. $h$ is a bounded bilinear form hence there exists a unique $S$ such that $h(x, y) = \langle Sy, x\rangle$. Then by definition, $S = T^*$, it always exists and it's unique. 


**Remarks**

For finite real/complex matrices, the transpose would be the adjoint operator. However, please take note that, we only proved the Rietz representation theorem, and the inducing the bilinear form with a linear mapping over the ral fields, but, it would still work in the complex fields. 

#### **Corollary-1 | Adjoint has the Same Norm**
> Let $T, T^*$ be the operator and its adjoint, then, $\Vert T^*\Vert = \Vert T\Vert$. 


**Proof**: 
 
this is direct by considering $h(x, y) = \langle x, Ty\rangle = \langle T^*x, y\rangle$, however in real Hilbert space, we have $h(x, y) = \langle x, T^*y\rangle$, this provides us with $\Vert h\Vert = \Vert T\Vert = \Vert T^*\Vert$ from the norm definition of $h$. 


---
### **Properties of the Adjoint**

1. $(S + T)^* = S^* T^*$, direct by the linearity of inner product. 
2. $(\alpha T)^* = \alpha T^*$, direct from (1.). 
3. $T^{**} = T$. Direct by $\langle T^{**}x, y\rangle = \langle x, T^* y\rangle = \langle Tx, y\rangle$. We undo the adjoint by swapping it back and forth. 
4. $\Vert T^*T\Vert = \Vert TT^*\Vert = \Vert T\Vert^2$. We prove this later. 
5. $T^*T = 0$ if and only if $T = \mathbf 0$. Direct from property (5.)
6. $(ST)^* = T^*S^*$, direct from the definition of an Hilbert adjoint operator. 


#### **Demonstration for | Property (4)**

Consider

$$
\begin{aligned}
    \Vert Tx\Vert^2 &= |\langle Tx, Tx\rangle| = |\langle x, T^* Tx\rangle|
    \\
    & \le \Vert x\Vert^2 \Vert T^*T\Vert
    \\
    \implies \Vert T\Vert^2 &\le \Vert T^*T\Vert \text{ Take the sup}
    \\
    \Vert T^*T\Vert &< \Vert T\Vert \Vert T^*\Vert
    \\
    \implies & \le \Vert T\Vert^2 \text { by }\Vert T\Vert = \Vert T^*\Vert. 
\end{aligned}
$$

hence $\Vert T\Vert^2 = \Vert T^*T\Vert$. But since $\Vert T\Vert = \Vert T\Vert^2$, then we also have
$$
\begin{aligned}
    \Vert T^*\Vert^2 = \Vert T^{**} T^*\Vert = \Vert TT^*\Vert,
\end{aligned}
$$
by property (3). 


**Exercises**
1. $T + T^*$ and $T^*T$ are adjoint operators of themselves. 

---
### **Complementary Spaces between the Ranges and Null spaces of the Adjoint Operators**

The range of the operator and the nullspace of the adjoint forms complementary spaces for the output space of the operator. 

#### **Thm | Complementary Spaces**
> Let $T: \mathcal H_1 \mapsto \mathcal H_2$, then the following are all true
> 1. $\text{null}(T^*) = \text{rng}(T)^\perp$. 
> 2. $\text{cl.rng}(T) = \text{null}(T^*)^\perp$. 

**Observations**

The range of the operator needs to be closed. The range of the operator involves finite span of vectors (Just the definition for spans of vectors), in hilbert spaces, finite spaces are not always closed, hence the closure is required. 

**Proof**

For (1.), it's a chain of equivalence 

$$
\begin{aligned}
    & y \in N(T^*) \iff T^* y = \mathbf 0
    \\
    \iff & \forall x \in \mathcal H_1 : \langle x, T^* y\rangle = \langle  Tx, y\rangle = 0
    \\
    \iff & 
    y \perp Tx \; \forall x \in \mathcal H_1
    \\
    \iff & 
    y \perp \text{rng}(T). 
\end{aligned}
$$

similarly, we consider 
$$
\begin{aligned}
    & y \in \text{rng} (T)^\perp 
    \\
    \iff  &\forall y' \in \text{rng}(T): \langle y', y\rangle = 0
    \\
    \iff & \forall x \in \mathcal H_1: \langle Tx, y\rangle = 0
    \\
    \iff & \forall x \in \mathcal H_1: \langle x,T^* y\rangle = 0
    \\
    \iff & T^* y = \mathbf 0 
    \\
    \iff &
    y \in \text{null}(T^*), 
\end{aligned}
$$

recall that in Hilbert spaces, $M \subset \mathcal H$, we have $M^{\perp\perp} = \text{cl}(M)$, in above we have $\text{rng}(T)^\perp = \text{null}(T^*)$, hence $\text{rng}(T)^{\perp\perp} = \text{cl.rng}(T) =\text{null}(T^*)^\perp$, the proof is now complete. 

#### **Thm | Injectivity**

> Let $T:\mathcal H_1\mapsto \mathcal H_2$, a linear operators on the space itself. Then: 
> 1. If $T$ is onto, then $T^*$ is injective. 
> 2. If $T$ is injective, then $\text{cl.rng}(T^*) = \mathcal H_1$

**Recall**

Onto meaning that it maps to everything in the output space $\mathcal H_2$ for the operator. Injective means that, there are all different elements in the input space $\mathcal H_1$ maps to a different element in $\mathcal H_2$. 