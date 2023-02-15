Basic Information for Lagrange Polynomials. 

---

### Definition an Overview

Assuming that we are going to interpolate the polynomial over a set of points; denoted as $\{(x_i, y_i)\}_{i = 0}^{k}$. The Lagrange form of polynomial interpolation is written in the form of: 

$$
L(x) := \sum_{j = 0}^{k} 
	y_j
	\left(
		\prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x - x_m}{x_j - x_m}
	\right)
$$

The inner finite produce is often refer to as the $l_j(x)$ function: 

$$
l_j(x) = \prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x - x_m}{x_j - x_m}
$$

And the is a basis function that has the following properties, consider $l_j(x_j)$, then the infinite produce becomes: 

$$
l_j(x) = \prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x_j - x_m}{x_j - x_m} = 1
$$

But consider the case when $l_j{x_n}$ with $n\neq j$, then we have: 

$$
l_j(x) = \prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x_n - x_m}{x_j - x_m} = 0
$$
 
Because $\exists\; m$ such that $0 \leq m \leq k$ and $m\neq j$ making the term $x_n - x_m = 0$, and in that case, it means that the whole produce is zero. 

---
### **The Derivative of Lagrange Polynomial**

This part is going to a lot of fancy math and it's going to be fun. Rewrite some of the components involved in the polynomials: 

$$
p_j(x) = \frac{1}{a_j}
\prod_{
\substack{
k = 0 \\ k\neq j}
}^N
(x - x_k). 
$$

Where the $a_j$ is just a constant and it's basically: 
$$
a_j = \prod_{\substack{
	k = 0\\ k \neq j}}^N
	(x_j - x_k). 
$$

Let's take care of the sign by considering: 

$$
\pm |p_j(x)| = \pm\frac{1}{a_j}
\prod_{
\substack{
k = 0 \\ k\neq j}
}^N
|x - x_k|
$$

And we choose whatever sign that is positive, so we can take the logarithm on both side and take the derivative. 

$$
\ln(p_j(x)) = \ln\left( 
	\frac{1}{a_j} \prod_{
		\substack{
		k = 0 \\ k\neq j}
		}^N
		|x - x_k|
\right)
$$
$$
\ln(p_j(x)) = \ln(a_j^{-1}) + 
	\sum_{\substack{k = 0\\k\neq j}}^N \ln(|x - x_k|)
$$

taking the derivative on both side yields

$$
\frac{1}{p_j(x)}p_j'(x) = 
\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x - x_k}
$$

$$
p_j'(x) = 
p_j(x)\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x - x_k}
$$

$\blacksquare$


