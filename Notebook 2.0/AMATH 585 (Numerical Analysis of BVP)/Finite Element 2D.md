Make sure to read: [[Finite Element 1D Formally Introduced]] first for some background on this topic. 

---
### **Intro**

We are interested to introduce 2D finite element method under the context of solving for the Steady State Poisson Equations for 2D problem, that is non-homogenous and without any time domain evolution. We assume Poisson equation of the form: 

$$
\begin{cases}
    \nabla\cdot(\nabla u) = f & \forall x \in \Omega
    \\
    u=g & \forall x \in \text{bd}(\Omega)
\end{cases}
$$

Here, $\text{bd}(\Omega)$ denotes the boundary of the piecience wiese lipschitz continuous domain $\Omega$. Firstly, create an coordinate index to linear index converstion notation by: 

$$
\mathcal{I}(i, j) = i + (j - 1)n_x
$$

Where, the grid will ne $n_x\times n_y$ denoting the number of partitioning on the $x, y$ direction, for the unit square $[0, 1]^2$. Then we define: 

**Tent Basis Function**

$$
\varphi_{\mathcal{I}(i, j)}(x, y)
= \begin{cases}
    \frac{\left(x-x_{i-1}\right)\left(y-y_{j-1}\right)}{\left(x_{i}-x_{i-1}\right)\left(y_{j}-y_{j-1}\right)} & \text { in }\left[x_{i-1}, x_{i}\right] \times\left[y_{j-1}, y_{j}\right] 
    \\[0.5em]
    \frac{\left(x-x_{i+1}\right)\left(y-y_{j-1}\right)}{\left(x_{i}-x_{i+1}\right)\left(y_{j}-y_{j-1}\right)} & \text { in }\left[x_{i}, x_{i+1}\right] \times\left[y_{j-1}, y_{j}\right] 
    \\[0.5em]
    \frac{\left(x-x_{i-1}\right)\left(y-y_{j+1}\right)}{\left(x_{i}-x_{i-1}\right)\left(y_{j}-y_{j+1}\right)} & \text { in }\left[x_{i-1}, x_{i}\right] \times\left[y_{j}, y_{j+1}\right] 
    \\[0.5em]
    \frac{\left(x-x_{i+1}\right)\left(y-y_{j+1}\right)}{\left(x_{i}-x_{i+1}\right)\left(y_{j}-y_{j+1}\right)} & \text { in }\left[x_{i}, x_{i+1}\right] \times\left[y_{j}, y_{j+1}\right] 
    \\[0.5em]
    0 & \text { elsewhere }
\end{cases}
$$

There are $n_xn_y$ total number of these Bi-linear basis function. The inner product of 2 function in the domain satisfying the boundary conditions are given as: 

$$
\langle u, v\rangle := 
\iint_{\Omega} u(x, y)v(x, y) dxdy
$$

Let's use $\mathcal{S}$ to denotes the set of basis functions, then for all non-boundary basis function, one can index it using $\mathcal{I}(i, j)\in \{1, 2, \cdots, n_x\}\times \{1, 2, \cdots, n_y\}$. Hence, in total, we have $n_xn_y$ number of basis function that describe the interior. 

For adapting the boundary, the above function will have to be modified to fewer cases to fit the boundary, because there are not points outside of the boundary to support it. If the region for the case is outside of the function, we will have to remove it from the definition of the function. 

---
### **Weak Conditions Reformulated in 2D**

The weak form formulation of the 2D finite element method is provided via the Green's Theorem. Green's Theorem is applied to the following Objective Formlation of the Week Form, under the defined inner product on $\Omega$, which is: 

$$
\forall\; \hat{v}\in S: \langle \mathcal{L}[\hat{u}], \hat{v}\rangle = \langle 
	f, \hat{v}
\rangle
$$

Using the Green's Theorem ([[Green's Theorem, 2D Integral by Parts]]), the inner product in this particular case can be evaluated into: 

$$
\begin{aligned}
    \forall\; \hat{v} \in \mathcal{S}:
    \langle \mathcal{L}[\hat{u}], \hat{v}\rangle
    &= 
    \iint_{\Omega}(\hat{u}_{xx} + \hat{u}_{yy})\hat{v}dxdy
    \\
    &= - \iint_{\Omega}(\hat{u}_x\hat{v}_x + \hat{u}_y \hat{v}_y)dxdy 
    +
    \int_{\text{bd}(\Omega)} (\nabla \hat{u})\hat{v} d\hat{\mathbf{n}}
    \\
    &= 
    \int_{\text{bd}(\Omega)} (\nabla u)\hat{v} d\hat{\mathbf{n}} - 
    \iint_{\Omega} (\nabla \hat{u})\cdot (\nabla \hat{v})dxdy
\end{aligned}
$$

The tent function will interact with itself, and 8 of its neighbours, and because the Trials Space and the basis set is the same, the discrete system generated is adjoin, giving us symmetric matrices. 

Taking the gradient of the Tentfunction one easily get: 

$$
\begin{aligned}
    \nabla \varphi_{\mathcal{I}(i, j)} &= 
    \nabla \left(
        \frac{(x - x_{i \pm_1 1})(y - y_{j\pm_2 1})}
        {
            (x - x_{i \pm_1 1})(y - y_{j\pm_{2}1})
        }
    \right)
    \\
    &= 
        (x - x_{i \pm_1 1})^{-1}(y - y_{j\pm_{2}1})^{-1}
        \begin{bmatrix}
            y - y_{j\pm_2 1} \\   
            x - x_{i \pm_1 1}
        \end{bmatrix}
\end{aligned}
$$

