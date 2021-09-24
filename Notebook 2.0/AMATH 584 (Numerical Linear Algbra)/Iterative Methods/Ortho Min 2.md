[[Ortho Min]], [[Conjugate Gradient]]

This algorithm is just a special cause of the Conjugate Gradient. 

---
### **Intro**
The connection between steepest gradient and conjugate gradient is this algorithm. An algorithm that is made to minimize matrices that are symmetric but not necessarily positive definite. 

It's recommended to see the first formulations of the conjugate gradient to get some basic ideas for the connections between this algorithm and other algorithms. 

As its name suggest, the Ortho Min 2 algorithm will be orthogonalizing the residual at each step by 2 directions instead of one direction. 

### **Ortho Min (2)**

**The basic quantities are:**

$$
e^{(k)} = x^+ - x^{(k)} \quad r^{(k)} = b - Ax^{(k)} = r^{(k - 1)} + a_{k- 1}Ar^{(k - 1)}
$$

$$
p^{(k)} = r^{(k)} - b_{k - 1}p{(k - 1)}
$$


The step-size into the direction and the conjugatation direction are given as: 

$$
a_k = \frac{\langle r^{(k - 1)}, Ap^{(k - 1)} \rangle}{\langle Ap^{(k - 1)}, Ap^{(k - 1)}\rangle}
\quad 
b_k = \frac{\langle Ar^{(k)}, Ap^{(k - 1)} \rangle}{\langle Ap^{(k - 1)}, Ap^{(k - 1)}\rangle}
$$

And the algorithm is stated as: 

$$
\begin{aligned}
    & x^{(k)} = x^{(k - 1)} + a_{k - 1}p^{(k - 1)}
    \\
    & r^{(k)} = r^{(k - 1)} - a_{k - 1}Ap^{(k - 1)}
    \\
    & p^{(k)} = r^{(k)} - b_{k - 1}p^{(k - 1)}
\end{aligned}
$$

The algorithm seeks to assert the invariants: 

$$
\begin{cases}
    r^{(k + 1)} =r^{(k)} + a_kA(r^{(k)} - b_{k - 1}p^{(k - 1)})
    \\
    x^{(k + 1)} = x^{(k)} + a_k p^{(k - 1)}
\end{cases}\tag{1}
$$


---
### **Subspace Project Frameworks**

Yosef Saad highlithed a frameworks for a series of iterativeoptimization methods for solving linear system. Here is the taxonomy of the framework: 

> $$
> \text{Find } \tilde{x} \in \mathcal{K} : b - A\tilde{x} \perp \mathcal{L} 
> $$

Where $\mathcal{K}, \mathcal{L}$ are subspaces. That is. This algorithm fits this frameworks for the following ways: 

$$
\begin{aligned}
    & x^{(k + 1)} \in  x^{(k)} + \text{span}\{p^{(k)}\}
    \\
    & r^{(k + 1)} \perp \text{span}\{
            Ar^{(k)}, Ap^{(k - 1)}
        \}
    \\
    & p^{(k)} \in r^{(k)} + \text{span}(p^{(k - 1)})
    \\
    & p^{(k)} \perp \text{span}\{Ap^{(k - 1)}\}
\end{aligned}
$$

You can verify that solving the above problem gives the coefficients for the algorithm during the iterations. 



