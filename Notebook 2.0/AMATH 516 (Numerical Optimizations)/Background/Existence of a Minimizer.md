[[Topological Basics for Optimizations]]
[[Characterizing Functions for Optimizations]]

---
### **Existence of a minimizer**

The existence of a minimizer depends on the continuity and the compactness of the set. And to do that we need to define a few things first. 

**Theorem: Closed Epigraph**

> The epigraph of a function is closed iff the function is lower-semi-continuous. 

**Proof**: Not yte given. 

**Coercive Function**

Recall Definition: 
> Function $f:\mathbf{E}\mapsto \mathbb{\bar{R}}$ is coercive if for any sequence $x_i$ with $\Vert x\Vert_i\rightarrow \infty$ it must be that $f(x_i)\rightarrow + \infty$. 

**Weistrass Theorem for Closed Function**

> For a proper, closed function $f$ over a compact set $C$ where $\text{dom}(f)\cap C\neq \emptyset$, then the function is bounded from below, and it will attain a minimum over the set $C$. 

(a) Function $f$ is bounded below. 

**Proof (a)**

For contradiction suppose other wise that it's not bounded below. Then there exists a sequence $\{x_n\}_{n\in \mathbb N}$ such that: 

$$
\begin{aligned}
    \lim_{n\rightarrow \infty} f(x_n) = -\infty
\end{aligned}
$$

From Bozano Weistrass, there is a subsequence $\{x_{n_k}\}_{k\ge 1}$ such that it converges to $\bar x\in C$ by the compactness of the set $C$. Because the function is closed, it's equivalent to lower-semi-continuous. Which means that: 

$$
\begin{aligned}
    f(\bar x) \le \lim\inf_{k\rightarrow \infty} f(x_{n_k})
\end{aligned}
$$

Contradicting the fact that the function is proper. 


**Proof (b)**

Since the function is bounded below, and the function is closed, consider $f_{\text{opt}}$ to be the minimum value over $C$. Then $\exists \{x_n\}_{n\in \mathbb N}$ such that $f(x_n)\rightarrow f_{\text{opt}}$. Take subsequence that converge to some point $\bar x$, using the lower semi-continuous property of $f$, we have: 

$$
    f(\bar x) \le \lim\inf_{k\rightarrow \infty} f(x_{n_k}) = f_{\text{opt}}
$$

Proven. 

**Remarks**

The proof seems so obvious, but it's not so much at the same time, we need to be aware of all the assumptions and why they are important to this proof of the theorem. The function will have to be proper, if not, the minimum is just $-\infty$, which it HAS a minimum, but it's not neccessarily useful. 

Function $f$ being a closed function implies no discontinuities that goes up. For example consider the following function defined on $[-M, M]$ where $M\ge 0$ where $M$ is assumed to be larger, then we consider this function: 

$$
\begin{aligned}
    f(x):= \begin{cases}
        -1/x^2 & x \neq 0
        \\
        0 & x = 0
    \end{cases}
\end{aligned}
$$

Observe that, the function can approach $-\infty$ as much as it wants, but the limiting point is not $-\infty$, and in this case, the minimum of the function doesn't exist. 

If the set $C$ is open, then, the limit of the sequences might not be in $C$ at all, hence, creating a limiting sequence that can make the function small, but the actual limiting point can'be attained. Creating problem for the minimum of the function over the region. 

Finally, **why do we use the Weistrass Theorem (Sequencial Compact Theorem)**? This is true because there could be infinitely many points on set $C\subseteq \text{dom}(f)$ such that it attains the minimum, or a desired value, however, it doesn't mean that they converge to a certain point. If we remove the assumption that $C$ is compact, then it's possible that some sequence $\{x\}_{n\in \mathbb N}$ such that the sequence diverges, but $f(x_n)$ converges to some minimum. Therefore, we have to make use of the compactness of $C$ and the existence of converging subsequence for it to be rigourous. 


---
### **Existence of Minimizer Theorem**

> let $f$ be a proper, closed, and coersive function, let $S\subseteq \mathbb E$ be an non-empty closed set such that $\text{dom}(f)\cap S \neq \emptyset$, then $f$ attains some minimums in $S$. 

**Proof**

Choose any $x\in \text{dom}(f)\cap S$, from the coersiveness of the function $f$, there exists $M$: 

$$
\begin{aligned}
    f(x) > f(x_0) \quad \forall x: \Vert x\Vert\ge M
\end{aligned}
$$

For any minimizer of $f$ over $S$, denoted as $\bar x$, satisfies: $f(\bar x)\le f(x_0)$, then follows from above that $S\cap \{x: \Vert x\Vert\le M\}$ is a compact set. By Weistrass Theorem for closed function, from previous section, $\bar x$ is in $\text{dom}(f)\cap S$. 

**Remarks**

Compare to the Weistrass's theorem, we consider the the difference between this theorem and the above. The Existence of minimizer exists for all $S\subseteq \mathbb E$, which is the difference. Under these sets of assumptions, we are remained with a class of functons that looks like a bowl on the large scale because it's coersive, and if we shine lights from the bottom of the function, it will perfectly describe the epigraph of the function (closeness), and the function is bounded below. 


