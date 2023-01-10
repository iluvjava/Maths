[[Introduction ADMM]]

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
    \sum_{i = 1}^{N}f_i(x_i) + \langle y_i, x_i - z\rangle \frac{\rho}{2}
    + \Vert x_i - z\Vert^2
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
    z^{(k + 1)}_i&= 
    \frac{1}{N}\sum_{i = 1}^{N}
        x_i^{(k + 1)} + \rho^{-1}y_i^{(k)}
    \quad \forall i \in [N]
    \\ 
    y_i^{(k + 1)} &= 
    y_i^{(k)} + \rho\left(
        z_i^{(k + 1)} - z^{(k + 1)}
    \right), 
\end{aligned}
$$

the second step is easily parallelizable, it's just the average, simply given as: $z^{(k + 1)} = \bar x^{(k + 1)} + \rho^{-1}\bar y^{(k)}_i$, the bar denotes the sample average for all $x_i, y_i\; \forall i \in [N]$.Note, the $\bigotimes$ is the euclidean cross product. 

**References**: 

The ADMM monograph by bloyd from Stanford University. 

---
### **Example: Parallel Dykstra**

A special case of the Parallel ADMM make use of the equivalence between limiting ADMM with inertia and Dykstra algorithm. For more information, see [[Dykstra Via ADMM]] for more details. This is also shown in Tibshirani's paper about the links between Dykstra and Coordinate descent algorithms. 


