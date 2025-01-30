[[Topological Basics for Optimizations]], 
We assume that the background set for our topology is the Euclidean space. 

----
### **Closure**


The closure for a set $Q\subseteq \R^n$ relative to a background $\R^n$ is the set of all points such that, the epsilon ball of that point has non-empty intersection of that set. Let's denote the closure set as $\text{cl}(Q)$, where $Q$ is the set under discussion. 

> $$
> \forall x \in \R^n: (x \in \text{cl}(Q) \iff 
> \forall \epsilon > 0: (\mathbb{B}_\epsilon \cap Q) \neq \emptyset)
> $$

**Remarks**

A closed set is not necessarily complete. For the set $\mathbb{Q}$ which is not complete, but it still has the epsilon ball intersecting region with itself for for very element from it. Even worse, the Cantor set in the real line is a closed set. See more in [[The Cantor Set]]. 

**Facts**
* A set is closed, if its complement is an open set. 
* A set is closed, if the limit of very sequence in the set is also in the set. 

---
### **Closure in complete metric spaces**

Let $(M, d)$ defines a complete metric space. 

#### **Def | Epsilon ball in metric space**
> For all $x \in M, \epsilon > 0$, define $\mathbb B_\epsilon(x) = \{y | d(x, y) < \epsilon\}$. 
> This is an open ball around $x$. 

#### **Def | Closure**
> A set $C \subseteq M$ is closed if and only if for all $x \in M, \epsilon > 0$, $\mathbb B_\epsilon (x) \cap C \neq\emptyset$. 

#### **Def | Relatively closed**
> A set $C \subseteq M$ is relatively closed in $A$ if and only if there exists a closed set $\widetilde A \subseteq X$ such that $\widetilde A \cap A = C$. 

**Example**

The set $[1/2, 1)$ is relatively closed in the set $(0, 1)$. 
There exists closed set $[1/2, 2] \cap (0, 1) = [1/2, 1)$. 

#### **Claim | Set subtraction and relative closedness**
> For all $O \subseteq X$ that is open and for all $B \subseteq X$, the set $B \setminus \mathcal O$ is relatively closed in $B$. 

**Proof**

Let $O \subseteq X$ be any open set. 
Consider $\widetilde B = B \setminus O$ which is a closed set. 
We have 

$$
\begin{aligned}
    \widetilde B \cap B &= 
    B \cap  O^\complement \cap B
    \\
    &= B \cap O^\complement = B \setminus O. 
\end{aligned}
$$

Therefore, the set $B \setminus O$ is relatively closed in $B$. 






