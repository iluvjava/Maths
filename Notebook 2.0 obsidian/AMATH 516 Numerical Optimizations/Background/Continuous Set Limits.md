- [Discrete Set Limit](Discrete%20Set%20Limit.md)

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
>             \forall v \in \mathcal N(x), \exists k_n \in \mathcal N_\infty^\# : 
>             C_{k_n} \cap V \neq \emptyset 
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations**

In $\mathbb R^n$, the neighborhood function for an element $x$, is $\mathcal N(x) = \{\mathbb B_\delta(x) | \delta > 0\}$. 
We can convert the definition in the language of $\epsilon, \delta$. 


#### **Def | Inner Limits of a Sequence of Sets**
> Replacing the space of sequence $\mathcal N_\infty^\#$ into $\mathcal N_\infty$, then we get the definition of the Innert limits of a sequence of sets. 

