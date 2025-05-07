- [Limit, Cluster Point of Sequence](../../MATH%20000%20Math%20Essential/Analysis/Limit,%20Cluster%20Point%20of%20Sequence.md)


---
### **Intro**

We introduce the special properties of the cluster point of a type of sequences where it gets zero velocity. 

#### **Definition |  disconnected set**
> Let metric space $(M, d)$ be the ambience space. 
> Let $E \subseteq M$. 
> E is disconnected if, there exists $A, B \subseteq M$ such that: 
> 1. $A, B$ are open sets. 
> 2. $A\cap B= \emptyset$, so they are disjoint set. 
> 3. $E \subseteq A \cup B$. 
> 4. $A \cap E \neq \emptyset \neq B \cap E$. 


#### **Theorem 1 | Disconnected close set**
> Let the ambient space be a metric space $(M, d)$. 
> Let $E \subseteq M$ be a closed set.  
> Then, $E$ is disconnected if there exists $S, T$ such that $E = S \dot\cup T$ where $S, T$ are closed closed, nonempty, disjoint set. 

**Proof**

Let $E$ be disconnected, then from the definition there exists $A, B$ such that
1. $A, B$ are open sets. 
2. $A\cap B= \emptyset$, so they are disjoint set. 
3. $E \subseteq A \cup B$. 
4. $A \cap E \neq \emptyset \neq B \cap E$. 
5. $E$ is a closed set. 

Then, the following results about $E \setminus A, E \setminus B$ are true and they will be derived by the end. 
- **(a)**: $E \setminus A, E \setminus B$ are closed set. 
- **(b)**: $(E \setminus A)\cup (E \setminus B) = E$, they cover the set $E$. 
- **(c)**: $(E \setminus A)\cap (E \setminus B) = \emptyset$, they are disjoint. 

Therefore, let $S = E \setminus A, T = E \setminus B$, then the theorem is true. 
Item (5) implies that $S, T$ are nonempty set as well. 

**Proof of (a)**. $E \setminus A = E \cap A^\complement$, $E, A^\complement$ are closed therefore $E \setminus A$ is closed. 
The proof for $B$ is follows the identical logic. 

**Proof of (b)**. 
Set algebra has 
$$
\begin{aligned}
    (E \setminus A) \cup (E \setminus B)
    &= \left(E \cap A^\complement\right) \cup \left(E \cap B^\complement\right)
    \\
    &= E \cap \left(
        A^\complement \cup B^\complement
    \right)
    \\
    &= E \cap (A \cap B)^\complement
    \\
    &\underset{(2)}{=} E \cap \emptyset^\complement
    \\
    &= E. 
\end{aligned}
$$

**Proof of (c)**. 
Set algebra has 

$$
\begin{aligned}
    \left(
        E\setminus A
    \right) \cap \left(
        E \setminus B
    \right)
    &= \left(
        E\cap A^\complement
    \right) \cap \left(
        E \cap B^\complement
    \right)
    \\
    &= E \cap A^\complement \cap B^\complement
    \\
    &= E \cap (A \cup B)^\complement 
    \\
    &\underset{(3)}= \empty. 
\end{aligned}
$$

$\blacksquare$


#### **Theorem 2 | Connected cluster point**
> Let $(x_n)_{n \ge 0}$ be a sequence in $\R^n$. 
> Let $C$ be the set of cluster point in $(x_n)_{n \ge 0}$ such that it's compact. 
> If, the sequence has $\lim_{n \rightarrow \infty} \Vert x_{n + 1} - x_n\Vert = 0$, i.e: eventually stationary. 
> Then the set $C$ must be a connected set. 

**Proof**

We prove the equivalent contrapositive statement. 
If $C$ is not a connected set, then it has $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert > \epsilon > 0$. 
Here are the key intermediate steps for the proof. 

