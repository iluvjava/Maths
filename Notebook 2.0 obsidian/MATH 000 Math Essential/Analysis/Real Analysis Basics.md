### **Intro**

We introduce the absolute basics of real analysis. There are approximately 2 parts: 
- The limits, continuity.
- The series, convergence. 

Besides that, I will just put whatever I want here. I am only writing this file after I am graduate school, PhD. So it's quite late and I forgot a bunch of the basics Real Analysis that I learned. I am doing this for functional analysis. These 2 things lie too close to each other to be ignored because a lot of these results are generalized into [[../../MATH 601 Functional Analysis/Functional Spaces/Metric Space Introduction | Metric Space Introduction]], a fundamental element that build up the functional spaces. Another one is vector space which has foundations in linear algebra. 

We assume that reader has basic mathematical maturity and at least know how to prove and the enumerosity of sets, countability and knows the symbolic representation of first order logic. For more about the concept of infinity, see [Countability of Sets](../Countability%20of%20Sets.md). 


---
### **Topology of the Real Number Line**
Basic Real analysis bases the topology on the real line. The nature of the real line is elusive. 

**Definition | A Dense Subset**
> A subset $A$ of real is dense if, for all $x, y \in \mathbb R$, there exists an element $z\in A$ such that it's between $x, y$. 

In brief, it's a set that is infinitely finely scattered on the background set. In our context the background set is the set of real number. 

**Example** 

The line of rationals is a dense set of the real. For every real number that is not the same, there is a rational that exist between the 2 number. 

**The Reals are a Separable Set**

> A set $X$ is separable if it contains a countable dense subset. 

In the case of the real number line, it contains the set of rationals as as a countable subset that is dense. 

---
### **Sequential Convergence**

The idea of sequential convergence gives reasoning behind the idea of continuity. 

> A sequence $a_n\rightarrow a$ if for all $\epsilon > 0$ there exists $N_\epsilon$ such that if $n > N_\epsilon$ then $|a_n - a|\le \epsilon$. 

**Remarks**

Intuitively it means that the number $a_n$ will stick very close to $a$, as much as we want it to, and it's sticking close to it all the way to infinity.

**More Backgrounds**

* [[Convergence of Cauchy Sequences]]

---
### **Monotone Convergence**

> Let $a_n$ be a real sequence and $a_{n + 1}\le a_n$ so that it's monotone decreasing. If the sequence is also bounded below, then it has to converge to a point. 

**Proof**

All numbers in the sequences form a subset of the real that is non-empty then it has to have an infimum by completeness of the reals. Let $L$ be the infimum, then for any $\epsilon > 0$ there exists $n$ such that $a_n \in [L, L + \epsilon]\;\forall \epsilon > 0$, by monotonicity of $a_n$, we know that $a_k \in [L, L + \epsilon]\;\forall k > n$, which is exactly the definition of a convergence sequence. 

---
### **Bozano Weierstrass | Converging Subsequence**

> Given any real sequence $a_n$ that is bounded in a compact interval $A$, there is a subsequence of $a_n$ that converges to a point in the space $A$. 

**Proof**

For a legit proof, see [Bozano Weierstrass](Bozano%20Weierstrass.md) for more information. 

**Remarks**

It's suitable in general metric space and converging subsequence characterizes compact spaces in metric space, this concept is very important because it generalizes to other places. 


---
### **Limit of a Function**

There are 2 equivalent definitions for the limit of a function at a point. One uses convergent sequences and the other uses, epsilon vicinity of a point in the domain.  

**Epsilon Region for the Limit of a Function**

> $L$ is a limit of function $f$ at the point $x_0$ if for all $\epsilon > 0$ there exists $\delta_\epsilon(x_0)$ such that for all $x$ with $0 < |x - x_0|< \delta_\epsilon(x_0)$ we have $|f(x) - f(x_0)| \le \delta_\epsilon(x_0)$. 

**Sequential Limit of a Function**

