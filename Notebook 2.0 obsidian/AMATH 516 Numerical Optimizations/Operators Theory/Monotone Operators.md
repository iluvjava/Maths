- [Introduction to Operators for Optimizations](Introduction%20to%20Operators%20for%20Optimizations.md)
- [Multivalued Functions, Set-valued Mappings](Multivalued%20Functions,%20Set-valued%20Mappings.md)

---
### **Intro**

Let the space of the monotone operators. 
Most of the materials are from Heinz's book Convex Analysis and Monotone Operator, and his teaching of MATH 565 in the university of British Columbia, 2024 Term 2 winter. 


#### **Definition | Monotone Operator**

> An operator $T:  X \mapsto 2^X$ is a monotone operator if for all $x, y \in \mathbb E$ we have $\inf\langle y - x, Ty - Tx\rangle \ge 0$. 

**Observations**

The reader should consider the case when $T$ is a function mapping from $\mathbb R \mapsto \mathbb R$ as a single valued mapping. 
It can be viewed as a multi-valued mapping that always maps to a singleton set. 
The reader should realize that under this case the definition of a monotone operator means that the function is monotonically increasing (or equivalently non-increasing) on it's defined domain. 

**Remarks**

A monotone operator doesn't imply: 
1. Continuity of any kind. 
2. Singled value property of any kind. 
3. Subjectivity of any kind. 


#### **Definition | Maximally Monotone**
> Mapping $A: X \mapsto 2^{X}$ is maximally monotone if $B: X \mapsto 2^X$ and satisfies $\text{gph}(A)\subseteq \text{gph}(B)$ then it must be $A = B$. 



---
### **Existence and Equivalent Definitions of Maximally Monotone operators**

We need to show that a maximally monotone operator exists, and then we show an equivalent definition. 


#### **Definition | Maximally Monotone Equivalent Definition**
> The operator $T: X \mapsto 2^X$ is a maximally monotone operator if and only if any $(x, x^*)$ satisfies $\forall (y, y^*)\in \text{gph}(T)$ we have $\langle x - y, x^* - y^*\rangle \ge 0$ then it must be that $(x, x^*)\in \text{gph}(T)$. 

**Demonstrations**

Proving $\impliedby$ by a contrapositive argument. 
If $T$ is not maximally monotone, then there exists a proper monotone operator $\tilde T$ such that $\text{gph}T \subsetneq \text{gph}\tilde T$. 
And there would exists a point $p=(x, x^*) \in \text{gph}(\tilde T)$, so that by monotonicity of $\tilde T$, we have $\forall (y, y^*) \in \text{gph}(T)$, $\langle x - x^*, y - y^*\rangle \ge 0$. 
Because $\text{gph}(T)\subseteq \text{gph}(\tilde T)$. 

To show $\implies$, it can be done by the definition of a maximally monotone operator, or a contrapositive argument as well. 


#### **Thm | Maximal Extension of Monotone Operators**
> For all monotone operator $A: X \mapsto 2^X$, there exists a maximal monotone operator $B$ such that $\text{gph}(A)\subseteq \text{gph}(B)$.

**Remarks**

The proof is very similar to [Hahn Banach Theorem and its Corollaries](Hahn%20Banach%20Theorem%20and%20its%20Corollaries.md). 
The extension of a monotone operators requires a very similar constructions.


---
### **Properties of Maximal Monotone Operators**
There are useful properties of maximal monotone operators. 

#### **Theorem | Sum of Max Mono Operators is Mono**
> Let $A, B$ be montone operator on $X$. Show that $A + B$ is montone on $X$. 

**Proof**
Directly we consider from the definition of a monotone operator called $A + B$. Take 2 points from the operator $(x, x^*) \in [A + B](x), (y, y^*) \in [A + B](y)$ then we would check 

