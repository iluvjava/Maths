This is the missing piece. It's in the [PDEchapter12](references/PDEchapter12.pdf) of the textbook. 

---
### **Intro**

The General Form for $y(x)$ of a Sturm-Liouville system (S.L Sys) takes the form: 

$$
\begin{aligned}
\partial_x[p(x)\partial_x[y]] + (\lambda r(x) - q(x))y = 0    
\end{aligned}. 
\tag{1}
$$

This is a eigenvalue problem in functional space. Where $\lambda$ is a parameters to be determined, it's the eigenvalue for the system.  For each value of $\lambda$, there is a solution for the equation, which is the Eigenfunction. Note*, Lambda, the eigenvalue can be complex. $\lambda \in \mathbb{C}$ when the function involved are complex. The Orthogonality property of solutions for the above ODE in a weighted space is a results of the differential operator being an adjoint operator in functional spaces.  We expand out the S.L system form to have

$$
\begin{aligned}
	p'(x)\partial_x[y] + p(x)\partial_x^2[y] + (\lambda r(x) - q(x)) y &= 0    
	\\
	p'(x)\partial_x[y] + p(x)\partial_x^2[y] - q(x)y &= \lambda r(x)y 
	\\
	p'y' + py'' - qy -\lambda ry& = 0
\end{aligned}
$$

It's not immediately obvious to why this is an eigenvalue problem, or the fact that the linear mapping involved is adjoint in functional spaces, under what type of conditions. We will clarify these concepts in the coming parts. 

**Observations**

The above form appears for the ODEs from method of separation for second order PDEs. For examples: 
1. Fourier, (Anisotropic Heat)
2. Legendre
3. Bessel
4. Chebyshev

Previously, we solved it and get fancy polynomials/series for the solutions, now, we see why those polynomials are famous orthogonal polynomials. 

---
### **Singular and Regular SL**

**Regular Summary**
* $p, p', q, r$ are continuous in interval $[a, b]$, and doesn't have zero, in the domain. 
* Robin boundary conditions that are legit. 

**Explanation**

The domain of the problem is a closed finite interval: $[a, b]$

$p, p', q, r$ are continuous in the domain and $p(x), r(x)\ne 0$ in $[a, b]$. If it crosses zero in side the domain, we have the sour problem of singuarities in the ODE. 

WLOG, we assume that $p(x)> 0, r(x) >0$ inside of the interval.

**Note**: By changing the sign of $\lambda$, one might include the case $p(x) < 0, r(x) < 0$ as well. We can do that because $\lambda$ is something left to be determined. 

The boundary conditions are of the form: 

$$
c_1y(a) + c_2 y'(a) = 0 
$$

$$
d_1y(b) +  d_2y'(b) = 0
$$

**Note**: At least one of $d_1$, $d_2$, or $c_1$, $c_2$ are non-zero.

**Singular**

If the system in on an infinite domain, or, at least one of the conditions for the regular SL is not satisfied. 

There are way more Singular than the Regular. But let's consider a subset of the singular system: 

* $p(x), p'(x), q(x), r(x)$ are continuous on $(a, b)$. 

* $p(x)> 0$, $r(x)> 0$, in $(a, b)$. but $p(x), q(x) = 0$ on the boundaries. 
 
* Domain might be infinite. 
* Boundary conditions are modified so that it's still solvable. 

