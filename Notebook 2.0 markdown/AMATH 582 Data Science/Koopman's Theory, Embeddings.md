[Dynamic Mode Decomposition](Dynamic%20Mode%20Decomposition.md)
Reference Lecture: [link](https://www.youtube.com/watch?v=9jZ2MsLnl0U)

We are still thinking about linear and non-linear dynamical system. 

---
### **Intro**: 
$$
\frac{dx}{dt} = f(x, t, \mu)
$$

Previous we have 

$$
X = \begin{bmatrix}
    x_1 & x_2 & \cdots & x_m
\end{bmatrix}
\rightarrow
\frac{dx}{dt} \approx Ax
$$

**Koopman Theory: 1931**

Let's assume that: $y = g(x)$, and in general, let's assume that $g(x_{k +1}) = Kg(x_k)$. Where $K$ is linear operator. So, given any dynamical system, we can find a way to remap variable in such a way that, the same system can be expressed by the new variables in a linear system. 

This can also be viewed as a changed of the coordinate system. So there is a right coordinate system for the non-linear system such that, we can have linear dynamics under the new coordinate system. 


---
### **Example**: 

Here is my Non-linear system: 

$$
\begin{cases}
    x_1' = \mu x_1
    \\
    x_2' = \lambda(x_2 - x_1^2)
\end{cases}
$$

Consider a transformation that is kinda arbitrary: 

$$
\begin{cases}
    y_1 = x_1 \implies y_1' = x_1' =\mu x_1
    \\
    y_2 = x_2 \implies y_2'' = x_2' = \lambda(x_2 - y_3)
    \\
    y_3 = x_1^2 \implies y_3' = 2x_1x_1' = 2\mu x_1^2 = 2\mu y_3
\end{cases}
$$

Then it can be said that: 

$$
\begin{bmatrix}
y_1 \\ y_2 \\ y_3
\end{bmatrix}'
=
\begin{bmatrix}
    \mu & 0 & 0 \\
    0 & \lambda & -\lambda \\
    0 & 0& 2\mu
\end{bmatrix}
\begin{bmatrix}
    y_1 \\ y_2 \\ y_3
\end{bmatrix}
$$

By choosing just polynomials, we are able to reduce a non-linear system to a linear one. However, notice that information is lost in a sense, because $y_3 = \pm x_1$. In addition, consider the number of fixed points in the system. 

There are one fixed point for the reduced linear system, but there should be 2 for the non-linear system. 

If there are N fixed points, then we should get $N$ koopman embedding for the system. 

---
### **Non-Closure Examples**: 

In general, the substitution might ber infinite. This is often the case, for examples: 

$$
\begin{cases}
    x_1 ' = \mu x_1 
    \\
    x_2' = \lambda (x_2^2 - x_1)
\end{cases}
$$

---
### **Relations to DMD and Actions in Practice**

**DMD is an approximation to the Coopman Operator**. Expanding the basis can help the algorithm to look for linear relations between the basis chosen. 

Consider the non-linear Schodinger equation: 

$$
i u_t + \frac{1}{2}u_{xx} + |u|^2u = 0
$$

Well, we can get DMD of the system, and see what kind of Eigenvalues it consists of. 

In this case, it should have periodic value, giving us purely imaginary eigenvalues. 

Then we can choose to transform the state variable to introduced non-linearity for the DMD. 


