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
> Unless specified, assume the following throughout. 
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

Configurations, assumptions first, then, Theorem 1 gives the general bound under the most general assumption of $f$, while Theorem 2, 3 gives some  more specialized bound when $f$ is positively homogenous function. 

#### **Configuration 1**
> Let 
> 1. $X, Y$ be real normed linear spaces. 
> 2. $f:X \rightarrow \overline \R$ be a real valued convex function such that $f^\star$ is non-negative everywhere. 
> 3. $K\subseteq Y$ be a non-empty convex cone. 
> 4. $A:X \rightarrow Y$ be a linear mapping. 
> 5. $a \in \text{rng}\; A - K$
> 6. $x \in X$. 


The following is assumed but, it will be justified later. 

#### **Assumption 1 | Fenchel duality with conic construction**
> Take $X, Y, K, A, a, x$ from Configuration 1 and, assume that the following equality holds: 
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
The second inequality is Cauchy Schwartz. 
Let $y'$ be projection of $y$ onto $K$, the inequality becomes $\langle y^*, y\rangle \le \Vert y^*\Vert_\star \text{dist}(y | K)$. 

$\blacksquare$

The paper, two more theorems are given to refine upper bound when additional assumptions are added to the settings of Theorem 1 for function $f$. 

#### **Theorem 2 | First refinement**
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
> Furthermore, when $A^*W \neq \{\mathbf 0\}$ whenever $W \neq \{\mathbf 0\}$, then the inequality sign can be replaced by an equality so,  it may be $f^\circ(A^* y^*) = 1$ and, it still holds. 

**Proof**

See the paper not proving it in the notes. $\blacksquare$


#### **Theorem 3 | Second refinement**
> Let $X, Y, K, A, a$ and $x$ satisfies Configuration 1, then assume that $f$ is a real-valued positively homogenous convex function on $X$ with degree $p \in (1, \infty)$ that is positive except at the origin. 
> Suppose that Assumption 1 holds with some $K \subseteq K^\circ$.
> Suppose that when $A^*W \neq \{\mathbf 0\}$ whenever $W \neq \{\mathbf 0\}$. 
> Then, it has the inequality: 
> $$
> \begin{aligned}
>     \inf_{\xi} \left\lbrace
>         f(x - \xi)^{1/p} : 
>         A\xi - a \in K
>     \right\rbrace 
>     &\le 
>     \mu_3 \text{dist}\; (Ax - a | K), 
> \end{aligned}
> $$
> where $\mu_3 \in \R \cup \{\pm \infty\}$ is given by: 
> $$
> \begin{aligned}
>     \mu_3 = \left(
>         \frac{1}{p}
>     \right)^{1/p}\left(
>         \frac{1}{q}
>     \right)^{1/q} \sup_{y^*}\left\lbrace
>         \Vert y^*\Vert_\star : y^* \in W, f^\star(A^*y^*) = 1
>     \right\rbrace, 
> \end{aligned}
> $$
> with $q \in (1, \infty)$ such that $1/p + 1/q = 1$. 


**Proof**

See the paper not proving it in the notes. $\blacksquare$


---
### **Checking the strong duality**

For Theorem 1, 2, 3 to validate, it requires Assumption 1. 
This subsection focus on strong duality, which is Equation (1). 
In the paper, it's Lemma 4. 

#### **Lemma 4 | checking for strong duality**
> Let $f$ be a real-valued function on real normed linear space $X$. 
> Let $A: X \rightarrow \R^m$ be a continuous linear mapping. 
> Let $K\subseteq \R^m$ be a non-empty closed convex set of form $K = K_1 \cap K_2$ for some closed convex polyhedral set $K_1$ and, closed convex set $K_2$. 
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


#### **Lemma 5 | the general W cone**
> Let $K, A, S, \hat K, W_1$ be given by Configuration 2. 
> Then the following holds. 
> - (i) Let $f: X \rightarrow \R^m$ be a real-valued convex function. For every $a \in \text{rng}\; A - K$ and, $x \in X$, it has $\sup_{y^* \in K^\circ} \{\langle y^*, Ax - a \rangle - f^\star(A^*y^*)\} = \sup_{y^* \in W_1} \{\langle y^*, Ax - a \rangle - f^\star(A^*y^*)\}$. 
> - (ii) Let $D \subseteq X^*$ be any convex set such that $(A^*)^{-1}D$ is closed and, has $\text{ker}\; A^*$ as its recession cone. Then $W_1 \cap (A^*)^{-1} D$ is contained in the convex hull of the extreme points of the closed convex set $G := \hat K ^\circ \cap (A^*)^{-1}D$. 
> - (iii) $W_1 = \{\mathbf 0\}$ if and only if $A^*W_1 = \{\mathbf 0\}$ if and only if $\text{rng}\; A \subseteq K$. 

