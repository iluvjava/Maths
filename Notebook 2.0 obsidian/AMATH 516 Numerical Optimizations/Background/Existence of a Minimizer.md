[[Topological Basics for Optimizations]],[[Characterizing Functions for Optimizations]]

---
### **Existence of a minimizer**

The existence of a minimizer depends on the continuity and the compactness of a subset of the domain of the function. 

**Theorem: Closed Epigraph**

> The epigraph of a function is closed iff the function is lower-semi-continuous. 

**Proof**:

See proof in [[Lower Semi-Continuity is Closedness of Epigraph]]. 


**Definition: Coercive Function**

> Function $f:\mathbf{E}\mapsto \mathbb{\bar{R}}$ is coercive if for any sequence $x_i$ with $\Vert x\Vert_i\rightarrow \infty$ it must be that $f(x_i)\rightarrow + \infty$. 

**Lemma: Minimizer over a Closed Set**

> For a proper, closed function $f$ over a compact set $C$ where $\text{dom}(f)\cap C\neq \emptyset$, then the function will attain a minimum over the set $C$. 

**Proof**

Consider $f_{\text{opt}} = \inf_{x\in C}f(x)$. Then $\exists (x_n)_{n\in \mathbb N}$ such that $f(x_n)\rightarrow f_{\text{opt}}$. Take subsequence $x_{n_k}$ that converge to some point $\bar x$ (Bozano Wierestrass), using the lower semi-continuous property of $f$, we have: 

$$
    f(\bar x) \le \lim\inf_{k\rightarrow \infty} f(x_{n_k}) = f_{\text{opt}}
$$

$\bar x$ is well defined via Bozano Weierstrass, and it's also a minimizer of the function over $C\cap \text{dom}(f)$. 

**Remarks**

What is the role of having the function to be a proper function? 

> The proof seems so obvious, but it's not so much at the same time, we need to be aware of all the assumptions and why they are important to this proof of the theorem. The function will have to be proper, for all $x$, $f(x) = -\infty$ or $f(x) = \inf$. It comes with $\text{dom}(f)\neq \emptyset$, make things convenient. 

What is the role of l.s.c or closedness of the function?

> Function $f$ being a closed function implies no discontinuities that goes up. This can be seemed a generalization on the continuity conditions from the usual extreme value theorem from introduction to real analysis and calculus. It asserts that the function indeed takes the minimum value at the point $\bar x$, instead of jumping up due to some type of discontinuity. 

What is the role for the closure of $C$? 
> If the set $C$ is open, then, the limit of the sequence might not be in $C$ at all, hence, creating a limiting sequence that can make the function small, but the actual limiting point, the minimizer we wan't can't be defined in $C$, or the domain of the function, this is a type of non-existence of the minimizer. 

Finally, why/how do we use the Weistrass Theorem (Sequential Compact Theorem)?

> Observe that it's the set $\arg\inf_{x\in C}f(x)$ can have any type f topology or cardinality we want it to be. The sequence $x_n$ such that $f(x_n) \rightarrow f_{\text{opt}}$ doesn't have to converge in anything, it can circle around inside of the set. Therefore, we have to make use of the compactness of $C$ and the existence of converging subsequence for it to converge to on, and just one of the point in the compact region, say $\bar x$ such that it attain the minimum of $f(\bar x) = f_{\text{opt}}$. 

---
### **Coersive Proper L.S.C Function has Minimizer in a Closed Set**

> let $f$ be a proper, closed, and coercive function, let $S\subseteq \mathbb E$ be an non-empty closed set such that $\text{dom}(f)\cap S \neq \emptyset$, then $f$ attains some minimums in $S$. 

**Proof**

Choose any $x\in \text{dom}(f)\cap S$ (By properness of the function), from the coerciveness of the function $f$, there exists $M$: 

$$
\begin{aligned}
    f(x) \ge f(x_0)\ge \inf_{x\in \mathbb E} f(x) \quad \forall x: \Vert x\Vert\ge M. 
\end{aligned}
$$

For any minimizer of $f$ over $S$, denoted as $\bar x$, satisfies: $f(\bar x)\le f(x_0)$, then follows from above that $S\cap \{x: \Vert x\Vert\le M\}$ is a compact set. By Bozano Weistrass Theorem for closed function, from previous section, $\bar x$ is in $\text{dom}(f)\cap S$.


---
### **Existence of Minimizer**

> Suppose that $f$ is lsc and proper and coercive, then it contains a minimizer. There could be many minimizers, but it contains at least one global minimizer. 

**Proof**

Since $f$ is proper, there exists some $x_0$ such that $f(x)$ is finite, then the level set $C := \{x: f(x) \le f(x_0)\}$: 
- it is bounded by the coersive property. If not, then there exists $x_n$ such that $\lim_{n\rightarrow \infty} \Vert x_n\Vert = \infty$, then $f(x_0)=\infty$, contradicting f is proper. 
- it's closed by l.s.c, and the function attains minimum inside of $C$. For all limiting sequence $x\rightarrow \bar x, x_n\in C$ we have $\lim_{n\rightarrow \infty} f(x_n) \ge \lim\inf_{n\rightarrow \infty} f(x_n)\ge f(\bar x)$, hence $\bar x \in C$ still, the set $C$ is closed. 

Therefore $C$ is compact and intersect the domain of the function by the choice of $x_0$. Invoke previous theorem about the existence of a minimizer over a compact set, we are done. 


**References**: 

This proof is closest to Amir's Beck Proof. 

---
### **Heinz's Compact Proof**

> Let $f:X\mapsto (-\infty, + \infty]$ be a coercive, l.s.c, and proper. Prove that $f$ has a minimizer. 

**Proof**

By proper, $\exists x: f(x) < \infty \implies \exists \mu =\inf f(X)$ with $(x_n)_{n\in \N}$ such that $\lim_{n\rightarrow \N} f(x_n) = \mu$ by the definition of infimum.  

**Claim**: 
> The sequence $(x_n)_{n\in \N}$ has to be always be bounded. 

Suppose for contradiction that this is not the case, such that there exists $\lim_{n\rightarrow \infty}f(x_n) = u \wedge \lim_{n\rightarrow \infty}\Vert x\Vert = \infty$, then by coersivity, $f(x_n) = \infty, n \rightarrow \infty$, meaning that $\mu = \infty$, contradicting that $f$ is proper. 

Using the fact that $\Vert x_n\Vert$ is bounded, then it can be describeed through the set $S = \{x| \Vert x\Vert < \infty\}$, and this set will be compact. Therefore, we have a subsequence $x_{n_k} \rightarrow \bar x$ by Bozano Weierstrass, giving us $\lim_{k\rightarrow \infty}f(x_{n_k}) = \mu$ and $\lim_{k\rightarrow \infty} x_{n_k} = \bar x$, where $\bar x$ will be our minimizer because by l.s.c: 

$$
\begin{aligned}
    & \lim_{k\rightarrow \infty} 
        f(x_{n_k}) \ge {\lim\inf}_{k\rightarrow \infty}f(x_n) \ge f(\bar x), 
        \\
    \implies &
    \lim_{k\rightarrow \infty} f(x_{n_k}) = \mu = f(\bar x)
\end{aligned}
$$

**Remarks**

Professor Heinz seems to made the assumption that $-\infty < f(x)$ for all $x$, and it seems to be unnecessary. 

**References**: Heinz's UBCO, course note. 

