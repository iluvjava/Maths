### **Intro**

We introduce the absolute basics of real analysis. There are approximately 2 parts: 
- The limits, continuity.
- The series, convergence. 

Besides that, I will just put whatever I want here. I am only writing this file after I am graduate school, PhD. So it's quite late and I forgot a bunch of the basics Real Analysis that I learned. I am doing this for functional analysis. These 2 things lie too close to each other to be ignored because a lot of these results are generalized into [[Metric Space]], a fundamental element that build up the functional spaces. Another one is vector space which has foundations in linear algebra. 

---
### **Sequential Convergence**

The idea of sequential convergence gives reasoning behind the idea of continuity. 

> A sequence $a_n\rightarrow a$ if for all $\epsilon > 0$ there exists $N_\epsilon$ such that if $n > N_\epsilon$ then $|a_n - a|\le \epsilon$. 
>

**Remarks**

Intuitively it means that the number $a_n$ will stick very close to $a$, as much as we want it to, and it's sticking close to it all the way to infinity. 


---
### **Bozano Weierstrass | Converging Subsequence**

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


---
### **Uniform convergence and Pointwise Convergence of a function**

We use pointwise convergence and uniform convergence to describe that possible ways where a sequence of functions can converge to another function in the space. 

**Def: Pointwise convergence**
> $f_n \rightarrow f$ pointwise in $D$ when for all point $x_0\in D$ such that for all $\epsilon$, if $n > N_\epsilon$ then we have $|f_n(x_0) - f(x_0)| \le \epsilon$. 

In brief, if we are long looking at each point on the function $f_n(x_0)$, then it gets closer to the point $f(x_0)$. 

**Remarks**
However, the relative speed of how each point converges to the target function is not described in the pointwise convergence definition. 


**Def: Uniform Convergence**

> $f_n \rightarrow f$ uniformly on $D$ when for all $\epsilon$ there exists $N_\epsilon$ when $n > N_\epsilon$ we have $\Vert f_n - f\Vert_D \le \epsilon$. Here, $\Vert g\Vert_D:= \sup_{x\in D}|g(x)|$ is a norm for the function. 

In brief, all the point in the region $D$ will be close to the target function. There doesn't exists some point where it's always slower than all the other point when the function $f_n$ is converging. 

