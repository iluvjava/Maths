Probability with a bit of measure theory in it. 


---
### **Intro**

We need some special type of topologies to for probability to happen. And I promise you, working with the space that we are going to define next will make your life much easier if you think deep about probability. 


**A probability space are defined by the following things**

* $\Omega$ , a set of outcomes. 
* $\mathcal{F}$, a set of set of outcomes, and a set of outcomes are called an event. This family of sets will have to satisfy a thing called the $\sigma$-algebra. 
* $p$ a function mapping from $\mathcal{F}$ to $[0, 1]$. 


---
### **$\sigma$-algebra**

The family of sets must satisfies the following: 

* $\mathcal{F}\subseteq 2^{\Omega}$, the family is a subset of the power set on all the outcomes. And $\mathcal{F}$ is not the empty set. 
* The set has closure under the set complement operations, which means that: $A\in \mathcal{F} \implies A^C\in \mathcal{F}$. 
* $A_i \in \mathcal{F} \implies \bigcup_i A_i \in \mathcal{F}$. Where, the sequence of sets will have to be countable. Using this fact and the second, one can deduce that any countable sequence of outcomes will have to be closed under union too. 

---
### **Probability**

Probability is only defined when we have a probability spaces defined. Let's take a look. 

The function is called a probability measure on the probability space that it's defined on, and it has to satisfy the following: 

$$
\begin{aligned}
    & \mathbb{P}(\Omega) = 1 
    \\
    & 
    A_i \cap A_j = \emptyset, i \neq j \implies \mathbb{P}\left(\bigcup_i A_i\right) = \sum_{i}^{}\mathbb{P}\left(A_i\right) 
\end{aligned}
$$

The additive properties on disjoint set of events. The second property only holds for **countable set of events**. 

The function $\mathbb{P}$ is the probability, it assigns probability to events. 





