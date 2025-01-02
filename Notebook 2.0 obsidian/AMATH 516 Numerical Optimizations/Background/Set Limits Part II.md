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
Define $d_n = d_{C_n}(x)$ for simpler notation. 

(1.): Assume that $x \in \Limsup{n \rightarrow\infty} C_n$, by definition it has $\liminf_{n \rightarrow \infty} d_n = 0$. 
Therefore, there exists subsequence $d_{n_k} \rightarrow 0$. 
This implies that it's impossible to have $C_{m}$ for some $m \ge n$, because it would contradict with the existence of subsequential limit. 

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
Hence, $\bar x \in \Limsup{n\rightarrow \infty} C_n$. 
Therefore, the point is in the outer set limit. 

(3): It's impossible that $C_n = \emptyset$ infinitely many often, because if it is, then it directly contradicts $\limsup_{n\rightarrow \infty} d_{C_n}(x) = 0$. 

(4): Without loss of generality, we may let the sequence $C_n$ starts at the set last $C_{m + k}$ where $C_m = \emptyset$ is the last occurrence, so all $C_n$ can be assumed to be non-empty. 
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
> Then we have the upper and the lower to be the same, and they equal to $\bigcap_{n\in \mathbb N} \overline K_n$. 


**Proof**

Let $x \in X$ be arbitrary. 
When the sequence of sets $K_n \subseteq K_{n + 1}$, the distance to any $x$ is monotone decreasing: 

$$
\begin{aligned}
    (\forall n \in N)(\forall x \in X)\; d_{C_n}(x) \ge d_{C_{n + 1}}(x) \ge 0. 
\end{aligned}
$$

Because the sequence is monotone and bounded below, it must has a limit, it naturally has $\liminf_{n\rightarrow \infty} d_{C_n}(x) = \limsup_{n \rightarrow \infty} d_{C_n}(x)$. 

When $K_n \supseteq K_{n + 1}$, the distance function is monotonically increasing. 
Assuming that there exists $m \in \N$ such that $K_n \neq \emptyset$ for all $n \ge m$, then for all $n \in \N$, $d_{C_{m + n}}(x) \le d_{C_m}(x) < \infty$. The sequence would be bounded above. 
A monotone increasing function bounded above has a limit, and naturally, $\limsup_{n\rightarrow \infty}d_{C_n}(x) = \lim_{n\rightarrow \infty} d_{C_{m + n}}(x) = \liminf_{n\rightarrow \infty} d_{C_n}(x)$. 




#### **Observations 5**
A sequence of singleton sets. 
Let's assume that $C_n = \{x_n\}$ is a list of singleton from space $\R_n$. 



---
### **Characterizations of Inner, Outer set Limits for Sequence of Sets**

We characterize the limits stated above using other mathematical entities. 



#### **Thm | Equivalent definition of the set outer limit**
> Consider the ambient space to be $\R^n$. 
> The following sets are the same. 
> $$
> \begin{aligned}
>     \Limsup{n\rightarrow \infty} C_n 
>     &= 
>     \left\lbrace
>         x | \; \exists x_n \rightarrow x, (k)_{n \in \N} \in \mathcal N^\#_\infty: 
>         x_{k_n} \in C_{k_n}
>     \right\rbrace
>     = \left\lbrace
>         x \; | \liminf_{n\rightarrow \infty} d_{C_n}(x) = 0
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**


To see $\supseteq$: 

Take any $x \in \{ x \; | \liminf_{n\rightarrow \infty} d_{C_n}(x) = 0\}$. 
By the observation of there exists a subsequence, $\lim_{k\rightarrow \infty} d_{C_{n_k}}(x) = 0$, we have the existence of a sequence $x_k \in \overline C_{n_k}$ such that $x_k \rightarrow x$ by definition of the distance function. 
By definition of closure, for all $\epsilon > 0$, $\mathbb B_\epsilon(x_k)\cap C_{n_k} \neq \emptyset$. 
Therefore, choose any sequence with $0 < \epsilon_k\rightarrow 0$, then we have another sequence $x'_k \in \mathbb B_{\epsilon_k}(x_k') \cap C_{n_k}$ from the definition of closure. 
The sequence $x'_k, x_k$ shares the same limit $x$. 
Therefore, we have: 

