[[Steady State BVP Error, LTE]]
[[The TST Matrix]]
[[Greens Function]]

---
### **Intro**
We continue discussing the error analysis, but this time for the infinity norm. 


---
### **The Error under the Infinity Norm**

Take notice that a lose bound can be established by considering: 

$$
\Vert \vec{e}\Vert_{L2} = \sqrt{h}\left(
        \sum_{j}^{}e_j^2
    \right)^{1/2} \ge \sqrt{h} \Vert e\Vert_{\infty}
    \implies
    \Vert \vec{e}\Vert_{\infty} \le 
    \frac{\Vert \vec{e}\Vert_{L2}}{\sqrt{h}} \in 
    \mathcal{O}(h^{3/2})
$$

Therefore it's definitely converging, but the bound here can be made better to $\mathcal{O}(h^2)$. 

---
### **The Inf Norm Bound is Actually $\mathcal{O}(h^2)$**

We wish to prove the claim that: 

**Claim 1**

> $$
> \Vert e\Vert_{\infty} \le \Vert A\Vert_{\infty}\Vert \tau\Vert_{\infty} = \mathcal{O}(h^2)
> $$

In the first part of the steady state error analysis, $\tau$ has $\mathcal{O}(h^2)$ bounded norm, in that sense, the infinity error would be bounded as well. Therefore our objective is to prove that $\Vert A\Vert_{\infty} \in \mathcal{O}(h^2)$ as well. 

To prove, take this fact for granted without prove: 

> The columns of $A^{-1}$, the second order TST discretiations matrix, are the Green's Function on Delta Function cetnered at the discretization point. 

**Greens function (Without the Time Domain)**

Greens function $G(x, \bar{x})$ is the funciton that solves the following system BVP: 

$$
\begin{cases}
    u''(x) = \delta(x - \bar{x}) & \forall x \in [0, 1] 
    \\
    u(0) = u(1) = 0
\end{cases}\tag{1.1}
$$

The derivative of the Ramp Function is the Heaviside Function, and the deriative of the heaviside function is the Delta Function. One of the property the solution $G(x; \bar{x})$ must satisfy is: 

$$
\begin{aligned}
    u'(\bar{x} + \epsilon) - u'(\bar{x} - \epsilon) &=  
    \int_{\bar{x} - \epsilon}^{\bar{x} + \epsilon} \delta(x - \bar{x}) dx = 1
\end{aligned}\tag{1.2}
$$

And the other 2 conditions to satisfy is: 

* Continuity on the domain $[0, 1]$
* Second derivative is zero on the interval $[0, \bar{x}), (\bar{x}, 1]$. 

We skipp the math and $G(x; \bar{x})$ is given as: 

$$
\begin{aligned}
    G(x; \bar{x}) &= 
    \begin{cases}
        (\bar{x} - 1)x & x \in [0, \bar{x}]
        \\
        \bar{x}(x - 1) & x \in[\bar{x}, 1]
    \end{cases}
    \\
    G(x; \bar{x}) &= 
    \begin{cases}
        (\bar{x} - 1)x & \bar{x} \in [x, 1]
        \\
        \bar{x}(x - 1) & \bar{x} \in [0, x]
    \end{cases} \quad \text{For Integral Representation}
\end{aligned}\tag{1.3}
$$

Which satisfies the property given in expression (1.1)

By linearity, the right hand side could very well be $c\delta(x - \bar{x})$, and the corresponding solution to the Green's Function will be multiplied by $c$ as well. 

To take into the whole Dirichlet boundary conditions, we would need to consider 2 other Green's Function $G_0(x), G_1(x)$ (They are basically delta function on the boundary): 

$$
\begin{aligned}
    G_0''(x)&= 0 \quad G_1''(x) &= 0 \\ 
    G_0(0) &= 1 \quad G_1(0) &= 0\\ 
    G_0(1) &= 0 \quad G_1(1) &= 1
\end{aligned}\tag{1.4}
$$

And in that sense, for any right handside initial distribution function, and BVP with Dirichlet conditions and $\alpha, \beta$ on both end, the solution to the system is given as: 

Then the steady state solution solved by the Greens Function is Given as: 


$$
\begin{aligned}
    u(x) &= \alpha G_0(x) + \beta G_1(x) + \int_{0}^{1} 
        f(\bar{x})G(x; \bar{x})
    d\bar{x}
    \\
    u(x) &= \left(
        \alpha - \int_{0}^{x} 
            \bar{x}f(\bar{x})
        d\bar{x}
    \right)(1 - \bar{x}) + \left(
        \beta + \int_{x}^{1} 
            (\bar{x} - 1)f(\bar{x})
        d\bar{x}
    \right)x
\end{aligned}\tag{1.5}
$$

The second line is just a direct substitution of results from (1.3). 