$$
\begin{aligned}
    & \langle x - y, x^* - y^*\rangle
    \\
    &
    \begin{cases}
        \exists x_A \in Ax, x_B \in B x : x^* = x_A + x_B
        \\
        \exists y_A \in Ay, y_B \in By: y^* = y_A + x_B
    \end{cases}
    \\
    \implies 
    &= \langle x - y, x^* - y^*\rangle 
    \\
    &= 
    \langle x - y, x_A + x_B - (y_A + y_B)\rangle
    \\
    &= \langle x - y, x_A - y_A\rangle + \langle x - y, x_B - y_B\rangle, 
\end{aligned}
$$

using the monotonicity of both operator $A$ and $B$, the above quantity has a positive sum. 

#### **Theorem | Continuous Montone Operator is Maximal Monotone**
> Let $A : X \mapsto X$ be a continuous and monotne, then $A$ would be maximal monotone. 

**Proof**

Let $(x, x^*)$ monotonically relate to $\text{gph}(A)$. 
The graph of the operator would be defined through $\text{gph}(A) = \{(y, Ay) | y \in X\}$, then we can use one point $y \in X$ instead and call the definition of monotone graph we would have 

$$
\begin{aligned}
    \forall y \in X: 
    \langle x - y, x^* - Ay\rangle &\ge 0. 
\end{aligned}
$$

We wat to show that $(x, x^*)$ is in $\text{gph}(A)$. 

$$
\begin{aligned}
    & \forall \alpha > 0, y_\alpha := x + \alpha(x^* - Ax)
    \\
    = & 
    \lim_{\alpha \searrow 0}
    x + \alpha(x^* - Ax) = x. 
\end{aligned}
$$

Using $y_\alpha$ instead of $y$, we try with $\alpha > 0$

$$
\begin{aligned}
    \langle x - y_\alpha, x^* - Ay_\alpha\rangle
    &\ge 0
    \\
    -\alpha \langle x^* - Ax, x^* - A y_\alpha\rangle &\le 0, 
\end{aligned}
$$

talking the limit of $\alpha \rightarrow 0$, by continuity of $A$, and the inner product on Hilbert spaces, we would have $\langle x^* - Ax, x^* - Ax\rangle \le 0$, and the only possible way for that is $x^* = Ax$, and therefore, $(x, x^*)\in \text{gph}(A)$. 

**Remarks**

The assumption that $A$ is continuous is strictly stronger than necessary because the limit we use is the limit of $\alpha(x^* - Ax)$ approaching zero, which is only along the direction of the vector $x^* - Ax$. 
This type of continuity is a weaker type called Hemi-Continuity. 
See [wiki](https://en.wikipedia.org/wiki/Hemicontinuity) for more information. 
Of course, naturally for all linear operator in finite Euclidean spaces, it's maximal monotone if and only if it's monotone. 
We used the previous proved theorem and the fact that any linear mapping on finite Euclidean space is a continuous mapping. 



---
### **Illustrative Examples for Max Monotone, Monotone Operators**

We discuss some examples that can illsutrate the properties of a maximal monotone, or a maximally monotone operators. 



---
### **Surjectivity of Maximally Monotone Operators**

[Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md) asserts the equivalence of surjectivity of $I + T$ for a maximal monotone operator. 

---
### **Shifting Output is Still Monotone**

Let $T$ be monotone then $T - \{v\}$ for any $v \in \mathbb E$ is still monotone because: 

$$
\begin{aligned}
    & \langle x - y,(T - \{v\})x - (T - \{v\})y\rangle 
    \\
    =& \langle x - y, Tx - v - (Ty - v)\rangle 
    \\
    =& \langle x -y, Tx - Ty\rangle \ge 0, 
\end{aligned}
$$

which doesn't change the monotonicity about the operator. 

**Remarks**

In the case of maximally monotone operator being a subgradient operator, shifting the output space by one vector is the same as adding an affine function to the original function. 
In general the sum of 2 monotone operator is still a monotone operator. 

---
### **Examples**

**Example 1 | Convex Projection is Monotone**
Recall [Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md), 

**Example 2 | Subgradient is Monotone**
See [Monotonicity of Subgradient](../Non-Smooth%20Calculus/Monotonicity%20of%20Subgradient.md) for more information. 


---
### **References**

Heinz's Book 20.2, for the shifting theorem that is a work of my own because it's used to prove the Minty's theorem. 