[[Real Analysis Basics]]. 

----
### **Intro**

We prove the Bozano Weierstrass theorem from first Principles. Confusions where quite involved when I first learn the topic, and it still is not easy to grasp after I started my graduate degree. Here we follow on of the proof from Wikipedia, and then we show it with mostly man, other than words. We do it for $\R$ first, and then state the Euclidean space $\R^n$ later. 

**Thm-1 | Bozano Weierstrass, Converging Subsequences**
> For any closed and bounded subset of $C\subseteq\R$, an infinite sequence $x_n\in C$ will contain a converging subsequence such that $x_{n_k}$ converges to a point $\bar x \in C$. 

**Lemma 1**: 
> For any sequence $x_n$ it will contain a monotone subsequence. 


---
### **Proof of the Theorem via Monotone subsequence**

Given a sequence, $x_n$, it must contains a monotone subsequence (see [Monotone Subsequence Theorem](Monotone%20Subsequence%20Theorem.md)), and in the case when $x_n \in C$, $C$ being a bounded set, we know that $\sup_{n\in \N}{x_n}$ or $\inf_{n\in \N}x_n$ must exist (bounded monotone sequence theorem) and by the fact that the sequence is monotone, it must converge to one of those point, and when the set $C$ is closed, we know that $\sup_{n\in \N}x_n, \inf_{n\in \N}x_n$ must also be a member of $C$. This completes the proof. 



---
### **Corollary | Higher Dimensions**

> Bozano Weierstrass' theorem can also be applied to $\R^n$. 

**Proof**: 

This is true because we can extract out a convergence subsequence that only converges on the first element in the vector, and then we repeat the same process on the subsequence and extract out a subsequence of that subsequence that converges on the second coordinate and so on. Then in the end, the sequence is going to converge to a point in $\R$. 


---
### **Alternative Proof for $\R$ using Nested Intervals**

This proof was in fact, the proof I was exposed to in my first ever analysis class. 
