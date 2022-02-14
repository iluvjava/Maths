[[Finite Elements Method]], [[Finite Elements Method 2]] 

Another coverage of the topic is discussed by the scientific computing class. 

---
### **Intro**

We will cover in details here, about the Finite Element Method, in 1D, for the steady state heat equation. 

Firstly, we need to introduce the Frameworks For F.E, and at the same time, some of the keywords that we will be using. 

**Problem Type**

For the simplcity of the discussion of the problem, we consider the steady state of a BVP problem, in the form of: 

$$
\begin{cases}
    \mathcal{L}[u] = f(x)
    \\
    u(0) = u(1) = 0
\end{cases}\tag{1}
$$

Where, $\mathcal{L}$ is the generic notation for some kind of linear opeartor, and for the sake of discussion, we would choose $\mathcal{L} = (-\partial_x^2 + r(x)I)$. 

**Inner Product**

We define the inner product for 2 function over some kind of bounded interval: 

$$
\langle u, w\rangle_{[0, 1]} = \int_{0}^{1} u(x)w(x)dx \tag{2}
$$

**The Objective of Finite Element**

Finite element choose a Basis of function, we denoted it as $\mathcal{S}$. Suppose that another basis is involved, say:$\mathcal{M}$. We assume that the basis function are at least smooth enough to have a derivative. 

However, for the sake of simplicity of discussion, we consider $\mathcal{S}$, $\mathcal{M}$ to be finite set of functions (which is also why discretizations are involved), then we consider that: 

$$
\forall \phi \in \mathcal{M}\; \exists \; c\in \mathbb{R}^{|\mathcal{S}| - 1}: 
\sum_{j = 1}^{|S|}\langle c_j\mathcal{L}[\varphi] - f, \phi\rangle = 0 \tag{3}
$$

Here, we make the assumption of discretization, whre a finite interval has been discretized into finite many interval for the convenience of considering function as vector with finite many elements. 

(3) is saying that, for any function from the set $M$, there is a linear combination of basis function from the set $\mathcal{M}$ weighted by vector $c$ such that putting it through $\mathcal{L}$, subtracting $f$ (which is what the ODE is doing) and dotting it with $\phi$ will sum up to be zero. 

The final objective it to convert the whole problem in the form of a matrix vector equation in the form of $Ac = \tilde{f}$ (we use $\tilde{f}$ to denote the RHS with considerations to the boundary conditions of the problem), where the elements in matrix $A$ is defined to be: 

$$
A_{i, j} = \int_{0}^{1} \varphi_j'(x) \phi_i'(x)dx + \int_{0}^{1} r(x)\varphi_j(x)\phi_i(x)dx \tag{4}
$$

And the elements of the matrix $A$ are usually estimated when the basis function or $r(x)$ is very hard to handle. If not, we can just take the integral by hands and figure out the elements in the matrix. 

---
### **Proof of the Weak Form**

Consider $\langle \mathcal{L}[u], \phi\rangle$ with $\phi \in \mathcal{M}$, this is known as the weak form: 

