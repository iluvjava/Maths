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

$\sigma$-alg defines a probabiliity spaces for events. 

The family of sets must satisfies the following: 

* $\mathcal{F}\subseteq 2^{\Omega}$, the family is a subset of the power set on all the outcomes. And $\mathcal{F}$ is not the empty set. 
* The set has closure under the set complement operations, which means that: $A\in \mathcal{F} \implies A^C\in \mathcal{F}$. 
* $A_i \in \mathcal{F} \implies \bigcup_i A_i \in \mathcal{F}$. Where, the sequence of sets will have to be countable. Using this fact and the second, one can deduce that any countable sequence of outcomes will have to be closed under union too. 

---




