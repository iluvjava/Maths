[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)


---
### **Interior**

The interior of a set $B\subseteq \mathbb R^n$ is the set of all the point such that for each point, there exists an closed epsilon ball surrounding that point and the whole ball is in the set $B$. Denotes the interior of the set as $\text{int}(B)$, then we have the definition that: 

#### **Def | Interior of a Set**
> $$
> x\in \text{int}(B)\iff 
> \exists \delta > 0: \mathbb{B}_\delta \subset Q
> $$

**Context**

The characterization allows moving around the point a tiny bit, make things easier when dealing with infinity. 

**Observations**

If $C_1 \subseteq C_2$, then it's interior still preserves this relation 

**Facts**

We call a set $C$ is open if $\text{int}(C) = C$, for notation simplicity we make $\text{int}C = C^\circ$. 


#### **Thm | Maximal Open set Subset is the Interior of the Set**
> The interior of the set $C$ is the union of all open set that is contained in $C$, meaning that $\text{int}(C) = \bigcup\{S\subseteq C | S^\circ = S\}$


**Proof**

If $x \in C^\circ$ then exists open ball $\mathbb = \{x : \Vert x\Vert < 1\}$, $\epsilon > 0$ where $x + \epsilon \mathbb B \subseteq C$, since $x + \epsilon \mathbb B$ is an open set, it belongs to the maximal open subsets of $C$. Choose any $x \in \bigcup\{S\subseteq C | S^\circ = S\}$, then by some type of axiom (maybe the axiom of choice) we have $x \in S \subseteq S$, and by the axiom of topology, there exists $\epsilon > 0$ such that $s + \epsilon \subseteq S \subseteq C$, and hence by the above definition of interior we have $x \in C^\circ$. 

