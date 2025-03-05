- [Limit, Cluster Point of Sequence](../../MATH%20000%20Math%20Essential/Analysis/Limit,%20Cluster%20Point%20of%20Sequence.md)


---
### **Intro**

We introduce the special properties of the cluster point of a a type of sequences where it gets zero velocity. 

#### **Definition | Disconnected close subsets**
> Let the embient space be a metric space $(M, d)$. 
> Let $E \subseteq M$ be a closed set. 
> $E$ is disconnected if $E = S \dot\cup T$ where $S, T$ are relatively open in E. 

**Remarks**

$E$ is closed, $S, T$ are disjoint, then $S, T$ are closed sets. 
For any sequence $(x_n)_{n \in \N}$ converging in $E$, it either falls into $S$ or $T$, mutually exclusive. 
WLOG let $x_n$ converges in $S$ to $\bar x$. 
Hence the limit of the sequence is in $S$ because $\bar x \in C = S\;\dot\cup\; T$. 


#### **Theorem | Connected cluster point**
> Let $(x_n)_{n \ge 0}$ be a sequence in $\R^n$. 
> Let $C$ be the set of cluster point in $(x_n)_{n \ge 0}$ such that it's compact. 
> If, the sequence has $\lim_{n \rightarrow \infty} \Vert x_{n + 1} - x_n\Vert = 0$, i.e: eventually stationary. 
> Then the set $C$ must be a connected set. 


**Proof**

We prove the equivalent contrapositive statement. 
If $C$ is not a connected set, then it has $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert > \epsilon > 0$. 
Here are the key intermediate steps for the proof. 

**(Step I)**: From $C$ being disconnected so there exists $S, T$ none empty such that $C \subseteq S \dot\cup T$ and it has $\inf_{x \in T}\dist(x, S) > \epsilon > 0$. 
**(Step II)**: It can be shown that for all $N \in \N$ there exists some $n \ge N$ such that it has $\Vert x_{n + 1} - x_n\Vert > \epsilon$ so $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert \ge \epsilon$. 

**Showing (Step I)**. 
By definition of $\inf$, there exists $z_n \in T$ such that $\dist(z_n, S)\rightarrow 0$. 
There exists $z_{k_n} \rightarrow z$ by compactness of $S$. 
Therefore $\dist(z_{k_n}, S)\rightarrow 0$ implies $z \in S$ by closure of $S$. 
By closure of $T$, $z \in S$ as well. 
This contradicts $S\cap T = \emptyset$. 
Therefore no such sequence exists and $\inf_{x\in T}\dist(x, S) > \epsilon > 0$. 

**Showing (Step II)**. 
$S \subseteq C, T\subseteq C$ therefore for all $N \in \N$, there exists some $n\ge N$ such that $x_n \in S$ because $C$ is the set of cluster points, therefore it has $k =\inf_{n \ge N} \{x_n \in S\}\neq \emptyset$. 
Therefore, $x_{k + 1}\in T$ by definition. 
Applying results from the previous set it has $\Vert x_k - x_{k + 1}\Vert > \epsilon$ which concludes the proof. 