**Proof of (i)**. 

For all $x^* \in A^* K^\circ$, define the $C(x^*):= \{ y^*\in \hat K^\circ: A^*y^* = x^*\}$. 
I.e: $C(x^*) = (A^*)^{-1}x^* \cap \hat K^\circ$, here, $(A^*)^{-1}x^*$ denotes the pre-image of the linear mapping $A^*$ on $x^*$. 
We make the following non-trivial observations: 

$$
\begin{aligned}
    \hat K^\circ = \bigcup_{x^*}\left\lbrace
        C(x^*) : x^* \in A^* \hat K^\circ
    \right\rbrace. 
\end{aligned}\tag{c}
$$

The following intermediate results help with claiming the final proof, their proofs can be found in the appendix. 
- (a) $C(x^*)$ contains at least one extreme point. 
- (b) For all $x^* \in A^* K^\circ$, the extreme points of $C(x^*)$ is in $W_1$. 
- (d) We have the equality 
$$
\begin{aligned}
    \sup_{y^*} \left\lbrace
        \langle y^*, Ax - a\rangle  - f^\star(A^*y^*): y \in K^\circ
    \right\rbrace
    = 
    \sup_{y^*} \left\lbrace
        \langle y^*, Ax - a\rangle  - f^\star(A^*y^*): y \in \hat K^\circ
    \right\rbrace
\end{aligned}
$$
- (e) The equality 
$$
\begin{aligned}
    \sup_{y^*}\left\lbrace
        \langle  y^*, Ax - a\rangle : y \in C(x^*)
    \right\rbrace &= 
    \sup_{y^*} \left\lbrace
        \langle y^*, Ax - a\rangle : 
        y^* \in C(x^*)\cap W_1
    \right\rbrace. 
\end{aligned}
$$

The overall proof follows from intermediate results (a)-(c). 
For all $a \in \text{eng}\; A - K$, for all $x \in X$ it has 

$$
\begin{aligned}
    & \sup_{y \in K^\circ}\left\lbrace
        \langle y^*, Ax - a\rangle - f^\star(A^*y^*) 
    \right\rbrace
    \\
    &\underset{\text{(d)}}{=} 
    \sup_{y \in \hat K^\circ}\left\lbrace
        \langle y^*, Ax - a\rangle - f^\star(A^*y^*) 
    \right\rbrace
    \\
    &\underset{\text{(c)}}{=}
    \sup_{x^* \in A^* \hat K^\circ}
    \left\lbrace
        \sup_{y^*\in C(x^*)}
        \left\lbrace
            \langle y^*, Ax - a\rangle - f^\star(x^*)
        \right\rbrace
    \right\rbrace
    \\
    &\underset{\text{(e)}}{=}
    \sup_{x^* \in A^* \hat K^\circ}
    \left\lbrace
        \sup_{y^*\in C(x^*)\cap W_1}
        \left\lbrace
            \langle y^*, Ax - a\rangle - f^\star(x^*)
        \right\rbrace
    \right\rbrace
    \\
    &\underset{\text{(c)}}{=}
    \sup_{y \in \hat K^\circ\cap W_1}\left\lbrace
        \langle y^*, Ax - a\rangle - f^\star(A^*y^*) 
    \right\rbrace
    \\
    &= \sup_{y \in \hat K^\circ\cap W_1}\left\lbrace
        \langle y^*, Ax - a\rangle - f^\star(A^*y^*) 
    \right\rbrace. 
\end{aligned}
$$

The last equality follows by $W_1 \subseteq \hat K^\circ$. 
See appendix at the end for proofs for intermediate results (a)-(e). 

**Proof of (ii)**. See the paper, we won't prove them here. 

$\blacksquare$

**Remarks**

The construction of $W_1$ seems to be quite non-trivial. 