---
### **Green's Function and the Inverse of the Operator**

Define Quantities: 

$$
\mathcal{A} = \frac{1}{h^2}
\begin{bmatrix}
    h^2& 0 & & & & & \\
    1& -2 & 1& & & & \\
    & 1& -2 &1 & & & \\
    & & \ddots &\ddots  &\ddots  & & \\
    & & &1  &-2  &1 & \\
    & & & &1 & -1 & 1
\end{bmatrix} \quad 
u = \begin{bmatrix}
u_0 \\ u_1 \\  \vdots \\ u_{m - 1} \\ u_{m} \\ u_{m + 1}
\end{bmatrix} \quad f = \begin{bmatrix}
    \alpha  \\ f(x_1) \\ f(x_2) \\ \vdots \\ f(x_{m -1}) \\ f(x_m) \\ \beta
\end{bmatrix}\tag{2.1}
$$

The system we trying to approximate is $u'' = f$. **Note**: This is a reformulation of the original problem, this is needed so that the boundary conditions are separated from the inerior of the grid. Now the system has the size of $(m + 2)\times (m + 2)$. 

Let $B$ be the inverse of Matrix $A$. We wish to prove the the matrix is having an infinity norm bounded by: $\mathcal{O}(h^2)$. 

$\mathcal{A}B = I$, this would imply $\mathcal{A}(B)_{:, j} = e_j$, the $j$th column of the matrix $B$ is an approximation to the system $u''(x) = h\delta(x - x_j)$ for the 1D discretizations. **At this point, take it for granted that**: 

> $$
> \begin{aligned}
>     & B_{i, 0}  = G_0(x_j) = 1 - x_i \quad \text{Boundary}\\
>     & B_{i, m + 1} = G_1(x_i) = x_i \\
>     B_{i,j} = hG(x_i; x_j) = 
>     & \begin{cases} 
>         h(x_j - 1)x_i & i = 1, 2, \cdots j
>         \\
>         h(x_i - 1)x_j & i = j, j + 1, \cdots m
>         \\
>         0 & i = 0, i = m + 1
>     \end{cases} \quad \text{Interior}
> \end{aligned}\tag{2.2}
> $$

**Take note that:** 

The delta functions on the RHS are weighted by $h$, we are approximating $f(x)$ discretely using $\sum_{j=0}^{m + 1}hf(x)\delta(x- x_j)$, intuitively, we want the mass at each point to be proportional to the width of the grid: $h$. This is needed so that the total volumn of the solution approximated $f(x)$ is approaching a limit instead of blowing up to infinity. 

**Take note that:** 

The greens function the models the solution for the interior grid points have value 0 on the boundary, corresponding to the first and last row of the matrix $B$. This is needed to prevent conflicts with the boundary greens function $G_0(x), G_1(x)$. 

**Observe that:**

The conditions of $i = 1, 2\cdots j$ and $i = j, j + 1, \cdots m$ can be interpreted as $i \le j$ and $i \ge j$. Which make it more intuitive to understand. 


**Important Question**

> Is there a function such that this approximated system will solve it exactly? 

**Answer** (Take this for Granted)

The function exists and it's: 

$$
v(x) = \alpha(1 - x) + \beta x + h \sum_{j = 1}^{m}f_jG(x; x_j) \tag{2.3}
$$

Then the above inverse $B$ will solve the differential system: 

$$
v''(x) = h \sum_{j = 1}^{m}f(x_j)\delta(x - x_j)
\quad 
v(0) = \alpha, v(1) = \beta \tag{2.4}
$$

Exactly. 

The system $v(x)$ is a linear interpolation of the true underlying solution: $u''=f(x)$. 

---
### **$\Vert B\Vert_{\infty}$ is $\mathcal{O}(h^2)$ as $h\rightarrow 0$**

Recall that $\Vert\cdot \Vert_\infty$ applied to a matrix is the max abs row sum, and in this case, $B$'s Max abs row sum is bounded because $h = 1/(m + 1)$, $x_j = 1/(m + 1)$. 

Then reconsider $1 - x_i, x_i$ for alll $i$, which are bounded. 

To prove **claim 1**, we need to take a look at the interior of the modified system and observe that $\mathcal{A}_{2:m + 1, 2:m + 1} = A$, Where $A$ is the finite difference TST matrix, therefore we need to prove that the abs Sum of rows of the interior points of matrix $A$ in $\mathcal{O}(h^2)$. 

$\tau$ is $\mathcal{O}(h^2)$, And elements in $A^{-1}$ are uniformally bounded by $h$, therefore each element in $A^{-1}\tau$ will be $h^3$ bounded, and because the size of $A$ is $1/h$, $\Vert A^{-1}\tau\Vert$ is $\mathcal{O}(h^2)$. We skip the precise math here fore now. 