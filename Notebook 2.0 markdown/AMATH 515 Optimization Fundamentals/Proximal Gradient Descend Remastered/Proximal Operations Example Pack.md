prereq: [Introduction to Proximal Gradient](Introduction%20to%20Proximal%20Gradient.md)


---
### **Intro**

There are a lot of things we can do with proximal gradient descend: 
1. Non-smooth
2. Constraint optimization with indicator function


In the case of non-smooth function, regularization and simple constrained optimization that has a closed form proximal solution are the interesting one. 


---
### **L1 Regularization**

The proximal solution for the nonsmooth part is the same as this problem: 
$$
\arg\min_x \left\lbrace
    \frac{1}{2t} \Vert x - y \Vert^2 + \lambda\Vert x\Vert_1
\right\rbrace
$$

Our objective is to solve this. Consider this: 

$$
\begin{aligned}
    x^+=& \arg \min_x \left\lbrace
        \frac{1}{2t} \Vert x - y \Vert^2 + \lambda\Vert x\Vert_1
    \right\rbrace 
    \\
    =& 
    \arg\min_{x_1, x_2 \cdots x_n} \left\lbrace
    \sum_{i = 1}^{n}\left(
            \frac{1}{2t} (x_i - y_i)^2 + \lambda |x_i|
        \right)
    \right\rbrace
    \\
    \implies 
    x^+_i =& \arg\min_{x_i}\left\lbrace
        \frac{1}{2t}(x_i - y_i)^2 + \lambda |x_i|
    \right\rbrace
\end{aligned}
$$

We need to solve for each element of $x_i$, and will need to discuss them by cases because $|x_i|$ is not smooth. 

Assuming that $x_i \neq 0$, then: 

$$
\begin{aligned}
    \bar{\partial}\left[
        \frac{1}{2t}(x_i - y_i)^2 + \lambda |x_i|
    \right] &= 0
    \\
    \frac{1}{t}(x_i - y_i) \pm \lambda &= 0
    \\
    x_i - y_i \pm \lambda t &= 0
    \\
    x_i &= y_i \mp \lambda t
\end{aligned}
$$

Take notice that, when 

$$
\begin{aligned}
    x_i \ge 0 &\implies y_i - \lambda t \ge 0 \implies y_i \ge \lambda t
    \\
    x_i \le 0 &\implies y_i + \lambda t \le 0 \implies y_i \le -\lambda t
\end{aligned}
$$

And if $x_i = 0$, then we will need subgradient, and we have: 



$$
\begin{aligned}
    \partial\left[
        \frac{1}{2t}(x_i - y_i)^2 + \lambda |x_i|
    \right] &\ni 0
    \\
    \frac{1}{t}(x_i - y_i) + [-\lambda, \lambda] &\ni 0
    \\
    x_i - y_i + [-t \lambda, t \lambda] &\ni 0
    \\
     \text{set }x_i &= 0
    \\
    y_i \in [-t \lambda, t\lambda]
\end{aligned}
$$

So basically let: 

$$
f(y) = \begin{cases}
    y - \lambda t  & y \ge \lambda t
    \\
    y + \lambda t & y \le -\lambda t
    \\
    0 & y \in [-t \lambda, t\lambda]
\end{cases}
$$

Then

$$
x^+ = f \bullet(y)
$$

Where $\bullet$ saying that, the function has been vectorized on each element of the input vector. 

up to this point, we have solved the proximal operator for all of the L1 Norm Regularized regression problem. 


---
### **Box Constrained Optimizations**

Proximal gradient can also handle convex constrained optimization, where the constraints are expressed as an indicator function over a convex set. And the proximal operator is projecting points to that convex set. 

The proximal operator for a box constrained optimization problem requires solving: 