> $L$ is a limit of a function $f$ at the point $x_0$ if, for all sequence $x_n$ that converges to $x_0$ but $x_n\neq x_0\;\forall n \in \mathbb N$, we have $\lim_{n\rightarrow \infty}f(x_n) = L$. 

**Remarks**

The 2 definitions for the limit of a function is equivalent. 

---
### **Limit Point, Cluster Point**

We consider real numbers, let the background set to be real number. 

**Definition | Limit Point**
> A point $x$ is the limit point of the set $A$ if, there exists a sequence of number $x_n\in A$ such that $\lim_{n\rightarrow \infty} x_n = x$. 

Limit point is *used to described sequences*. For example, if, $x$ is a limit point for the sequence $(x_n)_{n\in \N}$, there is a subsequence of $x_n$ such that converges to the point $x$. 

**Definition | Cluster Point**
> A point $x$ is the cluster point of a set $A$ if, there exists a sequence of number $x_n\in A\setminus \{x\}$ such that $\lim_{n\rightarrow \infty}x_n = x$. 

Cluster points are used to *described sets with infinitely many points*. 

Observe that a cluster point is a limit point, but a limit point is not a cluster point, because an isolated point in set $A$ can't be approached by a cluster point, but it can with a limit point. Due to this property, the sequence that describes the limit of a function, will have a cluster point, instead of a limit point, because in the context of a limit, we may never actually equals to that point at the limit. 


**Example, Applications:**

* [[Limit, Cluster Point of a Sequence Set]]
* [[Closure Topology]], which can be characterized by limit point of the set. 

---
### **Pointwise Continuity**

> A real function is continuous at a point $x_0$ when $\forall \epsilon > 0$ we have $\delta_\epsilon(x_0)$ such that for all $x$ such that $|x - x_0|\le \delta_\epsilon(x_0)$, we have $|f(x) - f(x_0)| \le \epsilon$. 

**Observations**: 

A function is continuous at point $x_0$ if and only if $\lim_{x\rightarrow x_0}(x_n) = f(x_0)$. The definition of continuity is like, a more generalized concepts for limit. It's looking at the limit of some space, after the space being transformed by the function. This concept generalizes. 

---
### **Uniform Continuity**

Uniform continuity is crucial for integrability of functions. 

> A function $f$ is uniformly continuous over a region $A$ when for all $\epsilon > 0$ we have $\delta_\epsilon$ such that for all $x, y$ such that $|x - y|< \delta_\epsilon(A)$ we have $|f(x) - f(y)| \le \epsilon$ for any $x, y\in A$. 

**Observations**: 

It's saying that, for all epsilon vicinity for any points $x \in A$, some subset of the domain of the function, is going to be $\epsilon$ bounded, but in the pointwise definition, we are using, different $\epsilon$ to bound each and very points. This is a *stronger version of  point-wise continuity*. 


---
### **Uniform, Pointwise Convergence of a function**

We use pointwise convergence and uniform convergence to describe that possible ways where a sequence of functions can converge to another function in the space. 

**Def | Pointwise convergence**
> $f_n \rightarrow f$ pointwise in $D$ when for all point $x_0\in D$ such that for all $\epsilon$, if $n > N_\epsilon$ then we have $|f_n(x_0) - f(x_0)| \le \epsilon$. 

In brief, if we are long looking at each point on the function $f_n(x_0)$, then it gets closer to the point $f(x_0)$. 

**Remarks**
However, the relative speed of how each point converges to the target function is not described in the pointwise convergence definition. 

**Def | Uniform Convergence**

> $f_n \rightarrow f$ uniformly on $D$ when for all $\epsilon$ there exists $N_\epsilon$ when $n > N_\epsilon$ we have $\Vert f_n - f\Vert_D \le \epsilon$. Here, $\Vert g\Vert_D:= \sup_{x\in D}|g(x)|$ is a norm for the function. 

In brief, all the point in the region $D$ will be close to the target function. There doesn't exists some point where it's always slower than all the other point when the function $f_n$ is converging. 





