[[Convex Sets]]
[[Characterizing Functions for Optimizations]]

---
### **Intro**

There are too many, this single file is just going to be a link to various other files. 

---
### **Lower Semi-Continuous Convex function is Closed**

> A convex function $f$ is closed if an only if it's lower semi-continous. 

**Proof**: 

The direciton where, if a function is lower semi-continuous and it's convex, then its epigraph is closed. This is direct and proved in [[Lower Semi-Continuity is Closedness of Epigraph]]. The other direction is also obvious because if a function is closed, regardless of it being convex or not, it's l.s.c. 



---
### **Continuity of Closed Convex Functions**

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$ be convex. Let $x_0 \in \text{int}(\text{dom}(f))$, then there exists $\epsilon > 0$, and $L > 0$ such that $\mathbb B_{x_0}$ such that: 
> 
>  $$
>	|f(x) - f(x_0)| \le L \Vert x - x_0\Vert
> $$
> 
> Where the function is locally Lipschitz. 

**Source**: Theorem 2.21 from \<First Order Method in Optimizations\>, It's also one of the main results in Dimitry's notes, chapter 3 for his AMATH 516. 


**Remarks**: 

The definition of Lipchitz is in [[Lipschitz Continuity]], and the proof and detailed discussion will be in here: [[Convex Function is Locally Lipschitz]]. 

---
### **Proper Convex Functions are Lipschitz Continuous**

For more details about it see [[Convex Function is Locally Lipschitz]] for more expositions. 

