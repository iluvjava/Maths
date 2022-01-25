[wiki link](https://en.wikipedia.org/wiki/Richardson_extrapolation)

[[Finite Difference]]

---
### **Intro**

It's used for sequence accelerations, where we have information for the power series for the sequence, here we use for deriving finite difference formulas for derivatives. 

The goal is to accelerate the sequence: $A(h)$, where $\lim_{h\rightarrow 0}A(h) = 0$, and $A(h)$ commits a power series representation. We will use a linear combinations of $A(h_i)$ evaluated at some points to accelerate the convergence of the power series. 

---
### **General Formula**

Suppose that the exact function $A^{+}$ is approximated by a function $A(h)$. 

> $$
>   A^+ = A(h) + a_0h^{k_0} + a_1 h^{k_1} + a_2 h^{k_2} \cdots 
> $$
> Where $a_0, a_1, \cdots \neq 0$ and $k_0 < k_1 < k_2 \cdots$ and they are positive integers. 

Consider: 

$$
\begin{aligned}
    A^+ &= A(h) + a_0h^{k_0} + \mathcal{O}(h^{k_1})
    \\
    A^+ &= A(h/t) + a_0\frac{h^{k_0}}{t^{k_0}}  + \mathcal{O}(h^{k_1})
    \\
    (t^{k_0} - 1)A^+ &= t^{k_0}A\left(
        \frac{h}{t}
    \right)^{k_0} - A(h) + (t^{k_0} - 1)\mathcal{O}(h^{k_1}) 
    \\
    A^{+} &= \frac{
        t^{k_0}A\left(
            \frac{h}{t}
        \right)^{k_0} - A(h)
    }{
        t^{k_0} - 1
    } + \mathcal{O}(h^{k_1})
\end{aligned}
$$

Observe that, the new approximation involving a linear combinatons of $A(h/t), A(h)$ has improved the error of the approximation for $A^+$, because $\mathcal{O}(h^{k_1})$ is better better than $\mathcal{O}(h^{k_0})$. 

---
### **Finite Difference Applications**

We can use richardson extrapolation and talor series to approximate the second derivative to a certain degree of accuracy. 




