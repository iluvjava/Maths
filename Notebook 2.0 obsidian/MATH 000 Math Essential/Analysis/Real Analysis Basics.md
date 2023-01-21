### **Intro**

We introduce the absolute basics of real analysis. There are approximately 2 parts: 
- The limits, continuity.
- The series, convergence. 

Besides that, I will just put whatever I want here. I am only writing this file after I am graduate school, PhD. So it's quite late and I forgot a bunch of the basics Real Analysis that I learned. I am doing this for functional analysis. These 2 things lie too close to each other to be ignored because a lot of these results are generalized into [[Metric Space]], a fundamental element that build up the functional spaces. Another one is vector space which has foundations in linear algebra. 

---
### **Bozano Weiestrass | Converging Subsequence**

> Given any sequence $a_n$ that is bounded in a compact interval $A$, there is a subsequence of $a_n$ that converges to a point in the space $A$. 

**Proof**

Skip. 

**Remarks**

It's suitable in general metric space. 

---
### **Limit of a Function**

> $L$ is a limit of function $f$ at the point $x_0$ if for all $\epsilon > 0$ there exists $\delta_\epsilon(x_0)$ such that for all $x$ with $0 < |x - x_0|< \delta_\epsilon(x_0)$ we have $|f(x) - f(x_0)| \le \delta_\epsilon(x_0)$. 


---
### **Pointwise Continuity**

> A real function is continuous at a point $x_0$ when $\forall \epsilon > 0$ we have $\delta_\epsilon(x_0)$ such that for all $x$ such that $|x - x_0|\le \delta_\epsilon(x_0)$, we have $|f(x) - f(x_0)| \le \epsilon$. 


---
### **Uniform Continuity**

> A function $f$ is uniformly continuous over a region $A$ when for all $\epsilon > 0$ we have $\delta_\epsilon$ such that for all $|x - y|< \delta_\epsilon(A)$ we have $|f(x) - f(y)| \le \epsilon$ for any $x, y\in A$. 