- **(Step I)**: $C$ is disconnected therefore, there exists $S, T$ none empty, disjoin and closed such that $C \subseteq S \dot\cup T$ **Theorem 1** and, there exists $\epsilon$ such that $\inf_{x \in T}\dist(x, S) > \epsilon > 0$. 
- **(Step II)**: Using previus results, it can be shown that for all $N \in \N$ there exists some $n \ge N$ such that it has $\Vert x_{n + 1} - x_n\Vert > \epsilon$ so $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert \ge \epsilon$. 
This contradicts eventual stationarity of the sequence. 

**Showing (Step I)**. 
For contradiction, consider $\inf_{x \in T}\dist(x, S)=0$, there exists $z_n \in T$ such that $\dist(z_n, S)\rightarrow 0$. 
There exists $z_{k_n} \rightarrow z$ by compactness of $T$ from compactness of $S$. 
Therefore, $\dist(z_{k_n}, S)\rightarrow 0$ implies $z \in S$ by closure of $S$. 
Then, $z \in S$ and $z \in T$. 
This contradicts $S\cap T = \emptyset$. 
Therefore, no such sequence exists and $\inf_{x\in T}\dist(x, S) > \epsilon > 0$. 

**Showing (Step II)**. 
<!-- 
$S \subseteq C, T\subseteq C$ therefore for all $N \in \N$, there exists $n\ge N$ such that $x_n \in S$ or $x_n \in T$ because $C$ is the set of cluster points, therefore $k =\inf_{n \ge N} \{n : x_n \in S, x_{n + 1}\in T\}\neq \emptyset$. 
Then, $x_{k = 1}\in T$ by definition. 
Applying results from the previous set it has $\Vert x_k - x_{k + 1}\Vert > \epsilon$ which concludes the proof.  
-->
For all $K \in \N$, there exists $k \ge K$ such that $x_{k} \in S$, $x_{k + 1} \in T$, this is true because $C$ is the set of cluster points for $(x_n)_{n \in \N}$. 
For all $\epsilon' \ge 0, N \in \N$, $\exists\; n \ge \max(N, N(\epsilon'))$ such that $\dist(x_n, C) \le \epsilon'$. 
Let $K = \max(N, N(\epsilon'))$, it implies $\exists k$ such that $\dist(x_k, S)\le \epsilon', \dist(x_{k + 1}, T) \le \epsilon'$. 
By closure of $S, T$ there exists $y_k \in S: \Vert x_k - y_k\Vert\le \epsilon'$ and there exists $z_{k + 1} \in T: \Vert x_{k + 1} - z_{k + 1}\Vert\le \epsilon'$. 
Choose $\epsilon' = \epsilon/4$, then consider the following inequalities

$$
\begin{aligned}
    \Vert x_k - x_{k + 1}\Vert &\ge 
    \Vert x_k - z_{k + 1}\Vert - \Vert x_{k + 1} - z_{k + 1}\Vert
    \\
    &= \Vert x_k - y_k + y_k - z_{k + 1}\Vert - \Vert x_{k + 1} - z_{k + 1}\Vert
    \\
    &\ge \Vert y_k - z_{k + 1}\Vert - \Vert x_k - y_k\Vert - \Vert x_{k + 1} - z_{k + 1}\Vert
    \\
    &\ge \epsilon - \epsilon' - \epsilon' = \epsilon/2. 
\end{aligned}
$$

Therefore, **Step II** is now complete. 
$\epsilon/2$ doesn't matter because we only need to show this is true for any $> 0$ quantity. 

**Remarks**

There should be a counter example for the case when compactness of the cluster point property is removed.
Not sure how that counter example looks like. 


#### **Theorem | Finite many cluster point**
> Let $(x_n)_{n \in \N}$ be a sequence in $\R^n$ that is bounded. 
> If $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert = 0$, and it has finitely many cluster points, then the sequence has a limit.

**Proof**

The proof is direct using previous theorem. 
The sequence is bounded implies compactness of the set of cluster point (name it $C$) of $x_n$. 
Any discrete set of finitely singletons in $\R^n$ is never connected except the case when there is only one singleton. 

