- [[../../AMATH 515 Optimization Fundamentals/Gradient Descend/Measuring Rate of Convergence]], 
- [[../Calc/Taylor Series]], 
- [Fixed Point Iterations 1D](Fixed%20Point%20Iterations%201D.md). 

---
### **Intro**

We derive the newton's method for function $\mathbb R \mapsto \mathbb R$ and then show the conditions for which it converges super-linearly. To derive it consider the Tayler expansion of a function $f$. Let $s$ to be the root of the function and expands it at the point $x$. We re-arrange it and solve it for root $s$

$$
\begin{aligned}
    f(s) &= f(x) + f'(x)(x - s) + o(|x - s|^2)
    \\
    0 &= f(x) + f'(x)x - f'(x)s + o(|x - s|^2)
    \\
    f'(x)s &= f(x) + f'(x)x + o(|x - s|^2)
    \\
    s &= f(x)/f'(x) + x + o(|x - s|^2). 
\end{aligned}
$$

Ignoring the error term, we obtain the iterative formula: 

$$
\begin{aligned}
    x_{n + 1} &= x_n + \frac{f(x_n)}{f'(x_n)}. 
\end{aligned}
$$

---
### **Convergence of the Algorithm**

We show that, under certain assumptions, the algorithm indeed converges. We define the mapping $g$

$$
g(x) = x + \frac{f(x)}{f'(x)}. 
$$






