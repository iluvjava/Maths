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

For the boundary, the above function will have to be modified to fewer cases to fit the boundary, because there are not points outside of the boundary to support it. If the region for the case is outside of the function, we will have to remove it from the definition of the function. 

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

### **Boundary Functions**

Here we make the assumption that $\Omega =[0, 1]^2$, so that we don't need to redefine the basis function on the boundary. The above tent basis function is still defined on the boundary, just with 2 or 3 of the cases chopped off, depending on whether the functions is on the edge or the corner of the grid point. 

Firstly, we make the augmented set of basis functions: 

$$
\overline{\mathcal{S}} = 
\left\lbrace
    (i, j) \in \{0, 1, \cdots, n_x, n + 1\}\times \{0, 1, \cdots, n_y, n + 1\}
\right\rbrace
$$

Define the Indices mapping function as: 

$$
\lfloor i, j\rceil = i + j(n_y + 1)
$$

Then, we may represent any piecewise continuous function $\tilde{u}$ as: 

$$
\begin{aligned}
    \tilde{u}(x, y) &= 
    \sum_{(i,j)\in \overline{\mathcal{S}}}
    c_{\lfloor i, j\rceil}
    \varphi_{\lfloor i, j\rceil}(x, y)
\end{aligned}
$$

Using the weak formulations of the Finite Element Method, one follow the same logic as Finite Element in 1D and obtain a system equations of the form $Ax = b$, where $A$ the linear operator has element defined as: 

$$
\begin{aligned}
    A_{\lfloor i, j\rceil, \lfloor k, l\rceil}
    &= 
    - c_{\lfloor k, l\rceil}
    \iint_{\Omega}(
        \nabla \varphi_{\lfloor i, j\rceil}
    )\cdot \nabla \varphi_{\lfloor k, l\rceil}dxdy
    \quad 
    \forall\; (i, j), (k, l)\in \{1, \cdots, n_x\}\times \{1, \cdots, n_y\}
\end{aligned}
$$

Take note that whenever $|i - k| + |j - l| \le 2$, the basis function will have parts of non-zero overlapping with each other, making that element in matrix $A$ non-zero. However, take notice that we only have $n_xn_y$ basis constraints if we only consider the interactions of all interior nodes. We need to in addition also consider the boundary points by listing more equations: 

$$
\begin{aligned}
    g(0, y) &= 
    \sum_{j = 1}^{n_y}c_{\lfloor
        0, j
    \rceil}\varphi_{\lfloor
        0, j
    \rceil}(0, y)
    \\
    g(1, y) &= 
    \sum_{j = 1}^{n_y}c_{\lfloor
        n_x + 1, j
    \rceil}\varphi_{\lfloor
        n_x + 1, j
    \rceil}(1, y)
    \\
    g(x, 0) &= 
    \sum_{i = 1}^{n_x}
        c_{\lfloor i, 0\rceil}\varphi_{\lfloor 
            i, 0
        \rceil}(x, 0)
    \\
    g(x, 1) &= 
    \sum_{i = 1}^{n_x}
        c_{\lfloor i, n_y + 1\rceil}\varphi_{\lfloor 
            i, n_y + 1
        \rceil}(x, 1)
\end{aligned}
$$

And around the 4 coorners, we would simply have the coefficients of the basis functions equals to the function $g$, more specifically: $g(x, y) = c_{\lfloor i,j \rceil}$ for all $(i, j)\in \{(0, 0), (0, 1), (1, 0), (1,1)\}$. Next, we need to assert the constraints at the discrete points on the grid, which will help with constructing the system of equations. For simplicity, here we will list the conditions asserted by considering the left side boundary, not repeating the points at the corners, then: 