$$
\begin{aligned}
    \exists x_k \rightarrow x, x_k \in C_{n_k}. 
\end{aligned}
$$

To see $\subseteq$: 
There exists a generic subsequence $k_n \in \mathcal N_\infty^\#$ such that we have a sequence $x_{k_n} \in C_{k_n}$. 
We are only interested in the subsequence, define $x'_n = x_{k_n}$ then: 
And the sequence has $x_n' \rightarrow x$, therefore by definition it has 

$$
\begin{aligned}
    0 \leftarrow \Vert x_n' - x\Vert \ge d_{C_{k_n}}(x) \ge 0. 
\end{aligned}
$$

Therefore, $\lim_{n\rightarrow \infty} d_{C_{k_n}}(x) = 0$, and therefore, the original sequence satisfies $\liminf_{n\rightarrow \infty}d_{C_n}(x) = 0$, and therefore it belongs to the other set as well. 

#### **Thm | Equivalent definition of the set inner limit**
> Consider the ambient space $\R^n$ with a sequence of $C_n \subseteq \R^n$, then the following sets are equivalent: 
> $$
> \begin{aligned}
>     \Liminf{n\rightarrow \infty} C_n  = 
>     \left\lbrace
>         x |\; 
>         \exists x_n \rightarrow x, (k_n)_{n \in \N} \in \mathcal N_\infty: x_{k_n} \in C_{k_n}
>     \right\rbrace = \left\lbrace
>         x \left | \limsup_{n\rightarrow \infty} d_{C_n}(x) = 0 \right. 
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**

Let's show that $\subseteq$. 
The subsequence $(k_n)_{n \in \N} \in \mathcal N_\infty$ means that the difference between $k_n$ and $\N$ is finite. 
Hence, there exists $m \in \N$ such that for all $n \ge m$, it has $x_{n} \in C_n$. 
Equivalently it says $x_{m + n} \in C_{m + n}$ for all $n \in \N$. 
The sequence $x_{m + n} \rightarrow x$ still and therefore by the convergence we have 
$$
\begin{aligned}
    0 \leftarrow \Vert x_{m + n} - x\Vert \ge 
    d_{C_{m + n}}(x) \ge  0. 
\end{aligned}
$$

Therefore, $\limsup_{n\rightarrow \infty} d_{C_n}(x) = 0$ is true. 

To see $\supseteq$, the limit implies that there exists $m \in N$ such that the sequence $\sup_{n \ge m} d_{C_n}(x) = 0$ is bounded and monotone converging to $0$. 
Therefore, there exists a sequence $x_{n} \in \overline C_{m + n}$ such that $x_n \rightarrow x$, by the definition of the distance function and the limit. 
From the closure, we can choose any $\epsilon_n \rightarrow 0$ and another sequence $x_n' \in \mathbb B_{\epsilon_n}(x_n)\cap C_{m + n}$ such that $x_n'\rightarrow x$ also, and $x_n'\in C_{m + n}$. 
Therefore, there exists the subsequence $(m + n)_{n \in N} \in \mathcal N_\infty$ such that we have the sequence $x_n'\in C_{m + n}$ and $x_n' \rightarrow x$. 
This concludes the proof. 



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
>     \Liminf{n \rightarrow \infty} C_n
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
Let's fix this specific sequence $x_n \rightarrow \bar x$. 
The existence of $u_n$ certainly implies that $S(x_n) \neq \emptyset$ for all $x_n$. 
It means also for all $n \in \N$ that: 

$$
\begin{aligned}
    \Vert u_n - u\Vert \ge d(u, S(x_n)) \ge 0 = d(u_n, S(x_n)). 
\end{aligned}
$$

And by convergence, it assures that $\lim_{n\rightarrow \infty} d(u, S(x_n)) = 0$. 
Interestingly, this implies that $u$ is in the outter limit of the sequence of set $S(x_n)$. 
The point $u$, is in the inner limit of the sequence of set $S(x_n)$. 







**Remark**

> [!note]- Remark
> This is called the Kuratowski convergence. 
> Read Chapter 5 B of Rockafellar Wett's Variational Analysis. 

