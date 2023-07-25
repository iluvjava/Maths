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
    & 
    |f(x)| = |f(\alpha x_0)| = |\alpha|\Vert x_0\Vert
    \\
    \iff 
    & 
    \Vert f\Vert = 1, 
    \\
    \text{and: }
    & 
    f(x_0) = \Vert x_0\Vert
\end{aligned}
$$

therefore, $f$ is a bounded linear functional on $Z$, using the previous theorem, we have $\tilde f(x) = f(x)$ on $Z$ such that $\Vert \tilde f\Vert_X = \Vert f\Vert_Z = 1$, and $\tilde f(x_0) = \Vert x_0\Vert$. However, Hahn Banach theorem will extend $\tilde f$ to the whole domain $X$. 

**Remarks**

This theorem has profound consequences and it's directly applicable for weak convergence results in Banach space. Here, we advise the reader to think about some example under the $\Vert \cdot\Vert_p$, the  p-norm for the system. 

---
### **Proof of the Most General Hahn Banach Theorem**

The proof is long and no that trivial. We prove the Hahn Banach Theorem in general vector spaces with a real field. This theorem is an application of Zorn's lemma. The proof presented here is taken from Kryzig's textbook. List of quantities used in the proof and their meaning: 

* $X$, a generic vector space. 
* $\{\mathbf 0\}\neq Z\subseteq X$, a linear subspace of the space $X$
* $f:Z\mapsto \mathbb R$, the linear functional mapping from a subset $Z\in X$. 
* $p$, a sublinear functionals.  
* $E$, is the set of linear functional that extends $f$, this set has a partial order. 
* $C$ any chain from the set $E$. 

Define 
$$
E := \{g \text{ lin functional in }X \;|\; g(x) = f(x)\; \forall x \in Z, g(x)\le p(x)\; \forall x \in \text{dom}(g), Z\subseteq \text{dom}(g)\}
$$

observe that $f\in E\implies E \neq \emptyset$. Let $E$ be a partial order induces by $\succeq$ such that $g \preceq h$ if and only if $h(x) = g(x)$ for all $x\in \text{dom}(g)$, and $\text{dom}(h)\supseteq \text{dom}(g)$ and $h(x) = g(x)$ for all $x\in \text{dom}(g)$. Due to the induced partial orderin, let $C\subseteq E$ to be a chain that exists by the virtue of the partial order. For all such $C$, define $\hat g(x)$ by 

$$
\begin{aligned}
    & \forall g \in C, x\in \text{dom}(g): \hat g(x) = g(x) 
    \\
    \implies & 
    \hat g \text{ is a linfunc: } \text{dom}(\hat g) = \bigcup_{g\in C} \text{dom}(g)
    \\
    & \text{C is a chain } \implies \text{dom}(\hat g) \text{ is a vec space}
\end{aligned}
$$

this particular element $\hat g$ is the upper bound element of the set $C$, which is direct from the definition of $\hat g$, and $\preceq$ for chain $C$. By Zorn's lemma, and the fact that $C$ is arbitrary, it is implied that $\exists \tilde f$, which is the maximal element of the set $E$, with $\tilde f\in E$ means $\tilde f(x) \le p(x)$ for all $x \in \text{dom}(\tilde f)$. The next part of the proof will show that $\text{dom}(\tilde f) = X$ using proof by contradiction. Suppose for contradiction that $\exists y_1 \in X \setminus \text{dom}(\tilde f)$, define $Y_1 = \text{span}(\text{dom}(\tilde f), y_1)$. 

$$
\begin{aligned}
    & \mathbf 0 \in \text{dom}(\tilde f) \implies y_1 \neq \mathbf 0
    \\
    \implies&
    x\in Y_1 \text{ has repr } x = y + \alpha y_1 \;\forall y\in \text{dom}(\tilde f), \text{ uniquely}
    \\
    & \text{def } g_1: Y_1 \mapsto \mathbb R \text{ then } g_1(y + \alpha y_1) = \tilde f(y) + \alpha c
    \\
    & X \setminus  \text{dom}(\tilde f) \neq \emptyset \implies \alpha \neq 0
    \\
    & g_1 \text{ is linear}
    \\
    & c \text{ is a undertermined fixed constant.}
\end{aligned}
$$

Right at the start, we used the fact that $f\in E$ and $Z$ is a linear subspace of $X$ to determine that $\mathbf 0\in \text{dom}(f)$. The representation is unique because $y_1\not\in \text{dom}(\tilde f)$. Suppose that $y, z \in \text{dom}(\tilde f)$, consider

$$
\begin{aligned}
    \tilde f(y) - \tilde f(z) = \tilde f (y - z) &\le p (y - z)
    \\
    & \le p(y + y_1 - (y_1 + z))
    \\
    & \le p(y + y_1) + p( -y - z)
    \\
    \iff 
    -p(-y_1 - z) - \tilde f(z) &\le p(y + y_1) - \tilde f (y). 
\end{aligned}
$$

Next we show that for all $\alpha \neq 0$, the proposed extension $g_1$ of $\tilde f$ is legit. Assuming that $\alpha < 0$. Furthermore, from the left size, there is $z$ but not $y$, but on the right side, there is not a $y$ but not $z$, taking sup of $z$ on the left, and then $y$ on the right, suggest that we can make $c$ such that 

$$
\begin{aligned}
    -p(-y_1 - z) - \tilde f(z) \le c \le p(y + y_1) - \tilde f (y).  
\end{aligned}
$$

Assuming $a < 0$ then let $z = \alpha^{-1}y$ with $y \in \text{dom}(\tilde f)$ we have the substitutions: 

$$
\begin{aligned}
    -p(-y_1 - \alpha^{-1}y) - \tilde f(\alpha^{-1}y)
    &\le c
    \\
    \alpha p(-y - \alpha^{-1}y) + \tilde f(y) 
    &\le -\alpha c
    \\
    g_1(x) =\tilde f(y) + \alpha c &\le
    -\alpha p(-y_1 - \alpha^{-1}y) = p(\alpha y_1 + y) = p(x), 
\end{aligned}
$$

recall that $\alpha y_1 + y = x \in Y_1$, a form the represent any elements from $Y_1$. When $a \ge 0$ can make the substitution $y = \alpha^{-1}y$ to yield the same results as the above. Therefore, we had constructed another functional $g_1 \succeq \tilde f$, contradicting the maximality of $\tilde f$ on $E$. 