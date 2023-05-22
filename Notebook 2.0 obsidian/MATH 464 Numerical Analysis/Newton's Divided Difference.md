[Neville's Method](Neville's%20Method.md)


---
### **Intro**

Newton's divided differences method is another recurrence relations on the Lagrange Interpolating polynomials, and it can be implemented relatively easily as well. 


### **Interpolation Polynomials**

The formula is compactly written as: 

$$
\begin{aligned}
    &
    P(x | x_0, \cdots, x_n) = 
    f[x_0] + \sum_{k = 1}^{n} f[x_0,\cdots, x_k]\prod_{i = 0}^{k-1}
    (x - x_i)
    \\
    & \text{Divided Diff Recurrence}
    \\
    &
    f[x_i, \cdots, x_{i + k}] = 
    \frac{f[x_{i + 1}, \cdots, x_{i + k}] - f[x_{i}, \cdots, x_{i + k -1}]}{x_{i + k} - x_i}. 
\end{aligned}
$$

---
### **Examples**

We expect to get back the exact polynomials if we apply the formula to a polynomials, at distinct points.

