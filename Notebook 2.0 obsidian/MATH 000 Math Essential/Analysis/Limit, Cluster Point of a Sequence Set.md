[[Real Analysis Basics]]


---
### **Intro**

We demonstrate the concepts of a limit point of a special kind of set. 
* The liminf, limpsup are the cluster point of a sequence set. 
* There could be other limit point. 
* There could be uncountably many such points.

**Definition | Limit Point in the Real Line**: 
> A point $x$ is a limit point of a set $A\subseteq \mathbb R$ if and only if for every $\epsilon$ neighborhood of $x$, there is a point $y\neq x$ such that $y\in A$. 

This statement can simply be characterize with fancier notation involving epsilon balls, the point $x\in A$ is a limit point point when $\mathbb B_\epsilon(x)\setminus \{x\}\cap A \neq \emptyset \; \forall \epsilon > 0$. 

**Theorem | Limit point of a set characterize as a limit in the set**
> A point $x$ is a limit point of the set $A$ if and only if there exists $(a_n)_{n\in \mathbb N}$ such that $x= \lim_{n\rightarrow \infty}a_n$ but $a_n\neq x$ for all $n\in \mathbb N$. 

**Proof**
The $\implies$ direction is direct by choosing an epsilon shrinking region $\mathbb B_\epsilon(x)$ with $\epsilon = 1/n$ where $n\in \mathbb N$, then there is always a point that $a_n\in \mathbb B_n(x)$ such that $a_n \in A$ by the definition of $x$being a limit point of the set $A$. 

To show $\impliedby$, we can choose any $\mathbb B_\epsilon(x)$ for any $\epsilon > 0$ which then gives us a choice of $a_n\neq x$ that is in $A \cap \mathbb B_\epsilon(x)$, completing the definition of a limit point.  

**Observations**: 

$x\in A$ is not a requirement for the the theorem, nor the definition. 

**Remarks**

The limit sequence $(a_n)_{n\in \mathbb N}$ must occurs inside of the set $A$, but it's limit doesn't have to be in the set, furthermore, the constraints that $a_n \neq x$ is somewhat artificial and it's made with the intention to prevent an isolated point of $A$ where, a trivial sequence $a_n = x$ would approach the point and characterize it as a limit point as well.


**References**: Abbott's Understanding analysis chapter 3. 

