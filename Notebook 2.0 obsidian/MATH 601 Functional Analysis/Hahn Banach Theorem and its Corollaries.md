1. [Zorn's Lemma](Zorn's%20Lemma.md), 
2. [Linear Functionals and Dual Spaces](Linear%20Functionals%20and%20Dual%20Spaces.md)

---
### **Intro**

We state the theorem, and discuss its corollaries and consequences. Recall that $p$ is a sublinear mapping on a vector space $X$ when $p(x + y) \le p(x) + p(y)$, and $p(\alpha x) \le |\alpha| p(x)$. 

#### **Thm (4.2-1) | Hahn Banach Theorem**
> Let $X$ be a vector space, let $Z\subseteq X$, let 
> 1. $f: Z\mapsto \mathbb R$ be a linear functional. 
> 2. $p:Z\mapsto \mathbb R$ be a sub-linear functional.
> Then it's possible to extend $f$ to $\tilde f: X\mapsto \mathbb R$, such that $f = \tilde f$ on $Z$, and $\tilde f \le p$ on $X$. 
> 
> Referenced from (4.2-1) from Kryzig's textbook, intrductory functional analysis. 

**Note**:

$p$ is a sub-linear functionals when $p(x + y) \le p(x) + p(y)$. 


#### **Thm (4.3-2) | Hahn Banach in Banach Space**
> The norm $\Vert \cdot\Vert$ is a sub-linear functionals in Banach space. Let $f$ be a bounded linear functional in the subspace $Z\subseteq X$, then there exists a bounded linear functional $\tilde f$ on $X$, which is an extension of $f$ on $Z$, i.e: $f(x) = \tilde f(x)$ for all $x \in Z$, and they satisfy: 
> $$
>   \Vert f\Vert_X = \Vert f\Vert_Z,
> $$
> Where $\Vert f\Vert_Z := \sup_{x\in Z}|f(x)|/\Vert x\Vert$, and $\Vert f\Vert_X := \sup_{x\in X} |f(x)|/\Vert x\Vert$. 

**Proof**

When $f$ is the zero functional, there exists the zero functional on $X$ that serves as the trivial extension of $f$. From the norm of $f$ we have $|f(x)| \le \Vert x\Vert \Vert f\Vert_Z$, for all $z \in Z$, define $p(x) := \Vert f\Vert_Z \Vert x\Vert$, which is a sub-linear functional determined by the property of the norm. By the original H.B theorem, there exists $\tilde f$ such that $\tilde f(x) \le \Vert x\Vert \Vert f\Vert_Z$, since $p$ is on $X$: 
$$
\begin{aligned}
    \sup_{x\in X} \frac{|\tilde f(x)|}{\Vert x\Vert} \le \Vert f\Vert_Z, 
\end{aligned}
$$

choose any $x_0\in Z$, then we have $f(x_0) = \tilde f(x_0)$, hence, the above can become an equality. 


#### **Corollary-1 (4.3-3) | Bounded Linear Functional Theorem**
> Let $X$ be a normed space and $x_0 \neq \mathbf 0$ be any element of $X$, then there exists a bounded linear functional $\tilde f$ such that $\Vert \tilde f\Vert = 1, \tilde f(x_0) = \Vert x_0\Vert$. 

**Proof**: 

Let $Z\subseteq X$ be $\text{span}(x_0)$, on $Z$ define $f(x) = f(\alpha x_0)= \alpha \Vert x_0\Vert$ for all $x\in Z$, obviously

$$
\begin{aligned}
    & |f(x)| = |f(\alpha x_0)| = |\alpha|\Vert x_0\Vert
    \\
    \iff 
    & \Vert f\Vert = 1, 
    \\
    \text{and: }& f(x_0) = \Vert x_0\Vert
\end{aligned}
$$

therefore, $f$ is a bounded linear functional on $Z$, using the previous theorem, we have $\tilde f(x) = f(x)$ on $Z$ such that $\Vert \tilde f\Vert_X = \Vert f\Vert_Z = 1$, and $\tilde f(x_0) = \Vert x_0\Vert$. However, Hahn Banach theorem will extend $\tilde f$ to the whole domain $X$. 

**Remarks**

This theorem has profound consequences and it's directly applicable for weak convergence results in Banach space. 

---
### **Proof of the Most General Hahn Banach Theorem**

The proof is long and no that trivial. We prove the Hahn Banach Theorem in general vector spaces in this section. 

**Basic Quantities**