Where, $\pm_1$ correlates with $\pm_1$, they choose the same sign no matter where they appear in the expression, and $\pm_2$ correlates with $\pm_2$, this notation encapsulated 4 cases of the function all at the same time. 

---
### **The Linear System**

Suppose that we wish to partition the region $\Omega = [0, 1]\times [0, 1]$. Into a grid with size $n_x\times n_y$. We consdier the following notations regarding the transformation between coordinate indexing and linear indexing: 

> $$
> \lfloor i, j\rceil = i + 1 + j(n_y + 2)
> $$

This is for ease with notations. Next, we let th solution $\tilde{u}$ to be a function spanned by the basis function, including at the boundary. Then: 

$$
\begin{aligned}
    \tilde{u}(x,y) = 
    \sum_{(i, j)\in \overline{G}}^{}
    c_{\lfloor i,j \rceil}\varphi_{\lfloor i,j \rceil}(x, y)
\end{aligned}
$$

Next, we would need to classify the type of indices for sanity: 

**Indices Classifications**: 

> $$
> \begin{aligned}
>     \overline{G} &:= \{0, 1, \cdots, n_x + 1\}\times \{0, 1, \cdots, n_y + 1\}
>     \\
>     G &:= \{1, \cdots, n_x\}\times \{1, \cdots, n_y\}
>     \\
>     \mathbb{\overline{B}}&:= \overline{G}\setminus G
>     \\
>     \mathcal{N}(i, j) &= \{(k, l)\in \overline{G}: |i - k| + |l - j| \le 2\}
> \end{aligned}
> $$



There are $(n_x + 2)(n_y + 2)$ number of variables to determine in total. However, due to boundary conditions, we can fill in the values for basis function that are crossing the boundary, there are $4 + 2(n_x + n_y)$ many of them, and they can be determined by: 

$$
\begin{aligned}
    c_{\lfloor i, j\rceil} = g(x_i, y_j) \quad \forall \; (i, j) \in \overline{\mathbb{B}}
\end{aligned}
$$

Suppose that the linear system $A \vec{c} = \vec{b}$ models the Finite Element in 2D, then it would be a $(n_x + 2)\times(n_y + 2)$ system. But firstly we can assert the variables that are modeling the basis function on the boundary, getting: 

$$
\begin{aligned}
    A_{\lfloor i, j\rceil, \lfloor i, j\rceil} &= 
    1
    \\
    \vec{b}_{\lfloor i,j \rceil} &= g(x_i, y_j)  
    \quad \forall \; (i, j) \in \overline{\mathbb{B}}
\end{aligned}
$$

Next, we must consider the weakform of the formula, which wll modeling all nodes that are not crossing the boundary. Recall the the weak form: 

$$
\begin{aligned}
    \langle \mathcal{L}\tilde{u}, \varphi_{\lfloor i,j \rceil}\rangle &= \langle f, \varphi_{\lfloor i,j \rceil}\rangle \quad \forall \; (i, j) \in G
    \\
    \left\langle 
    \mathcal{L}\left[
        \sum_{(k, l)\in G}^{}
        c_{\lfloor k, l\rceil}\varphi_{
            \lfloor k, l\rceil
        }
        \right], 
        \varphi_{\lfloor i,j \rceil}\right\rangle 
        &= \langle f, \varphi_{\lfloor i,j \rceil}
    \rangle
    \\
    \left\langle 
    \mathcal{L}\left[
        \sum_{(k, l)\in G}^{}
        c_{\lfloor k, l\rceil}\varphi_{
            \lfloor k, l\rceil
        }
        \right], 
        \varphi_{\lfloor i,j \rceil}\right\rangle 
        &= \langle f, \varphi_{\lfloor i,j \rceil}
    \rangle
    \\
    \sum_{(k, l)\in\mathcal{N}(i, j)}^{\forall}c_{\lfloor k, l\rceil}
    \langle \mathcal{L}[\varphi_{\lfloor k,l \rceil}], \varphi_{\lfloor i, j \rceil}\rangle
    &= \langle f, \varphi_{\lfloor i, j \rceil}\rangle
\end{aligned}
$$

Which creates only 9 variables for each row of our matrix, because each of the basis function that are not crossing the boundary will be interacting with 8 of its neighbours including itself, implying that the matrix can be written in the form of: 

$$
\begin{aligned}
    A_{\lfloor i,j \rceil, \lfloor k, l \rceil}
    &= 
    \begin{cases}
        \langle \mathcal{L}[\varphi_{\lfloor k, l \rceil}], \varphi_{\lfloor i,j \rceil}\rangle & (k, l) \in \mathcal{N}(i, j)
        \\
        1 & (k, l), (i, j) \in \overline{\mathbb{B}}
        \\
        0 & \text{else}
    \end{cases}
    \\
    \vec{b}_{\lfloor i,j \rceil} &= 
    \begin{cases}
        g(x_i, y_j) & (i, j)\in \overline{\mathbb{B}}
        \\
        \langle f,\varphi_{\lfloor i,j \rceil} \rangle & \text{else}
    \end{cases}
\end{aligned}
$$

And that is going to be the system thta we are solving. It's a $(n_x + 2)(n_y + 2)$ system where $4 + 2(n_x + n_y)$ of the coefficients are easily determined by the Dirichlet Boundary Conditions. To evaluate the inner product, one would at least need to use the Green's Theorem listed above, and factor out the basis function so that Guassian Quadrature method can be used. 

More specifically, the nodes that are interacting with the boundary nodes will have to be calculated differently compare to nodes that are in the strict interior of the grid point. For sanity, let's define nodes that are in the strict interior (nodes that are not interacting with boundary crossing nodes). 

---
### **Working out the Inner Product**

That is a lot of work, maybe for a future time. 