---
alias: Kuratowski Convergence Set Convergence

---
- [Set Limit Part I](Set%20Limit%20Part%20I.md)
- [Multivalued Functions, Set-valued Mappings](../Operators%20Theory/Multivalued%20Functions,%20Set-valued%20Mappings.md)
- [Metric Space Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Metric%20Space%20Introduction.md)

---
### **Intro**

In this section the concept of a set limit can be strengthened by the introduction of a metric space. 
The set limit introduced in the previous section is readily available by choosing the discrete metric for the underlying metric space. 
Recall that subsequence $\mathcal N_\infty^\#$ is the set of all subsequences of the sequence of natural numbers. 
Denote $\mathcal N_\infty$ to be the set of subsequences of natural number such that it only differs on finite many positions. 
Please also recall the projection operator of sets $\Pi_C(x) \ni y$  means that $\Vert y - x\Vert  = \inf_{x \in C} \Vert y - x\Vert$, $y$ is the closest vector to vector $y$ in the set $C$. 
Before we start, we define the following quantities relevant to discussion of set limits in complete metric space and Banach spaces. 

**References**

Some concepts introduce in this file are similar to Rockafellar and Wetts book, 4.A. 

#### **Def | Distance Beteen set and Points**
> Let $(X, d)$ be a complete metric space.
> We define the distance between a set and a singleton element of the set using: 
> $$
> \begin{aligned}
>     d_K(x) &= \inf_{y\in K} d(y, x). 
> \end{aligned}
> $$

#### **Def | Ball Dilation of Sets**
> Let $(X,d)$ be a complete metric space. 
> Let $K \subseteq X$. 
> We denote 
> $$
> \begin{aligned}
>     \mathbb B_r(K) = \{x \in X | d_K(x) \le r\}. 
> \end{aligned}
> $$


**Observations**: 

Assume that $(X, d)$ to be the Banach space. 
Denote $\mathbb B$ to be the open unit norm ball around point $\mathbf 0$. 
$$
\mathbb B_r(K) = \overline{K + r \mathbb B}. 
$$
The addition is Minkowski set addition and the overline is taking the closure of the set. 


#### **Def | Limits of Sets**
> Let $(x, d)$ be a metric space, we define the limit of a sequence of sets $C_n \subseteq X$ mathematically as 
> $$
> \begin{aligned}
>     \Limsup{n\rightarrow \infty} C_n &= 
>     \left\lbrace
>         x \left | \; 
>         \liminf_{n\rightarrow \infty }d_{C_n}(x) = 0
>         \right. 
>     \right\rbrace, 
>     \\
>     \Liminf{n\rightarrow \infty} C_n &= 
>     \left\lbrace
>         x \left | \; 
>             \limsup_{n\rightarrow \infty} d_{C_n}(x) = 0
>         \right. 
>     \right\rbrace. 
> \end{aligned}
> $$

#### **Observation 0 | Did you see the sequence?**
> Let the ambient metric space be $\R^n$ here. 
> If $x \in \Limsup{n\rightarrow \infty} C_n$, then all following are items are true. 
> 1. There exists a sequence $x_k \in \overline C_{n_k}$ such that $x_n\rightarrow x$. Conversely, if there exists a sequence $x_n \in C_n$ such that $x_n\rightarrow \bar x$, then $\bar x \in \Limsup{n\rightarrow \infty} C_n$. 
> 2. For all $n \in \N$, there exists $m \ge n$ such that $C_m \neq \emptyset$. 
>
> If $x \in \Liminf{n \rightarrow\infty} C_n$, then all following items are true: 
> 
> 3. There exists $m \in \N$ such that for all $n\ge m$ such that $C_n \neq \emptyset$. So WLOG, we can assume that there is no empty set. 
> 4. $\lim_{n\rightarrow \infty} d_{C_n}(x) = 0$; so $x$ gets to $C_n$ infinitely close. Equivalently, there exists $n \ge m \in \N$, a sequence $x_k \in \overline C_{m + k}$ such that $x_k \rightarrow x$. 

**Proof:**

For the convention, if $C_n = \emptyset$ then define $d_{C_n}(x) = \infty$. 
Define $d_n = d_{C_n}(x)$ for simplier notation. 

(1.): Assume that $x \in \Limsup{n \rightarrow\infty} C_n$, by definition it has $\liminf_{n \rightarrow \infty} d_n = 0$. 
Therefore, there exists subsequence $d_{n_k} \rightarrow 0$. 
This implies that it's impossible to have $C_{m}$ for some $m \ge n$, because it would contradicts with the existence of subsequential limit. 

