- [[Metric Space]], 
- [[../../MATH 000 Math Essential/Analysis/Real Analysis Basics]], 
- [[../../AMATH 516 Numerical Optimizations/Background/Topological Basics for Optimizations]], 


---
### **Intro**

Separability, Denseness, and completeness of the Metric Spaces and their derivatives. For the introduction, we define some of the concepts and then use theorems to paint a better picture for the topologies inside of a metric space. 

To start, we define the concept of vicinity around any "point" in the metric space. Given $(X, d)$, we then define 

**Definition: An Open set**
> $A\subseteq X$ is open when for all $x\in A$ there exists $\epsilon > 0$ such that $\mathbb B_\epsilon(x)\in A$. 

**Definition: A Closed Set**
> $A\subseteq X$ is closed when $X\setminus A$ is open. 



**Definition: Dense Subset**

> A subset $A\subseteq X$ is dense when $\text{cl}(A) = X$. 


**Definition: An Accumulation Point**

>Let $M\subseteq X$, with $x_0\in X$, $x_0$ is an accumulation point if for all $\epsilon > 0$, we have $\mathbb B_\epsilon(x_0)\setminus \{x_0\} \neq \emptyset$. 


**Observation**
- The accumulation point of a set doesn't have to be in that set $M$, but it does have to be in the background set $X$. 
- It has to have some other neighbours in $M$ that is as close we want them to be $M$. 
- This is not exactly the same as the definition of a limit point in real analysis as that one doesn't require the pointto be part of the subset $A\subseteq \mathbb R$. 
- If the union of all limit points of $A$ is the same as background set $X$, then the set $A\subseteq X$ is dense in the set $X$. 


**Theorem: Sequential Characterization of an Accumulation Point**

> $x_0 \in X$ is an accumulation point of $M$ if and only if for all $\epsilon > 0$, $\mathbb B_{\epsilon}(x_0)\setminus \{x_0\}$ contains infinitely many points of $M$, i.e: there exists a sequence $(x_n)_{n\in \mathbb N}$ such that $\lim_{n\rightarrow \infty}x = x_0$ with $x_n \neq x \; \forall n \in \mathbb N$. 


**Proof**:

This theorem is analogous to the limit point in the real line, hence we are skipping the proof here. 

**Example:**
The set $\mathbb Z\subseteq \mathbb R$ with metric $|\cdot|$ is not having any accmulation point because all the points in the set is a singleton. 

**Definition: A Separable Subset**

> $X$ is a separable metric space if it has a countable subset that is dense in $X$. 

**Intuitive Explanations**: 

There is a subset that is countable such that it can cover almost everypoint in the set $X$ via the use of sequential limit. If this is not the case, then we can't really distinguish points "fine enough" using limits on the metric for this metric space. 

**Example: Separable Space**

The set $\mathbb R$ equiped with the usual $\Vert \cdot\Vert$ Euclidean space is separable because the closure of $\mathbb Q^n$, a countable subset gives us the space $\mathbb R^n$. 
