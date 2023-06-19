---
alias: Baire Catetory Theorem and Uniform Mapping Theorem

---
- [Metric Space Introduction](Functional%20Spaces/Metric%20Space%20Introduction.md)
- [Convergence, Completeness in Metric Space](Functional%20Spaces/Convergence,%20Completeness%20in%20Metric%20Space.md)
---
### **Intro**

This theorem shows how much of the topology of the reals can be used to represent abstract metric spaces. It has profound consequences. In [Functional Analysis From MIT OCW](References/Functional%20Analysis%20From%20MIT%20OCW.pdf), it's stated that one of the profound consequence of the theorem is that existence of a function that is continuous but nowhere differentiable. See [this](https://math.stackexchange.com/questions/2993112/proving-that-the-set-of-continuous-nowhere-differentiable-functions-is-dense-usi) for a stack exchange post about it. 


---
### **More Topologies for Metric Spaces**

We would need just a bit more topolgy to grasp the statement of the theorem better. 


#### **Def | Boundary, Interior and Closure**
> Let $(X, d)$ be a complete metric space, let $M \subseteq X$ we define the interior,closure and the boundary of for the set $M$. 
> 1. The boundary is $\partial M := \{x \in X | \forall \epsilon > 0: \mathbb B_\epsilon(x)\cap M \neq \emptyset \wedge \mathbb B_\epsilon(x | X \cap M^C \neq \emptyset)\}$. It's all the point in the space where, any epsilon region of the space around the point intersect the set, and the complement of the set. 
> 2. The interior of the set is $M^\circ$, defined as $M^\circ := \{x\in X : \forall \epsilon > 0, \mathbb B_\epsilon(x) \in M\}$. Describing the region of all points such that infinity small vicinty of the point is still part of the set. 
> 3. The closure of the set is another set defined as $\overline M := \{x \in X : \forall \epsilon > 0, \mathbb B_\epsilon(x)\cap X \neq \emptyset\}$. Describing all the points where, the infinitely small vicinity of the point can intersect with the set. 

**Observations**

Direct from the definiton, we can discover: 
1. $M^\circ \subseteq M\subseteq \overline M$
2. For any type of singleton set $M$, we have $\partial M = M$. 
3. In the case of $M = \mathbb Q, X = \mathbb R$, we have $\partial M = \mathbb R$, and $Q\subsetneq \partial \mathbb Q$. 
4. For $[1, 0]$, we have $\partial [0, 1] = \{0, 1\}\subsetneq [0, 1]$. 
5. Observe that, $\partial M \cap M^\circ = \emptyset$ by definiton. If the point is pard of the boundary, then it cannot be in the interior of the set. 
6. Observe that, $\partial M \cup M^\circ \subseteq \overline M$. If a point is in the boundary, then it intersect with $M$, then it's part of the closure. Since all points in the set $M$ itself is definitely in the closure, the observation is true. 
7. The in the above case (6.) equal can be true. This is direct by thinking about the definiton, therefore we also have $\overline M = M^\circ \cup \partial M$. 


#### **Thm | Nowhere Dense is Stronger than Empty Interior**
> Let $(X, d)$ be a metric space. Let $M \subseteq X$ be a subset that is nowhere dense, meaning that $\left(\overline M\right)^\circ = \emptyset$ (interior of the closure is empty), then the set must have empty interior, but the converse is not true. 

**Proof**

$$
\begin{aligned}
    \left(
        \overline M
    \right)^\circ &= (\partial M \cup M^\circ)^\circ
    \\
    (\text{observation 5})\implies &= 
    ((\partial M)^\circ  \cup M^\circ)\supseteq M^\circ
    \\
\end{aligned}
$$

Therefore, $M^\circ \subseteq  \left(\overline M\right)^\circ$, and therefore. Being a nowhere dense set is stronger. The converse is not true, consider the set $\mathbb Q$, which is dense, and not nowhere dense. 


**Remarks**

A nowhere dense set is a set that is not dense. A dense set is a set $M\subseteq X$ such that $\overline M = X$. Dense and nowhere dense are mutually exclusive, however, there are sets that are neither dense, nor nowhere dense, those sets that are neither, can be devided into sets with empty interior, and without empty interior, nowhere dense sets are from the former category, and it's a stronger set of such category. 

### **Def | Complement Topology**

> Let $(X, d)$ be a metric space with $M \subseteq X$. If $M$ is an open set, meaning that $M^\circ = M$, then the complement set $M^C$ is a closed set. 

**Proof**




