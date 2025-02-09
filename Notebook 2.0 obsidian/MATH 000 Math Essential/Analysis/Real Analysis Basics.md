### **Intro**

We introduce the absolute basics of real analysis. There are approximately 2 parts: 
- The limits, continuity.
- The series, convergence. 

Besides that, I will just put whatever I want here. I am only writing this file after I am graduate school, PhD. 
So it's quite late and I forgot a bunch of the basics Real Analysis that I learned. 
I am doing this in preparation for functional analysis. 
These two things lie too close to each other to be ignored because a lot of these results are generalized into [[../../MATH 601 Functional Analysis, Measure Theory/Functional Spaces/Metric Space Introduction | Metric Space Introduction]], a fundamental element that build up the functional spaces. 
Another one is vector space which has foundations in linear algebra. 

We assume that reader has basic mathematical maturity and at least know how to prove and the enumerosity of sets, countability and knows the symbolic representation of first order logic. 
For more about the concept of infinity, see [Countability of Sets](../Countability%20of%20Sets.md). 


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
### **Cauchy Sequence**

We apply the Bozano Wierestrass to prove the Cauchy convergence theorem for a sequence in $\mathbb R$. 

#### **Def | Cauchy Sequence in $\mathbb R$**
> Sequence $(a_n)_{n\in \mathbb N}$ a Cauchy sequence if, for all $\epsilon > 0$, there exists $N_\epsilon$ such that for all $m > n > N_\epsilon$ it satisfies that $|a_m - a_n| < \epsilon$, if and only if the sequence is a convergent sequence. 

**Proof**

If the sequence $a_n$ is convergent, then $|a_n - a_m|\le |a_n - a - (a_m - a)| \le |a_n - a| + |a_m - a|$ is bounded, by the limit existence, the right hand side has a limit of zero, and hence $|a_m - a_n|$ can be epsilon bounded. To show that a Cauchy sequence is a convergent sequence, direclty conider that 
$$
\begin{aligned}
    & \forall \epsilon > 0\;  \exists N_\epsilon \in \mathbb N : m > n > N_\epsilon: 
    m > n > N_\epsilon \implies |a_n - a_m| <\epsilon
    \\
    \text{ B.W} \implies & 
    \forall n > N_\epsilon\; 
    \exists
    (a_{m_k + n})_{k\in \mathbb N}: \lim_{k\rightarrow \infty} a_{m_k} =a
    \\
    \implies & \forall n\ge N_\epsilon
    \lim_{k\rightarrow \infty}|a_{n + m_k} - a_n| \le \epsilon
    \\
    \implies &\forall n \ge N_\epsilon: 
    |a - a_n| \le \epsilon
    \\
    \implies & \lim_{n\rightarrow \infty} |a - a_n| = 0, 
\end{aligned}
$$

and hence the subsequential limit has to be the limit of the sequence. 

---
### **Subsequence and Subsequential Limit**

To define a subsequence, we need a sequence in $\mathbb R$. 
Let $a_n$ be a sequence in $\mathbb R$. 

#### **Def | Subsequence**
> A subsequence of $a_n$ is the sequence $a_{n_k}$ such that $n_{k + 1} > n_{k}$. 

**Observations**

We may treat any sequence as a function, for example $a_n: \mathbb N \mapsto \mathbb R$. 
This sequence is essentially a function mapping from the indices of the sequence that is in the set of natural number to the set of reals. 
Then a subsequence would be defined as a restriction of the function $a_n$ on a countably infinite set of $\mathbb N$. 
In more abstract term, the set $\mathbb N$ also has total order and a sequence is a always a map from a set that has total order to another set. 

**Remarks**

The definition excludes finite sequence. 
Assuming finite sequence is included, the set of all subsets of $\mathbb N$ is uncountable. 
However, it's not sure to the writer whether the subset of all infinite countable set of $\mathbb N$ forms a uncountable family, or coumtable family. 

#### **Def | Subseequential Limit**
> Let $a_n$ be a sequence then it has subsequential limit $a_n$ when there exists a subsequence $a_{n_k}$ such that $\lim_{k\rightarrow \infty} a_{n_k} = a$. 

**Observations**

Immediately observe that a subsequential limit $a$ can be characterized. 
If $a \in \mathbb R$ is the subsequential limit of $a_n$ then for all $\epsilon > 0$ there exists some $n \in \mathbb N$ such that $|a_n - a| < \epsilon$. 
We emphaize that this is not the same as limit of the sequence because we didn't say there exists some $m \in \mathbb N$ such that for all $m > n$, that same condition $|a_n - a| < \epsilon$ is true. 

**Remarks**

