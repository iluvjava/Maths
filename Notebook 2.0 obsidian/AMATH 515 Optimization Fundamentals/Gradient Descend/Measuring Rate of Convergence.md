How do we measure the speed at which some sequence approaches zero? 

---

### **Introduction**

Here we are interested in classifying different type of convergence rate, which serves as a board category metric for optimization algorithms. Throughout this file, we assume that $c, q, \epsilon > 0$. In general, we have the following classifications for the convergence rate of a sequence that is approaching zero. 

**Sub-Linear**:

$a_k$ goes to zero at a sub-linear rate if we can find constant $c>0, q > 0$ where 

$$a_k \le \frac{c}{k^q}$$

Usually we terminate the algorithm at a targeted conditions for $a_k$, and we are interested after what $k$, we will hit $|a_k| < \epsilon$. And the value of $k$ will be determine by both $\epsilon$ and the rate of convergence for the algorithm. 

**Linear**: 

$a_k$ --> 0 at a linear rate if $a_k\le c(1 - q)^k$ for $q \in (0, 1)$. Exercise: Follow the course reader (Dimitri's Textbook), page 28, to check why Linear Convergence rate implies that given $\epsilon$, we need $k \ge \frac{1}{q}\ln (\frac{c}{\epsilon})$ so that $a_k\le \epsilon$. 

**Quadratic:**

$a_k$ --> 0 at a quadratic rate if 

$$a_{k + 1} \le c a_k^2 \le \frac{1}{c}(ca_0)^{2^{k+1}},$$

by unrolling the recurrences presented by the first inequality, we can obtain the upper bounding sequence on the right side of the second inequality. 


---
### **Rate of Convergence for a Sequence in General**


**Definition**

>WLGO assume that we have the sequence $a_n \rightarrow 0$, and another sequence $b_n$ such that: 
> 
> $$
> \begin{align*}
>    \exists c > 0, n \in \mathbb N \text{ s.t: }\forall m \ge n \; |a_n| \le C|b_n|, 
> \end{align*}
> $$
> 
> then we say that the sequence $a_n$ convergences with $\mathcal O(b_n)$. In general, when $a_n \rightarrow a$ as $n\rightarrow \infty$, we can just model the sequence $|a_n - a|\rightarrow 0$ and apply the above definition. 


**Remarks**

Observe that in the above case, when a sequence has linear convergence, we have $b_n = 1/k^{n}$, when linear we have $b_n = q^n, q\in (0, 1)$, and super linear $b_k = a_0^{2^{k + 1}}$. 


---
### **Further Characterizations for Convergences**




