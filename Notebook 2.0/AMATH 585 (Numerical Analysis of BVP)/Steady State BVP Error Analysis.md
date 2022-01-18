[[Direct Method]], [[Finite Difference]]

---
### **Intro**

We are interesting in deriving the error bound for the solution to the steady state of the heat equation via finite difference method. In particular, the steady state solution of the 1D problem on the unit interval with Dirichlet Boundary Conditions, for simplicity. 


We will derive LTE(Local Truncation Error) and Global Error using a basic example. 

The example system is: 

$$
\begin{cases}
    u''(x) = f(x) & \forall  x\in [0, 1]
    \\
    u(0) = \alpha, y(1) = \beta 
\end{cases}
$$

Divides the interval up to $m + 1$ intervals, equally spaced, then $h$, define $x_j = jh$, $h = 1/(1 + m)$, where $1\le j \le m$, and let $x_0$ and $x_{m + 1}$ denotes the bound points: $0, 1$. basically: $x_0 < x_1 < x_2 < \cdots < x_{m} < x_{m + 1}$. 

Let's define the quantities here: 

$$
\hat{u} = \begin{bmatrix}
    u(x_1)\\u(x_2)\\ \vdots \\  u(x_m)
\end{bmatrix}
\quad 
\vec{u} = \begin{bmatrix}
    u_1 \\ u_2 \\ \vdots \\ u_m
\end{bmatrix}
$$

Where, $\vec{u}$ denotes the computed results for the grid points and $\hat{u}$ denotes the exact steady state solution for the systems. The the error would be computed as $\vec{e} = \hat{u} -\vec{u}$. 

Then we construct the system of Finite Difference, which is: 

$$
\begin{aligned}
    A_h \vec{u} &= \vec{f}
    \\
    A &= \frac{1}{h^2}\begin{bmatrix}
        -2 & 1 & &&  \\
        1& -2 & 1 && \\
        & & \ddots && \\
        & & &&  1 \\
        & &&  1 & -2
    \end{bmatrix}
    \\
    \vec{f} &= 
    \begin{bmatrix}
        f(x_1) - \alpha/h^2
        \\
        f(x_2)
        \\
        \vdots
        \\
        f(x_{m - 1})
        \\
        f(x_m) - \beta/h^2
    \end{bmatrix}
\end{aligned}
$$

---
### **What is the Global, Local Error?**

What is the error, if we solve the discretized system as an approximation to the original problem ($A_h\vec{u} = \vec{f}$), for the steady state solution? 

To measure the error, we introduce 2 important type of norms: 

$$
\Vert \vec{v}\Vert_{\infty} \quad 
\Vert \vec{e}\Vert_{L2} = \sqrt{h}\Vert \vec{e} \Vert_2
$$

**Claim 1**

> The global error for the L2 norm is $\mathcal{O}(h^2)$ and the error for the infinity norm is also $\mathcal{O}(h^2)$. 

**Let's find the Global Error under the L2 norm**

Due to finite difference, we say: $A\hat{u} = \vec{f} + \vec{\tau}$, where $\vec{\tau}$ denotes the Truncation error from the finite differences. Then: 

$$
\begin{aligned}
    \vec{e} &= \vec{u} - \hat{u}
    \\
    A_h\vec{e} &= A_h\vec{u}  - A_h\hat{u}
    \\
    A_h\vec{e} &= A_h\vec{u} - (\vec{f} - \vec{\tau})
    \\
    A_h\vec{e} &= \hat{f} - (\vec{f} - \vec{\tau})
    \\
    A\vec{e} &= -\vec{\tau}
\end{aligned}
$$

Take notice that, the error is another discretiations of a system with boundary conditions $\vec{e}_0 = \vec{e}_{m +1}= 0$. Because, at the boundary, there is no error and it's also not in the linear system $A\vec{u} = \vec{f}$. Here, we obtained another ODE: $e''(x) = - \tau(x)$The local truncation error (LTE) is given as: 

$$
\tau_j = \left(
    u''(x_j) + \frac{h^2}{12}u^{(4)}(x_j) + \mathcal{O}(h^4)
\right) - f(x_j) = \frac{h^2}{12}u^{(4)}(x_j) + \mathcal{O}(h^4)
$$

because the original system we are solving is: $u''(x) = f(x)$, therefore we only have the error terms left. The error here is indeed getting smaller and it's in the order of $h^2$ because: 

$$
\begin{aligned}
    \lim_{h\rightarrow 0} A_h \vec{e} &= \lim_{h\rightarrow 0} -\vec{\tau}
    \\
    e''(x) + \mathcal{O}(h^4) &= 
    \lim_{h\rightarrow 0} \frac{h^2}{12} u^{(4)}(x) + \mathcal{O}(h^4) \quad \forall x \in (0, 1)
    \\
    \implies 
    e''(x) &= \lim_{h\rightarrow 0}\frac{h^2}{12}u^{(4)}(x) + \mathcal{O}(h^4)
\end{aligned}
$$

The error is in the order of $\mathcal{O}(h^2)$. Taking the integral on both side we have $e(x)$, however, $h$ remains the same and kept the order of accuracy. 

**Note**

The L2 norm is consistent of the L2 norm for function, notice that the integral of $e(x)$ will converge to zero with $\mathcal{O}(h^2)$, which doesnt mean that $\Vert \vec{e}\Vert_2$ is going to converge to zero at the same rate. 

The proof for the Infinity norm is more involved and it will be covered in another file. 

---
### **How Stable Is This?**

A problem is stable when: 

> $A_hu_h = f_h$ is the problem and $\Vert A_h^{-1}\Vert \le C$ for $h$ getting smaller and smaller and C is not paramaterized by h in anyway. 

In this case, it just so happens that the matrix $A$ has a spectrum that is bounded as $h\rightarrow 0$ and its inverse is still going to be bounded, which in the end bounding the norm of the operator. Because the matrix is TST, which is discusssed in: [[The TST Matrix]]. 




