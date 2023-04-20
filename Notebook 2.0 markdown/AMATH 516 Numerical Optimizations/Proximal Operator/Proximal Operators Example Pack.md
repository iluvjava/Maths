prereq: [Proximal Gradient via Forward Backwards Envelope](../Proximal%20Methods/Proximal%20Gradient%20via%20Forward%20Backwards%20Envelope.md)


---
### **Intro**

There are a lot of things we can do with proximal gradient descend: 
1. Non-smooth
2. Constraint optimization with indicator function


In the case of non-smooth function, regularization and simple constrained optimization that has a closed form proximal solution are the interesting one. 

**References**: 

The book \<First Order Optimizations\>, Amir's book. 


---
### **L1 Regularization**

The proximal solution for the non-smooth part is the same as this problem: 
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

Where $\bullet$ saying that, the function has been vectorized on each element of the input vector. Up to this point, we have solved the proximal operator for all of the L1 Norm Regularized regression problem. 

**Remarks**

A simpler form is listed [here](https://math.stackexchange.com/questions/1961888/the-proximal-operator-of-the-l-1-norm-function), the prox operator supper the one norm on a complex vector too. 


---
### **Box Constrained**

Suppose that the box constraint is defined by $[l_i, u_i]\; \forall 1 \le i \le n$, for each of the variable $x_i$. Notice that projecting onto a single interval for $y_i$ just $\min(\max(y_i, l_i), u_i)$. Just apply this for $1\le i \le n$ will work, this is by the parallel property of the proximal operator. 


---
### **Example 6.16 in Beck's Textbook**! 



---
### **Example 6.17 In Beck's Textbook**! 


---
### **Cheatsheet**
[Amir's Prox Cheatsheet](../References/Amir's%20Prox%20Cheatsheet.pdf)


