prereq: [[Lagrange Polynomial Interpolation]]

We need the derivative information for the Lagrange Polynomial interpolated at some points for given function. 

---

### Cheb Diff Matrix
The entries of the cheb matrix is literally given from the derivative of the interpolative polynomials, by which I mean that: 

$$
D_{i, j} = L'(x_i)
$$

Ok... So then we have to use the derivative from the Lagrange Polynomials to help us out here. 


Picking up from the last part, we have the following quantities: 

$$
l_j(x) = \prod_{
		\substack{
		m = 0
		\\ 
		m\neq j}}^{k}
		\frac{x_j - x_m}{x_j - x_m} = 1
$$
and 
$$
p_j(x) = \frac{1}{a_j}
\prod_{
\substack{
k = 0 \\ k\neq j}
}^N
(x - x_k)
$$
And: 
$$
a_j = \prod_{\substack{
	k = 0\\ k \neq j}}^N
	(x_j - x_k)
$$

And the derivative of $p'(x)$ is given by: 
$$
p_j'(x) = 
p_j(x)\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x - x_k}
$$

Then this means that the interpolated function has derivative of:

$$
\sum_{j = 0}^{k}f_j p_j'(x)
 = 
 \sum_{j = 0}^k f_j
 	\left(
		p_j(x)
		\sum_{k = 0, k\neq j}^N
		(x - x_k)^{-1}
	\right)
$$

Convert the inner $p_j(x)$ to the finite product form: 

$$
\sum_{j = 0}^{k}f_j p_j'(x)
 = 
 \sum_{j = 0}^k f_j
 	\left(
		\frac{1}{a_j}
			\prod_{
			\substack{
			k = 0 \\ k\neq j}
			}^N
			(x - x_k)
		\sum_{k = 0, k\neq j}^N
		(x - x_k)^{-1}
	\right)
$$

Move out the constants and make the running index **independent**" 

$$
\sum_{j = 0}^{k}f_j p_j'(x)
 = 
 \sum_{j = 0}^k \frac{f_j}{a_j}
 	\left(
		\prod_{
		\substack{
		k = 0 \\ k\neq j}
		}^N
		(x - x_k)
		\sum_{l = 0, l\neq j}^N
		(x - x_k)^{-1}
	\right)
$$

Let's fix the value of $j$, and then we consider the inner sum: 

$$
\left(
	\prod_{
	\substack{
	k = 0 \\ k\neq j}
	}^N
	(x - x_k)
	\sum_{l = 0, l\neq j}^N
	(x - x_k)^{-1}
\right)
$$
Which can be multiplied in and obtain:

$$
\sum_{\substack{l = 0 \\ l \neq j}}^N
\left(
	\prod_{\substack{k = 0 \\ k \neq j \\ k \neq l}}^N(x -x_k)
\right)
$$

**(1.0)**

Now, we set $x = x_i$, assuming that $i\neq j$

Then take notice that, $k\neq j$ implies that $\exists \; k$  such that $k = i$. 

Then the inner produce will be zero for all $l \neq i$

And then the only non zero terms is when $l = i$. YEEEES!

And then we have: 

$$
\prod_{\substack{k = 0\\k \neq i, j}}^N(x_i - x_k)
$$

Therefore, the coefficient of $f_j$ for the term $L(x_i)$ where $i\neq j$, we have: 

$$
\frac{f_j}{a_j}\prod_{\substack{k = 0\\k \neq i, j}}^N(x_i - x_k)
$$
**(1.1)**

And take notice that, multiplying both numerator and denominator by $(x_i - x_j)$, we will have: 

$$
D_{i, j} = \frac{f_ja_i}{a_j(x_i - x_j)}
$$

However, go back to the very beginning and assume that the value $x_i$ happens to have $i=j$, then we have: 

$$
p_j'(x_j) = 
p_j(x_j)\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x_j - x_k}
$$

And $p_j(x_j) = l_j(x_j)$, and then that means: 

