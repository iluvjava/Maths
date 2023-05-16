### **Intro**

The interpolating polynomial for a list of data point outputed by some function $f: \mathbb{R}\mapsto \mathbb R$ in the form of $\{(x_i, f(x_i))\}_{i=0}^k$ is given by the following formula: 
$$
P(x) = \sum_{j = 0}^{k} 
	f(x_j)
	\left(
		\prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x - x_m}{x_j - x_m}
	\right),
$$
then the polynomial above equals to the value of $f$ at all $x_j$, for $0\le j \le k$. 


**Observations**

Suppose a special function $f(x_i) = 0$ for all ordered $x_i$ where $0 \le i \le n$, then let $x_{n + 1}$ be a special data point in $[x_0, x_n]$, then we want to interpolate the above function. This will yield an interpolating polynomial of the form: 

$$
\begin{aligned}
    & P(x) = f(x_{n + 1}) \left(
        \prod_{\substack{m = 0 \\ m \neq n + 1}}^{n + 1}
        \frac{x - x_m}{x_{n + 1} - x_m} 
    \right)
    \\
    & \text{let } x = \bar x, x_{n + 1} = x, \text{then}
    \\
    &
    P(t) = f(\bar x) \left(
        \prod_{\substack{m = 0}}^{n}
        \frac{t - x_m}{\bar x - x_m} 
    \right)
\end{aligned}
$$

**References**: Cengage's Numerical Analysis textbook, with my own interpretations and observations. 


---
### **Remainder of the Interpolating Polynomials**


>Let $\{x_i\}_{i=0}^n$ be distinct points from interval $[a, b]$, where $a = x_0, b = x_n$, and let $f$ be in $C^{n + 1}[a, b]$, then for each $x \in [a, b]$, which is none of the data point, then there exists $\xi(x)\in (a, b)$ such that 
> $$
> f(x) - P(x) = \frac{f^{(n + 1)}(\xi(x))}{(n + 1)!}\prod_{i = 0}^{n} (x - x_i),
> $$
> where $P(x)$ is the lagrange interpolating polynomial introduced from the previous section. 

**Proof**

- Let $P(t)$ be the interpolating polynomial for $f$ at the data pont. 
- Let $e(t)$ be the errors function. 
- let $e(t) = f(t) - P(t)$, we want $e(t)$ equals to $f(t) - P(t)$ at $(x_i, f(x_i))$ for all $0 \le i \le n$, and at the additional point $\bar x$. 

Then according to our previous observations, the error polynomial can be interpolated at the points $\{(x_i, (f - P)(x_i))\}\cup \{(\bar x, (f - P)(\bar x))\}$, denoted using $\tilde e(t)$ will be of the form: 

$$
\begin{aligned}
    \tilde e(t) &= (f - P)(\bar x) \left(
        \prod_{\substack{m = 0}}^{n}
        \frac{t - x_m}{\bar x - x_m} 
    \right)
    \\
    \text{let }
    g(t) &= (f - P)(t) - \tilde e(t).
\end{aligned}
$$

The funtion $g(t)$ has zero at $t = x_i$ for all $0\le i \le n$, and it also has $g(\bar x) = 0$ by the use of $\tilde e$. $g(t)\in C^{n + 1}[a, b]$ and by generalized Rolle's theorem, there exists $\xi \in (a, b)$ such that $g^{(n + 1)}(\xi) = 0$, using this piece we have

$$
\begin{aligned}
    g^{(n + 1)}(\xi) &= 0 
    \\
    &= f^{(n + 1)}(\xi) - \tilde e'(\xi)
    \\
    &= f^{(n + 1)}(\xi) - (f(\bar x) - P(\bar x))\frac{(n + 1)!}{\prod_{m = 0}^n(\bar x - x_m)},
\end{aligned}
$$

re-arranging the above formulate and we will have the results for the theorem.