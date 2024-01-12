[Proximal Gradient, Forward Backwards Envelope](../Proximal%20Methods/Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)


---
### **Intro**

We give examples for proximal gradient operator of simple cases of $f$. 
They are the building blocks of more complicated cases of proximal mapping. 
Read the above prereq for formulas and known calculus rule for proximal mappings. 

**References**: 

The book \<First Order Optimizations\>, Amir's book. 


---
### **L1 Regularization**


Let $f = \Vert \cdot\Vert_1: \mathbb R^n \mapsto \mathbb R$, we want to solve for 
$$
\begin{aligned}
    \underset{t\lambda f}{\text{prox}}(y)
    &= 
    \underset{x \in \mathbb R^n}{\text{argmin}}
    \left\lbrace
        \frac{1}{2}\Vert x - y\Vert + \lambda\Vert x\Vert_1
    \right\rbrace
\end{aligned}
$$
And the proximal operator is the famoust soft thresholding mapping $\text{sign}(y)\max(y - \lambda t, 0)$, the operation is applied element wise to the vector $y$. 
Additionally, we have $\text{sign}(\alpha)$ where it maps positive, negative $\alpha$ number to $1, -1$ and to zero, if the number is zero. 


#### **Demonstration**
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

We need to solve for each element of $x_i$, and will need to discuss them by cases because $|x_i|$ is not smooth. Assuming that $x_i \neq 0$, then: 

$$
\begin{aligned}
    \partial\left[
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

Take a specfic element of $x_i$, it would only be determined by $y_i$, in which case it's an element-wise operation where the operation for each $y_i$ is given by 

$$
\left(\underset{t\lambda f}{\text{prox}}(y)\right)_i = 

\begin{cases}
    y_i - \lambda t  & y_i \ge \lambda t
    \\
    y_i + \lambda t & y_i \le -\lambda t
    \\
    0 & y_i \in [-t \lambda, t\lambda]
\end{cases}
$$

And it's not hard to realize that the above expression would be equivalent to $\text{sign}(y_i)\max(|y_i| - \lambda t, 0)$. 
The reader should verify this. 
Finally, broadcasting the function to the whole array of $y$ would yield the proximal operator. 

**Remarks**

A simpler form is listed [here](https://math.stackexchange.com/questions/1961888/the-proximal-operator-of-the-l-1-norm-function), the prox operator supper the one norm on a complex vector too. 


---
### **Box Constrained**

The box constraint is defined by the region $[l_i, u_i]\; \forall 1 \le i \le n$, for each of the variable $x_i$. 
Projecting onto a single interval for $y_i$ just $\min(\max(y_i, l_i), u_i)$. 
Apply that for $1\le i \le n$ will work, this is by the parallel property of the proximal operator, so we have

$$
\begin{aligned}
    \text{prox}_{\text{Box}[l, u]}(y) = \min(\max(y, l), u). 
\end{aligned}
$$

### **Projection on to Hyper Plane Box Intersections**

**Remarks**

See theorem 6.27, Amir Beck First Order method textbook. 

---
### **Projection onto Probability Simplex**




---
### **Example 6.16 in Beck's Textbook**! 



---
### **Example 6.17 In Beck's Textbook**! 


---
### **Cheatsheet**
[Amir's Prox Cheatsheet](../References/Amir's%20Prox%20Cheatsheet.pdf)


