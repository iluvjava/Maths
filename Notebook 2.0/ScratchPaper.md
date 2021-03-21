## HW 9

### **Coding Problem 1**

Given ODEs system: 
$$
\begin{cases}
    v' &= v - \frac{1}{3}v^3 - \omega + I(t)
    \\[1em]
    \omega' &= \frac{a + v - b\omega}{\tau}
    \\[1em]
    I(t) &= \frac{1}{10}\left(
        5 +\sin\left(
            \frac{\pi t}{10}
        \right)
    \right)
\end{cases}
$$

And the parameters are set to be: 

$$
a = 0.7, b = 1, \tau = 12
$$

And the initial condition is: 
$$
v(0) = 1 \quad \omega (0) = 0
$$

#### **The RK2 Method**
$$
x_{k + 1} = x_k + \Delta t f\left(
    t_k + \frac{\Delta t}{2}, x_k + \frac{\Delta t}{2}f(t_k, x_k)
\right)
$$

And this is the iterative formula for the RK23 scheme. 

#### **The RK4 Method**

Define he following quantities: 

$$
\begin{cases}
    f_1 &= f(t_k, x_k) 
    \\
    f_2 &= f
    \left(
        t_k + \frac{\Delta t}{2}, x_k + \frac{\Delta t}{2}f_1
    \right)
    \\
    f_3 &= f\left(
        t_k + \frac{\Delta t}{2}, x_k + \frac{\Delta t}{2}f_2
    \right)
    \\
    f_4 &= f\left(
        t_k + \Delta t, x_k + f_3
    \right)
\end{cases}
$$

And the iterative formula is given by

$$
x_{k + 1} = x_k + \frac{\Delta t}{6}\left(
    f_1 + 2f_2 + 2f_3 + f_4
\right)
$$

And this is the RK4 scheme. 

### **Coding Problem 2**

Here we are interested in solving the boundary value problem. 

$$
x'' + x = 5\cos(4t) \quad x(0) = 1 \quad x(6) = 0.5
$$

Assume that $\Delta t$ is given for this problem. 

This is a direct solve with matrix, involving the boundary conditions. But we only need to model the interior points. Let all the points in the grid, including the boundary be denoted by $0, 1, \cdots, N$, then: 

Consider the boundary point, x_0, we will have:

$$
\frac{x_2 - 2x_1 + x_0}{\Delta t^2} + x_1 = 5\cos(0)
$$

Where we use the notation: $x_t := x(t)$. 

Notice that, we can move the boundary points from the left to the right, and left with a system that is only relevant to $x_1, x_2$, which finally gives us: 

$$
\frac{x_2 - 2x_1}{\Delta t^2} + x_1 = 5\cos(0) - \frac{x_0}{\Delta t^2}
$$

And on the other side of the boundary we will have t he expression: 

$$
\frac{x_{N} - 2x_{N - 1} + x_{N - 2}}{\Delta t^2} = 5\cos(6) \implies 
\frac{- 2x_{N - 1} + x_{N - 2}}{\Delta t^2} = - \frac{x_{N}}{\Delta t^2} + \cos(4\times 6)
$$

And these 2 expression will determine what is going to be on the $b$ vector and the interior of the $A$ matrix. 

These matrix on the LHS are $N - 1 \times N -1$

$$
\frac{1}{\Delta t^2}
\begin{bmatrix}
    -2 &1  & & &\\ 
    1 & -2 & 1& &\\
    & 1& -2& 1 &\\
    & &\ddots & &  
    \\
    & & 1& -2& 1
\end{bmatrix}
+ I 
$$


### **Written HW**

Reduction of the second order equation into a first order 2 variables system of equations. 

$$
\theta'' + b \theta' + a\theta = 0
$$

$$
y := \theta' \quad \theta := \theta
$$

$$
\begin{bmatrix}
    \theta \\ y
\end{bmatrix}' = 
\begin{bmatrix}
    \theta' \\ y'
\end{bmatrix}
=
\begin{bmatrix}
    \theta' \\ \theta''
\end{bmatrix}
=\begin{bmatrix}
    y \\ - by - a\theta
\end{bmatrix}
=
\underbrace{
\begin{bmatrix}
0 & 1 \\ - a & - b
\end{bmatrix}}_{A}
\begin{bmatrix}
\theta \\ y
\end{bmatrix}
$$

$$
x' = f(t, x) = Ax
$$