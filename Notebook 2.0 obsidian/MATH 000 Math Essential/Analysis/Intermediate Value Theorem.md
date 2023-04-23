- [Real Analysis Basics](Real%20Analysis%20Basics.md), for continuous function. 

---
### **Intro**

When a function is continuous over a closed interval $[a, b]$ on the real line. Suppose that we obtained $f(a), f(b)$, and suppose that $y\in [f(a), f(b)]$, then there exists some value $x\in [a, b]$ such that $f(x) = y$. 

#### **Thm-1 | Intermediate Value Theorem**
> Let $f:\R \mapsto \R$ such that it's continuous, suppose that $y$ exists between the value of $f(a), f(b)$, then there exists at least one $x$ such that $f(x) = y$. 

**Proof**

Without lost of generality, we assume $f(a) < y < f(b)$. Let $S:= \{x\in [a, b]| f(x) < y\}$. $a \in S \implies S \neq \emptyset \implies \bar x:=\sup S \in [a, b]$. We consider 2 sequences that approaches the point $\bar x$ in different ways. 
- construct $(x_n)_{n\in \N}$ with $\lim_{n\rightarrow \infty} x_n = \bar x$, where $x_n < \bar x$, then $x_n\in S$, hence $f(x_n) < y$, taking the limit of the sequence yield: $f(\bar x) = \lim_{n\rightarrow \infty}f(x_n) \le y$ by $x_n \in S$. For concrete argument, the sequence can simply be: $x_n = \bar x - 1/n$. 
- Other wise we can make $x_n'$ approaching $\bar x$ from above, then $x_n\not \in S$, hence $\lim_{n\rightarrow \infty}f(x_n) = f(\bar x) \ge y$. 

The limit equals to the function at $\bar x$ is because the function is known to be continuous. Since $f(\bar x)$ is both $\ge, \le$, it must be equal. Concluding the proof here. 


**Remarks**: 

If, a continuous function takes different signs at both ends of the intervals, then it must take the value zero at some point, with a valid roots satisfying the conditions as well. 

