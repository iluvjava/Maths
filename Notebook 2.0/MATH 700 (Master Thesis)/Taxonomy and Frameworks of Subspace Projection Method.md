This file aims to summarize the keys for the taxonomy of iterative method proposed by Yousef Saad in his book \<Iterative Methods for Sparse Linear System\>

---
### **Intro**

The Taxonomy proposed by Yousef Saad is pretty general, and it descibes what subspace projection method does. I think he is referring to the Galerkin Types of Method. 

**Galerkin Frameworks**: 

Here is the framework description. 


> Find $\tilde{x} \in x_0 + \mathcal{K} \text{ s.t: } b - A\tilde{x} \perp \mathcal{L}$

Look for an $x$ in the affine linear subspace $\mathcal{K}$ such that it's perpendicular to the subspace $\mathcal{L}$, or, equivalently, minimizing the projection onto the subspace $\mathcal{L}$. 

Let's look into the details a bit: 

$$
\begin{aligned}
    & \tilde{x} \in x^{(0)} + \mathcal{K}
    \\
    \implies & 
    \tilde{x} = x^{(0)} + \delta x \quad \delta x \in \mathcal{K}
    \\
    \text{Algorithm Asserts: }& 
    b - A\tilde{x} \perp \mathcal{L} \implies b - A(x^{(0)} + \delta x) \perp \mathcal{L}
    \\
    & \langle b - Ax^{(0)} - A\delta x , w\rangle = 0 \quad \forall w \in \mathcal{L}
   \\
    & \langle r_{0} - A\delta x,w \rangle=0\quad \forall w \in \mathcal{L}
\end{aligned}\tag{1}
$$

**Subspace Norm Minimization Framework**

Other times, iterative method will choose to build up a subspace for each step with a subspace generator, and build up the solution on this expanding subspace, but with the additional objective of minimizing the residual under certain norm. 

> Assuming that the vector $x\in x_0 + \mathcal{K}$, and we want to minimize the residual under a norm induced by positive definite operator $B$. Let it be the case that the columns of matrix $K$ span subspace $\mathcal{K}$ with $\dim(\mathcal K) = k$. 

$$
\begin{aligned}
    &\hspace{0.6em} \min_{x\in x_0 + \mathcal{K}} \Vert b - Ax\Vert_B^2 
    \\
    &= \min_{w\in \mathbb{R}^{k}} 
    \Vert b - A(x_0 + Kw)\Vert_B^2 & 
    \\
    &= \min_{w\in \mathbb{R}^{k}} 
    \Vert 
        r_0 - AKw
    \Vert_B^2
\end{aligned}\tag{2}
$$

We take the derivative of it and set the derivative to zero, this translate the problem to a projection problem under the $A$ norm. 
$$
\begin{aligned}
    \nabla_w \left[
        \Vert r_0 - AKx\Vert_B^2
    \right] &= \mathbf{0}
    \\
    (AK)^TB(r_0 - AKx) &= \mathbf{0}
    \\
    (AK)^TBr_0 - (AK)^TBAKx &= \mathbf{0}
    \\
    (AK)^TBr_0 &= (AK)^TBAKx
\end{aligned}\tag{3}
$$

Different choices of $B, K$ can lead to many different expresions. Some of them are easy to solve and build up the solution with an expanding subspace. 


---
### **Orthogonality Condition Matrix Representation**

Consider that: 
$$
\begin{aligned}
\text{Let } V \in \mathbb{C}^{n\times m} \text{ be a aasis for: }\mathcal{K}
\\
\text{Let } W \in \mathbb{C}^{n\times m} \text{ be a basis for: } \mathcal{L}
\end{aligned}\tag{4}
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
\end{aligned}\tag{5}
$$

And if we assume that $(W^TAV)$ is invertible, then we obtain the step to take to figure out the next step of the iteration $\tilde{x}$. 

**Prototype Algorithm**

$$
\begin{aligned}
    & \text{While not converging}: 
    \\&\hspace{1.1em}
            \begin{aligned}
            &\text{Increase Span for: } \mathcal{K, L}
            \\
            &\text{Choose: } V, W \text{ for } \mathcal{K}, \mathcal{L}
            \\
            & y:= (W^TAV)^{-1}W^Tr^{(0)}
            \\
            & x:= x+ Vy
            \\
            & r:= r^{(0)} - AVy
        \end{aligned}
\end{aligned}\tag{6}
$$

Analysis of subspace projections methods should involve discussion of this particular frame works. 



---
### **Similarity Between Orthogonality Method and Norm Differential**

For some of the cases, these 2 method are the same. Consider the minimization problem where $x$ is from some affine subspace $x_0 + \mathcal{L}$ and we wish to minize $\Vert b - Ax\Vert_2^2$. And we assume that $A$ is at least full rank, so that there is a unique minimizer. Then we have ($B = I$): 

$$
\begin{aligned}
    (AK)^Tr_0 &= (AK)^TAKx
\end{aligned}
$$

This is the same as the Galerkin Formulation with $V = K, W = AK$. Like that, and this gives the Minimal Residual Objective to work with. 

---
### **Consequences**

The GMRes method, the Conjugate Gradient method, and many other methods all fits ounder this category. In which, a subspace is maintained during the iterations, and then it try to get the best results using the maintained subspace for the iteration. 

**Conjugate Gradient**

For the conjugate gradient algorithm, the minimization objective is to minimize the A-norm of the error. More specifically we have: 

$$
\begin{aligned}
    \hspace{0.5em}
    \min_{w\in \mathbb{R}^k} 
    \Vert 
        A^{-1}b - (x_0 + P_kw)
    \Vert_A^2 & 
    \\
    \nabla_w [\Vert A^{-1}b - (x_0 + P_kw)\Vert_A^2] &= \mathbf{0}\iff\text{Minimum Attained}
    \\
    \nabla_w[\Vert e_0 - P_kw\Vert_A^2] &= \mathbf{0}
    \\
    P_k^T(A(e_0 - P_kw)) &= \mathbf{0}
    \\
    P^T_kAe_0 - P^T_kAP_kw &= \mathbf{0}
    \\
    P^Tr_0 = P^T_kAP_kw
\end{aligned} 
$$

This is the conditions derived using the objective of minimizing the error norm by choosing the solution $x$ from the affine space of $x_0 + \text{span}(P_k)$, where we assume that $P_k$ is a matrix whose columns are some basis vectors. 

Plase obseve that the above equation is also the same as the following Galerkin's Condition's Matrix From: 

$$
\text{choose }:  x\in x_0 + \text{span}(P_k) \text{ s.t: }  
b - Ax \perp \text{span}(P_k)
$$

For any miniizations method, there is a Galerkin Frameworks that seems to describe it. 


---
### **Prototyping the Common Algorithm**






