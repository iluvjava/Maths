- [Characterizing Functions for Optimizations](Background/Characterizing%20Functions%20for%20Optimizations.md)
- [Fenchel Conjugate](Duality/Convex%20Conjugation%20Introduction.md)

---
### **Intro**

**Piecewise Linear-Quadratic Functions (PLQ)**. 
This type of function seems to have key interest for applications related tasks. 

#### **Def | Piecewise Linear Quadratic Function ^[:1 Rockafellar, Wetts Definition 10.20]**
> Function $F:\R^n \rightarrow \overline \R$ is PLQ when 
> 1. $\text{dom}\; f$ is the union of finitely many polyhedral sets. 
> 2. on each polyhedral partitions, it admits form $x \rightarrow \langle x, Ax\rangle + \langle a, x\rangle + \alpha$, where $a$ is a vector, $\alpha$ is a scalar constant, and $A$ is symmetric. 
