[[Matroid]]


---
### **Intro**

The following theorem is stated as theorem 1.11 in the textbook for this given course. Let's first abstract out some of the construct for the Kruskal MST algorithm, and use it on a Matroid. Let $(X, \mathcal B)$ be a matroid defined via the basis definition of the matroid together with a cost function $w:E \mapsto \mathbb R_+$, then the algorithm is stated like: 

$$
\begin{aligned}
    & S := \emptyset
    \\
    & \text{while: }S\neq\mathcal B
    \\
    \hspace{1.1em} &
    \text{choose: }x \in X\setminus S \text{ of min weight and s.t: } S\cup \{x\}  \subseteq B, B\in \mathcal B
    \\
    \hspace{1.1em}&
    S:= S\cup \{x\}
\end{aligned}
$$

In this case, we continuing choosing an element from the set $X$ that is not part of the solution set $S$ that we are building, and then we consider adding new element that is not in the set and yet contains the element of another solution in the basis, and then adding that would make it become a basis. The algorithm terminates when there is no such an $x$ satisfying the conditions. 

---
### **Theorem Statement**

> Let $|A| = |B|$ for all $A,B \in \mathcal B$ and $\mathcal B\neq \emptyset$ and $(X, \mathcal B)$ is a matroid iff for all $w:X\mapsto \mathbb R$, the greedy algorithm finds a set $S\in \mathbb B$ of minimum weight. hh

There are 2 directions to prove. To prove the $\impliedby$ we consider the use of a prove by contradiction. We assume that something is not a matroid, and then we show that there is a special weight function that breaks the greedy algorithm when it's not a matroid. When $(X, \mathcal B)$ isn't a matroid it means that: 

> $$
> \begin{aligned}
> \exists A, B, \forall a\in A\setminus B, b \in B \setminus A: 
> (B\cup \{a\})\setminus \{b\}\not\in \mathcal B
> \end{aligned}
> $$
There are 2 basis $A, B$ such that they can't exchange any of their element. Let's consider the following weight function: 

$$
w(x) = \begin{cases}
    -1 & x = a
    \\
    0 & x \in B
    \\
    + \infty & \text{else}
\end{cases}
$$

Initialize the Greedy algorithm so it does the following: 

$$
\begin{aligned}
    S_1 &= \{a\}
    \\
    & (...)
    \\
    S_n &= \{a\}\cup S \in \mathcal B
\end{aligned}
$$

Observe that $(B\setminus\{b\})\cup \{a\}\notin \mathcal B$; but $S\cup \{a\}\in \mathcal B$, therefore it has to be the case that $S\not\subseteq B$, and that would mean $w(S) = \inf$, because at least one element is not $\in B$. However remember that $w(B) = 0$, which is better than $\infty$, therefore, greedy Algorithm failed for this function. 