When a system is singular, there is a very good chance that we had singularities for the functions inside of the domain (in this case, it's the boundary), see the Legendre System in the example part for more about how to modify the boundary of the solution. 

However, take notice we really need to take care of the boundary conditions so the solutions are still valid in a sense. This is one of the features for this subset of Singular SL. 

**Boundary Modifications**

If, $p(x) = 0$ at either $a, b$, then: 

* $p(a) = 0$, let $y(a)$ be bounded, and then let $y(b) = 0$. 
* $p(b) = 0$, let $y(b)$ be bounded, and then let $y(a) = 0$. 
* $p(a) = p(b) - 0$, then let $y(a), y(b)$ both be bounded. 

**This modification of the boundary conditions is required, for singular SL, this is needed so that the ODE is still solvable.** 

---
### **Examples of SL System**

**List of SL System**:
1. Fourier System: Regular
2. Legendre System: Singular
3. Bessel's Equation: Singular
4. Spherical Bessel's Equation: Singular
5. Chebyshev Equation: Singular

Let's take a look at some of the examples, and determine whether they are singular, or regular. 

**Fourier System**

$$
y'' + \lambda y = 0 \quad y(0) = 0 \quad y(L) = 0
$$

In this case, refer back and find out that, $p(x) = 1$, $q(x) = 1$, $r(x) = 1$. 

In this case, we are on a finite domain, $p(x)$, $r(x)$, both continuous and bigger than zero, then we are dealing with a **Regular SL system**. 

We had done this before when solving the 1D equations PDEs waves and heat system. 

We found out that $\lambda_n = (\frac{n\pi}{L})^2$ for $n\in \mathbb{N}$

and Eigenfunctions are $\sin(\sqrt{\lambda_n})$

**Legendre System**

$$
\partial_x[(1 - x^2)\partial_x[y]] + \lambda y = 0
$$

Where $p(x) = 1 - x^2$, $q(x) = 0$, and $r(x) = 1$, and in this case, $p(x) = 0$ at $x = \pm 1$, this means that this is a **singular SL-System**. Because we had $p(x)$ equals to zero, violating the regular case. 

If, $p(x) = 0$ at either $a, b$, then: 

* $p(a) = 0$, let $y(a)$ be bounded, and then let $y(b) = 0$. 
* $p(b) = 0$, let $y(b)$ be bounded, and then let $y(a) = 0$. 
* $p(a) = p(b) - 0$, then let $y(a), y(b)$ both be bounded. 

**This modification of the boundary conditions is required, for singular SL, this is needed so that the ODE is still solvable.** 

In the Legendre example, we had: 

$$
\lambda_n = n(n + 1) \quad n \in \mathbb{Z}_{\ge 0}
$$

And the eigenfunction is like: 

$$
y_n(x) = P_n(x)
$$

The famous, Legendre polynomials. 

**Bessel's Equation** 

$$
x^2 y'' + xy' + (\lambda x^2 - \tilde p^2)y = 0  \quad x \in [0, b]
$$

This doesn't look right at the first glance, but we can divide both side by $x$ and get: 

$$
x y'' + y' + \left(
    \lambda x - \frac{\tilde{p}^2}{x}
\right) y = 0
$$

Boom, this is interesting. And this looks like a SL system. 

$p(x) = x$, $r(x) = x$ and $q(x) = \frac{\tilde{p}^2}{x}$


$p(0) = 0$, and $r(0) = 0$, so in this case, at least one of the conditions for the regular system is not satisfied. 

This is a Singular SL System. 

In this case, it's zeroing out on the boundary condition, therefore, we impose the boundary conditions that: 

$y(x)$ is bounded at $x = 0$ and $y(x)$ is zero at $x = b$. 


**Spherical Bessel's Equation**

$$
x^2 y'' + 2xy' + (\lambda x^2 - n(n + 1)) y = 0 \quad x\in [0, b]
$$

And it's not hard to see that $x^2 y'' + 2xy' = \partial_x[x^2 \partial_x[y]]$

And in this case, $p(x) = x^2$, $r(x) = x^2$, $q(x) = n(n+ 1)$. And in this case, this is actually singular, because: $p(0) = 0$. 

And that means we need to change the boundary condition, to say that $y(x)$ being bounded at $x = 0$, and $y(x)$ being zero at $x = b$. 


**Chebyshev Equation**

The star of today.  

$$
(1 - x^2) y'' - xy' + \lambda y = 0 \quad x \in [-1, 1]
$$


This equation is important because of it's applications to the Spectral Method, and it can be generated easily using the trigs function. 

This is not in the SL format. To transform we divide it by $(1 - x^2)^{\frac{1}{2}}$, then in the end we get: 