$$
\begin{aligned}
    \langle \mathcal{L}[u], \phi\rangle 
    &\equiv 
    \int_{0}^1(-u''(x) + r(x)u(x))\phi(x)dx 
    = 
    \int_{0}^{1} f(x)\phi(x)dx \equiv \langle f,\phi\rangle
    \\
    \int_{0}^{1} 
        -u''(x)\phi(x)
    dx &= 
    \int_{0}^{1} -\phi(x)d(u'(x))
    \\
    &= 
    \left. -u'(x)\phi(x) \right|_{0}^1 + \int_{0}^{1} 
        \phi'(x)u'(x)
    dx
    \\
    \implies
    \langle \mathcal{L}[u], \phi\rangle 
    &= 
    \left. -\phi(x)u'(x)\right|_0^1 + 
    \int_{0}^{1} 
        u'(x)\phi'(x)
    dx + \int_{0}^{1} r(x)u(x)\phi(x) dx 
    = \langle f, \phi\rangle
\end{aligned}\tag{5}
$$

**The Basis and the Basis Functions**

The choice of Basis set $\mathcal{S}, \mathcal{M}$ depends, but for the sake of discussion, we will be using the set of all linear piecewise function on a defined discretized grid point for both $\mathcal{M}, \mathcal{S}$, let's suppose that there are $x_0, x_1, \cdots, x_n$ points discretizing $[0, 1]$, including the boundary. Consider the following basis function: 

$$
\varphi_i(x) = 
\begin{cases}
    \frac{x - x_{i - 1}}{x_i - x_{i - 1}} & x\in [x_{i - 1}, x_i]
    \\
    \frac{x_{i + 1} - x}{x_{i + 1} - x_{i}} & x\in [x_{i}, x_{i + 1}]
    \\
    0 & \text{else}
\end{cases}\tag{6.1}
$$

The function $\varphi_i$ is defined to be non-zero on the sub interval $[x_{i - 1}, x_i]\cup [x_i, x_{i + 1}]$, piecewise linear going up and then down with a slope of 1, like a hat. To span the whole set $\mathcal{S}$, we have $\{\varphi_j\}_{j = 1}^{n - 1} = \mathcal{S} = \mathcal{M}$. That is our basis which the F.E is going to fullfill its objective. Since $\mathcal{M}$ is assumed to be the same we also have $\{\phi_i\}_{i = 1}^{n - 1} = \mathcal{M}$. 

For completeness, and the choice of $\mathcal{L}$ containing the second derivetive, we also consider the derivative of all the basis function, which is required for the weakform (5): 

$$
\varphi_i'(x) = \begin{cases}
    \frac{1}{x_{i} - x_{i - 1}} & x \in [x_{i - 1}, x_i]
    \\
    \frac{-1}{x_{i + 1} - x_{i}} & x \in [x_{i}, x_{i + 1}]
    \\
    0 & \text{else}
\end{cases}\tag{6.2}
$$

**Note**: What we refer to when $\mathcal{S} = \mathcal{M}$ is called the Galerkin's Finite Element Method. 

**Fullfilling the F.E Objective**

Let the solution $\hat{u}$ approximated by F.E be $\in \mathcal{S}$, so that: 

$$
\exists \;c\in \mathbb{R}^{n - 1}: \hat{u}(x) = \sum_{j = 1}^{n - 1}c_j\varphi_j(x)
\tag{7}
$$

With this assumption, we let the solution with $c$ to satisfies the weak form of the problem, giving us: 

$$
\begin{aligned}
    \forall \phi\in \mathcal{M}: 
    \langle \mathcal{L}[\hat{u}] - f, \phi\rangle  
    = 
    0
\end{aligned}\tag{8}
$$

The above expression is very similar to (3), Using the weakform derived from (5), we have: 

$$
\begin{aligned}
    \underbrace{\left.-\phi(x)\hat{u}'(x)\right|_0^1}_{=b}
    + 
    \int_{0}^{1} 
        \sum_{j = 1}^{n - 1}c_j\varphi_j'(x)\phi'(x)
    dx + 
    \int_{0}^{1} r(x)\phi(x)\sum_{j = 1}^{n - 1}c_j\varphi_j(x)dx 
    &= 
    \langle f, \phi_i\rangle_{[x_0,\cdots,x_n]}
    \\
    b + 
    \sum_{j = 1}^{n - 1}\left(
        \int_{0}^{1} 
            c_j\varphi_j'(x)\phi'(x)
        dx    
    \right)
    + 
    \sum_{j = 1}^{n - 1}
    \int_{0}^{1} 
        c_jr(x)\phi(x)\varphi_j(x)
    dx &= 
    \langle f, \phi_i\rangle_{[x_0,\cdots,x_n]}
    \\
    \underset{[1]}{\implies}
    \sum_{j = 1}^{n - 1}\left(
         \int_{0}^{1} 
            c_j\varphi_j'(x)\phi'(x)
        dx 
        +    
        \int_{0}^{1} 
        c_jr(x)\phi(x)\varphi_j(x)
        dx
    \right) &= 
    \langle f, \phi_i\rangle_{[x_0,\cdots,x_n]}
\end{aligned}\tag{9}
$$

\[1\]: Take note that $b=0$, because by definition of $\varphi_i\in \mathcal{S}$, the function takes zero value at the point $x = 1, x = 0$. 

If we choose $\phi_i(x)\in \mathcal{M}$ for expression (9), then it's possible to write it as a matrix vector system inthe form of $Ac = f$ where element of $A$ are the same as (4). 

---
### **Bonus Part**

Adjoint Operator and Symmetric Matrices. They arise when the Linear Operator $\mathcal{L}$ is adjoin. For example, if we let $r(x) > 0 \;\forall \; x\in[0, 1]$, and then consider $\partial_x[r(x)\partial_x[u(x)]]$ as the linear operator $\mathcal{L}$, then, under the space $\mathcal{S}$ of all function on the unit interval satisfying $\mathbb{R}\mapsto\mathbb{R}$, and boundary conditions $u(0) = u(1) = 0$, then the operator $\mathcal{L}$ is **Adjoin**. 

Which is not hard verify and **simply using a integration by parts** will show that the operator $\mathcal{L}$ satisfies: 

$$
\forall\; v, u\in \mathcal{S}: \langle \mathcal{L}u, v\rangle = \langle \mathcal{L}v, u\rangle
$$

Then, the finite difference on this operator is going to be symmetric as well, which is implied by the week form , in expression (3). 

Choose any function $\varphi_j \in \mathcal{S}$ from the trial space, and $\phi_i\in\mathcal{M}$ from the test space, then the weak form asserts: 

$$
\begin{aligned}
    \langle \mathcal{L}[\varphi_j], \phi_i\rangle &= \langle f, \phi_i\rangle
    \\
    \implies 
    \langle \varphi_j, \mathcal{L}[\phi_i]\rangle &= 
    \langle f, \phi_i\rangle
\end{aligned}
$$

Which implies that the matrix $A_{i, j} = A_{j, i}$, priving that the discretized operator $A$ is going to be symmetrid of $L$ is adjoint. I would keep the discussion to real functions, I am not sure what's gonna happen for complex function. 


**Claim:** 

> The operator $\partial_x[p(x)\partial[\cdot]]$ is a adjoint operator on the interval $[a, b]$, with the boundary condition of $u(a) = 0 = u(b)$. 

**Justifications**: 

$$
\begin{aligned}
    \langle \partial_x[p(x)\partial_x[u]], v\rangle &= 
    \int_{a}^{b} 
        v(x) \partial_x[p(x)\partial_x[u(x)]]
    dx
    \\
    &= \int_{a}^{b} 
        v(x)
    d(p(x)u'(x))
    \\
    &= 
    \left.p(x)u'(x)v(x)\right|_a^b
    - \int_{a}^{b} p(x)u'(x)v'(x)dx
    \\
    &= 
    \int_{a}^{b} p(x)u'(x)v'(x)dx
    \\
    \langle \partial_x[p(x)\partial_x[v]], u\rangle
    &= 
    \int_{a}^{b} 
        u(x)\partial_x[p(x)\partial_x[v(x)]]
    dx
    \\
    &= \int_{a}^{b} 
        u(x)
    d(p(x)v'(x))
    \\
    &= \left. u(x)p(x)v'(x)\right|_a^b
    - \int_{a}^{b} 
        p(x)v'(x)u'(x)
    dx
    \\
    &= 
    - \int_{a}^{b} 
        p(x)v'(x)u'(x)
    dx
    \\
    \implies 
    \langle \partial_x[p(x)\partial_x[u]], v\rangle &= 
    \langle \partial_x[p(x)\partial_x[v]], u\rangle
\end{aligned}
$$


---
### **Error Analysis of Finite Element**

Suppose that an opeartor $\mathcal{L}$ is self adjoin (I didn't say it being linear). Then the norm it defines will be a measure of error. A Finite Element method that minizes the energy norm of the error is referred to as the **Ritz Finite Element Method**

**Claim: Ritz Glalerkin Equivalence for Adjoint Operator**

> When the opeartor is adjoint, the Ritz Finite Element Method and the Galkerkin's Finite Element method is the same. 


