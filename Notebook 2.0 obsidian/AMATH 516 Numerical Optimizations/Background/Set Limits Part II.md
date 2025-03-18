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
Recall that 
1. Subsequence $\mathcal N_\infty^\#$ is the set of all subsequences of the sequence of natural numbers. 
2. $\mathcal N_\infty$ to be the set of subsequences of natural number such that it only differs on finite many positions (For any sequence in $\mathcal N_\infty$, there exists a last element where the sequences are different from the sequence of natural number, after that they are the same). 
3. The projection operator in a complete metric space. $\Pi_C(x) \ni y$ means that $\Vert y - x\Vert  = \inf_{x \in C} \Vert y - x\Vert$, $y$ is the closest vector to vector $y$ in the set $C$. This exists for all non-empty closed set and the set of closest point is compact and nonempty (See Rockafellar's Example 1.20 for this theorem) This is not true in general Hilbert space (See [Projection in Hilbert Spaces](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Projection%20in%20Hilbert%20Spaces.md)). 


Before we start, we define the following quantities relevant to discussion of set limits in complete metric space and Banach spaces. 

**References**

Some concepts introduce in this file are similar to Rockafellar and Wetts book, 4.A. 

#### **Def | Distance Between set and Points**
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

**Observations**

A complete metric spaces makes $d_C (x) < \infty$ for all $C \neq \emptyset$. 
This is crucially important and it will be leveraged in the proofs that follow. 

#### **Observation 0 | Did you see the sequence?**
> Let the ambient metric space be $\R^n$ here. 
> If $x \in \Limsup{n\rightarrow \infty} C_n$, then all following are items are true. 
> 1. There exists a sequence $x_k \in \overline C_{n_k}$ such that $x_k\rightarrow x$. Conversely, if there exists a sequence $x_n \in C_{k_n}$ such that $x_n\rightarrow \bar x$, then $\bar x \in \Limsup{n\rightarrow \infty} C_n$. 
> 2. For all $n \in \N$, there exists $m \ge n$ such that $C_m \neq \emptyset$. 
>
> If $x \in \Liminf{n \rightarrow\infty} C_n$, then all following items are true: 
> 
> 3. There exists $m \in \N$ such that for all $n\ge m$ such that $C_n \neq \emptyset$. So WLOG, we can assume that there is no empty set. 
> 4. $\lim_{n\rightarrow \infty} d_{C_n}(x) = 0$; so $x$ gets to $C_n$ infinitely close. Equivalently, there exists $n \ge m \in \N$, a sequence $x_k \in \overline C_{m + k}$ such that $x_k \rightarrow x$. 

**Proof:**

For the convention, if $C_n = \emptyset$ then define $d_{C_n}(x) = \infty$. 
Define $d_n(x) = d_{C_n}(x)$. 

**Showing(1):** If $x \in \Limsup{n \rightarrow\infty} C_n$, by definition $\liminf_{n \rightarrow \infty} d_n(x) = 0$. 
Hence, there exists subsequence $d_{n_k}(x) \rightarrow 0$. 
Hence there exists sequence $x_k \in \overline C_{n_k}$ such that $x_k \rightarrow x$. 
To show the converse, suppose that $x_n \in C_{k_n}$ and $x_n \rightarrow \bar x$. 
Then subsequence $d_{n_k}(\bar x)\rightarrow 0$ hence $\liminf_{k\rightarrow \infty} d_{k}(\bar x) = 0$ so $x \in \Limsup{n\rightarrow \infty} C_n$. 

**Showing(2):**
If there all $C_n =\emptyset$ for some $n \ge m \in \N$, then it contradicts $\liminf_{n\rightarrow \infty} d_{n}(x) = 0$. 

**Showing(3):** It's impossible that $C_n = \emptyset$ infinitely many often, because if it is, then it directly contradicts $\limsup_{n\rightarrow \infty} d_{C_n}(x) = 0$. 

**Showing(4):** Without loss of generality, we may let the sequence $C_n$ starts at the set last $C_{m + k}$ where $C_m = \emptyset$ is the last occurrence, so all $C_n$ can be assumed to be non-empty. 
Define $d_n = d_{C_n}(x)$, then the monotone decreasing sequence $\sup_{m\ge n} d_n$ converges to zero. 
This is equivalent to say that $x_n$ gets to $C_n$ infinitely close. 


#### **Observation 1 | Both the Upper and Lower Limits of Sets are Closed Sets**
> In Banach space $(X, d)$, we have that the lower and upper limit of the sequence of set $(K_n)_{n \in \mathbb N}$ are closed sets. 

**Proof**

For simpler notations
Consider that 
$$
\begin{aligned}
    & x \in \Liminf{n\rightarrow \infty} K_n 
    \iff \lim_{n\rightarrow \infty}d_{K_n}(x) = 0
\end{aligned}
$$

For simpler notations, let $r_n := d_{K_n}(x)$. 
$x$ is within $r_n$ from the set $\overline K_n$, therefore it can be written as: 

$$
\begin{aligned}
    \iff& 
    \forall n \in \mathbb N:
     x \in \overline{K_n + r_n \mathbb B}
    \\
    \iff & 
    x \in \bigcap_{n \in \mathbb N} \overline{K_n + r_n \mathbb B}. 
\end{aligned}
$$

Which is the intersection of closed sets, and therefore it's a closed set. 
Similarly, if we have $x \in \Limsup{n\rightarrow \infty} K_n$, a similar proof can be conduct like the above to show the closure of upper limit as well. 
In the case of $x \in \Limsup{n \rightarrow \infty} K_n$, which would instead gives us a subsequence of $C_{n_k}$ and go through the same proof. 


#### **Observations 2 | Lower Limit is a Subset of Upper Limits**
> We have that for any sequence of sets $\Liminf{n\rightarrow \infty}K_n \subseteq \Limsup{n\rightarrow \infty} K_n$. 

**Proof**

This is obviously true since if we have $x$ such that $\lim_{n\rightarrow \infty} d_{k_n}(x) = 0$, and therefore it must be that $\liminf_{n\rightarrow \infty}d_{K_n}(x) = 0$. 

#### **Observations 3 | Monotone Convergence of Sets means Limits**
> Let $K_n$ be a sequence of set that is monotone expanding, or monotone shrinking, i.e: $K_n\subseteq K_{n + 1}, K_n\supseteq K_{n + 1}$, for all $n \in \mathbb N$. 
> Then we have the outer and inner set limit equals to $\bigcap_{n\in \mathbb N} \overline K_n$. 


**Proof**

Let $x \in X$ be arbitrary. 
When the sequence of sets $K_n \subseteq K_{n + 1}$, the distance to any $x$ is monotone decreasing: 

$$
\begin{aligned}
    (\forall n \in N)(\forall x \in X)\; d_{C_n}(x) \ge d_{C_{n + 1}}(x) \ge 0. 
\end{aligned}
$$

The sequence is monotone and bounded below, it has a limit and $\liminf_{n\rightarrow \infty} d_{C_n}(x) = \limsup_{n \rightarrow \infty} d_{C_n}(x)$. 
If $x \in \bigcap_{n\in \N} \overline K_n$ then $d_{C_n}(x) = 0 \; \forall n \in \N$ hence the zero is limit therefore $x$ belongs to the inner/outer limit of the set sequence. 

If $K_n \supseteq K_{n + 1}$, then $d_{C_n}(x)$ monotonically increases $\forall x \in X$. 
Assume there exists $m \in \N$ such that $K_n \neq \emptyset$ for all $n \ge m$, then for all $n \in \N$, $d_{C_{m + n}}(x) \le d_{C_m}(x) < \infty$. 
The monotone increasing sequence $d_{C_{m _ n}}$ is bounded above hence it has a limit. 
Therefore, $\limsup_{n\rightarrow \infty}d_{C_n}(x) = \lim_{n\rightarrow \infty} d_{C_{m + n}}(x) = \liminf_{n\rightarrow \infty} d_{C_n}(x)$. 
Any element from $x \in \bigcap_{n\in \N}\overline K_n$ has $\lim_{n\rightarrow \infty}d_n(x) = 0$ hence it belongs to the inner and outer limit of set sequence $K_n$. 




#### **Observations 5**
A sequence of singleton sets. 
Let's assume that $C_n = \{x_n\}$ is a list of singleton from space $\R_n$. 



---
### **Characterizations of Inner, Outer set Limits for Sequence of Sets**

We characterize the limits stated above using other mathematical entities. 



#### **Thm | Equivalent definition of the set outer limit**
> Consider the ambient space to be $\R^n$. 
> Then outer limit of sets admits equivalent definition:  
> $$
> \begin{aligned}
>     \Limsup{n\rightarrow \infty} C_n 
>     &= 
>     \left\lbrace
>         x | \; \exists x_n \rightarrow x, (k)_{n \in \N} \in \mathcal N^\#_\infty: 
>         x_{n} \in C_{k_n}
>     \right\rbrace
>     = \left\lbrace
>         x \left|\; \liminf_{n\rightarrow \infty} d_{C_n}(x) = 0 \right.
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**

Denote $d_n(x) = d_{C_n}(x)$

**We show $\supseteq$**: 
Take any $x \in \{ x \; | \liminf_{n\rightarrow \infty} d_{n}(x) = 0\}$. 
By the Observation 0 there exists subsequence $\lim_{k\rightarrow \infty} d_{n_k}(x) = 0$, hence $\exists x_k \in \overline C_{n_k}$ such that $x_k \rightarrow x$. 
By definition of closure, for all $\epsilon > 0$, $\mathbb B_\epsilon(x_k)\cap C_{n_k} \neq \emptyset$. 
Choose any sequence $0 < \epsilon_k\searrow 0$, construct $x'_k \in \mathbb B_{\epsilon_k}(x_k') \cap C_{n_k}$. 
The sequence $x'_k, x_k$ shares the same limit $x$ so: 