---
#### **Final results of the paper | the finite generalized Hoffman bounds**

The final, important results are given in the theorems below. 

#### **Theorem 6 | Finite Hoffman constant in the general case**
> Take $X, K, A, \R^m, W_1$ from Configuration 2. 
> Assume that $K = K_1 \cap K_2$ for some polyhedral cone $K_1$, and some closed convex cone $K_2\subseteq \R^m$. Then, the following hold. 
> - (i) Let $f$ be a positively homogenous function convex function of degree $p = 1$ except at the origin. For all $a \in \text{rng}\; A - (K_1 \cap \text{ri}\; K_2)$, and $x \in X$, the bound from Theorem 2 holds. If $\text{rng}\; A \not\subseteq K$, then the inequality sign can be replaced by an equality sign and, if either $K$ is polyhedral, or $\text{rng}\; A + K = \R^m$, then $\mu_2$ is finite. 
> - (ii) Let $f$ be a positively homogenous function convex function of degree $p \in (1, \infty)$ except at the origin. For all $a \in \text{rng}\; A - (K_1 \cap \text{ri}\; K_2)$, and $x \in X$, the bound with $\mu_3$ from Theorem 3 holds. More over, if $\text{rng}\; A \not\subseteq K$, and either $K$ is polyhedral, or $\text{rng}\;A + K = \R^m$, then $\mu_3$ is finite. 

**Proof**

See the paper, we skip the proof here. $\blacksquare$

**Remarks**

The results seem very minimal 

---
#### **Appendix**

The details of some are here, we reference the proof for their labels in lemmas/theorems. 


#### **Proofs | Intermediate results for Lemma 5**
We proof intermediate results stated in the proof of Lemma 4, (a)-(e). 

**Proof of (a)**. 
The set $C(x^*)$ has at least one extreme point because $\text{lin.rec}\; C(x^*) = \{\mathbf 0\}$ by Corollary 18.53 in Rockafellar's convex analysis red book. 
It has 

$$
\begin{aligned}
    \text{lin.rec}\; C(x^*)
    &= \text{lin}\left(
        \text{rec}\; (A^*)^{-1} x^* \cap \hat K^\circ
    \right)
    \\
    &= 
    \text{lin}\left(
        \text{ker}\; A^* \cap \hat K^\circ
    \right)
    \\
    &= \text{lin.ker} A^* \cap \text{lin}\; \hat K^\circ
    \\
    &= \text{lin.ker} A^* \cap \text{lin}\; (K + S)^\circ
    \\
    &= 
    \text{lin.ker} A^* \cap \text{lin}\; (K^\circ \cap S^\perp)
    \\
    &= 
    \text{lin.ker} A^* \cap \text{lin}\; K^\circ 
    \cap \text{lin}\; S^\perp
    \\
    &= S\cap S^\perp = \{\mathbf 0\}. 
\end{aligned}
$$

**Proof of (b)**. We show that for all $x^* \in A^* K^\circ$, all extreme points of $C(x^*)$ is in $W_1$. 
To do that, we show that if point $y\not \in W_1$, then it's not an extreme point of $C(x^*)$. 
By definitions 
$$
\begin{aligned}
    y &\in (W_1)^\complement = 
    \left(
        \hat K ^\circ \setminus \left(
            \hat K ^\circ + (\text{ker}\; A^* \cap \hat K^\circ)\setminus \{\mathbf 0\}
        \right)
    \right)^\complement
    \\
    &= 
    \left(
        \hat K ^\circ \cap \left(
            \hat K ^\circ + (\text{ker}\; A^* \cap \hat K^\circ)\setminus \{\mathbf 0\}
        \right)^\complement
    \right)^\complement
    \\
    &= 
    (\hat K ^\circ)^\complement \cap \left(
        \hat K ^\circ + (\text{ker}\; A^* \cap \hat K^\circ)\setminus \{\mathbf 0\}
    \right)
    \\
    \iff &
    \left(\forall y \in \hat K^\circ\right): y\in \hat K^\circ + (\text{ker}\; A^* \cap \hat K^\circ)\setminus \{\mathbf 0\}
    \\
    \iff & 
    \left(\forall y \in \hat K^\circ\right)
    \left(\exists z \in \text{ker}\; A^* \cap \hat K^\circ\right): 
    y\in \hat K^\circ + z. 
