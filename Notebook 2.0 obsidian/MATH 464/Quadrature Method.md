- [Lagrange Interpolations](Lagrange%20Interpolations.md)


---
### **Intro**

We introduce the Quadrature method and use it to derive the famous Simpson's rule for numerical integrations. The quadrature method is making up some linear functional in a finite dimension to approximate some linear functional in the functional spaces. Consider the definition of: 

$$
\begin{aligned}
    & Q_3[f] : C[a, b] \mapsto \mathbb R := a_1 f(a) + a_2f((a + b)/2) + a_3f(b)
    \\
    & I[f] : C[a, b] \mapsto  \mathbb R := \int_{a}^b f(x)dx, 
\end{aligned}
$$

but $Q_3$ is actually a vector in $\mathbb R^3$, it can be viewed as summing up $[f(a)\; f((a + b)/2)\; f(b)]$, which is a linear transform from the continuous function space to $\mathbb R^3$. To fill in $a_1, a_2, a_3$, we choose some basis function $g_1, g_2, g_3$ (whith is usually just $1, x, x^3$) and solve the system: 

$$
\begin{aligned}
    Q_3[g_1] &= I[g_1] 
    \\
    Q_2[g_2] &= I[g_2]
    \\
    Q_3[g_3] &= I[g_3], 
\end{aligned}
$$

Like that. And when $g_1, g_2, g_3$ are $1, x, x^2$, the quadrature, $Q_3[1], Q_3[x], Q_3[x^2]$ becomes the rows of a vandermonde matrix where $x_1, x_3$ are $a, b$ and $x_2$ are the middle point $(a + b)/2$. We are done here. Solving the linear system yield the Simpson's formula: 

$$
\begin{aligned}
    Q_3[f] = 
    \frac{h}{6}\left(
        f(a) + 4f \left(
            \frac{a + b}{2}
        \right) + f(b)
    \right),
\end{aligned}
$$
However, observe that, we have equality when $f \in P^2[a, b]$, this prompted the following representation for the Quadrature weights in general. We know this is solvable because the LHS can be represented using the Vandermonde matrix, and when $a \neq b$ the vandermonde matrix is an intertible matrix. 

**Quadrature Method**

We define $\{x_i\}_{i = 0}^n$ to be a list of ordered, distinct points in interval $[x_0, x_n]$, let $P_n$ be the Lagrange interpolation polynomial for $f$, let $w$ be an weight function on $[x_0, x_n]$, the weight function is always positive, then

$$
\begin{aligned}
    Q_n[f|w] := I[p_n | w] &= \int_{a}^{b} 
        P_n(x)w(x)
    dx
    \\
    &=\int_{a}^{b} w(x)\sum_{i = 0}^{n}f(x_i) l_i(x) dx
    \\
    &= \sum_{i = 0}^{n}f(x_i) \int_{a}^{b} 
        w(x)l_i(x)
    dx
\end{aligned}
$$

implying that the solution for the Quadrature weight, under some weight function $w$ is given as $a_i = \int_{a}^{b}w(x)l_i(x) dx$ directly. This is in fact, a closed form solution for the above system of equation uisng the Lagrange interpolating polynomials. 

---
### **The Gauss Quadrature Method**

The Gauss quadrature method determines the best choice of the grid points that minimizes the error for the method. 

