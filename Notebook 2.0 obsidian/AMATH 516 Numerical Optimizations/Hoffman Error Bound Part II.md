- [Hoffman Error Bound](Hoffman%20Error%20Bound.md)
- [Introducing Cone](AMATH%20516%20Numerical%20Optimizations/Background/Introducing%20Cone.md)
- [Convex Parametric Minimization and Strong Duality](Duality/Convex%20Parametric%20Minimization%20and%20Strong%20Duality.md)

---
### **Intro**

Hoffman error bound exists for polytopes. 
The concept has been generalized by Tseng and Burkes into a wider context for convex programming. 
This file will go deep into that, and we will follow this paper faithfully: 
> J. V. Burke and P. Tseng, “A unified analysis of Hoffman’s Bound via Fenchel Duality,” _SIAM J. Optim._, vol. 6, no. 2, pp. 265–282, May 1996, doi: [10.1137/0806015](https://doi.org/10.1137/0806015).

Next, we introduce the notations and, with the concepts required to discuss the materials in the paper. 
Recall the following definitions, ideas: 
1. Recession cone, denoted by $\text{rec}$. 
2. Linearity of cone, denoted by $\text{lin}$. 

#### **Assumption | Global**
> Let $X, Y$ be two normed linear spaces. 
> Let $f: X \rightarrow \overline \R$ be a convex function such that $f^\star \ge 0$ always. 
> One such example is, $\Vert \cdot\Vert$, or when $\text{epi}\; f$ is a cone. 
> Let 
> 1. $K \subseteq Y$ be a cone, non-empty closed and convex. We denote the dual of a cone by $K^\circ$. This adopts the same notation as the paper. 
> 2. Let $A:X\rightarrow Y$ be a linear mapping, and we denote it's adjoint $A^*: Y^* \rightarrow X^*$. 

**The Goals**

The goal of the paper is to find a constant $\mu \ge 0$ along with the conditions sufficient for its existence for a uniform bound between the quantities for all $x \in X$: 

$$
\begin{aligned}
    \inf_{\xi} \left\lbrace
        f(x - \xi): A\xi - a \in K
    \right\rbrace
    &\le \mu\text{ dist}\; (Ax - a | K). 
\end{aligned}
$$

Take note that when $\mu = \infty$, the inequality becomes trivial. 
This has relevance to the Hoffman Error bound. 
For example, set $f = \Vert \cdot\Vert$, let $X, Y$ be $\R^m, \R^n$, suppose that the set $K = \R^n_+$, the above inequality is

$$
\begin{aligned}
    & \inf_\xi\left\lbrace
        \Vert x - \xi\Vert: A\xi - a \in \R^n_+
    \right\rbrace
    \\
    &= \text{dist}\;(x | \{\xi: A\xi - a \in \R^n_+\})
    \\
    &\le \mu \text{ dist}\;(Ax - a | \R^n_+)
    \\
    &= \mu \Vert [Ax - a]_-\Vert. 
\end{aligned}
$$

It bounds the distance of $x$ to solution set $\{\xi : A\xi - a \in \R^n_+\}$ in $\R^n$ to the violation of constraints by point $x$ in $R^m$, given by $Ax - a\in \R^n_+$. 
It generalizes the Hoffman Error bound of the Polytope. 

---
#### **Starting with a lack luster upper bound**

Configurations, assumption, and some losse bound that has potentials. 

#### **Configuration 1**
> Let 
> 1. $X, Y$ be real normed linear spaces. 
> 2. $f:X \rightarrow \overline \R$ be a real valued convex function such that $f^\star$ is non-negative everywhere. 
> 3. $K\subseteq Y$ be a non-empty convex cone. 
> 4. $A:X \rightarrow Y$ be a linear mapping. 
> 5. $a \in \text{rng}\; A - K$
> 6. $x \in X$. 


The following is assumed but it will be justified later. 

#### **Assumption 1 | Fenchel duality and conic restruction**
> Take $X, Y, K, A, a, x$ fro Configuration 1 and, assume that the following equality holds: 
> $$
> \begin{aligned}
>     \inf_\xi \left\lbrace
>         f(x - \xi) : A \xi - a \in K
>     \right\rbrace
>     &= \sup_{y^*} \left\lbrace
>         \langle y^*, Ax - a\rangle - f^\star(A^* y^*) : y \in K^\circ
>     \right\rbrace. 
> \end{aligned}\tag{1}
> $$
> Assume there exists a cone $W \subseteq K^\circ$ independent of $x$ such that it has equality 
> $$
> \begin{aligned}
>     \sup_{y^*} \left\lbrace
>         \langle y^*, Ax - a\rangle - f^\star(A^* y^*): y \in K^\circ
>     \right\rbrace
>     = 
>     \sup_{y^*} \left\lbrace
>         \langle y^*, Ax - a\rangle - f^\star(A^* y^*): y \in W
>     \right\rbrace
> \end{aligned}\tag{2}
> $$


#### **Theorem 1 | first upper bound**
> Take $X, Y, K, a, x$ from Configuration 1 and, assume Assumption 1 is true given the configuration. 
> Then there exists some $\mu \in \R \cup \{-\infty, \infty\}$ such that 
> $$
> \begin{aligned}
>     \inf_{\xi} \left\lbrace
>         f(x - \xi): A\xi - a \in K
>     \right\rbrace
>     &\le \mu_1\text{ dist}\; (Ax - a | K).
> \end{aligned}
> $$
> And the constant is given by 
> $$
> \begin{aligned}
>     \mu_1 := \sup_{y^*}
>     \left\lbrace
>         \Vert y^*\Vert_\star : y^* \in W, A^*y^* \in \text{dom}\; f^\star
>     \right\rbrace.
> \end{aligned}
> $$

**Proof**

The proof now follows, the non-trivial intermediate steps are label and they will be explained shortly after. 

$$
\begin{aligned}
    & \inf_\xi \left\lbrace
        f(x - \xi): A\xi - a \in K
    \right\rbrace
    \\
    &= \sup_{y^* \in K^\circ} \left\lbrace
        \langle y^*, Ax - a\rangle - f^\star(A^* y^*)
    \right\rbrace
    \\
    &\underset{\text{(a)}}{\le} 
    \sup_{y^*} \left\lbrace
        \langle y^*, Ax - a\rangle : y \in \text{dom}\; f^\star, y^* \in K^\circ
    \right\rbrace
    \\
    &\underset{\text{(b)}}{\le} 
    \sup_{y^*} \left\lbrace
        \Vert y^*\Vert_\star \text{dist}\; (Ax - a| K) : y \in \text{dom}\; f^\star, y^* \in K^\circ
    \right\rbrace
    \\
    &= \mu_1 \text{ dist}\; (Ax - a | K). 
\end{aligned}
$$

At (a) we used the non-negativity of $f^\star$. 
At (b), explanations now follow. 
For all $y = Ax - a \in Y$, choose any $y' \in K$, then it has for all $y^* \in K^\circ$ that: 

$$
\begin{aligned}
    \langle y^*, y\rangle 
    &\le 
    \langle y^*, y - y'\rangle 
    \le 
    \Vert y^*\Vert_\star \Vert y - y'\Vert. 
\end{aligned}
$$

The first inequality is because $y^* \in K^\circ$ but $y \in K$. 
The second inequality is Cauchy Schwarts. 
Let $y'$ be projection of $y$ onto $K$, the inequality becomes $\langle y^*, y\rangle \le \Vert y^*\Vert_\star \text{dist}(y | K)$. 

$\blacksquare$

The paper, two more theorems are given to refine upper bound when additinal assumptions are added to the settings of Theorem 1 for function $f$. 

#### **Theorem 2 | First refinment**
> Take $X, Y, K, a, x$ from Configuration 1, and, assume Assumption 1 is true. 
> Assume in addition that $f$ be a real-valued positively homogenous convex function of degree 1 that is positive except at the origin. 
> Then: 
> $$
> \begin{aligned}
>     \inf_\xi \left\lbrace
>     f(x - \xi) : A \xi - a \in K
>     \right\rbrace
>     &= \sup_{y^*} \left\lbrace
>         \langle y^*, Ax - a\rangle - f^\star(A^* y^*) : y \in K^\circ
>     \right\rbrace. 
> \end{aligned}
> $$
> Where, $\mu_2 \in \R \cup \{\pm \infty\}$ is given by 
> $$
> \begin{aligned}
>     \mu_2 := \sup_{y^*} \left\lbrace
>         \Vert y^*\Vert_\star : y^* \in W, f^\circ(A^*y^*) \le 1
>     \right\rbrace. 
> \end{aligned}
> $$
> Where $f^\circ(x^*):= \sup_{x \neq \mathbf 0} \langle x, x^*\rangle/f(x)$. 
> Further more, when $A^*W \neq \{\mathbf 0\}$ whenever $W \neq \{\mathbf 0\}$, then the inequality sign can be replaced by an equality so it may be $f^\circ(A^* y^*) = 1$ and, it still holds. 


#### **Theorem 3 | Second refinement**
> 



---
### **Checking the strong duaity**

For Theorem 1, 2, 3 to validate, it requires Assumption 1. 
This subsection focus on strong duality, which is Equation (1). 
In the paper, it's Lemma 4. 

#### **Lemma 4 | checking for strong duality**
> Let $f$ be a real-valued function on real normed linear space $X$. 
> Let $A: X \rightarrow \R^m$ be a continuous linear mapping. 
> Let $K\subseteq \R^m$ be a non-empty closed convex set of form $K = K_1 \cap K_2$ for some closed convex polyhedral set $K_1$ and, closed convx set $K_2$. 
> Then, for every $a \in \text{rng}\; A - (K_1 \cap \text{ri}\; K_2)$, every $x \in X$ the strong duality holds: 
> $$
> \begin{aligned}
>     \inf_\xi \left\lbrace
>     f(x - \xi) : A \xi - a \in K
>     \right\rbrace
>     &= \sup_{y^*} \left\lbrace
>         \langle y^*, Ax - a\rangle - f^\star(A^* y^*) : y \in K^\circ
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**

See the paper. $\blacksquare$

**Remarks**

This is using strong duality regularity conditions frequently discussed in elementary convex analysis textbook. 


----
### **Choosing the W cone**

The following contents explain Lemma 4, 5, 6 in the original paper. 

#### **Configuration 2 | W cone configuration the general case**
> Let $K\subseteq \R^m$ be a non-empty closed convex cone. 
> Let $A: X \rightarrow \R^m$ be a continuous linear mapping. 
> Define 
> 1. Subspace $S \subseteq \R^m$ by $S:= \text{ker}\; A^* \cap \text{lin}\; K^\circ$. 
> 2. Cone $\hat K := K + S$. 
> 3. Consider the following subset $W_1$ given $\hat K^\circ$ defined as 
> $$
> \begin{aligned}
>     W_1 &:= \left\lbrace
>         y^* \in \hat K^\circ : 
>         \text{There doesn't exists } z^* \in \hat K^\circ\setminus \{\mathbf 0\} \text{ with }
>         A^*z^* = 0 \text{ and } y^* - z^* \in \hat K^\circ
>     \right\rbrace
>     \\
>     &= 
>     \hat K^\circ \setminus \left(
>         \hat K^ \circ + 
>         (\text{ker}\; A^* \cap \hat K^\circ) \setminus \{\mathbf 0\}
>     \right). 
> \end{aligned}
> $$


#### **Configurations 3 | W cone, the Cartesian product case**



#### **Lemma 5 | the general W cone**
> Let $K, A, S, \hat K, W_1$ be given by Configuration 2. 
> Then the following holds. 
> - (i) Let $f: X \rightarrow \R^m$ be a real-valued convex function. For every $a \in \text{rng}\; A - K$ and, $x \in X$, it has $\sup_{y^* \in K^\circ} \{\langle y^*, Ax - a \rangle - f^\star(A^*y^*)\} = \sup_{y^* \in W_1} \{\langle y^*, Ax - a \rangle - f^\star(A^*y^*)\}$. 
> - (ii) Let $D \subseteq X^*$ be any convex set such that $(A^*)^{-1}D$ is closed and, has $\text{ker}\; A^*$ as its recession cone. Then $W_1 \cap (A^*)^{-1} D$ is contained in the convex hull of the extreme points of the closed convex set $G := \hat K ^\circ \cap (A^*)^{-1}D$. 
> - (iii) $W_1 = \{\mathbf 0\}$ if and only if $A^*W_1 = \{\mathbf 0\}$ if and only if $\text{rng}\; A \subseteq K$. 

**Proof**

**Proof of (i)**. 



$\blacksquare$

**Remarks**





---
#### **Final results of the paper | the finite generalized Hoffman bounds**



