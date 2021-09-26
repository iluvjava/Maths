This file aims to summarize the keys for the taxonomy of iterative method proposed by Yousef Saad in his book \<Iterative Methods for Sparse Linear System\>


---
### **Intro**

The Taxonomy proposed by Yousef Saad is pretty general, and it descibes what subspace projection method does. 


Here is the framework description. 


> Find $\tilde{x} \in x_0 + \mathcal{K} \text{ s.t: } b - A\tilde{x} \perp \mathcal{L}$

Look for an $x$ in the affine linear subspace $\mathcal{K}$ such that it's perpendicular to the subspace $\mathcal{L}$, or, equivalently, minimizing the projection onto the subspace $\mathcal{L}$. 

Let's look into the details a bit: 

$$
\begin{aligned}
    & \tilde{x} \in x^{(0)} + \mathcal{K}
    \\
    \implies & 
    \tilde{x} = x^{0} + \delta x \quad \delta x \in \mathcal{K}
    \\
    \text{Algorithm Asserts: }& 
    b - A\tilde{x} \perp \mathcal{L} \implies b - A(x^{(0)} + \delta x) \perp \mathcal{L}
    \\
    & \langle b - Ax^{(0)} - A\delta x , w\rangle = 0 \quad \forall w \in \mathcal{L}
   \\
    & \langle r_{\text{new}} - A\delta x,w \rangle=0\quad \forall w \in \mathcal{L}
\end{aligned}
$$

---
### **Matrix Representation**

Consider that: 
$$
\begin{aligned}
    V \in \mathbb{C}^{n\times m} \text{ Basis for: }\mathcal{K}
    \\
    W \in \mathbb{C}^{n\times m} \text{Basis for: } \mathcal{L}
\end{aligned}
$$

We let the span of the columns of the matrix $V, W$ be the basis for $\mathcal{K}, \mathcal{L}$, then: 

$$
\begin{aligned}
    \tilde{x} &= x^{(0)} + Vy
    \\
    b - A\tilde{x}  &\perp (\text{span}\leftarrow \text{col})(W)
    \\
    W^T(b - A\tilde{x} - AVy) &= \mathbf{0}
    \\
    W^Tr^{(0)} - W^TAVy&= \mathbf{0}
    \\
    W^TAVy = W^Tr^{(0)}
\end{aligned}
$$

And if we assume that $(W^TAV)$ is invertible, then we obtain the step to take to figure out the next step of the iteration $\tilde{x}$. 

**Prototype Algorithm**

> $$
> \begin{aligned}
>     & \text{While not converging}: 
>     \\&\hspace{1.1em}
>          \begin{aligned}
>             &\text{Seletct: } \mathcal{K, L}
>             \\
>             &\text{Choose: } V, W \text{For} \mathcal{K}, \mathcal{L}
>             \\
>             & r = b - Ax
>             \\
>             & y = (W^TAV)^{-1}W^Tr
>             \\
>             & x = x + Vy
>         \end{aligned}
> \end{aligned}
> $$


Analysis of subspace projections methods should involve discussion of this particular frame works. 
