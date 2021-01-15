How do we measure the speed at which some sequence approaches zero? 

---

### Introduction 
1. $a_k$ goes to zero at a sub-linear rate if we can find constant $c>0, q > 0$ where $$a_k \le \frac{c}{k^q}$$
Usually we terminate the algorithm at a targeted conditions for $a_k$, and we are interested after what $k$, we will hit $|a_k| < \epsilon$. And the value of $k$ will be determine by both $\epsilon$ and the rate of convergence for the algorithm. 

**Linear**: 
$a_k$ --> 0 at a linear rate if $a_k\le c(1 - q)^k$ for $q \in (0, 1)$. 

Exercise: 

Follow the course reader, page 28, to check why Linear Convergence rate implies that given $\epsilon$, we need $k \ge \frac{1}{q}\ln (\frac{c}{\epsilon})$ so that $a_k\le \epsilon$. 

Quadratic: 

$a_k$ --> 0 at a quadratic rate if 
$$a_{k + 1} \le c a_k^2 \le \frac{1}{c}(ca_0)^{2^{k+1}}$$

And this thing goes to zero really fast. 