$$
p_j'(x_j) = 
\sum_{\substack{k = 0\\ k\neq j}}^N\frac{1}{x_j - x_k} = D_{j, j}
$$

#### Using the Chebyshev Node

Notice that, we are using a special type of nodes for interpolation here. 

In Our case, we use the Chebyshev nodes, which is given by the formula: 

 $$
x_j = \cos(j\pi/N) \quad \forall \; j = 0, 1, 2 \cdots N
$$


And after some tedious math, which I suggest starting with the expression **(1.1)** which is easier to compute, we will obtain the Chebyshev Matrix as the following: 

$$
\begin{array}{c}
\left(D_{N}\right)_{00}=\frac{2 N^{2}+1}{6}, \quad\left(D_{N}\right)_{N N}=-\frac{2 N^{2}+1}{6} \\
\left(D_{N}\right)_{j j}=\frac{-x_{j}}{2\left(1-x_{j}^{2}\right)}, \quad j=1, \ldots, N-1 \\
\left(D_{N}\right)_{i j}=\frac{c_{i}}{c_{j}} \frac{(-1)^{i+j}}{\left(x_{i}-x_{j}\right)}, \quad i \neq j, \quad i, j=1, \ldots, N-1
\end{array}
$$
where
$$
c_{i}=\left\{\begin{array}{ll}
2 & i=0 \text { or } N \\
1 & \text { otherwise }
\end{array}\right.
$$

### Dirichlet Boundary Conditions

Here we will consider general type of boundary conditions when taking derivative using the Chebyshev Matrix. 

One sentence: **You do the surgery on the matrix and move the boundary information into the right hand side, which is a vector when you solve for things. **

For General boundary conditions, suppose that we have: $u(-1) = -2, u(1) = 2$, and an equation: 

$$
\partial_x^2 u = 0
$$

Discretizing it we will have: 
$$
	D^2u = \mathbf{0}
$$

And take note that, now we need to do the boundary surgery: 

$$
\begin{bmatrix}
D^2_{0, 0} & \cdots & D^2_{N+1, N+1} \\ 
\vdots & 
	\begin{matrix}
		\widetilde{D}^2
	\end{matrix}
& \vdots \\
D^2_{N + 1, 0} & \cdots & D^2_{N+1, N+1} \\ 
\end{bmatrix}u = \mathbf{0}
$$

Where the matrix $\widetilde{D}^2$ denotes the interior parts of the $D^2$ matrix. 

The key here is that, by asserting that: $u_0 = -2$ and $u_{N + 1} = 2$, we will be able to move the columns of the matrix $D^2$ to the right hand side where it becomes a vector $b$, a $N - 1\times 1$ vector. 


Here is some matlab example codes of doing these: 

```matlab
[D, chebPoints] = cheb(20);
D2 = D^2;
b = -2.*D2(:, 1) + 2.*D2(:, end);
b = b(2: end - 1);
D2Tilde = D2(2: end - 1, 2: end - 1);
plot(chebPoints(2: end - 1), (D2Tilde)\b);
```

Therefore, generally speaking, if we want to assert a Dirichlet boundary conditions for a system of the form: $D^2u = b$, and assuming that $u(-L) = \alpha$ and $u(L) = \beta$, then we will have: 

$$
\widetilde{D^2} u = \tilde{b} - \alpha(D^2)_{:, 1}-\beta (D^2)_{:, end}
$$

And hence solving this equation will get us all the interior points for the function $u$ while asserting the Dirichlet Boundary. 

**NOTE** This can be extended, the boundary can change according to time, or even in the 2d case, it can change according to the space too, and the key here is to just do the Surgery during each evaluate of the right hand side. The same as the [[Direct Method]] using the finite difference. 

### Speed up The Computations

So far this method does't provide any better computational benefits compare to the Direct Method with Finite difference, and hence, making it not that well. 

However, FFT algorithm and some complex number magic will be able to help us to speed up the computations here. 