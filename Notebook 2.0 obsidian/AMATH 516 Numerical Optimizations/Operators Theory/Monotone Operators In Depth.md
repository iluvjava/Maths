- [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md)

---
### **Intro**

We continue the saga of monotone operators in a separate files. 
The class of monotone operator is huge in Hilbert space and it has profound theorems. 
This writing will exposes references to some of the deeper theorems of monotone operators, and we prove some of them if they are appropriate. 

---
### **Minty's Surjectivity Theorem**

We introduce the star of this file. 

#### **Thm | Minty's Surjectivity Theorem for Maximally Monotone Operator**
> Let $A$ be a multi-valued mapping on some Hilbert space: $\mathcal H$, and $A$ is monotone. Then $A$ is *maximal monotone* if and only if $\text{ran}(I + A) = \mathcal H$ (The operator is surjective). 

**Proof**
For a proof and discussion of the theorem, visit [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md). 

---
### **Domain and Range of Max Monotone Operators**

These theorems are not easy to prove. 

#### **Corollary 21.14 | Convexity of the Closure of the Range and Domain of Maximal Monotone Operators**
> Let $F_A(x,z)$ be the Fritzpatrick Function of an operator $A$. 
> Let $A: X \mapsto 2^X$ be maximal monotone, set $Q_1: X \times X \mapsto X = (x, z) \mapsto x$ and $Q_2: X \times X \mapsto X = (x, z) \mapsto z$. 
> Then 
> 1. $\text{dom }A = \text{cl}(Q_1(\text{dom}(F_A)))$, 
> 2. $\text{int.dom } A = \text{int} Q_1 \text{dom }A$, 
> 3. $\text{cl.rng}A = \text{cl }Q_2 \text{ dom }F_A$, 
> 4. $\text{int.rng}A = \text{int }Q_2 \text{ dom }F_A$. 
> 
> Consequently, we have that the closure and the interior of the domain and range of a maximal monotone operator is a convex set. 

**Remarks**

It's Corollary 21.14 in Professor Heinz Red Book on monotone operators, 2nd edition. 
For more information about Fritzpatrick function, visit [Fitzpatrick Functions](Fitzpatrick%20Functions.md). 
