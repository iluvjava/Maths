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

We would need just a bit more topolgy to grasp the statement of the theorem better. In the following theorems, $\mathbb B_\epsilon(x)$ is the epsilon ball centered at $x$, with background topology $X$. 


#### **Def | Boundary, Interior and Closure**
> Let $(X, d)$ be a complete metric space, let $M \subseteq X$ we define the interior,closure and the boundary of for the set $M$. 
> 1. The boundary is $\partial M := \{x \in X | \forall \epsilon > 0: \mathbb B_\epsilon(x)\cap M \neq \emptyset \wedge \mathbb B_\epsilon(x)\cap M^C \neq \emptyset\}$. It's all the point in the space where, any epsilon region of the space around the point intersect the set, and the complement of the set. 
> 2. The interior of the set is $M^\circ$, defined as $M^\circ := \{x\in X | \exists \epsilon > 0 \text{ s.t: } \mathbb B_\epsilon(x) \subseteq M\}$. Describing the region of all points such that infinity small vicinity of the point is still part of the set. 
> 3. The closure of the set is another set defined as $\overline M := \{x \in X | \forall \epsilon > 0, \mathbb B_\epsilon(x)\cap X \neq \emptyset\}$. Describing all the points where, the infinitely small vicinity of the point can intersect with the set. 

**Observations**

Direct from the definition, we can discover: 
1. $M^\circ \subseteq M\subseteq \overline M$
2. For any type of singleton set $M$, we have $\partial M = M$. 
3. In the case of $M = \mathbb Q, X = \mathbb R$, we have $\partial M = \mathbb R$, and $Q\subsetneq \partial \mathbb Q$. 
4. For $[1, 0]$, we have $\partial [0, 1] = \{0, 1\}\subsetneq [0, 1]$. 
5. Observe that, $\partial M \cap M^\circ = \emptyset$ by definition. If the point is pard of the boundary, then it cannot be in the interior of the set. 
6. Observe that, $\partial M \cup M^\circ \subseteq \overline M$. If a point is in the boundary, then it intersect with $M$, then it's part of the closure. Since all points in the set $M$ itself is definitely in the closure, the observation is true. 
7. The in the above case (6.) equal can be true. This is direct by thinking about the definition, therefore we also have $\overline M = M^\circ \cup \partial M$. 
8. The empty set is a both opened and closed. It's opened because there is no point to choose the vicinity of to test the definition, hence it's open. It's closed because there is no point to choose the vicinity of to test the definition, hence it's closed. These conditions are trivially satisfied. 


#### **Thm-1 | Nowhere Dense is Stronger than Empty Interior**
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

#### **Thm-2 | Complement Topology**

> Let $(X, d)$ be a metric space with $M \subseteq X$. If $M$ is an open set, meaning that $M^\circ = M$, then the complement set $M^C$ is a closed set. 

**Proof**

Choose $x\in M^C$, then $x \not\in M$. The set $M$ is open, we have equivalence

$$
\begin{aligned}
    (M^\circ = M) &\iff 
    (x \in M^\circ \iff\exists \epsilon > 0 :\mathbb B_\epsilon(x)\subseteq M)
    \\
    & \iff 
    (x\in M^C \iff \forall \epsilon > 0 : \mathbb B_\epsilon(x)\not\subseteq M)
    \\
    & \text{and :}
    \\
    & \quad 
    \begin{aligned}
        \forall \epsilon > 0 : \mathbb B_\epsilon(x)\not\subseteq M &\iff 
        \forall \epsilon > 0 : (\mathbb B_\epsilon(x)\subseteq M^C \vee \mathbb B_\epsilon(x) \cap M^C\neq \emptyset). 
        \\
        &\iff 
        \forall \epsilon 0 > : \mathbb B_\epsilon(x) \subseteq M^C
        \\
        &\iff M^C = \overline{(M^C)}. 
    \end{aligned}
\end{aligned}
$$


Therefore, the complement set is a closed set. 

---
### **Baire's Category Theorem**


#### **Terminologies and background**
Let $(X, d)$ be a complete metric space, with $M\subseteq X$, the $M$ is 
1. *Rare* (which is the same as Nowhere dense, abbreviated as N.D). 
2. *Meager*, maens that $M$ is a union of countably(or finite) many *rare* sets.
3. Non-Meager, when $M$ is not a Meager set. 

#### **Thm-3 | Baire Category**

> If $(M, d)$ is a complete metric space where it's $\neq \emptyset$, then $M$ is non-meager, consequently if $M = \cup_{k\in \mathbb N}C_k$, where $C_k$ are all closed set, then it has to be the case that not all of them are N.D. Which means that at least one of them has an non-empty interior to it. 

**Proof**

For the best comfort of readhing, I am experimenting with new format of presenting the proof. To proof, we derive a contradiction by assuming that, $M$ is the union of $C_n$, a sequence of set that are all closed, having empty interior (they are all N.D).To start, we list and label the following statements
* \[(S1)\]: $(M, d)$ is a metric space that is complete with $M\neq \emptyset$. 
* \[(S2)\]: $M= \cup_{n\in \mathbb N}C_n$. 
* \[(S3)\]: $C_n = \overline C_n$, these sets the make up $M$ above are all closed sets. All N.D. 

Observe that, if $C_n = M$ for any $n\in \mathbb N$, then the interior of $C_n = M$, which contradicts N.D assumptions from \[(S3)\]. Therefore it must be $C_n \neq M$ for all $n\in \mathbb N$. Therefore, let's consider fixing any $n \in \mathbb N$, then 

$$
\begin{aligned}
    (C_n \neq M \wedge [(S1)]) &\implies (M\setminus C_n \neq \emptyset)
    \\
    &\iff 
    (\exists p_n \in M\setminus C_n) \leftarrow [(1)] 
    \\
    [(2)]\rightarrow (C_n \text{ is closed}) &\iff (M\setminus C_n \text{ open}) \; \text{ by thm-2}
    \\
    &\iff (\exists \epsilon_n > 0: \mathbb B_{\epsilon_n}(p_n)\subseteq (M\setminus C_n))
    \\
    & \iff(\exists \epsilon_n > 0 : \mathbb B_{\epsilon_n}(p_n)\cap C_n = \emptyset)
\end{aligned}
$$

Next, we are going to choose another point $p_{n + 1}$ that is close to $p_n$. Consider 

$$
\begin{aligned}
    \left(
        \mathbb B_{\epsilon_n/3}(p_n)\not\subseteq C_{n + 1} \text{ by } C_{n + 1} \text{ being N.D}
    \right)
    & \implies \left(
        \exists p_{n + 1} \in \mathbb B_{\epsilon_n/3}(p_n) : 
        p_{n + 1} \not\in C_{n + 1}
    \right) 
    \\
    \left([(2)]\wedge p_{n + 1}\not\in C_{n + 1}\right) &\implies
    \left(
        \exists \epsilon_{n + 1} : \epsilon_{n}/3 > \epsilon_{n + 1} > 0 : \mathbb B_{\epsilon_n}(p_{n + 1}) \cap C_{n + 1} = \emptyset
    \right)
\end{aligned}
$$