(2.): 
Since $d_{n_k} \rightarrow 0$, there exists sequence $x_k \in \overline C_{n_k}$ such that $x_k \rightarrow 0$.
Conversely, let $x_n \in C_n$ be such that $x_n \rightarrow \bar x$ (Here we implicitly assumed that $C_n \neq \emptyset$ for all $n \in \N$). 
Then it has

$$
\begin{aligned}
    0 \leftarrow \Vert x_n - \bar x\Vert \ge d(\bar x, C_n) \ge 0. 
\end{aligned}
$$

Taking limit on both side, it yields $\lim_{n\rightarrow \infty} d(\bar x, C_n) = \liminf_{n\rightarrow \infty} d(\bar x, C_n) = 0$. 
Hence $\bar x \in \Limsup{n\rightarrow \infty} C_n$. 
Therefore, the point is in the outer set limit. 

(3): It's impossible that $C_n = \emptyset$ infinitely many often, because if it is, then it directly contradicts $\limsup_{n\rightarrow \infty} d_{C_n}(x) = 0$. 

(4): Without loss of generality, we may let the sequence $C_n$ starts at the set last $C_{m + k}$ where $C_m = \emptyset$ is the last occurrence, so all $C_n$ can be assumed to be non-empty. 
Define $d_n = d_{C_n}(x)$, then the monotone decreasing sequence $\sup_{m\ge n} d_n$ converges to zero. 
This is equivalent to say that $x_n$ gets to $C_n$ infinitely close. 




#### **Observation 1 | Both the Upper and Lower Limits of Sets are Closed Sets**
> In Banach space $(X, d)$, we have that the lower and upper limit of the sequence of set $(K_n)_{n \in \mathbb N}$ are closed sets. 

**Proof**

Consider that 

$$
\begin{aligned}
    & x \in \Liminf{n\rightarrow \infty} K_n 
    \iff \lim_{n\rightarrow \infty}d_{K_n}(x) = 0
    \\
    \iff& 
    \forall n \in \mathbb N(
        r_n := d_{K_n}(x) \iff x \in \overline{K_n + r_n \mathbb B}
    )
    \\
    \iff & 
    x \in \bigcap_{n \in \mathbb N} \overline{K_n + r_n \mathbb B}, 
\end{aligned}
$$

which is the intersection of closed sets, and therefore it's a closed set. 
Similarly, if we have $x \in \Limsup{n\rightarrow \infty} K_n$, a similar proof can be conduct like the above to show the closure of upper limit as well. 


#### **Observations 2 | Lower Limit is a Subset of Upper Limits**
> We have that for any sequence of sets $\Liminf{n\rightarrow \infty}K_n \subseteq \Limsup{n\rightarrow \infty} K_n$. 

**Proof**

This is obviously true since if we have $x$ such that $\lim_{n\rightarrow \infty} d_{k_n}(x) = 0$, and therefore it must be that $\liminf_{n\rightarrow \infty}d_{K_n}(x) = 0$. 

#### **Observations 3 | Monotone Convergence of Sets means Limits**
> Let $K_n$ be a sequence of set that is monotone expanding, or monotone shrinking, i.e: $K_n\subseteq K_{n + 1}, K_n\supseteq K_{n + 1}$, for all $n \in \mathbb N$. 
> Then we have the upper and the lower to be the same, and they equal to $\bigcap_{n\in \mathbb N} \overline K_n$. 

**Proof**

Suppose that $\forall n \in \mathbb N: K_n \subseteq K_{n + 1}$, then the distance has $\forall n \in \mathbb N: d_{K_n}(x)\ge d_{K_{n + 1}}(x)$. 
With that the limit of the metric has 

$$
\begin{aligned}
    \liminf_{n\rightarrow \infty} d_{K_n}(x) = \inf_{n \in \mathbb N} d_{K_n}(x) 
    = \lim_{n\rightarrow \infty} d_{K_n}(x). 
\end{aligned}
$$

Therefore, the upper and lower limit of the set is the same. 
Let's consider that $\forall n \in \mathbb N: K_n \supseteq K_{n + 1}$. 
Then the distance function increases monotonically: $d_{K_n}(x) \le d_{K_{n + 1}}(x)$. 
Therefore, the limit would be 

