[Lagrange Interpolations](Lagrange%20Interpolations.md). Basic Information for Lagrange Polynomials.  

---

### **Definition an Overview**

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

The inner finite product is often refer to as the $l_j(x)$, it's a polynomial with degree k: 

$$
p_j(x) = \prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x - x_m}{x_j - x_m}
$$

And the is a basis function that has the following properties, consider $l_j(x_j)$, then the infinite product becomes: 

$$
\forall\; l \in [k+1] - 1 : 
p_j(x_l) = \prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}
	}^{k}
	\frac{x_l - x_m}{x_j - x_m} = \begin{cases}
		1 & l = j
		\\
		0 & \text{else}
	\end{cases}
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
(x - x_k) \text{, where } 
a_j = \prod_{\substack{
	k = 0\\ k \neq j}}^N
	(x_j - x_k). 
$$

The $a_j$ is just a constant; the coefficients of the polynomial. We Take the logarithm on both side and take the derivative wrt to $x$, yields:

$$
\begin{aligned}
	\ln(p_j(x)) &= \ln\left( 
	\frac{1}{a_j} \prod_{
		\substack{
		k = 0 \\ k\neq j}
		}^N
		(x - x_k)
	\right)
	\\
	\ln(p_j(x)) &= \ln(a_j^{-1}) + 
	\sum_{\substack{k = 0\\k\neq j}}^N \ln((x - x_k))
	\\
	\frac{1}{p_j(x)}p_j'(x) &= 
	\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x - x_k}
	\\
	p_j'(x) &= 
	p_j(x)\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x - x_k}. 
\end{aligned}
$$

$\blacksquare$

---
### **First Few Terms**

Suppose that some quadratic interpolations where made to the function using the Langrange Polynomial, we are intereseted in its derivative formula. 