$$
\begin{aligned}
    \exists x_k' \rightarrow x, x_k' \in C_{n_k}. 
\end{aligned}
$$

**We show $\subseteq$:**
Let $k_n \in \mathcal N_\infty^\#$ such that $x_{k_n} \in C_{k_n}$. 
We are only interested in the subsequence, define $x'_n = x_{k_n}$ and it has $x_n' \rightarrow x$, therefore by definition it has 

$$
\begin{aligned}
    0 \leftarrow \Vert x_n' - x\Vert \ge d_{k_n}(x) \ge 0. 
\end{aligned}
$$

Therefore, $\lim_{n\rightarrow \infty} d_{k_n}(x) = 0$, and therefore, the original sequence satisfies $\liminf_{n\rightarrow \infty}d_{n}(x) = 0$. 

#### **Thm | Equivalent definition of the set inner limit**
> Consider the ambient space $\R^n$ with a sequence of $C_n \subseteq \R^n$, then the following sets are equivalent: 
> $$
> \begin{aligned}
>     \Liminf{n\rightarrow \infty} C_n  = 
>     \left\lbrace
>         x |\; 
>         \exists x_n \rightarrow x, (k_n)_{n \in \N} \in \mathcal N_\infty: x_{n} \in C_{k_n}
>     \right\rbrace = \left\lbrace
>         x \left |\; \limsup_{n\rightarrow \infty} d_{C_n}(x) = 0 \right. 
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**

