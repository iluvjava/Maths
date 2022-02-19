[[Finite Difference with Errors Term]]

---
### **Intro**

We introduct the basic concept of 2D finite different method using the example of an steady state solution for the non-homoegenous 2D poisson equation of the form: 

$$
\begin{cases}
    \Delta u = f & 
    \\
    u(x, y) = \gamma(x, y) & \forall (x, y) \in \text{Boundary}([0,1]\times[0, 1])
\end{cases}
$$

Note: $\Delta$ is the Laplacian: $\partial_x^2 + \partial_y^2$, and the $\gamma(x,y)$ are just the function on the boundary that is not correlated to time. 

**Natural Ordering of 2D Grid Points**: 

> The natural ordering of the grid point in 2D for PDE is rowwise, going from the bottom of the grid to the top of the grid row by row.

For simplicity, we would assume that the grid points are $m\times m$, the same number of discritization of x,y direction give the grid point width $h$ for both the $x, y$ direction on the domain $[0, 1]\times[0, 1]$. The way grid points are indexed is **similar to the Cartisian coordinate system**. 

The matrix is operating on the block vector of the form: 

$$
u = 
\begin{bmatrix}
    u^{[1]} \\ u^{[2]} \\ \vdots \\ u^{[m]}
\end{bmatrix}
$$

Where $u^{i}$ denotes the ith row of the grid, for example $u^{[i]}$ will denotes all the $(x_1, y_i), (x_2, y_i), \cdots (x_m, y_i)$, the $i^{th}$ row for the on the grind point, counting from the bottom to the top. 

The above natural ordering doesn't make any assumption for the type of discretization. 


**Equally Spaced Grid Points**: 

> Suppose that the grid $[0, 1]\times[0, 1]$ has been partitioned into a $m\times m$ grid point, equally, then $(x_i, y_i) = (ih, jh)$, $i,j= 1, \cdots, m$ and $h = 1/(m + 1)$
> Next, we let $u_{i, j}$ denotes the value of the solution at the point $(x_i, x_j)$, then it can be said that $u_{i, j} = u(ih, jh)$. and let's define that $u^{[j]}_i = u_{i, j}$. Take not that this is different from the ordering of **elements in matrices**. in our case $(i, j)$, $i$ denotes cordinate point: $(ih, jh)$. 


---
### **Constructing the Finite Difference Matrices**

This is the 5 pointes stencil centered at some points: 

$$
\begin{bmatrix}
    0 & 1 & 0
    \\
    1 & -4 & 1
    \\
    0 & 1 & 0
\end{bmatrix}
$$

The discrete operator such that applies the finite difference method is given as: 

$$
A = \frac{1}{h^2}\begin{bmatrix}
    T & I & &  &
    \\
    I & T & I & &
    \\
    & & & \ddots&
    \\
    & & \ddots& &I
    \\
    & & &I &T
\end{bmatrix} 
$$

Take note that, in this case, it can be given as $P\otimes I + I\otimes P$, $\otimes$ denotes the kronerker product between 2 matrices. Where, $P$ is a tridiagonal matrix with $1$ on the sub and super diagonals and $-2$ on the diagonals. Then it can be seemed that: 

$$
\begin{aligned}
    \underbrace{\begin{bmatrix}
        -2I & I & &  &
        \\
        I & -2I & I & &
        \\
        & & & \ddots&
        \\
        & & \ddots& &I
        \\
        & & &I &-2I
    \end{bmatrix}}_{P\otimes I} +
    \underbrace{\begin{bmatrix}
        P& & &  \\
        &P & &  \\
        & & \ddots& \\
        & & & P 
    \end{bmatrix}}_{I\otimes P}
    &= h^2A
\end{aligned}
$$


---
### **Actual Implementations**

Is it worth it to find the explicit matrix representation for the problem? 

> No, during implementation it's usually implemented as a blackbox linear operator. To find the actual matrix, one can consider converting the natural ordering of the tuple into linear indices using a function. Kron product are welcome, but it's used more for the analysis side. 

suppose that the domain $[0, 1]\times[0, 1]$ is splitted into a grid of size $m \times m$ (width x height). Then the translation of $(i, j)$ grid point to the index inside of the vector for gridpoints **with natural ordering** will be given as: 

$$
\begin{aligned}
    \mathcal{I}(i, j) = (j - 1)m + i \quad \forall (i, j) \in [1, \cdots, m]\times[1, \cdots m]
\end{aligned}
$$

In addition, we let $u_{i, j} = u(i*h, j*h)$ where $h = 1/(m + 1)$, this would implies hat we take the interior of the grid point to be $m$, and the values $0, m + 1$ will denote values on the bounary. 

The discrete Laplacian gives the $\mathcal{I}(i, j)$ row of the matrix vector system $A\vec{u} = \vec{f}$

