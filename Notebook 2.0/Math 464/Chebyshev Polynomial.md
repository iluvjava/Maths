This is quiet foundational. 

---
### **Chebyshev Type I**

Wiki link: [here](https://en.wikipedia.org/wiki/Chebyshev_polynomials). We introduce this entities without much of the proof. Serve as a quick references when using it. 

**Canonical Definition:Chebyshve Type I** 

> Chebyshev polynomial of the first kind is given as: 
> $$T_n(x) = \cos(n\arccos(x))$$

It's written in the form of trig but it's a class of orthogonal polynomial under certain weighed space. 

**Orthogonality Conditions**
> $$
> \langle T_i, T_j\rangle = \int_{-1}^{1} f(x)g(x)\frac{dx}{\sqrt{1 - x^2}} = 0
> $$

**Chebyshev Node**

> $$
> \cos(\theta_k) \quad \theta_k = \frac{k\pi}{n}
> $$
> For $k \in \mathbb{Z}_+$ this is in $[-1, 1]$ and it includes the boundary for the interval. 
> Interpolating the zero line at the chebyshev nodes gives chebyseve polynomial. Basically they are the roots of the chybeshve polynomial. 

**Equivariance Property: Inf Norm Minimizatons**

> $$
> T_k(x) = \arg\min_{p(x)}
> \left\lbrace
>     \Vert p(x) \Vert_\infty: \forall x \in [-1, 1]
> \right\rbrace
> $$
> Chebysheve only wiggles in the interval $[-1, 1]$. We didn't prove that it's a polynomial so far. But if it's a polynomial,then we found a polynomial that doesn't wiggle expontnetially aggressively. 


**Chebyshev Differential Equations**

> $$
> (1 - x^2)y'' - x y' + n^2y = 0
> $$
> This is a type of  Sturm Liuville System. See [[Sturm Liouville Theory]] for more about these type of systems. 


