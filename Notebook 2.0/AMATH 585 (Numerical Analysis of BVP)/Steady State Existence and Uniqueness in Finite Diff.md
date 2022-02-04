Prereq: [[Finite Difference]], [[Direct Method]]

---
### **Intro**

We are interested in how the existence and uniqueness of some type of problems are manifested in solving equations using the Finite Difference Method. Here, we will be using an example involving the steady state 1D Non-Homogenous Heat equation with Neuamn Boundary Conditions. 

The physical problem of the steady steady heat equation with neuman boundary condition is not well posed. The initial distribution and the total energy of the heat source function determines the long term distribution. However, the initial distribution is not involved in the finite difference method. 

For such a problem that is not well-posed, we can still try solving it and see what is expected for the RHS source function that makes the problem solvable. 

Steady State of BVP problem: 

$$
\begin{cases}
    u''(x) = f(x)
    \\
    u'(0) = \sigma_0, u'(1) = \sigma_1
\end{cases}\tag{1}
$$

Neuman conditions specifies the rate of heat flow at the boundary, zero means insulated, positive means heat is floating in, negative means floating out. 

---
### **Both Ends Insoluated**

The finite difference scheme proposed for (1) can be expressed as: 

$$
\begin{aligned}
    \underbrace{\frac{1}{h^2}
    \begin{bmatrix}
        -h & h & & & & \\
        1 & -2 & 1 & & & \\[0.7em]
        & \ddots & \ddots & \ddots  & & \\[0.7em]
        & & & 1& -2& 1 \\
        & & & & h& - h
    \end{bmatrix}}_{= A_h}
    \underbrace{\begin{bmatrix}
        u_0 \\ u_1 \\ \vdots \\ u_{m} \\ u_{m + 1}
    \end{bmatrix}}_{\tilde{u}} 
    = 
	\underbrace{\begin{bmatrix}
        \sigma_0 + \frac{hf(x_0)}{2}\\ f(x_1) \\ \vdots \\ f(x_m) \\ -\sigma_1 + 
        \frac{h}{2}f(x_{m + 1})
    \end{bmatrix}}_{\tilde{f}}
\end{aligned}\tag{2}
$$

Where the boundary conditions are using first derivative second order central. 

> It's immediate from the matrix that, the vector of all ones is in it's null space. 

**Handling of Neuman Boundary Conditions** 

$$
\begin{aligned}
    \frac{u_1 - u_{-1}}{2h} &= \sigma_0
    \\
    \frac{u_1 - 2u_0 + u_{-1}}{h^2} &= f(x_0)
    \\
    \implies 
    u_1 - u_{-1} = 2h\sigma_0
    \\
    u_{-1} = u_1 - 2h\sigma_0 
    \\
    \implies 
    \frac{u_1 - 2u_0 + u_1 - 2h\sigma_0}{h^2} &= f(x_0)
    \\
    \frac{2u_1 - 2u_0}{h^2} &= f(x_0) + \frac{2\sigma_0}{h}
    \\
    \frac{u_1 - 2u_0}{h} &= 
    \frac{hf(x_0)}{2} + \sigma_0
\end{aligned}\tag{3}
$$

The first 2 expression are the Neuman Boundary conditions using central first drivetive second order method on $x_0$, and the second line is the central difference, second order second derivative at the point $x_0$. 

Which is just some basic algebra, and this will give us the first row for the matrix $A_h$ in terms of $u_1, u_0$, the procedures for the last row of matrix $A_h$ is analogous and we will skip that part. 

---
### **Ill-Posed Problem**

Physically the problem has dependence on the initial heat distribution on the rod. In the case where $u'(0) = u'(1) = 0$, so that the rod is insolated, the amount of heat is trapped. Then the steady state solution is a constant solution $c$ such that $c = \int_{0}^1 u(x, 0) dx$ if we assume that $f(x) \equiv 0$. When $f(x)\not\equiv 0$, the steady state solution doesn't exist because the total energy in the system exploded. In this case, the steady-state solution is lost into the Null space of the operator $A_h$. 

Assuming the boundary conditions are not identically zero, then the heat source must cancle out with the heat fluxes introduced by the boundary. 

**Claim 1**:

> The steady state solution only exists when this condiction holds true: 
> $$
> \int_0^1 f(x)dx = \sigma_1 - \sigma_0
> $$

**Proof**: 

$$
\begin{aligned}
    \int_{0}^{1} 
        u''(x, \infty)
    x &= u'(1) - u'(0)
    \\
    \int_{0}^1 f(x)dx &= u'(1)- u'(0)
    \\
    \int_{0}^1 f(x)dx &= \sigma_1 - \sigma_0
\end{aligned}\tag{4}
$$

The first line is the fundamental theorem of calculus. The second line is by the fact that the steady state solution has $u''(x) = f(x)$, and the third line implies that the heat flux must equals to the total energy provided by the source function. 


---
### **Discrete Problem and Linear Algebra**

**Claim 2**