$$
\begin{aligned}
    \liminf_{n\rightarrow \infty}d_{K_n}(x)
    &= \lim_{n\rightarrow \infty} \inf_{m \ge n} d_{K_n}(x)
	= 
    \lim_{n\rightarrow \infty} d_{K_n}(x). 
\end{aligned}
$$

We used the monotonicity of distance function and show that the definition of the upper limit and the inner limit is once again the same. 
With monotonicity, for every point $x$ from the limit of the set, has

$$
\begin{aligned}
    & r_n := d_{K_n}(x) \iff x \in \overline{K_n + r_n \mathbb B}
    \\
    \iff& x \in \bigcap_{n\in \mathbb N} \overline{K_n + r_n \mathbb B}. 
\end{aligned}
$$

With $K_n \supseteq K_{n + 1}$, we should have that 

$$
\begin{aligned}
    x &\in \overline{K_n + r_n \mathbb B} \subseteq \overline{K_{n-1} + r_n \mathbb B} \subseteq \cdots 
    \\
    x& \in \overline{K_m + r_n \mathbb B}, \quad \forall m \le n 
    \\
    x &\in \bigcap_{m \le n} \overline{K_m + r_n \mathbb B}  
    = \left(
        \bigcap_{m \le n}\overline K_m 
    \right) + r_n \mathbb B, 
\end{aligned}
$$
we then take the limit as $n \rightarrow \infty$, then the above set becomes $x \in \bigcap_{n \in \mathbb N} \overline K_n$. 
Similarly, with $K_n \subseteq K_{n + 1}$, we have 

$$
\begin{aligned}
    x &\in \overline{K_m + r_n \mathbb B} \subseteq 
    \overline{K_{n + 1} + r_n \mathbb B} \subseteq \cdots 
    \\
    x&\in \overline{K_m + r_n \mathbb B} \;\forall m \ge n
    \\
    x 
    &\in \bigcap_{m \ge n}\overline{K_m + r_n \mathbb B} 
    \\
    &= \left(
        \bigcap_{m \ge n} \overline K_m
    \right) + r_n \mathbb B. 
\end{aligned}
$$

Take the limit as $n \rightarrow \infty$, we have that $x \in \bigcap_{n \in \mathbb N}\overline K_n$. 


#### **Observations 5**
A sequence of singleton sets. 
Let's assume that $C_n = \{x_n\}$ is a list of singleton from space $\R_n$. 



---
### **Characterizations of Inner, Outer set Limits for Sequence of Sets**

We characterize the limits stated above using other mathematical entities. 

