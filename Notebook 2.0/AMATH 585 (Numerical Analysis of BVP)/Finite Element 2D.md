Make sure to read: [[Finite Element 1D Formally Introduced]] first for some background on this topic. 


---
### **Intro**

We are interested to introduce 2D finite element method under the context of solving for the Steady State Poisson Equations for 2D problem, that is non-homogenous and without any time domain evolution. 

Firstly, create an coordinate index to linear index converstion notation by: 

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

There are $n_xn_y$ total number of these Bi-linear basis function. Here, denote the domain of the function to be $\Omega$, and denote the bounary as $\text{bd}(\Omega)$, the inner product of 2 function in the domain satisfying the boundary conditions are given as: 

$$
\langle u, v\rangle := 
\iint_{\Omega} u(x, y)v(x, y) dxdy
$$

Let's use $\mathcal{S}$ to denotes the set of basis functions, then for all non-boundary basis function, one can index it using $\mathcal{I}(i, j)\in \{1, 2, \cdots, n_x\}\times \{1, 2, \cdots, n_y\}$. Hence, in total, we have $n_xn_y$ number of basis function that describe the interior. 

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
    \forall \hat{v} \in \mathcal{S}:
    \langle \mathcal{L}[\hat{u}], \hat{v}\rangle
    &= 
    \iint_{\Omega}(\hat{u}_{xx} + \hat{u}_{yy})\hat{v}dxdy
    \\
    &= - \iint_{\Omega}(\hat{u}_x\hat{v}_x + \hat{u}_y \hat{v}_y)dxdy 
    +
    \int_{\text{bd}(\Omega)} (\nabla u)\hat{v} d\hat{\mathbf{n}}
    \\
    &= 
    \int_{\text{bd}(\Omega)} (\nabla u)\hat{v} d\hat{\mathbf{n}} - 
    \int_{\Omega} (\nabla \hat{u})\cdot (\nabla \hat{v})dxdy
\end{aligned}
$$

The tent function will interact with itself, and 4 of its neighbour, and because the Trials Space and the basis set is the same, the discrete system generated is adjoin, giving us symmetric matrices. 

Boundary conditions needs to be satisfied by considering boundary functions that can span the boundary conditions. Which is just the Basis function defined above but applied to the boundary points, which would need points outside of the boundary for supports. 

Taking the Divergence of the Tentfunction one easily get: 

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
        (x - x_{i \pm_1 1})^{-1}(y - y_{j\pm_{2}1})^{-1}(
        (x - x_{i \pm_1 1})+ (y - y_{j\pm_2 1})
    )
\end{aligned}
$$

Where, $\pm_1$ correlates with $\pm_1$, they choose the same sign no matter where they appear in the expression, and $\pm_2$ correlates with $\pm_2$. 

### **Boundary Functions**



