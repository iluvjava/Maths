- [Convergence, Completeness in Metric Space](Functional%20Spaces/Convergence,%20Completeness%20in%20Metric%20Space.md)
- [Hahn Banach Theorem and its Corollaries](Hahn%20Banach%20Theorem%20and%20its%20Corollaries.md) 


---
### **Intro**

Let $X$ be Hilbert space. 
So it's a special kind of Metric space. 
Recall that a sequence $x_n$ converges to $x$ in the metric means that $d(x, x_n) \rightarrow 0$ where $d(x, x_n)$ is just a real number. 
This is also referred to as strong convergence in Hilbert space. 
However, this is not the only mode of convergences in Hilbert space. 
We define weak convergence next. 



#### **Def | Weakly Converging Sequence**
> Let $x_n$ be a sequence in $X$ that converges weakly to a point $x$, denote as $x_n \rightharpoonup x$, then for all $v \in X$ we have $\langle x_n, v\rangle\rightarrow 0$. 


**Observations**

A sequence the converges weakly is not a sequence that converges strongly. 
Obviously consider the standard basis vector of $l^2$ with $\e_i$. 
We have $\langle \e_i, v\rangle = v_i$ for all $v_i$, for any $v \in X$. 
Since $v \in X$, we must have the partial sum $\sum_{i = 1}^{n} v_i^2$ to be convergent. 
And therefore $v_i$ is bounded by $\epsilon^2_i$, therefore it converges. 
Also it doesn't converge because it's not Cauchy. 


**Remarks**
In finite dimension, weak convergence is the same as strong convergence. 


#### **Def | Weak Seqeuentially Closed**
> A set $D \subseteq X$ is a sequential weakly closed set if, for all $x_n \in X$ such that $x_n \rightharpoonup x$, then $x \in D$. 



#### **Facts**
> We state a list of useful facts that may be useful. 
> 1. Weak limits if exists they are unique. 
> 2. Strong convergence implies weak convergence. 
> 3. $x_n \rightarrow x \iff (x_n \rightharpoonup x \wedge \Vert x _n \Vert\rightarrow \Vert x\Vert)$
> 4. $x_n \rightharpoonup x$ implies that $x_n$ is a bounded vector. 
> 5. Weak convergence is able to achieve convergence point-wise. Meaning that if $x_n \rightharpoonup y$, then $x_{n, k}\rightarrow y_{n, k}$ for all $k \in \mathbb N$. 
> 6. Every bounded sequence has a weakly convergent subsequence. 



