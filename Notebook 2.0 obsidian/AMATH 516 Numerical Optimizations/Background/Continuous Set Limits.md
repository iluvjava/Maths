- [Discrete Set Limit](Discrete%20Set%20Limit.md)
- [Multivalued Functions, Set-valued Mappings](../Operators%20Theory/Multivalued%20Functions,%20Set-valued%20Mappings.md)

---
### **Intro**

We define continuous set limits using the subsequences characterizations. 
Recall that subsequence $\mathcal N_\infty^\#$ is the set of all subsequences of the sequence of natural numbers. 
Denote $\mathcal N_\infty$ to be the set of subsequences of natural number such that it only differs on finite many positions. 
With these, we are ready to introduce the definitions for the outer/inner limit of a sequences of sets in ambience space $\mathbb R^n$. 

#### **Def | Outer Limits of A Sequence of Sets**
> Let $(A_n)_{n \in \mathbb N}$ be a sequence of set such that $A_n \subseteq \mathbb R^n$. 
> The defiition of the outer limit is defined via an quivalent conditions. 
> $x \in \Limsup{n\rightarrow \infty} A_n$ if and only if there exists $x \in \mathbb R^n$ such that $\forall V \in \mathcal N(x)$ there exists $(k_n)_{n\in \mathbb N} \in \mathcal N_\infty^\#$ such that $C_{k_n}\cap V \neq \emptyset$. 
> Mathematically we have the representation
> $$
> \begin{aligned}
>     \Limsup{n \rightarrow \infty} C_n
>     = 
>     \left\lbrace
>          x 
>         \left|
>             \forall v \in \mathcal N(x), \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# : 
>             C_{k_n} \cap V \neq \emptyset 
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations**

In $\mathbb R^n$, the neighborhood function for an element $x$, is $\mathcal N(x) = \{\mathbb B_\delta(x) | \delta > 0\}$. 
We can convert the definition in the language of $\epsilon, \delta$. 
The above mathematical definition is equivalent to 

$$
\begin{aligned}
    \Limsup{n\rightarrow \infty} C_n
    &= 
    \left\lbrace
        x \left| 
            \forall \delta > 0\; 
            \exists 
            (k_n)_{n\in \mathbb N}: 
            C_{k_n} \cap \mathbb B_\delta(x) \neq \emptyset
        \right.
    \right\rbrace, 
\end{aligned}
$$
instead of $x \in  C_{k_n}$ as it were the case in discrete set limit, we relaxed the conditions to $C_{k_n } \cap \mathbb B_\delta(x) \neq \emptyset$. 

#### **Def | Inner Limits of a Sequence of Sets**
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


#### **Def | Outer Limits of a Set-Valued Mapping**
> Consider $S : \mathbb R^n \rightarrow 2^{\mathbb R^n}$. 
> The outer limit and the inner limit of the multi-valued mapping $S$ as
> $$
> \begin{aligned}
>     \Limsup{x\rightarrow \bar x} S(\bar x)
>     &= 
>     \bigcup_{x\rightarrow \bar x}
>     \Limsup{n\rightarrow \infty} S(x_n)
>     \\
>     &= \left\lbrace
>         u \left | 
>             \exists x_n \rightarrow \bar x, \exists u_n \rightarrow u: 
>             u_n \in S(x_n)
>         \right.
>     \right\rbrace, 
>     \\
>     \Liminf{x\rightarrow \bar x}S(x)&= 
>     \bigcap_{x\rightarrow\bar x} 
>     \Liminf{n\rightarrow \infty} S(x_n) 
>     \\
>     &= 
>     \left\lbrace
>         u \left | 
>             \forall x_n \rightarrow \bar x, \exists N \in \mathcal N_\infty, 
>             u_n \underset{u\in N}{\longrightarrow} u, 
>             u_n \in S(x_n)
>         \right.
>     \right\rbrace.
> \end{aligned}
> $$

**Proof**

We will prove that the equality is equivalent to the conditions stated in the set definitions of the multi-valued mapping limit. 


**Remark**

This is called the Kuratowski convergence. 

---
### **Characterizations of Inner, Outer set Limits for Sequence of Sets**

We characterize the limits stated above using other mathematical entities. 

#### **Thm | Characterizing Set Limits via Distance Function**
> Define $d_C(x)$ to be the shortest distance between all points in $C$ and the point $x$. 
> $$
> \begin{aligned}
>     \Liminf{n\rightarrow \infty} C_n 
>     &= 
>     \left\lbrace
>         x \left| 
>             \; \limsup_{n\rightarrow \infty} d_{C_n}(x) = 0
>         \right.
>     \right\rbrace, 
>     \\
>     \Limsup{n\rightarrow \infty} C_n
>     &= 
>     \left\lbrace
>         x \left | \; 
>             \liminf_{n\rightarrow \infty} d_{C_n}(x) = 0
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

**Proof**





#### **Thm | Characterizing Set Limits via Sets Operations**
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

**Obervations**

They are always closed sets. 



