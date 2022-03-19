[[Ortho Min J]]
[[Conjugate Gradient for Dummy]]

---
### **Intro**

Inspired by the process of looking for orthomin J algorithm, I am interested in disoverin some of the properties of the conjugate gradient algorithm from only first principles, in hope to spark more generality for the arguments and reveal potential connections between subspace methods in general.

The conjugate gradient algorithm is usually stated without much explanations as to how it is arrived. Sometimes short justifications where given such as in Greenbaum's work where the algorithm is derived by orthogonalizing residual against the previous residual and conjugate direction, while assuming $p_0 = r_0$. However this is not informative for the underlying reasons of "WHY?", it's stated in a way as if the writer already know there is a short recurrence for the conjugate vectors, instead of naturally leading to that idea (Which of course, a completely separate idea from just the Conjugate Gradient.) Some other time it's stated in such a complicated way that doesn't quiet introduce some big ideas correlated to the algorithm itself, such as: [Conjugate Gradient Without Agonizing Pain](https://sites.math.washington.edu/~morrow/498_13/conjgrad.pdf) where it explains all the magic, but somewhat uninspiring.

The goal of this exerpt is to discover it in a similar manner to the Ortho Min J by only first principle without any preconception of what conjugate gradient is, except for the fact that, it minimizes something. During the exploration, we use Content from [[Taxonomy and Frameworks of Subspace Projection Method]], and [[Projector]]. 

**The Objective of the Algorithm**

Introduce the algorithm as an attempt to minimize the energy norm of the error for a linear equation $Ax = b$, here we make the assumptions: 
* the matrix $A$ is symmetric semi-positive definite.  
* Further assume another matrix $P_k = [p_0 \;p_1\;\cdots p_{k-1}]$ as a matrix whose columns is a basis.

$$
\min_{w \in \mathbb{R}^k}\Vert 
    A^{-1}b - (x_0 + P_kw)
\Vert_A^2 \iff P^T_kr_0 = P_k^TAP_kw
$$

And using the matrix form for the Galerkin Condition where $W, V$ are both $P_k$, we have this orthgonality formulations: 

$$
\text{choose: }x \in x_0 + \text{span}(P_k) \text{ s.t: } b - Ax \perp \text{span}(P_k)
$$

Take note that this doesn't garantee to happen, for example the FOM and Bi-Lanczos Method are orthogonalizations method that doesn't directly link to a norm minimization objective. 

**A Orthogonal Vector**

To solve for $w$, we wish to make $P_k^TAP_k$ to be an easy to solve matrix. Let the easy to solve matrix to be a diagonal matrx and hence we let $P_k$ to be a matrix whose columns are A-Orthogonal vectors. 

$$
\begin{aligned}
    P^T_kAP_k &= D_k \text{ where: } (D_k)_{i,i} = \langle p_{i - 1}, Ap_{i - 1}\rangle
    \\
    P_kr_0 &= P^T_kAP_kw = D_kw
    \\
    w &= D^{-1}_kP_k^Tr_0
\end{aligned}
$$

Here, we make the assumption that the algorithm is: 

> Accumulating vectors $p_j$ into the matrix $P_k$ and then iterative improve the solution $x_k$, by reducing the error denote as $e_k$ which is defined as $A^{-1}b - x_k$. 

Then, we can derive the following expression for the solution at step k $x_k$ and the residual at step $r_k = b - Ax_k$ for the algorithm: 

$$
\begin{cases}
    x_k = x_0 + P_kD^{-1}_kP^T_kr_0
    \\
    r_k = r_0 - AP_kD^{-1}_kP^T_k r_0
    \\
    P^T_kAP_k = D_k
\end{cases}
$$