$$
\begin{aligned}
    \sum_{1 \le i, j \le 3}^{}\left(
        \begin{bmatrix}
            u_{i - 1, j + 1} & u_{i, j + 1} & u_{i + 1, j + 1}
            \\
            u_{i - 1, j} & u_{i, j} & u_{i + 1, j}
            \\
            u_{i - 1, j - 1} & u_{i, j - 1} & u_{i + 1, j - 1}
        \end{bmatrix}
        \odot
        \begin{bmatrix}
            0 & 1 & 0
            \\
            1 & -4 & 1
            \\
            0 & 1 & 0
        \end{bmatrix}        
    \right)_{i, j} &= h^2\vec{f}_{\mathcal{I}(i, j)} \quad \forall\; \mathcal{I}(i, j)
    \\ 
    \frac{1}{h^2}
    \text{sum}\left(
        \begin{bmatrix}
            & u_{i, j + 1} & 
            \\
            u_{i - 1, j}&-4u_{i, j} &u_{i + 1, j} &
            \\
            & u_{i, j - 1}& 
        \end{bmatrix}
    \right)
    &=
    \vec{f}_{\mathcal{I}(i, j)} 
    \quad \forall \mathcal{I}(i, j)
\end{aligned}
$$

For each subscript $(i, j)$ on $u$, convert it to the row index, and then put the coefficients into the $I(i, j)$ colum. A routine that does this will produce the correct matrix. 

**Boundary Conditions**

The boundary are the function $u(0, y), u(1, y)\;\forall\; y \in[0, 1]$ and $u(x, 0), u(x, 1)\; \forall x \in[0, 1]$. With the grid point, we will be able to represent it as 4 vectors. $u_{0,[0, 1]}, u_{1, [0, 1]}, u_{[0, 1], 1}, u_{[0, 1], 0}\in\mathbb{R}^m$, denoting the left, right, top and bottom boundary condition for the system. 

The boundary conditions are immediately next to $u_{i, j}$ where $j = 1 \vee j = m \vee i = 1 \vee i = m$. 

> To make life easier, we consider the boundary conditions via the first and last row of the grid points, and some row in the middle of the gridpoints. 

**Boundary Conditiosn Formulations**

The first row make use of the boundary conditions: 

$$
\begin{aligned}
    \vec{f}_{\mathcal{I}(i, 1)} &= 
    \frac{1}{h^2}
    \text{sum}
    \left(
        \begin{bmatrix}
            & u_{i, 2}& 
            \\
            u_{i - 1, 1} & -4u_{i, 1}& u_{i + 1, 1}
            \\
            & u_{i, 0}& 
        \end{bmatrix}
    \right) \quad \forall 1 \le i \le m
    \\
    \vec{b}^{[1]} &= 
    - \frac{1}{h^2}\begin{bmatrix}
        u_{1, 0} \\ u_{2, 0} \\ \vdots \\ u_{m, 0}
    \end{bmatrix}
    - \frac{u_{0, 1}\mathbf{e}_1^{(m)}}{h^2} 
    - \frac{u_{m + 1, 1} \mathbf{e}_{m}^{(m)}}{h^2}
    + f^{[1]}
\end{aligned}
$$

For all the rows in the middle, we have the the expression: 

$$
\begin{aligned}
    \vec{f}_{\mathcal{I}(i, j)} &= 
    \frac{1}{h^2}
    \text{sum}
    \left(
        \begin{bmatrix}
            & u_{i, j + 1}& 
            \\
            u_{i - 1, j} & -4u_{i, j}& u_{i + 1, j}
            \\
            & u_{i, j - 1}& 
        \end{bmatrix}
    \right) \quad \forall 1 \le i \le m , \; 2 \le j \le m - 1
    \\
    \vec{b}^{[j]} &= 
    - \frac{u_{0, j}\mathbf{e}_{1}^{(m)}}{h^2}
    -
    \frac{u_{m+ 1,j}\mathbf{e}_m^{(m)}}{h^2}
    + f^{[j]}
\end{aligned}
$$

And the boundary conditions for the last row is similar to the first row: 

$$
\begin{aligned}
    \vec{f}_{\mathcal{I}(i, m)} &= 
    \frac{1}{h^2}\text{sum}
    \left(
        \begin{bmatrix}
            & u_{i, m + 1}&  \\
            u_{i- 1, j}& -4u_{i, m}&  u_{i + 1, j} \\
            & u_{i, m - 1}&  
        \end{bmatrix}
    \right)
    \quad \forall\; 1 \le i \le m
    \\
    b^{[m]} &= 
    -\frac{1}{h^2}\begin{bmatrix}
        u_{1, m + 1} \\ u_{2, m _ 1} \\ \vdots \\ u_{m, m + 1}
    \end{bmatrix} 
    - \frac{u_{0, m}}{h^2}\mathbf{e}^{(m)}_1 
    - \frac{u_{m + 1, m}}{h^2}\mathbf{e}^{(m)}_m
    + \vec{f}^{[m]}
\end{aligned}
$$

Which consiss of all the boundary conditions we need for the problem. 

---
### **The Error Term**






