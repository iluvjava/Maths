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

The step-size into the direction and the conjugatation direction are given as: 

$$
a_k = \frac{\langle r^{(k - 1)}, Ap^{(k - 1)} \rangle}{\langle Ap^{(k - 1)}, Ap^{(k - 1)}\rangle}
\quad 
b_k = \frac{\langle Ar^{(k)}, Ap^{(k - 1)} \rangle}{\langle Ap^{(k - 1)}, Ap^{(k - 1)}\rangle}
$$

