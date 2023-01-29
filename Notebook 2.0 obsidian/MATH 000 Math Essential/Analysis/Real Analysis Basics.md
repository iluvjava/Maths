### **Intro**

We introduce the absolute basics of real analysis. There are approximately 2 parts: 
- The limits, continuity.
- The series, convergence. 

Besides that, I will just put whatever I want here. I am only writing this file after I am graduate school, PhD. So it's quite late and I forgot a bunch of the basics Real Analysis that I learned. I am doing this for functional analysis. These 2 things lie too close to each other to be ignored because a lot of these results are generalized into [[Metric Space]], a fundamental element that build up the functional spaces. Another one is vector space which has foundations in linear algebra. 

We assume that reader has basic mathematical maturity and at least know how to prove and the enumerosity of sets, countability and knows the symbolic representation of first order logic. 


---
### **Real Number Line**
Basic Real analysis bases the topology on the real line. The nature of the real line is elusive. 

**Definition: A Dense Subset**
> A subset $A$ of real is dense if, for all $x, y \in \mathbb R$, there exists an element $z\in A$ such that it's between $x, y$. 

In brief, it's a set that is infinitely finely scattered on the background set. In our context the background set is the set of real number. 

**Example:** 
The line of rationals is a dense set of the real. For every real number that is not the same, there is a rational that exist between the 2 number. 

**Real is Separable**

> A set $X$ is separable if it contains a countable dense subset. 

In the case of the real number line, it contains the set of rationals as as a countable subset that is dense. 


---
### **Sequential Convergence**

The idea of sequential convergence gives reasoning behind the idea of continuity. 

> A sequence $a_n\rightarrow a$ if for all $\epsilon > 0$ there exists $N_\epsilon$ such that if $n > N_\epsilon$ then $|a_n - a|\le \epsilon$. 
>

**Remarks**

Intuitively it means that the number $a_n$ will stick very close to $a$, as much as we want it to, and it's sticking close to it all the way to infinity.

**More Backgrounds**

* [[Convergence of Cauchy Sequences]]

---
### **Monotone Convergence**

> Let $a_n$ be a real sequence and $a_{n + 1}\le a_n$ so that it's monotone decreasing. If the sequence is also bounded below, then it has to converge to a point. 

**Proof**

All numbers in the sequences form a subset of the real that is non-empty then it has to have an infimum by completeness of the reals. Let $L$ be the infimum, then for any $\epsilon > 0$ there exists $n$ such that $a_n \in [L, L + \epsilon]$, by monotonicity of $a_n$, we know that $a_k \in [L, L + \epsilon]\;\forall k > n$, which is exactly the definition of a convergence sequence. 

---
### **Bozano Weierstrass | Converging Subsequence**

> Given any real sequence $a_n$ that is bounded in a compact interval $A$, there is a subsequence of $a_n$ that converges to a point in the space $A$. 

**Proof**

Use the nested interval theorem or something. Skip. 

**Remarks**

It's suitable in general metric space. 


---
### **Limit of a Function**

> $L$ is a limit of function $f$ at the point $x_0$ if for all $\epsilon > 0$ there exists $\delta_\epsilon(x_0)$ such that for all $x$ with $0 < |x - x_0|< \delta_\epsilon(x_0)$ we have $|f(x) - f(x_0)| \le \delta_\epsilon(x_0)$. 

**Sequential Limit of a Function**

> $L$ is a limit of a function $f$ at the point $x_0$ if, for all sequence $x_n$ that converges to $x_0$ but $x_n\neq x_0\;\forall n \in \mathbb N$, we have $\lim_{n\rightarrow \infty}f(x_n) = L$. 

**Remarks**

The 2 definition for the limit of a function is equivalent. 

---
### **Limit Point, Cluster Point**

We consider real numbers, let the background set to be real number. 

**Definition: Limit Point**
> A point $x$ is the limit point of the set $A$ if, there exists a sequence of number $x_n\in A$ such that $\lim_{n\rightarrow \infty} x_n = x$. 
>

**Definition: Cluster Point**
> A point $x$ is the cluster point of a set $A$ if, there exists a sequence of number $x_n\in A\setminus \{x\}$ such that $\lim_{n\rightarrow \infty}x_n = x$. 

Observe that a cluster point is a limit point, but a limit point is not a cluster point, because an isolated point in set $A$ can't be approached by a cluster point, but it can with a limit point. 


**Example, Applications:**

* [[Limit, Cluster Point of a Sequence Set]]
* [[Closure Topology]], which can be characterized by limit point of the set. 

---
### **Pointwise Continuity**

> A real function is continuous at a point $x_0$ when $\forall \epsilon > 0$ we have $\delta_\epsilon(x_0)$ such that for all $x$ such that $|x - x_0|\le \delta_\epsilon(x_0)$, we have $|f(x) - f(x_0)| \le \epsilon$. 


---
### **Uniform Continuity**

> A function $f$ is uniformly continuous over a region $A$ when for all $\epsilon > 0$ we have $\delta_\epsilon$ such that for all $|x - y|< \delta_\epsilon(A)$ we have $|f(x) - f(y)| \le \epsilon$ for any $x, y\in A$. 


---
### **Uniform, Pointwise Convergence of a function**

We use pointwise convergence and uniform convergence to describe that possible ways where a sequence of functions can converge to another function in the space. 

**Def: Pointwise convergence**
> $f_n \rightarrow f$ pointwise in $D$ when for all point $x_0\in D$ such that for all $\epsilon$, if $n > N_\epsilon$ then we have $|f_n(x_0) - f(x_0)| \le \epsilon$. 

In brief, if we are long looking at each point on the function $f_n(x_0)$, then it gets closer to the point $f(x_0)$. 

**Remarks**
However, the relative speed of how each point converges to the target function is not described in the pointwise convergence definition. 


**Def: Uniform Convergence**

> $f_n \rightarrow f$ uniformly on $D$ when for all $\epsilon$ there exists $N_\epsilon$ when $n > N_\epsilon$ we have $\Vert f_n - f\Vert_D \le \epsilon$. Here, $\Vert g\Vert_D:= \sup_{x\in D}|g(x)|$ is a norm for the function. 

In brief, all the point in the region $D$ will be close to the target function. There doesn't exists some point where it's always slower than all the other point when the function $f_n$ is converging. 