This simple concept is over powered. 
Since the set of all $\mathbb Q$ is iterable by $\mathbb N$, it would mean that there exists a sequence $a_n$ maps from $\mathbb N$ to $\mathbb  Q$. 
Since for all $a \in \mathbb R$ there is a rational number that is arbitrarily close to $a$, it would mean the existence of a sequence $a_{n_k}$ that converges to $a\in \mathbb R$ . 
Therefore, the limits of all subsequential limit would be the entire set $\mathbb R$. 



---
### **Limit Point, Cluster Point of a set**

We consider real numbers, let the background set to be real number. 

#### **Definition | Closure Point**
> A point $x$ is the limit point of the set $A$ if, there exists a sequence of number $x_n\in A$ such that $\lim_{n\rightarrow \infty} x_n = x$. 

**Observations**

Limit point is *used to described sequences*. 
Let $x_n \in \mathbb R$ be a sequence then let $A = \{x_n : n \in \mathbb N\}$. 
Then it would mean that either there exists $x_j = x$ for some $j \in \mathbb N$, or that there exists a subsequence $x_{n_k}$ such that its limit is $x$. 


#### **Definition | Boundary Point**
> A point $x$ is the cluster point of a set $A$ if, there exists a sequence of number $x_n\in A\setminus \{x\}$ such that $\lim_{n\rightarrow \infty}x_n = x$. 

**Observations**

Cluster points are used to *described sets with uncountable infinitely many points*. 

Observe that a cluster point is a limit point, but a limit point is necessarily not a cluster point. 
We call $x \in A$ to be isoloated if there exists an open interval $\mathcal N(x)= (x - \epsilon, x  + \epsilon)$ such that $\mathcal N(x)\cap A = \emptyset$. 
A isolated point in set $A$ can't be approached indefinitely as the limit of a sequence that because $x_n \not \in A$, but it can with a limit point. 


#### **Definition | Cluster point of a sequence**
> A point $\bar x \in \R^n$ is the cluster point of sequence $(x_n)_{n \ge 0}$ under the following equivalent scenario: 
> 1. For all $\epsilon > 0$, there exists $N \in \N$ such that there exists $n \ge N$ then $\Vert x_n - \bar x\Vert \le \epsilon$. 
> 2. There exists a subsequence of $x_n$: $x_{k_n}$ such that $x_{k_n}\rightarrow \bar x$. 

**Proof**

(1.) implies (2.) by an inductive argument which constructs the subsequence. Otherwise, the subsequence would be infinite and the index of the subsequence manifests as (1.). 



**Example, Applications:**

* See [[Limit, Cluster Point of Sequence]]. 
* See [[Closure Topology]], which can be characterized by limit point of the set. 


---
### **Limit of a Function**

There are 2 equivalent definitions for the limit of a function at a point. 
One uses convergent sequences and the other uses, epsilon vicinity of a point in the domain.  

**Epsilon Region for the Limit of a Function**

> $L$ is a limit of function $f$ at the point $x_0$ if for all $\epsilon > 0$ there exists $\delta_\epsilon(x_0)$ such that for all $x$ with $0 < |x - x_0|< \delta_\epsilon(x_0)$ we have $|f(x) - f(x_0)| \le \delta_\epsilon(x_0)$. 

**Sequential Limit of a Function**

> $L$ is a limit of a function $f$ at the point $x_0$ if, for all sequence $x_n$ that converges to $x_0$ but $x_n\neq x_0\;\forall n \in \mathbb N$, we have $\lim_{n\rightarrow \infty}f(x_n) = L$. 

**Observations**

$L$ is a limit point on the range of the function when there exists a sequence in the domain of the function such that it also has a limit point. 


**Remarks**

The two definitions for the limit of a function is equivalent. 
When talking about the limit of a function, $f$ doesn't have to be defined at $x$ at all. 

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
> $f_n \rightarrow f$ pointwise in $D$ when for all point $x_0\in D$ such that for all $\epsilon$, if $n > N_\epsilon(x_0)$ then we have $|f_n(x_0) - f(x_0)| \le \epsilon$. 

In brief, if we are long looking at each point on the function $f_n(x_0)$, then it gets closer to the point $f(x_0)$. 

**Remarks**
However, the relative speed of how each point converges to the target function is not described in the pointwise convergence definition. 

**Def | Uniform Convergence**

> $f_n \rightarrow f$ uniformly on $D$ when for all $\epsilon$ there exists $N_\epsilon$ when $n > N_\epsilon$ we have $\Vert f_n - f\Vert_D \le \epsilon$. Here, $\Vert g\Vert_D:= \sup_{x\in D}|g(x)|$ is a norm for the function. 

In brief, all the point in the region $D$ will be close to the target function. There doesn't exists some point where it's always slower than all the other point when the function $f_n$ is converging. 





