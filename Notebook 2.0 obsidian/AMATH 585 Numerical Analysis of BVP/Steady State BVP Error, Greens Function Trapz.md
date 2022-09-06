[[Steady State BVP Error, LTE]], [[Steady State BVP Error, Greens Function]]


---
### **Intro**

We are using another way getting the $\mathcal{O}(h^2)$ error on the Non-Homogenous Heat equation without heat conductivity on 1D, using a different approach as what has been shown in Error Analysis 2. 

This time we are using Green's Function to directly compute the Global Error for an example, and then the more general case. 

---
### **The Heat Equation**

We are concerned with the BVP problem:  

$$
\begin{aligned}
    \begin{cases}
    u''(x) = f(x) & x \in[0, 1]
    \\
    u(0) = u(1) =0 &
    \end{cases}
\end{aligned}\tag{3}
$$

For this particular problem:

$$
\begin{aligned}
u(x) &= \int_{0}^{1}
f(\bar{x})G(x|\bar{x})
d\bar{x}
\end{aligned}\tag{4}
$$

$$
\begin{aligned}
u_i &= h \sum_{j = 1}^{m}f(x_j)G(x_i|x_j) \quad i = 1\cdots m
\end{aligned}\tag{5}
$$

**Lemma 1**

> Expression (5) is the trapz approximation to expression (4).

**Proof for Lemma 1**

Recalls the the Greens Function here is defined to be:  

$$
\begin{aligned}
G(x; \bar{x}) &=
\begin{cases}
(\bar{x} - 1)x & \bar{x} \in [x, 1]
\\
\bar{x}(x - 1) & \bar{x} \in [0, x]
\end{cases} \quad \text{For Integral Representation}
\end{aligned}
$$

Then:  

$$
\begin{aligned}
u(x_i) &= \int_{0}^{1}
f(\bar{x})G(x|\bar{x})
d\bar{x}
\\
& \approx
\sum_{j = 0}^{m}\frac{h}{2}\left(
f(x_j)G(x_i|x_j) + f(x_{j + 1})G(x_i| x_{j + 1})
\right)
\\
&=
\sum_{j=0}^{m}\frac{h}{2}f(x_j)G(x_i|x_j)
+
\sum_{j - 1}^{m + 1}\frac{h}{2}f(x_j)G(x_i|x_j)
\\
&= \frac{h}{2}(
f(x_0)G(x_i|x_0) + f(x_{m + 1})G(x_i|x_{m + 1})
) +
\sum_{j = 1}^{m}hf(x_j)G(x_i|x_j)
\\
&=
0 + \underbrace{\sum_{j = 1}^{m}hf(x_j)G(x_i|x_j)}_{= u_i}
\end{aligned}\tag{6}
$$
Due to the boundary conditions, the Greens function with $\bar{x} = x_0$ or $\bar{x} = x_{m + 1}$ will give the value of zero.

**Lamma 1** has been proven.  

In this special example, we have seem that the discrete solution for $u_i$ is the same as the trapz rule over the linear combinations of Greens function weighted by $f(x_j)$, the source function.

**What Does it Tell**: 

Taking a look at the material listed in: [[Greens Function for Heat Eqn]], then it's apparently that expression (4) is exactly the solution to the heat equation in (3). And, the inverse of the matrix is using the Green's Function (Which is the fact we toaken for granted in [[Steady State BVP Error, Greens Function]]) and weighting it by the non-homogeous $f(x)$ on the discrete set of points. In above **lemma 1** we have shown that the approximated vector is a trapz rule in disguise. And it's not hard to show that the trapz rule is giving us an error of $\mathcal{O}(h^2)$ (This is part of the HW2 for this class), therefore the approximated solution we obtained has an error that is $\mathcal{O}(h^2)$. 

To show that it's related to the inverse of the discretized Laplacian Matrix, we stack the discreate approximation at grid point $x_i$ into the form: 

$$
\begin{aligned}
    \vec{u} &= 
    \sum_{j = 1}^{m}
        hf(\vec{x})G(\vec{x}|x_j)
    \\
    \vec{u} &= 
        \underbrace{\begin{bmatrix}
            hG(\vec{x}|x_1) & hG(\vec{x}|x_2) & \cdots 
            & hG(\vec{x}|x_m)
        \end{bmatrix}}_{A^{-1}} f(\vec{x})
\end{aligned}
$$

Greens Function has the property that, putting it through $A$ will gives us the standard basis vector. 

---
### **The General Case**

**Major Claim**

> The steady state solution for a 1D non-homogenous heat equation without conductivity and with Dirichlet Boundary conditions can be: 
> 
> $$
> v(x) = \alpha(1 - x) + \beta x + h \sum_{j = 1}^{m}f_jG(x; x_j) \tag{1}
> $$
> 
> Is obtained via finite difference method with 2nd derivative central difference > scheme solves the following ODE exactly: 
> 
> $$
> v''(x) = h \sum_{j = 1}^{m}f(x_j)\delta(x - x_j)
> \quad 
> v(0) = \alpha, v(1) = \beta \tag{2}
> $$

It's listed in the book and I didn't investigate it and I don't know how to prove it yet. 


