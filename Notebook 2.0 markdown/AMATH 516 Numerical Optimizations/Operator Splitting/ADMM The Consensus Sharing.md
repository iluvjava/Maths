[Introduction ADMM](../Proximal%20Methods/Introduction%20ADMM.md)

---
### **Intro**

ADMM algorithm gives amazing advantange for parallel implementations whenever we have a sum of more than one closed and convex functions. Consider the following convex optimizations problems: 

$$
\begin{aligned}
    \min_{x, z}
    \left\lbrace
        \left.
        \sum_{i = 1}^{N} f_i(x_i)
        \right|
        x_i = z \; \forall i \in [N]
    \right\rbrace
\end{aligned}
$$

where $x$ is a block vector where $x = [x_1^T \; x_2^T\; \cdots x_N^T]^T$, where all $x_i\in \mathbb R^n\; \forall i \in [m]$, so that $x\in \mathbb R^{nN}$. Such a problem can also be viewed as looking for the zero sets of a sum of all the subgradient of these functions. Next, the ADMM augmented Lagrangian suggests that

$$
\begin{aligned}
    \mathcal L_\rho(x, z, y) :=& 
    \sum_{i = 1}^{N}f_i(x_i) + \langle y_i, x_i - z\rangle
    +  \frac{\rho}{2}\Vert x_i - z\Vert^2
    \\
    = &
    \sum_{i = 1}^{N}f_i(x_i) + 
    \langle y_i, x_i - z\rangle + \frac{\rho}{2}
    \left(
        \Vert x_i - z + \rho^{-1}y_i \Vert^2 - 
        \Vert \rho^{-1}y_i\Vert^2
    \right), 
\end{aligned}
$$
take note that the vector $z, y$ are all block vectors, of the exact same format. Finally, it gives us an update sequence for the ADMM algorithm given as: 

$$
\begin{aligned}
    x^{(k + 1)} &= \underset{x}{\text{argmin}}\mathcal L_\rho(x, z^{(k)}, y^{(k)}) =
    \bigotimes_{i = 1}^N \text{prox}_{f_i/\rho}\left(
        z^{(k)}  - \rho^{-1}y_i^{(k)}
    \right)
    \\
    z^{(k + 1)}&= 
    \frac{1}{N}\sum_{i = 1}^{N}
        x_i^{(k + 1)} + \rho^{-1}y_i^{(k)}
    \\ 
    y_i^{(k + 1)} &= 
    y_i^{(k)} + \rho\left(
        z^{(k + 1)} - z^{(k + 1)}
    \right), 
\end{aligned}
$$

the second step is easily parallelizable, it's just the average, simply given as: $z^{(k + 1)} = \bar x^{(k + 1)} + \rho^{-1}\bar y^{(k)}_i$, the bar denotes the sample average for all $x_i, y_i\; \forall i \in [N]$.Note, the $\bigotimes$ is the euclidean cross product, and we made use of the parallel product property for proximal operator introduced at the end of [Moreau Envelope and Proximal Mapping](../Proximal%20Operator/Moreau%20Envelope%20and%20Proximal%20Mapping.md). 

**Clarifying the average polling**

Take note that, the average of a list of vector is also an projection onto the range of a certain matrix, and it's also the minimizer of a square distance to a linear subspace. Recall that, the projection of $b$ onto $\text{ran}(A)$ is the solution to $\underset{x}{\text{argmin}}\Vert b - Ax\Vert^2_2$, which is also solution to the problem $\arg\min_{x\in \text{ran}(A)}||x - b||^2$. It has the close form solution of $b - A^T(AA^T)^{\dagger}Ab$, which is also a form of [Projector](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Projector.md). 

In the case of average polling, the constraint is commonly described as $\{(x_1, x_2, \cdots, x_N)| x_1 = x_2 = \cdots = x_N\}$, which is the range of the matrix $\mathbf 1_N \otimes I_n$ ($\otimes$ here is the Kronecker Product), and the projection of any block vector $(y_1, \cdots, y_N)$ on to the set will be the average of all the blocks $y_i, \; i \in [N]$.

**References**: 

The ADMM monograph by Boyd from Stanford University. 