> Let Matrix $A_h$ be the finite difference matrix appeared in expression (2), then the nullspace of $A^T_h$ is given as: 
> $$
>     \text{null}(A^T) = \text{span}\left(
>         \begin{bmatrix}
>             1/h\\ 1 \\ 1 \\ \vdots \\1 \\ 1 \\ 1/h
>         \end{bmatrix}
>     \right)
> $$
> The immediate consequence is that if the RHS vector $\tilde{f}$ (tilde is used to denote the RHS with the boundary conditions)  has component in $\text{null}(A^T)$, then that component is perp to $\text{ran}(A)$, meaning that component is not solvable to the linear system. Therefore the discrete system is only sovable whenever $\tilde{f}\perp \text{null}(A^T)$. 

**Proof of Claim 2:**

Consider block structure matrices for $A_h$ for simplicity we denote $A$ as $A_h$, and we assume that $A \in \mathbb{R}^m$, we also use the notation of $\mathbf{e}^{(m)}_i$ to denote the $i^{th}$ standard basis vector in $\mathbb{R}^m$. 

$$
\begin{aligned}
    A &= \frac{1}{h^2} 
            \begin{bmatrix}
                -h & h(\mathbf{e}^{(m)}_1)^T & 0 \\
                \mathbf{e}_1^{(m)} & \tilde{A} & \mathbf{e}^{(m)}_m \\ 
                0 & h(\mathbf{e}_m^{(m)}) & - h
            \end{bmatrix} 
            \quad
            \text{Where } 
            \tilde{A} = \begin{bmatrix}
                -2 & 1  & & &  \\
                1 & -2 & 1 & &  \\
                & &\ddots &\ddots &  \\ 
                & & & & 1  \\ 
                & & &1 & -2 \\ 
            \end{bmatrix}
\end{aligned}\tag{5}
$$

Now consider multiplying a right hand side block vector $[x_1 \; y \; x_2]^T$. 

$$
\begin{aligned}
    A^T &= 
    \frac{1}{h^2}\begin{bmatrix}
        -h & (\mathbf{e}^{(m)}_1)^T & 0 \\
        h\mathbf{e}_1^{(m)} & \tilde{A} & h\mathbf{e}^{(m)}_m \\ 
        0 & (\mathbf{e}_m^{(m)})^T & - h
    \end{bmatrix} 
    \\
    \frac{1}{h^2}\begin{bmatrix}
        -h & (\mathbf{e}^{(m)}_1)^T & 0 \\
        h\mathbf{e}_1^{(m)} & \tilde{A} & h\mathbf{e}^{(m)}_m \\ 
        0 & (\mathbf{e}_m^{(m)})^T & - h
    \end{bmatrix} 
    \begin{bmatrix}
        x_1 \\ y \\ x_2
    \end{bmatrix}
    & =
    \begin{bmatrix}
        0 \\ \mathbf{0} \\ 0
    \end{bmatrix}
    \\
    \begin{bmatrix}
        -hx_1 + y_1 
        \\
        hx_1 \mathbf{e}_1^{(m)} + \tilde{A}y + hx_2 \mathbf{e}_m^{(m)}
        \\
        y_m -x_2 h
    \end{bmatrix}
    & =
    \begin{bmatrix}
        0 \\ \mathbf{0} \\ 0
    \end{bmatrix}
    \\
    \implies & 
    \begin{cases}
        y_1 = hx_1 \\ 
        y_m = hx_2
    \end{cases}
\end{aligned}\tag{6}
$$

Substituting the relation into the middle row we obtained a system of equations for solving: 

$$
\begin{aligned}
    y_1 \mathbf{e}_1^{(m)} + \tilde{A}y + y_m \mathbf{e}_m^{(m)} 
    &= \mathbf{0}
    \\
    (\tilde{A} + \mathbf{e}^{(m)}_1\mathbf{e}^{(m)T}_1 + \mathbf{e}_m^{(m)}\mathbf{e}_m^{(m)T}) y &= \mathbf{0}
    \\
    \begin{bmatrix}
        -1 & 1 & & \\
        1 & -2 & 1 & \\
        & 1& -2& 1 \\
        & & & \ddots & \\
        & & & -1&1 
    \end{bmatrix} y = \mathbf{0}
    \\
    \implies
    y \in \text{span}\left(
        \begin{bmatrix}
            1 \\ \vdots \\ 1
        \end{bmatrix}
    \right)
\end{aligned}\tag{7}
$$

Substituting it back we have $x_1 = x_2 = 1/h$. **Claim 2** is proven at this point. 

---
### **Combing the Uniqueness for the Continuous and the Discrete**

Take note that the span of $\text{ran}(A^T)$ can be written as the span of $g = [1 \; h\; h\; \cdots h\; h\; 1]^T$. $\tilde{f} \perp \text{null}(A^T) \iff \tilde{f}^Tg = 0$, which implies: 

$$
\sigma_0  - \sigma_1 + \frac{hf(x_0)}{2} + \sum_{i = 1}^{m} hf(x_i) + \frac{h}{2}f(x_{m + 1}) = \int_{0}^{1} f(x)dx + \sigma_0 - \sigma_1 + \mathcal{O}(h^2)
$$

Observe that the disrete unique condition is just the trapz rule applied to **Claim 1**. They are the same when $h\rightarrow 0$. 

