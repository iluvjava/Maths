* [Continuous Mapping](Continuous%20Mapping.md)


---
### **The Pre-image of the function Preserves Opened Sets and Closed Sets**

A functional is continuous when the pre-image mapping of the functional is preserving the closed or the opened sets, from the range of the function back to the domain of the function. 

**Theorem Statement**
> Let $X,Y$ be 2 normed spaces, then $f:X\mapsto Y$ is a mapping then: f is continuous if and only if ($V\subseteq Y$ is open $\implies f^{-1}(V)$ is open)

**Notes**

$f^{-1}(V)$ is simply the pre-image of the set. 

**Proof**

We show that: $V\subseteq Y$ is open implies $f^{-1}(V)$ implies the fact that $f$ is a continuous mapping. Let any $\bar y \in V$ where $V$ is an opened subset of $Y$. $\exists \bar x \in f^{-1}(V): f(\bar x) = \bar y$. Using the fact the set $V$ is opened, we have: 

$$
\begin{aligned}
   & \exists \epsilon > 0: y\in \mathbb B(\bar y, \epsilon)\setminus \{\bar y\} \implies 
   y\in V
   \\
   & \mathbb B (\bar y, \epsilon)\subseteq V
\end{aligned}
$$

Using the fact that $f$ is a continuous mapping: 

$$
\begin{aligned}
    & \forall \epsilon \ge 0 \; \exists \delta \ge 0: x\in \mathbb B(\bar x, \delta)
    \implies
    \Vert f(x) - f(\bar x)\Vert = \Vert f(x) - \bar y\Vert\le \epsilon
    \\
    \implies
    &f(x) \in \mathbb B (\bar x, \epsilon)
    \\
    \implies & 
    x \in f^{-1}(\mathbb B(\bar x, \epsilon))
    \\
    \implies &
    x \in f^{-1}(V)
    \\
    & \mathbb B(\bar x, \delta) \subseteq f^{-1}(V)
\end{aligned}
$$

Therefore, there is a way, to find such a $\delta$ for all $\epsilon$ bounding the openedness of the set $V$ for all $\bar y \in V$. For the converse directions, we consider that $f^{-1}(V)$ is an opened set for all $V \subseteq Y$ that is opened, then consider choosing any opened subset $\mathbb B(f(c), \epsilon)\subseteq Y$, $f(c) \in Y$: 
$$
\begin{aligned}
    & V:= \mathbb B(f(c), \epsilon)
    \\
    \implies& 
    f^{-1}(V) \text{ is opened. }
    \\
    & c\in f^{-1}(V)
    \\
    \implies& 
    \exists \delta > 0: \mathbb B (c,\delta) \subseteq f^{-1}(V)
    \\
    \implies & 
    x \in \mathbb B(c, \delta)\implies x \in f^{-1}(V)
    \\
    \implies &
    x \in \mathbb B(c, \delta)\implies f(x)\in f^{-1}(V)
\end{aligned}
$$

And the last statement implies that the output of the mapping for any given $x$ in an delta ball in the domain would imply that it's also $\epsilon$ bounded on the range of the function around the point. 


**Remarks**

The theorem doesn't mean that a continuous mapping preseves the openness of a given set. 

**Source**

This is the theorem 2.1 from the textbook \<A Friendly Introduction to Functional Analysis\>. 


---
### **Corollray**
> Let $f: X\mapsto Y$ be a mapping, then $f$ is continuous if and only if $\forall F\subseteq Y$ that is a closed set, $f^{-1}(F)$ is also closed. 

To prove the theorem we make use of the following obvious facts:
* $F\subseteq Y \implies f^{-1}(Y\setminus F) = X\setminus f^{-1}(F)$. 
* If $F$ is closed, then $F^{C}$, the complement of $F$ is opened and vice versa. 

**Proof**
Skipped. 

