[Krylov Subspace](Krylov%20Subspace.md)


----
### **Intro**

This exerp is going to be similar to [Conjugate Gradient with Krylov Subspace](Conjugate%20Gradient%20with%20Krylov%20Subspace.md), but this time we make more concise statements about what we are trying to prove using the procedures for the conjugate gradient. 

We are going to use the objective of the conjugate gradient algorithm to see how it make use of the krylove subspace.

To start, assume that: 

$$
\begin{aligned}
    x_k \in& x_0 + \text{span}\{A^jr_0\}_{i = 0}^{k - 1}
    \\
    \in& x_0 + \mathcal{K}_k(r_0)w \quad w \in \mathbb{R}^k
\end{aligned}
$$

We are saying that the $k$ th guess of the solution comes from the affine subspace involving krylove subspace that is initialized by $r_0$.

Now, using the objective of the conjugate gradient, which minimizes the energy norm of the error vector, we have: 

$$
\begin{aligned}
    & \min_{w} \Vert e_k\Vert_A^2
    \\
    &= \min_{w} \Vert x^+ - x_k\Vert_A^2
    \\
    &= 
    \min_w \Vert 
        x^+ - x_0 - \mathcal{K}_k(r_0)w
    \Vert_A^2
    \\
    &= \min_{w}
    \Vert 
        e_0 - \mathcal{K}_k(r_0) w
    \Vert_A^2
    \\
    &= 
    \min_w \Vert e_0 - \mathcal{K}_k(Ae_0)w\Vert_A^2
\end{aligned}
$$

To minimize, we need to project $Ae_0$ onto $A\mathcal{K}_k(Ae_0)$, which is basically saying: $r_k\perp \mathcal{K}_k(r_0)$. (I moved the $A$ so that it acts on $e_0$, giving $r_0$). This is exactly what the conjugate gradient algorithm is going to do, it optimize the value of $w$, to assert the orthogonality of residuals against the transformed Krylov Subspace. 