#### **Thm | Sequential Definitions of the Inner and Outer Limits of a Sequence of Sets**
> Consider ambient space $\mathbb R^n$, then we define the inner and outer limit for a sequence of set $C_n$ subsequences of the natural sequence: 
> $$
> \begin{aligned}
>     \Limsup{n\rightarrow \infty} C_n 
>     &= 
>     \left\lbrace
>         x |\; \exists x_n\rightarrow x, (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# : 
>         x_{k_n} \in C_{k_n}
>     \right\rbrace
>     \\
>     \Liminf{n\rightarrow \infty} C_n
>     &= 
>     \left\lbrace
>         x |\; \exists x_n\rightarrow x, (k_n)_{n \in \mathbb N} \in \mathcal N_\infty: 
>         x_{k_n} \in C_{k_n}
>     \right\rbrace
> \end{aligned}
> $$

**Observations**

The upper limit of sets is the union of all the clusters points of some sequences taken from the sequences of sets, with the assumptions that there are not empty set here. 
The lower limit, is the limit of the all the points the can be converged to using sequences that eventually comes from the sequence of sets. 

**Proof**

Let's choose any subsequence $(k_n)_{n \in \mathbb N}$ of the naturals $(n)_{n \in \mathbb N}$, and assume that it satisfies for all $n \in \mathbb N$, $\lim_{n\rightarrow \infty} d_{C_{k_n}}(\bar x) = 0 \wedge d_{C_{k_n}}(\bar x) < \infty$. 
Define $r_n : = d_{C_{k_n}}(\bar x)$, so $r_n \searrow 0$. 
Because $d_{C_{k_n}}(\bar x) < \infty$, hence $C_{k_n} \neq \emptyset$ for all $n \in \mathbb N$. 
Reader should agree that for all $n \in \mathbb N$ we have dilated norm ball characterizations

$$
\begin{aligned}
    r_n = d_{C_{k_n}}(x_{k_n}) \iff \bar x \in \overline{\mathbb B_{r_n}(C_{k_n})}. 
\end{aligned}
$$

Consider the subsequence defined as 

$$
\begin{aligned}
    x_n &:= \begin{cases}
        \bar x & n \not\in \{k_n | n \in \mathbb N\}, 
        \\
        x_n \in & \Pi_{\text{cl}\left(C_{k_n}\right)} \bar x \text{ else} 
    \end{cases}
    \\
    \implies & 
    d(\bar x, x_{k_n}) = d(\bar x, \Pi_{\text{cl}(C_{k_n})}\bar x) \le r_n
    \\
    \implies &
    x_{k_n}, x_n \rightarrow \bar x \text{ by } \lim_{n\rightarrow \infty} r_n = 0. 
\end{aligned}
$$

However, at this point we only have $x_{k_n} \in \overline{C_{k_n}}$, to relax it consider proximity sequence defined as 

$$
\begin{aligned}
    x'_n
    := 
    \begin{cases}
        \exists x'_{k_n} \in \mathbb B_{\epsilon_n}(x_{k_n})\cap C_{k_n} \neq \emptyset & 
        n \in \{k_n | n \in \mathbb N\}, 
        \\
        x_n & \text{ else}. 
    \end{cases}
\end{aligned}
$$

We have the freedom to choose $\epsilon_n \le r_n$, so that $\epsilon_n \searrow 0$ too then we have the subsequence of the proximity sequence satisfying: 

$$
\begin{aligned}
    d(x'_{k_n} \bar x) &\le d(x'_{k_n}, x_{k_n}) + d(x_{k_n}, \bar x)
    \\
    &= \epsilon_n + r_n, 
\end{aligned}
$$

Taking limit of the above sequence, we have $x_{k_n} \rightarrow \bar x$ as $n\rightarrow \infty$. 
This time, by definition of $x'_{k_n}$, we have $x'_{k_n} \in C_{k_n}$. 
In this case, we have transferred the definition between the distance function and the sequence, more precisely, fixing any $\bar x$ and subsequence $k_n$, we have that 

$$
\begin{aligned}
    \lim_{n\rightarrow \infty} d_{C_{k_n}}(x) = 0 \wedge d_{C_{k_n}}(x) < \infty 
    \implies 
    \exists x'_{k_n} \rightarrow \bar x : x_{k_n}' \in C_{k_n}. 
\end{aligned}
$$

The other direction is easier. 
Assuming that we have $x_n$ as a sequence, and a subsequence $(k_n)_{n \in \mathbb N}$ of $(n)_{n\in \mathbb N}$, such that $x_{k_n} \in C_{k_n}$ and $x_{k_n}\rightarrow \bar x$, which means that 

$$
\begin{aligned}
    & d(x_{k_n}, \bar x) \rightarrow 0, 
    \\
    & x_{k_n} \in C_{k_n} \implies 
    d_{C_{k_n}}(\bar x) \le d(x_{k_n}, \bar x) 
    \\
    \implies 
    &
    \lim_{n\rightarrow \infty} d_{C_{k_n}}(\bar x) = 0. 
\end{aligned}
$$

Therefore, we actually had equivalence between these 2 conditions. 
The sequence definition of upper, lower set limit is the implies convergence of the metric is the easier direction, however, we need to smooth out some cases when $C_n = \emptyset$ for some $n$. 
Observe that $\lim_{n\rightarrow \infty} d_{C_n}(\bar x) = 0$ doesn't mean that $d_{C_n}$ is a bounded sequence, it means that there exists $m\in \mathbb N$ such that if $n \ge m$, we have that $d_{C_n}(\bar x) < \infty$ hence $C_n \neq \infty$. 
Therefore, without loss of generality, we have to choose the subsequence again to assure the finiteness of the distance to make use of the above prove. 
For any $(k_n)_{n \in \mathbb N} \in \mathcal N_{\infty}$, truncating the sequence to $k_{n + m}$ would still be in $\mathcal N_{\infty}$, hence, without loss of generality we assumed that $C_{k_n} \neq \emptyset$ for the above proof. 


#### **Thm | Neighborhood Characterizations of Outer Limits of Sets**
> Let $(A_n)_{n \in \mathbb N}$ be a sequence of set such that $A_n \subseteq \mathbb R^n$. 
> The definition of the outer limit is defined via some equivalent conditions. 
> $x \in \Limsup{n\rightarrow \infty} A_n$ if and only if there exists $x \in \mathbb R^n$ such that $\forall V \in \mathcal N(x)$ there exists $(k_n)_{n\in \mathbb N} \in \mathcal N_\infty^\#$ such that $C_{k_n}\cap V \neq \emptyset$. 
> Mathematically we have the representation
> $$
> \begin{aligned}
>     \Limsup{n \rightarrow \infty} C_n
>     & = 
>     \left\lbrace
>          x 
>         \left|
>             \forall V \in \mathcal N(x)\;
>             \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# : 
>             C_{k_n} \cap V \neq \emptyset 
>         \right.
>     \right\rbrace
>     \\
>     &= \left\lbrace
>         x | \delta > 0 \implies 
>         \exists (k_n)_{n\in \mathbb N} \in \mathcal N_\infty^\#: C_{k_n}\cap \mathbb B_\delta \neq \emptyset
>     \right\rbrace
> \end{aligned}
> $$

**Observations**




#### **Thm | Neighborhood Characterizations of Inner Limits of sets**
> Replacing the space of sequence $\mathcal N_\infty^\#$ into $\mathcal N_\infty$, then we get the definition of the inner limits of a sequence of sets. 
> Mathematically we have the definition 
> $$
> \begin{aligned}
>     \Limsup{n \rightarrow \infty} C_n
>     = 
>     \left\lbrace
>         x 
>         \left|
>             \forall v \in \mathcal N(x), \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty : 
>             C_{k_n} \cap V \neq \emptyset 
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**




#### **Thm | Sets Operations Characterizations of Limits**
> Similarly, the outer and inner set limit defined above can be considered through sets operations: 
> $$
> \begin{aligned}
>     \Liminf{n\rightarrow \infty} C_n 
>     &= 
>     \bigcap_{N \in \mathcal N_\infty^\#} 
>     \text{cl}\left(
>         \bigcup_{n \in N} C_n
>     \right), 
>     \\
>     \Limsup{n\rightarrow \infty} C_n 
>     &= 
>     \bigcap_{N \in \mathcal N_\infty} 
>     \text{cl} \left(
>         \bigcup_{n \in N}C_n
>     \right). 
> \end{aligned}
> $$

**Observations**

They are always closed sets. 
Intersection of closed set is always a closed set. 

**Remarks**

This is Rockafellar and Wets, Exercise 4.2 (b). 



---
### **Introduction to set-valued Convergence**

Limit of sets described above is able to describe, characterize the limit of a set value map. 


#### **Def | Outer, inner limits of a Set-Valued Mapping**
> Consider $S : \mathbb R^n \rightarrow 2^{\mathbb R^n}$. 
> The outer limit and the inner limit of the multivalued mapping $S$ as
> $$
> \begin{aligned}
>     \Limsup{x\rightarrow \bar x} S(x)
>     &= \left\lbrace
>         u \left | \;
>             \exists x_n \rightarrow \bar x, \exists u_n \rightarrow u: 
>             u_n \in S(x_n)
>         \right.
>     \right\rbrace, 
>     \\
>     \Liminf{x\rightarrow \bar x}S(x)&=  
>     \left\lbrace
>         u \left| 
>             \; \forall x_n \rightarrow \bar x, \exists N \in \mathcal N_\infty, 
>             u_n \underset{u\in N}{\longrightarrow} u, 
>             u_n \in S(x_n)
>         \right.
>     \right\rbrace.
> \end{aligned}
> $$

#### **Observation 0 | The basics**

Let $u \in \Limsup{x \rightarrow \overline x} S(x)$, by definition, there exists $x_n\rightarrow \bar x, u_n\rightarrow u$ such that $u_n \in S(x_n)$. 
The existence of $u_n$ certainly implies that $S(x_n) \neq \emptyset$ for all $x_n$. 
It means also for all $n \in \N$ that: 

$$
\begin{aligned}
    \Vert u_n - u\Vert \ge d(u, S(x_n)) \ge 0 = d(u_n, S(x_n)). 
\end{aligned}
$$

And by convergence, it assures that $\lim_{n\rightarrow \infty} d(u, S(x_n)) = 0$. 
The point $u$ is approached by a limit and therefore, the set it defines is, a closed set. 




**Remark**

> [!note]- Remark
> This is called the Kuratowski convergence. 
> Read Chapter 5 B of Rockafellar Wett's Variational Analysis. 

