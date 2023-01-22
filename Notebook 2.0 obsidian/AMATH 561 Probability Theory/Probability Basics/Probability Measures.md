[[Probability Spaces]]

---
### **Intro**

A probability measure is a special type of measure placed on a probability spaces. Denoted as $p(x)$. Mapping from $\mathcal{F}$ to $[0, 1]$. Firstly, we define what a measure is. 

**Definition of a measure**: 

> $$
> \begin{aligned}
>       \text{(i)}&\quad   \mu(A) \ge \mu(\emptyset) = 0 \quad \forall \; A \in \mathcal{F}, 
>       \\
>       \text{(ii)}&\quad A_i \in \mathcal{F} \implies \mu (\cup_i A_i) = \sum_{i}^{}\mu(A_i),
> \end{aligned}
> $$
where $\mathcal F$ is a set of set, denoting all the subsets of $\Omega$. And for the second conditions, we have a sequence of finite, or countable many infinite elements from the probability spaces. Notice that the nonneativity of measure is included in the first condition. 

**Remarks**

Measure is trying to construct a homomorphism between the group of sets $\mathcal F$ to the groups of positive reals, where the group of sets is based on the $\cup$ operator and the group of positive reals based on the $+$ operator. 

**Definition of a probability measure**

> For probability measure is a measure satisfiying: 
> 
> $$
> \mu(\Omega) = 1.
> $$

---
### **Properties of Measures**

$$
\begin{aligned}
    &\text{(i)}\quad A\subseteq B \implies \mu(A)\le \mu(B)
    \\
    &\text{(ii)}\quad 
    A\subseteq\bigcup_m A_m \implies \mu (A) \le \sum_{m}^{}\mu(A_m) 
    \\
    &\text{(iii)}\quad 
    \left(
	    A_i \subseteq A_{i + 1}\;\forall i 
    \right)
    \wedge
    \left(\bigcup_iA_i = A \right)
    \implies 
    \mu(A_i) \le \mu(A) \wedge \lim_{i \rightarrow \infty} \mu(A_i) = \mu(A)
    \\
    &\text{(iv)}\quad 
    \left(
        A_{i + 1}\subseteq A_i \; \forall i
    \right) \;\wedge\; 
    \left(
        \bigcap_i A_i = A
    \right) 
    \;\wedge\;
    \left(
        \mu(A_i) < \infty 
    \right)
    \implies \mu(A_i) \ge \mu(A_{i + 1}) \;\wedge\; \lim_{i\rightarrow \infty} \mu(A_i) = A
\end{aligned}
$$

For property (iii) and (iv) we are assuming countable sequences. 

**Proof(i)**

Treat $B$ as $A \cup (B\setminus A)$ then use the summation rule and the non-negativity rule. 

**Proof (ii)**

$$
\begin{aligned}
    & A\subseteq B 
    \\
    & \mu(B) = \mu(A\cup(B - A)) = \mu(A) + \mu(B - A)\ge \mu(A)
    \\
    & \mu(A)\le \mu(B)
\end{aligned}
$$

**Proof (iii)**

Given a sequence of $A_i$, define $B_i = A_i - A\bigcap_{j\neq i}A_j$ for each $A_i$ then all $B_i$ will be disjoint sets and $B_i \subseteq A_i$ for all $i$. Therefore, we can state that the measure on all the sets of $B_i$ will be: 

$$
\begin{aligned}
    & \mu\left(\bigcup_iA_i\right) = 
    \mu\left(\bigcup_i B_i\right) = \sum_{i}^{}\mu (B_i) \le \sum_{i}^{}\mu(A_i)
\end{aligned}
$$

We make use of property (ii). 