**Let's show that $\subseteq$.** 
If $(k_n)_{n \in \N} \in \mathcal N_\infty$ then the difference between $\{k_n:n \in \N\}$ and $\N$ is finite. 
Hence, there exists $m \in \N$ such that for all $n \ge m$, it has $x_{n} \in C_n$. 
Equivalently it says $x_{m + n} \in C_{m + n}$ for all $n \in \N$. 
The sequence $x_{m + n} \rightarrow x$ still and therefore: 
$$
\begin{aligned}
    0 \leftarrow \Vert x_{m + n} - x\Vert \ge 
    d_{C_{m + n}}(x) \ge  0. 
\end{aligned}
$$

Therefore, $\limsup_{n\rightarrow \infty} d_{C_n}(x) = 0$. 

**Let's show $\supseteq$**, $\limsup_{n\rightarrow \infty}d_n(x) = 0$ implies there exists $m \in \N$ such that $\sup_{n \ge m} d_{n}(x) = 0$. 
Therefore, there exists a $x_{n} \in \overline C_{m + n}$ such that $x_n \rightarrow x$, by the definition of the distance function and the limit supremum. 
By closure, for all $\epsilon_n \searrow 0$ there exists $x_n' \in \mathbb B_{\epsilon_n}(x_n)\cap C_{m + n}$ such that $x_n'\rightarrow x$ and $x_n'\in C_{m + n}$. 
Therefore, there exists the subsequence $(m + n)_{n \in N} \in \mathcal N_\infty$ with $x_n'\in C_{m + n}$ and $x_n' \rightarrow x$ because $x'$ is close to $x_n$. 
$\blacksquare$



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
>             \; \forall V \in \mathcal N(x)\;
>             \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# : 
>             C_{k_n} \cap V \neq \emptyset 
>         \right.
>     \right\rbrace
>     \\
>     &= \left\lbrace
>         x | \;\delta > 0 \implies 
>         \exists (k_n)_{n\in \mathbb N} \in \mathcal N_\infty^\#: C_{k_n}\cap \mathbb B_\delta \neq \emptyset
>     \right\rbrace
> \end{aligned}
> $$

