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
A_{i, j} = \int_{0}^{1} \varphi_j'(x) \phi_i(x)dx + \int_{0}^{1} r(x)\varphi_j(x)\phi_i(x)dx \tag{4}
$$

And the elements of the matrix $A$ are usually estimated when the basis function or $r(x)$ is very hard to handle. If not, we can just take the integral by hands and figure out the elements in the matrix. 

---
### **Proof and a more Detailed Looked**

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
\end{aligned}
$$

**The Basis and the Basis Function**

The choice of Basis set $\mathcal{S}, \mathcal{M}$ depends, but for the sake of discussion, we will be using the set of all linear piecewise function on a defined discretized grid point, let's suppose that there are $x_0, x_1, \cdots, x_n$ points discretizing $[0, 1]$, including the boundary. Consider the following basis function: 

$$

$$


