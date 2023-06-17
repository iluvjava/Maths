Probability with a bit of measure theory in it. 


---
### **Intro**

Probability spaces are profound and they are complicated in the sene that they aggregates several realms of mathematics. I think it was designed to restrict the type of events that can be asked for a probability measure, and they helps with the definition of a random variable and the computations associated with random variables. 

**Reference**
A Modern Approach to Probability Theory, chapter 1. 

**Basic Quantities**

* $\Omega$ , a set of outcomes. 
* $\mathcal{F}$, a family of subsets of outcomes. A set of outcomes are called an event. Later in the file, this family of sets will have to satisfy a thing called the $\sigma$-algebra. 
* $P$ a function mapping from $\mathcal{F}$ to $[0, 1]$, which is called a probability measure. 


---
### **Def-1 | $\sigma$-algebra**

> A $\sigma$-algebra (or field) denoted $\mathcal F$ is a family of subsets of the set $\Omega$, and it satisfies the following conditions
> * $\emptyset \in \mathcal F$
> * The set has closure under the set complement operations, meaning that for all: $A\in \mathcal{F} \implies A^C\in \mathcal{F}$. 
> * For any countable sequences of $A_i \in \mathcal {F}$, $\bigcup_i A_i \in \mathcal{F}$.

**Observations**

Since $\emptyset \in \mathcal F$, then we can see that $\emptyset^C = \Omega \in \mathcal F$. Let $A_i$ be any sequences of countable sets, then $A_i^C$ has to be another sequence of countable set from $\mathcal F$, $\cup_{i\in \mathbb N}A_i^C\in \mathcal F$ as well, and therefore, $(\cup_{i\in \mathbb N} A_i)^C \in \mathcal F$, which means $\cap_{i\in \mathbb N} A_i^C$ by De-morgan's law, by the fact that the sequence is arbitrary, the intersection of countable sets from the $\sigma$ algebra. 

**Exercise**

Show that if $A, B \in \mathcal F$, then $A\setminus B \in \mathcal F$ as well. Hint $B \setminus A = (A\cup B)\cap A^C$. 


---
### **Def-2 | Probability Measure**

> A probability measure, denoted using $\mathbb P$ is a measure on $\mathcal F$, a $\sigma$ algebra, it's a function mapping from $\mathcal F$ to $[0, 1]$. In addition to being a measure and $\mathbb P(\Omega) = 1$, it satisfies the countable additivity condition: 
> $$
> \begin{aligned}
>    \mathbb P \left(
>     \bigcup_{m = 1}^\infty A_m
>     \right) &= \sum_{m = 1}^\infty \mathbb P(A_m). 
> \end{aligned}
> $$


**Remarks**
But what is a measure? A measure $\mu$ is a function mapping from the set of sigma aglebra of $\Omega$ to the real satisfying the conditions 
1. $\forall E \in \Omega$, $\mu(A) \ge 0$, Non-negativity
2. $\mu(\emptyset) = 0$
3. Countable aditivity which is the same as the probability measure as in the definition above. 
For more just read the wiki [here](https://en.wikipedia.org/wiki/Measure_(mathematics)). 

---
### **Def-3 | A Probability Space**

> Let $(\Omega, \mathcal F, \mathbb P)$ where $\Omega$ is any set, and $\mathcal F$ is a $\sigma$ algebra based on $\Omega$, where $\mathbb P$ is a probability measured for $\mathcal F$, these 3 entities form a Probability spaces. 

**Intuitions**

The set $\Omega$ is the set of all outcomes, $\mathcal F$ is the set of all events for the probability spaces, which has to be a set that is measurable, and $\mathcal P$ is the probability measure, which can't exists without the other too, because it helps defining integration for random variables of the probability spaces. 

**List of Propositions**
Let $A\subseteq B$ be from $\mathcal F$, let $A_n$ be a countable sequence from $\mathcal F$, then 

* $\mathbb P(\emptyset) = 0$. 
* $\mathbb P (A)\le \mathbb P (B)$. 
* $\mathbb P(B\setminus A) = \mathbb P(B) - \mathbb P(A)$.
* $\mathbb P(A^C) = 1 - \mathbb P(A)$. 

All of these can be derived from first principles of the probability measure. And for the last one 

$$
\begin{aligned}
    \mathbb P \left(
        \bigcup_{n = 1}^\infty A_n
    \right) \le \sum_{n = 1}^{\infty} \mathbb P(A_n), 
\end{aligned}
$$

which is left as an exercise to the reader, as a hint, consider the list of set that are disjoin defined by 

$$
\begin{aligned}
    A_n' = \bigcup_{m = 1}^{\infty} A_n \setminus A'_m \implies A'_n \subseteq A_n, 
\end{aligned}
$$

which is actually too much hint for the readers really. 

---
### **Def | Generating Sigma Algebra**

> Let $G\subseteq 2^{\Omega}$, then there exists a unique sigma algebra $\mathcal F$ such that $G \subseteq \mathcal F$, and it's minimum which means that if $G \subseteq \mathcal G$, then it must be $\mathcal  G\subseteq \mathcal F$. 

And we skip the justifications for now. Because I don't find it particular enlightening. 



--- 
### **Def | Boreal Set,  A Measurable Sigma Algebra**

We motivate the definition of a Borel set for the probability spaces. 

**Motivations for Borel Set**
> The set of $\mathbb R$ with $2^{\mathbb R}$ is not a measurable set, neither is $[0, 1]$ the unit interval. This is a problem because it's impossible to place a measure on all members from $2^{\mathbb R}$ in this case (Just google Vatali Set), therefore, we must consider alternative sigma algebra on $\mathbb R$, or the unit interval on the real $[0, 1]$. 

**Borel Set**
> A Borel set, we denote using $\mathcal B$, is the set of all subsets of $\mathbb R$, or $[0, 1]$ that can be constructed using countable many union and complement of open intervals in $\mathbb R$, or $[0, 1]$. 

**Fact**

Lesbesgue measure can be used on the Borel set and normalizing it by $\mu (\Omega)$ can then give us a probility measure over the space. 


**Remarks**

In a sense, it's the Sigma algebra generated by all the open intervals of $\mathbb R$ or $[0, 1]$. And there are a lot of equivalent set of $\Omega$s which can be used to construct the sigma algebra which equals to the Borel Sets. There are a lot of exercise in the referenced textbook regarding the construction of the Borel sets. 