**Proof**




#### **Thm | Neighborhood Characterizations of Inner Limits of sets**
> Replacing the space of sequence $\mathcal N_\infty^\#$ into $\mathcal N_\infty$, then we get the definition of the inner limits of a sequence of sets. 
> Mathematically we have the definition 
> $$
> \begin{aligned}
>     \Liminf{n \rightarrow \infty} C_n
>     &= 
>     \left\lbrace
>         x 
>         \left|
>             \;\forall v \in \mathcal N(x), \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty : 
>             C_{k_n} \cap V \neq \emptyset 
>         \right.
>     \right\rbrace
>   \\
>   &= \left\lbrace
>     x |\; 
>     \exists x_n \rightarrow x, (k_n)_{n \in \N} \in \mathcal N_\infty: x_{n} \in C_{k_n}
>   \right\rbrace
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


#### **Definition 0 | An alternative definition**
> The set limit of a multivalued mapping generalizes the idea of a set limit to continuous limit. 
> Alternatively, the limit of the set value mapping can be 
> $$
> \begin{aligned} 
>     \Limsup{x \rightarrow \bar x} S(\bar x) 
>     &= \bigcup_{x_n\rightarrow \bar x} \Liminf{n\rightarrow \infty} S(x_n), 
>     \\
>     \Liminf{x\rightarrow \bar x} S(\bar x) 
>     &= 
>     \bigcap_{x_n \rightarrow \bar x} \Liminf{n\rightarrow \infty} S(x_n). 
> \end{aligned}
> $$
> It considers set limits by considering the existence of some, or, for all $x_n \rightarrow \bar x$ where the set limit can be identified. 

**Proof**


Let $u \in \Limsup{x \rightarrow \overline x} S(x)$, by definition, there exists $x_n\rightarrow \bar x, u_n\rightarrow u$ such that $u_n \in S(x_n)$. 
Let's fix this specific sequence $x_n \rightarrow \bar x$. 
The existence of $u_n$ certainly implies that $S(x_n) \neq \emptyset$ for all $x_n$. 
It means also for all $n \in \N$ that: 

$$
\begin{aligned}
    \Vert u_n - u\Vert \ge d(u, S(x_n)) \ge 0 = d(u_n, S(x_n)). 
\end{aligned}
$$

And by convergence, it assures that $\lim_{n\rightarrow \infty} d(u, S(x_n)) = 0$. 
Interestingly, this implies that $u$ is in the outer limit of the sequence of set $S(x_n)$. 
The point $u$, is in the inner limit of the sequence of set $S(x_n)$. 
Because the sequence $x_n\rightarrow \bar x$ has assumed its existence, the following holds: 

$$
\begin{aligned}
    u &\in \bigcup_{x_n\rightarrow \bar x} \Liminf{n\rightarrow \infty} S(x_n). 
\end{aligned}
$$

Take any $u \in \Liminf{x \rightarrow \bar x} S(x)$, by definition, take any $x_n \rightarrow \bar x$ such that it defines a set sequence $S(x_n)$ such that there exists a $m \in \N$ such that $u_{m + n} \in S(x_{m + n})$ for all $n \in \N$, and $u_{m + n} \rightarrow u$. 
Consequently, it means that $u_n \rightarrow u$ too. 
The existence of the sequence identifies $u \in \Liminf{n\rightarrow \infty} S(x_n)$. 
Since this condition has to hold for all $x_n \rightarrow \bar x$, it has the following interpretation: 

$$
\begin{aligned}
    u \in \bigcap_{x_n\rightarrow \bar x} \Liminf{n \rightarrow \infty} S(x_n). 
\end{aligned}
$$


> [!note]- Remark
> This is called the Kuratowski convergence. 
> Read Chapter 5 B of Rockafellar Wett's Variational Analysis. 



#### **Observation | Outer, inner limits of a Set-Valued Mapping**
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