\end{aligned}
$$

The last line implies that $y - z \in \hat K^\circ$. 
Next, we have $y+ z \in \hat K^\circ$ as well because 
$$
\begin{aligned}
    z &\in \left(
        \text{ker}\; A^* \cap \hat K^\circ 
    \right)\setminus \{\mathbf 0\} \subseteq \hat K^\circ \setminus \{\mathbf 0\}
    \\
    \implies & 
    z + y \in \hat K^\circ. 
\end{aligned}
$$

The last line come from the fact that $y \in \hat K^\circ$, $z\in \hat K^\circ$ and, $\hat K^\circ$ is a convex cone. 
Combining the results we have $y\pm z \in C(x^*)$, since $z \neq \mathbf 0$ by definition, it means that $y$ can be represented by $y = 1/2(y + z) + 1/2(y - z)$ which means that $y$ cannot be an extreme point of the $C(x^*)$. 

**Proof of (c)**. It's direct, and it has 

$$
\begin{aligned}
    &\bigcup_{x^*}\left\lbrace
        C(x^*) : x^* \in A^* \hat K^\circ
    \right\rbrace
    \\
    &= \bigcup_{x^*}\left\lbrace
        C(x^*) : x^* \in A^* \hat K^\circ
    \right\rbrace
    \\
    &= \bigcup_{x^*}
    \left\lbrace
        (A^*)^{-1}x^* : x^* \in A^* \hat K^\circ
    \right\rbrace = \hat K^\circ. 
\end{aligned}
$$

**Proof of (d)**.
For all $y\in K^\circ$ because $S \subseteq \text{lin}\;K^\circ$, the cone has decomposition $K^\circ = S + K^\circ \cap S^\perp$. 
Therefore, it can be written as $y^* = y_1^* + y_2^*$ such that $y_1^* \in S$ and $y_2^* \in K\cap S^\perp$, then it has 

$$
\begin{aligned}
    \left\langle y^*, Ax - a\right\rangle - f^\star(A^*y^*) &= 
    \left\langle y^*_1, Ax - a\right\rangle 
    + \left\langle y^*_2, Ax - a\right\rangle
    - f^\star(A^*y^*). 
\end{aligned}
$$

Recall that by assumption it has $-a \in \text{rng}\; A + K\subseteq \text{rng}\; A + \text{span}\; K = S^\perp$, therefore $\langle y_1^*, -a\rangle = 0$, in addition, $y_1^* \in S = \text{ker}\; A^* \cap \text{lin}\; K^\circ\subseteq \text{ker}\; A^*$ therefore it has $\langle y_1^*, Ax\rangle = 0$ also. 
With that the above simplifies and has: 

$$
\begin{aligned}
    \left\langle y^*, Ax - a\right\rangle - f^\star(A^*y^*) &= 
    \langle y_2^*, Ax - a\rangle - f^\star\left(A^*y^*_2\right). 
\end{aligned}
$$

Finally, $y_2^* \in K^\circ \cap S = (K + S)^\circ = \hat K^\circ$ , and therefore, the supremum still holds after exchanging $K^\circ$ with the smaller set $\hat K^\circ$. 

**Proof of (e)**. 
For all $y \in C(x^*)$, $\bar x \in X$, the inner product term has 

$$
\begin{aligned}
    \langle y^*, Ax - a\rangle &= \langle y^*, A(x - \bar x)\rangle + \langle y^*, A\bar x - a\rangle. 
\end{aligned}
$$

Observe that $A\bar x - a \in K$ by Configuration 2 which had $a \in \text{rng}\; A - K$. 
It also has $y\in C(x^*) \subseteq \hat K^\circ \subseteq K^\circ$, 
Therefore, $\langle y^*, A\bar x - a\rangle \le 0$ by dual cone and hence it always has: 

$$
\begin{aligned}
    \langle y^*, Ax - a\rangle \le \langle y^*, A(x - \bar x)\rangle. 
\end{aligned}
$$

Next, the function in the supremum, $y^*\mapsto \langle y^*, A(x - \bar x)\rangle$ is a linear function, therefore it always attains supremum at extreme faces of convex $C(x^*)$. 
From part (a) we know all extreme points of $C(x^*)$ is in $W_1$ hence, the supremum is in fact equal and it's finite. 

$\blacksquare$