$$
(1 - x^2)^{\frac{1}{2}} y'' - \frac{x}{(1 - x)^{\frac{1}{2}}} + 
\frac{\lambda}{(1 - x)^{\frac{1}{2}}y} = 0
$$

Which is: 

$$
[(1 - x)^{\frac{1}{2}}y']' + \frac{\lambda}{(1 - x^2)^{\frac{1}{2}}}y = 0
$$

And in this case, $p(x) = (1 - x^2)^{\frac{1}{2}}$, $r(x) = (1 - x^2)^{-\frac{1}{2}}$, and $q(x) = 0$, however because $p(x) = 0$ at $x = \pm 1$, and therefore, we had a **Singular SL System**


---
### **Orthogonality Theorems (Only a Sketch of Proof)**

The eigenfuncitons corresponding to distinct eigen values are orthogonal, over the defined interval. 

Basically

$$
\int_{a}^{b} r(x) \phi_j(x)\phi_k(x)dx \quad j\ne k
$$

Where $\phi_j(x)$ is the solution to the eigenvalue $\lambda_j$ and $\phi_k(x)$ is the solution with the eigen value $\lambda_k$. 

To prove it, we will need to consider the following procedures: 

Let's first, substitute both solutions into the system (System means expression (1)) so that would be: 

$$
[p(x)\phi_j']' + (\lambda_k - q(x))\phi_j = 0
$$

$$
[p(x)\phi_k']' + (\lambda_k - q(x))\phi_k = 0
$$

Multiply the first one by $\phi_k$ and then multiply the second one by $\phi_j$ and then we take the difference between the first one of the second one, that will be giving us the expression that: 

$$
\phi_j (p(x)\phi_k')' - \phi_k(p(x)\phi_j')' = [\lambda_j - \lambda_k]r(x)\phi_j\phi_k
$$

Skipping some mental math:

$$
\int_{a}^{b} 
\phi_j(p(x)\phi_k)' - \phi_k(p(x)\phi_j)'
dx = (\lambda_j - \lambda_k)
\int_{a}^{b} 
r(x)\phi_j\phi_k
dx
$$

After some product rule 

> $$
> (\lambda_j - \lambda_k)\int_{a}^{b} 
>     r(x)\phi_j(x)\phi_k(x)
> dx 
> = 
> \left[\phi_jp(x)\phi_k' - \phi_kp(x)\phi_j'\right|_a^{b} 
> \tag{2}
> $$

**If it's a regular SL system**

When it's Homogeneous Dirichlet, we have: 

$$
\phi_j(a) = \phi_k(a) = 0 \quad \phi_j(b) = \phi_k(b) = 0
$$

As the boundary condition of the system. 

Substituting it back to expression (2), the RHS of the system will evaluate to zero. 

If it's Homogeneous Neuman, with: 

$$
\phi_j'(a) = \phi_k'(a) = 0 \quad \phi_j'(b) = \phi_k'(b) = 0
$$

And it will still set the RHS of (2) to be zero. 

If it's mixed Robin Boundary conditions, it will still set the RHS to zero. 

**If it's a Singular System**

That means we need to use the boundary modifications, and it will also mean that $P(x)$ has to be equal to zero at one/both of the boundaries

Let the solution be bounded at $a$, let the solution be zero at $b$, and things will still wipe out to zero on the LHS. 

**Note**, I skipped a lot of math for this section. 

Therefore, the inner product between eigenfunctions for distinct eigenvalues are orthogonal under the weighted inner product involving $r(x)$. 

$$
\int_{a}^{b}r(x)\phi_k(x)\phi_j(x) dx = 0
$$

---
### **More Theorems but Without the Proofs and Just Stated Here**

* Orthogonality. 
* Uniqueness. For each eigenvalue, there exists uniquely one eigen function for that value. 
* All eigenvalues are real. 
* All eigenvalues are positive. 

And is exactly the same as the Hermitian Matrix, see: [[Hermitian Adjoint]]

This is just one of the hermitian operator, but this time it's for functions on a bounded interval (or infinite interval) I guess. 

Now, I am giving handle to another file: [[Sturm Liouville Theory P2]]