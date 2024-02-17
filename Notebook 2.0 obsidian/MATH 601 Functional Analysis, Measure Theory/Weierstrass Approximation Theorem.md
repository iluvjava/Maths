- [Real Analysis Basics](../MATH%20000%20Math%20Essential/Analysis/Real%20Analysis%20Basics.md),
- [Weierstrass M-Test](../MATH%20000%20Math%20Essential/Analysis/Weierstrass%20M-Test.md)


---
### **Intro**

The proof of the theorem requires the normalized Bernstein Polynomials. 
We will talk about this specific polynomial that is used for the proof of the theorem. 

**References**
- Wang's Real analysis 328 class in UBCO. 
- [18.100A Fall 2020 Lecture 25: Power Series and the Weierstrass Approximation Theorem (mit.edu)](https://ocw.mit.edu/courses/18-100a-real-analysis-fall-2020/mit18_100af20_lec252.pdf)
- [Bernstein polynomial - Wikipedia](https://en.wikipedia.org/wiki/Bernstein_polynomial)

#### **Def | Bernstein Polynomials**

> The Bernstein polynomial of order $n$, are defined for values of $k = 0, \cdots, n$, and $x \in [0, 1]$. Then 
> $$
>   P_k^n(x) = \mathbf C_k^n x^k(1 - x)^{n - k}. 
> $$
> Where $\mathbf C_k^n = n!/(k!(n - k)!)$

**Observations**

We list the fact that we just discussed
1. $\sum_{i = 1}^{n}P_k^n(x) = 1$, 
2. $P_k^n(0) =\delta_0(k/n), P_k^n(1) = \delta_1(k/n)$
3. $P_k^n(x)$ attains maximum at $k/ n$ on $[0, 1]$. 

Finally, a brief google search reveals Bernstein polynomials are not orthogonal. 
This makes things elusive. 

> [!deltails]-
> 
> This term of polynomial is exactly the $k$ term of the binomial expansion of $(1 - x + x)^n$. 
> Which is quite bizarre, because based on this fact we know 
> 
> $$
> \sum_{ k = 1}^{n} P_k^n(x) = 1, 
> $$
> 
> for all $n \in \mathbb N$. 
> This polynomials all satisfies the boundary conditions that $P_k^n(1) = P_k^n (0) = 0$ for all $n > k > 0$. 
> When $k = 0$, we just assume that $P_0^n(0) = 1, P_0^n(0) = 0$ on $[0, 1]$. 
> Due to $0^0$ undefined for $P_0^n(0)$, this is a choice of convention. 
> When $k = n$, we have $P_n^n = x^n$. 
> So then $P_k^n(0) = 0, P_k^n(1) = 1$. 
> Observe that the function at the boundary points, has $P_k^n(1) = \delta_{1}(k/n), P_k^n(0) = \delta_{0}(k/n)$, it acts like the Dirac Delta function. 
> Finally, leave as an exercise, the reader should confirms that the polynomial $P_k^n(x)$ attains maximal at $k / n$ on $[0, 1]$ for all values of $0 \le k \le n$. 


#### **Def | The Bernstein Polynomials Transform**

> The transformation represents any function using the Bernstein polynomials by assigning coefficients for terms $P_k^n(x)$. Let $f$ be continuous and defined on $[0, 1]$, then 
> $$
> B_n[f](x) := \sum_{k = 0}^{n}f(k/n) P_k^n(x). 
> $$

**Observations**

Obviously this is a linear transformation on $C[0, 1]$. 
And it will preserves inequality of the functions as well. 
Observe that if $X\sim \text{Binomial}(n, k, p)$  then $\mathbb{P}\left(X = k\right) = P_k^n(p)$. 

### **Claim | Special Bernstein Transformation**
> The Bernstein polynomial transformation when applied to $1, x, x^2$, has 
> 1. $B_n[x] = x$, 
> 2. $B_n[x] = x^2 + (x - x^2)/n$. 

**Proof**

Directly from the definition we have 

$$
\begin{aligned}
    B_n[x](x) &= \sum_{k=0}^n \frac{k}{n}P_k^n(x)
    \\
    &= \sum_{ k =0}^{n}\frac{k}{n} \frac{n!}{k!(n - k)!} x^k(1 - x)^{n - k}
    \\
    &= \sum_{k = 1}^{n} \frac{(n - 1)!}{(k - 1)!(n - k!)}x^k (1 - x)^{n - k}
    \\
    k = k' + 1 \implies
    &= 
    \sum_{k' = 0}^{n - 1}\frac{(n - 1)!}{k'!(n - k' - 1)!} x^{k' + 1}(1 - x)^{n - k'-1}
    \\
    &= x \sum_{k' = 0}^{n - 1}
    \mathbf C_k^{n - 1}x^{k'} (1 - x)^{n - 1- k'} = x. 
\end{aligned}
$$

The second equality would take some more efforts. 



---
### **Probability Interpretations of the Convergence of Bernstein Transformation**

This interpretation is listed on the Wikipedia page and we shall investigate. 
It's intuitive but it's not elementary. 


---
### **Weierstrass Approximation Theorem**



