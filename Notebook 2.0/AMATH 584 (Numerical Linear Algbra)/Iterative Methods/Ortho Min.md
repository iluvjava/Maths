[[Steepest Descend for Matrix Vector]], [[Iterative Method]]

Ortho Min stands for: Orthogonal minimizations. 

We based discussions here on Green Baum's work. 
[[Fields of Values]]: This is needed for the convergence analysis of the algorithm. 

---
### **Intro**

> The term OrthoMin is created by prof Greene Baum for the discussion for a class of iterative method. It seems to be an important idea and it's the stem for generalizing the idea into other type of algorithms. 

We will be introducing another view on the steepest descend method for linear system. 

Recall the brain dead method for minimizing the residual for a given matrix that is diagonally dominant, this is like: 

$$
x^{(k + 1)} = x^{(k)} + M^{-1}(b - Ax^{(k)})
$$

Where $M^{-1}\approx A^{-1}$, for example, consider $M = L$ where $L$ is the lower triangular part of matrix $A$, including the diagonal; giving us: 

$$
\begin{aligned}
    x^{(k + 1)}=& x^{(k)} + L^{-1}(b - (L + U)x^{(k)})
    \\
    =& x^{(k)} + L^{-1}b - (I + L^{-1}U)x^{(k)}
    \\
    =& L^{-1}b - L^{-1}Ux^{(k)}
    \\
    =& L^{-1}(b - Ux^{(k)})
\end{aligned}
$$

We had recovered the Gauss Seidel Iterations here. 

---
### **Steepest Descend**

Replacing $M^{-1}$ to be a scalar that we can tweak at our will, we have: 

$$
\begin{aligned}
    x^{(k + 1)} =& x^{(k)} - a_k(b - Ax^{(k)})
    \\
    x^+ - x^{(k + 1)} =& x^+ - x^{(k)} - a_kr^{(k)}
    \\
    r ^{(k + 1)} =& r^{(k)} - a_k Ar^{(k)}
    \\
    a_k =& \arg\min_y \Vert
        r^{(k)} - yAr^{(k)}
    \Vert_2^2
    \\
    a_k =& \frac{\langle r^{(k)}, Ar^{(k)} \rangle}{\langle Ar^{(k)}, Ar^{(k)} \rangle}
\end{aligned}\tag{1}
$$

**Claim 1**

> Stepping in direction of $Ar^{(k)}$ such that it minimizes the next residual (Equivalently, projecting current residual onto $Ar^{(k)}$ orthogonally), will decrease the 2-norm of the residual monotonically. 

**Proof**

Consider: 

$$
\left\Vert
    r^{(k + 1)}
\right\Vert^2 = 
\left\Vert
    r^{(k)}
\right\Vert^2 + |a_k| \left\Vert
     Ar^{(k)}
\right\Vert^2 - 
2\langle r^{(k)}, a_k Ar^{(k)} \rangle
\tag{2}
$$

Let's take a closer look at 2 of these quantities: 

$$
\begin{aligned}
    a_k Ar^{(k)} = &
        \frac{\langle r^{(k)}, Ar^{(k)} \rangle}{\langle Ar^{(k)}, Ar^{(k)}\rangle} Ar^{(k)}
    \\
    \implies 
    \left\Vert
         a_k Ar^{(k)}
    \right\Vert^2 &= 
    
    \left|\frac{\langle r^{(k)}, Ar^{(k)} \rangle}{\langle Ar^{(k)}, Ar^{(k)}\rangle}\right|^2 \left\Vert
         Ar^{(k)}
    \right\Vert^2
    \\
    &= \frac{\left|\langle r^{(k)}, Ar^{(k)} \rangle\right|^2}
    {
        \left\Vert
             Ar^{(k)}
        \right\Vert^2
    }
\end{aligned}\tag{3}
$$

**Observe**: 

Absolute value is needed, we are assuming it for complex number as well. 

Let's consider this quantity as well: 

$$
\begin{aligned}
    & a_k \langle r^{(k)}, Ar^{(k)} \rangle \\
    =& 
    \left(
        \frac{\langle r^{(k)}, Ar^{(k)} \rangle}{\langle Ar^{(k)}, Ar^{(k)}\rangle}
    \right)\langle r^{(k)}, Ar^{(k)} \rangle
    \\
     =& \frac{\left|\langle r^{(k)}, Ar^{(k)} \rangle\right|^2}{\left\Vert
        Ar^{(k)}
    \right\Vert}
\end{aligned}\tag{4}
$$

Subsitutue (4), (3) into (2) we have: 

$$
\begin{aligned}
    \left\Vert
         r^{(k + 1)}
    \right\Vert^2 
    & = 
    \left\Vert
         r^{(k)}
    \right\Vert^2 - 
    \frac{|\langle r^{(k)}, Ar^{(k)} \rangle|^2}
    {
        \left\Vert
            Ar^{(k)}
        \right\Vert^2
    }
    \\
    \left\Vert
         r^{(k + 1)}
    \right\Vert^2 
    &= \left\Vert
         r^{(k)}
    \right\Vert^2
    \left(
        1 - 
        \left|
            \frac{\langle r^{(k)}, Ar^{(k)} \rangle}{\langle r^{(k)}, r^{(k)} \rangle}
        \right|^2
        \left(
            \frac{\left\Vert
                 r^{(k)}
            \right\Vert}{\left\Vert
                 Ar^{(k)}
            \right\Vert}
        \right)^2
    \right)
\end{aligned}\tag{5}
$$

The multiplier for $r^{(k)}$ is less than one (if zero is not in the field of value of $A$), causing the iterations for $r^{(k + 1)}$ to be monotonically decreasing during the iterations. 

> This formulations is also the the same as using steepest gradient descent to optimize the objective $x^TAx - b^Tx$. 

Refer to the header on relevant materials and compare the results yourself. 

---
### **The Convergence**

In expression (5), field of values for the matrix $A$ appeared, but with the residual vector. 


$$
\frac{\langle r^{(k)}, Ar^{(k)} \rangle}{\langle r^{(k)}, r^{(k)} \rangle} =
\frac{(r^{(k)})^TAr^{(k)}}{\Vert r^{(k)}\Vert^2}\tag{6} = \mathcal{F}(A)
$$

please also observe that the matrix induced 2-norm is also there, which is basically: 

$$
\frac{\Vert r^{(k)}\Vert^2}{\Vert Ar^{(k)}\Vert^2} = \frac{1}{||A||_2^2}\tag{7}
$$

So then we have that: 

$$
\left\Vert
     r^{(k + 1)}
\right\Vert^2 \le \left(
    1 - \frac{\mathcal{F}(A)^2}{\Vert A\Vert_2^2}
\right)\left\Vert
     r^{(k)}
\right\Vert^2\tag{8}
$$

When, $0\not\in \mathcal{F}(A)$, the right hand size is less than one, giving us strict decreasing of the residual at each step of the iteration. 


> Equation (2.11) in Greenbaum's iterative method is not understood, the value of $\alpha$ and eigen eigenvalues when assuming matrix $A$ is symmetric positive definite. 
 mn