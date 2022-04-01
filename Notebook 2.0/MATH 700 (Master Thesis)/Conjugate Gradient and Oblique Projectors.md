[[Ortho Min J]]
[[Conjugate Gradient for Dummy]]
[[Krylov Subspace]]

---
### **Intro**

Inspired by the process of looking for orthomin J algorithm, I am interested in disovering some of the properties of the conjugate gradient algorithm from only first principles, in hope to spark more generality for the arguments and reveal potential connections between subspace methods in general.

The conjugate gradient algorithm is usually stated without much explanations as to how it is arrived. Sometimes short justifications wxhere given such as in Greenbaum's work where the algorithm is derived by orthogonalizing residual against the previous residual and conjugate direction, while assuming $p_0 = r_0$. However this is not informative for the underlying reasons of "WHY?", it's stated in a way as if the writer already know there is a short recurrence for the conjugate vectors, instead of naturally leading to that idea (Which of course, a completely separate idea from just the Conjugate Gradient.) Some other time it's stated in such a complicated way that doesn't quiet introduce some big ideas correlated to the algorithm itself, such as: [Conjugate Gradient Without Agonizing Pain](https://sites.math.washington.edu/~morrow/498_13/conjgrad.pdf) where it explains all the magic, but somewhat uninspiring.

The goal of this exerpt is to discover it in a similar manner to the Ortho Min J by only first principle without any preconception of what conjugate gradient is, except for the fact that, it minimizes something. During the exploration, we use Content from [[Taxonomy and Frameworks of Subspace Projection Method]], and [[Projector]]. 

**Notations**

* $\text{ran}(A)$ range of the matrix A. 
* Conjugate vectors are A-orthogonal vectors. These 2 are synonym in this excerp, they are vector $v,u$ such that $\langle v, Au\rangle = 0$

**The Objective of the Algorithm**

We introduce the algorithm as an attempt to minimize the energy norm of the error for a linear equation $Ax = b$, here we make the assumptions: 
* the matrix $A$ is symmetric semi-positive definite.  
* Further assume another matrix $P_k = [p_0 \;p_1\;\cdots p_{k-1}]$ as a matrix whose columns is a basis.

$$
\min_{w \in \mathbb{R}^k}\Vert 
    A^{-1}b - (x_0 + P_kw)
\Vert_A^2 \iff P^T_kr_0 = P_k^TAP_kw
$$

And using the matrix form for the Galerkin Condition where $W, V$ are both $P_k$, we have this orthgonality formulations: 

$$
\text{choose: }x \in x_0 + \text{ran}(P_k) \text{ s.t: } b - Ax \perp \text{ran}(P_k)
$$

Take note that this link between a norm minimzation and an equivalent Orthogonality condition doesn't garantee to happen, for example the FOM and Bi-Lanczos Method are orthogonalizations method that doesn't directly link to a norm minimization objective. 

**A-Orthogonal Vector**

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
\end{cases}\tag{1}
$$

---
### **The Projector**

From (1), please note that $AP_kD_k^{-1}P_k$ is a projector, and so is $P_kD^{-1}_kP_k^TA$. Here is a simple proof: 

$$
\begin{aligned}
    AP_kD^{-1}_kP_k^T(AP_kD^{-1}_kP_k^T) &= AP_kD^{-1}_kP_k^TAP_kD^{-1}_kP_k^T 
    \\
    &= AP_kD_k^{-1}D_kD_k^{-1}P_k^{T}
    \\
    &= AP_kD_k^{-1}P_k^T 
    \\[1.1em]
    P_kD^{-1}_kP_k^{T}A(P_kD^{-1}_kP_k^{T}A) &= P_kD^{-1}_kD_kD_{k}^{-1}P^T_kA
    \\
    &= 
    P_kD^{-1}_kP^T_kA
\end{aligned}\tag{2}
$$

Both matrices are indeed projectors. Please take note that they are not Hermitian, which would mean that they are not orthogonal projector, hence, **oblique projectors**. For notational convenience, we denote $\overline{P}_k = P_kD_k^{-1}P_k^{T}$; then these 2 projectros are: 

$$
\begin{aligned}
    AP_kD^{-1}_kP_k^T &= A\overline{P}_k 
    \\
    P_kD^{-1}_kP_k^TA &= \overline{P}_kA
\end{aligned}\tag{2.1}
$$

Let's prove some useful properties that I found on these projectors. 

> $$
> \begin{aligned}
>     & \text{ran}(I - A\overline{P}_k )\perp \text{ran}(P_k)
>     \\
>     & \text{ran}(I - \overline{P}_kA) \perp \text{ran}(AP_k)
> \end{aligned}
> $$

**Proof**

$$
\begin{aligned}
    P_k^T(I - A\overline{P}_k) &= P_k^T - P_k^{T}A\overline{P}_k
    \\
    &= P_k^{T} - D_kD_k^{-1}P^T_k
    \\
    &= \mathbf{0}
    \\
    (AP_k)^T(I - \overline{P}_kA) &=P_k^TA - P_k^TA\overline{P}_kA
    \\
    &= P_k^TA - P_k^TAP_kD_k^{-1}P_k^TA
    \\
    &= P_k^TA - P^T_kA 
    \\
    &= \mathbf{0}
\end{aligned}\tag{2.2}
$$
Done. 


**Consequences 1: Residual Orthogonality Against P**

Please observe that, from (1), one can immediately see that $r_0$ is the result the projector: 

$$
\begin{aligned}
    r_k &= r_0 - A\overline{P}_kr_0 = (I - A\overline{P}_k)r_0
    \\
    \implies 
    r_k &\perp \text{ran}(P_k)
\end{aligned}\tag{2.3}
$$

**Consequence 2: Generating Conjugate Vectors**

As a result, given any set of basis vector, for example $\{u_k\}_{i = 0}^{n - 1}$, one can generate a set of A-Orthogonal vectors from it. More specifically: 

$$
\begin{aligned}
    p_k &= (I - \overline{P}_kA)u_k
    \\
    \text{span}(p_k) &\perp \text{ran}(AP_k)
\end{aligned}\tag{2.4}
$$

This provide us with an actual way of looking for the vectors that are A-Orthogonal! 

---
### **Assisted Conjugate Gradient**

So far, we have this particular scheme of solving the optimization problem, coupled with the way to computing the solution $x_k$ at each step, and the residual at each step, while also getting the residual vector at each step too. 

$$
\begin{cases}
    x_k = x_0 + \overline{P}_k r_0
    \\
    r_k = (I - A\overline{P}_k) r_0
    \\
    P^T_kAP_k = D_k
    \\
    \overline{P}_k = P_kD^{-1}_kP_k^T
    \\
    p_k = (I - \overline{P}_kA)u_k & \{u_i\}_{i = 0}^{n - 1} \text{ is a Basis}
\end{cases}\tag{3}
$$

With the assitance of a set of basis vector that span the whole space, this algorithm is possible to achieve the objective. Take note that we can accumulate the solution for $x_k$ accumulatively, instead of computing the whole projector process, we have the choice to update it recursively as the newest $p_k$ vector is introduced at that step. Let's Call this formulation of the algorithm: *Assisted Conjugate Gradient*. 

**Assited CG Properties**

Let's consider some of the immediate properties of this algorithm we developed.

$$
\begin{aligned}
    p_{k + j}^Tr_k &= p_{k + j}^Tr_0 \quad \forall \; 0 \le j \le n - k
    \\
    p_{k + j}^Tr_k &= p_k^T(I - A\overline{P}_k)r_0
    \\
    &= (p^T_{k + j} - p^T_{k + j}A\overline{P}_k)r_0
    \\
    &= p_{k + j}^Tr_0
\end{aligned}\tag{3.1}
$$

Take notice that this is true because $p_{j + k}$ is A-Orthogonal to all previous A-Orthogonal vector, so that the product $p^T_{k + j}A\overline{P}_k = \mathbf{0}$. Using these propeties, we can find out about a short recurrence relations of the residual: 

$$
\begin{aligned}
    r_k - r_{k - 1} &= r_0 - A\overline{P}_kr_0 - (r_0 - A\overline{P}_{k - 1}r_0)
    \\
    &= A\overline{P}_kr_0 - A\overline{P}_{k - 1}r_0
    \\
    &= - Ap_{k - 1}\frac{\langle p_{k - 1}, r_0\rangle}{\langle p_{k - 1}, Ap_{k - 1}\rangle}
    \\
    \implies 
    x_{k} - x_{k - 1} &= 
    p_{k - 1}\frac{\langle p_{k - 1}, r_0\rangle}{\langle p_{k - 1}, Ap_{k - 1}\rangle}
    \\
    \text{def: } a_{k - 1} &:= \frac{\langle p_{k - 1}, r_0\rangle}{
        \langle p_{k - 1}, Ap_{k - 1}\rangle
    } = 
    \frac{\langle p_{k - 1}, r_{k - 1}\rangle}{
        \langle p_{k - 1}, Ap_{k - 1}\rangle
    } 
\end{aligned}\tag{3.2}
$$

The recurrence is established because of the derived relations for the dot product $\langle p_{k - 1}, r_0\rangle = \langle p_{k - 1}, r_{k - 1}\rangle$, and the further consequence is the ability to express the error using only the conjugate gradient vectors. Take note that (2.3) is still true for the Assisted Conjugate Gradient Method. 


---
### **Residual Assistance**

Now, consider the case where, the set of basis vector: $\{u\}_{i = 0}^{n - 1}$ to be the residual vector generated from the algorithm. Then there are a series of new added lemmas that are true. However, this is where things started to get exciting, because a short recurrence for $p_k$ during each iteration arised and residuals are all orthgonal. 


**Lemma 1**
> $$
> \begin{aligned}
>     p_{k + j} Ap_k &= p_{k + j}^TAr_k - p_{k + j}^TA\overline{P}_{k}Ar_k \quad 
>     \forall\; 0 \le j \le n - k
>     \\
>     &= p_{k + j}^TAr_k
>     \\
>     \langle p_{k + j}, Ap_k\rangle
>     &= \langle r_k, Ap_{k + j}\rangle
>     = \langle p_{k + j}, Ar_k\rangle
> \end{aligned}\tag{4.1}
> $$

Observe that $p_{k + j}A\overline{P}_k = \mathbf{0}$, this is true because of how the conjugate vector is defined back in (2.4)

**Lemma 2**

> $$
> \begin{aligned}
>     \langle r_k, p_k\rangle &= 
>     \langle r_k, p_k\rangle
>     \\
>     &= \langle r_k, r_k\rangle - \langle r_k, \overline{P}_kAr_k\rangle
>     \\
>     &= \langle r_k, r_k\rangle
> \end{aligned}\tag{4.2}
> $$

This is true because $\overline{P}_k$ are orthogonal to $r_k$, purely because of the results from (2.3). Lemma 2 updates the expression for $a_{k - 1}$ in (3.2), giving us: 

$$
\begin{aligned}
    a_k = \frac{\langle p_{k - 1}, r_{k - 1}\rangle}{
        \langle p_{k - 1}, Ap_{k - 1}\rangle
    } = 
    \frac{\langle r_{k - 1}, r_{k - 1}\rangle}{\langle p_{k - 1}, Ap_{k - 1}\rangle}
\end{aligned}\tag{4.3}
$$

**Claim 1: Orthgonal Residuals**

The residual are orthogonal during the process of Residual Assisted Conjugate Gradient. Inductively: 

> $$
> \begin{aligned}
>     \langle r_k , r_j \rangle = 0 \quad \forall\; 0 \le j \le k - 1 \end{aligned}\tag{4.4}
> $$

Let this above claim be inductively true then consider: 

$$
\begin{aligned}
    r_{k + 1} &= r_k - a_kAp_k
    \\
    \implies 
    \langle r_{k + 1}, r_k\rangle &= \langle r_k, r_k\rangle - 
    a_k \langle r_k, Ap_k\rangle
    \\
    &= \langle r_k, r_k\rangle - 
    \frac{\langle r_k, r_k\rangle}{\langle p_k, Ap_k\rangle}
    \langle r_k, Ap_k\rangle
    \\
    &= 
    0
\end{aligned}
$$

The first line is from (3.2), and then next we make use of the updated definition for $a_k$ in (4.3). Next we consider: 

$$
\begin{aligned}
    p_j &= (I - \overline{P}_jA)r_j \quad \forall\; 0\le j \le k - 1
    \\
    r_j &= p_j + \overline{P}_jAr_j
    \\
    r_k &= (I - A\overline{P}_k)P_0
    \\
    r_k\perp \text{ran}(P_k) & \implies 
    \langle r_k, r_j\rangle =\langle r_k, p_j + \overline{P}_jAr_j\rangle = 0
\end{aligned}
$$

The first 3 lines come from the definition from (3), but with the assistant subspace $\{u_i\}_{i = 0}^{n - 1}$ changed into the residual vectors generated by the algorithm at each step. The orthogonality is asserted by the propery of the projector (2.3) and definition of $r_j$ (3). The base case of the argument is simple, because $p_0 = r_0$, and by the property of the projector, $\langle r_1, r_0\rangle = 0$. Claim 1 is proved at this point. 

**Claim 2: Short Recurrence for the Conjugate Vectors Generations**

> $$
> \begin{aligned}
>     p_k &= r_k + b_{k - 1}p_{k - 1} \quad b_{k - 1} = \frac{\Vert r_k\Vert_2^2}
>     {\Vert r_{k - 1}\Vert_2^2}
> \end{aligned}\tag{4.5}
> $$

$$
\begin{aligned}
    p_k &= (I - \overline{P}_kA)r_k
    \\
    r_k - \overline{P}_kAr_k &= 
    r_k - P_kD^{-1}_kP^T_kAr_k
    \\
    &= r_k - P_kD^{-1}_k(AP_k)^Tr_k
\end{aligned}
$$

Observe that: 

$$
\begin{aligned}
    (AP_k)^Tr_k &= 
    \begin{bmatrix}
        \langle p_0, Ar_k\rangle
        \\
        \langle p_1, Ar_k\rangle
        \\
        \vdots
        \\
        \langle p_{k - 1}, Ar_k\rangle
    \end{bmatrix}
\end{aligned}
$$

Consider the inner product with results from (4.1): 

$$
\begin{aligned}
    \langle p_j, Ar_k\rangle& \quad \forall\; 0 \le j \le k -2 
    \\
    \langle p_j, Ar_k\rangle&= \langle r_k, Ap_j\rangle
    \\
    &= \langle r_k, a_j^{-1}(r_j - r_{j + 1})\rangle
    \\
    &= a_j^{-1}\langle r_k, (r_j - r_{j + 1})\rangle = 0
\end{aligned}
$$

The second line is using the property that the matrix $A$ is symmetric, the third line is using the recurrence of the residual established in (3.2), and the last line is true for all $0 \le j \le k - 2$ by the orhogonality of the residual proved in Claim 1. Therefore we have: 

$$
\begin{aligned}
    (AP_k)^Tr_k &= 
    \begin{bmatrix}
        \langle p_0, Ar_k\rangle
        \\
        \langle p_1, Ar_k\rangle
        \\
        \vdots
        \\
        \langle p_{k - 1}, Ar_k\rangle
    \end{bmatrix}
    = 
    a_{k - 1}^{-1}\langle r_k, (r_{k - 1} - r_{k})\rangle \xi_k
\end{aligned}
$$

Take note that the vector $\xi_k$ is the k th standard basis vector in $\mathbb{R}^k$. And using this we can simplify the expression for $p_k$ into: 

$$
\begin{aligned}
    p_k &= r_k - P_kD^{-1}_k(AP_k)^Tr_k
    \\
    &= r_k - P_kD_k^{-1}a_{k - 1}^{-1}(\langle r_k, (r_{k - 1} - r_{k})\rangle) \xi_k
    \\
    &= 
    r_k - \frac{a_{k -1}^{-1}\langle -r_k, r_k\rangle}
    {\langle p_{k - 1}, Ap_{k - 1}\rangle}p_k
    \\
    &= r_k + \frac{a_{k -1}^{-1}\langle r_k, r_k\rangle}
    {\langle p_{k - 1}, Ap_{k - 1}\rangle}p_k
    \\
    &= r_k + 
    \left(
        \frac{\langle r_{k - 1}, r_{k - 1}\rangle}{\langle p_{k - 1}, Ap_{k - 1}\rangle}
    \right)^{-1}
    \frac{\langle r_k, r_k\rangle}{\langle p_{k - 1}, Ap_{k - 1}\rangle}p_k
    \\
    &= 
    r_k + \frac{\langle r_k, r_k\rangle}{\langle r_{k - 1}, r_{k - 1}\rangle}p_k
\end{aligned}
$$

Claim 2 is done. 


---
### **The Residual Assisted Conjugate Gradient**

Using the updated recurrence for the parameter $a_k$ stated in 4.3, and the conjugation constant for claim 2 at (4.5) and proven, we can express the conjugate gradient algorithm: 

$$
\begin{aligned}
    & p^{(0)} = b - Ax^{(0)} 
    \\&
    \text{For } i = 0,1, \cdots
    \\&\hspace{1.1em}
    \begin{aligned}
        & a_{i} = \frac{\Vert r^{(i)}\Vert^2}{\Vert p^{(i)}\Vert^2_A}
        \\
        & x^{(i + 1)} = x^{(i)} + a_i p^{(i)}
        \\
        & r^{(i + 1)} = r^{(i)} - a_iAp^{(i)}
        \\
        & b_{i} = \frac{\Vert r^{(j + 1)}\Vert_2^2}{\Vert r^{(i)}\Vert_2^2}
        \\
        & p^{(i + 1)} = r^{(i + 1)} + b_{i}p^{(i)}
    \end{aligned}
\end{aligned}
$$

That is the algorithm, stated with all the iteration number listed as a super script inside of a parenthesis. Which is equivalent to what we have proven for the Residual Assisted Conjugate Gradient. 


---
### **Conjugate Gradient and Krylov Subspace**

The conjugate Gradient Algorithm is actually a residual assisted conjugate gradient, a special case of the algorithm we derived at the start of the excerp. The full algorithm can be seem by the short recurrence for the residual and the conjugation vector. This part is trivial. Next, we want to show the relations to the Krylov Subspace, which only occurs for the Residual Assisted Conjugate Gradient algorithm. 

**Claim:** 

> $$
> \begin{aligned}
>     p_k \in \mathcal K_{k + 1}(A|r_0)
>     \\
>     r_k \in \mathcal K_{k + 1}(A|r_0)
> \end{aligned}
> $$

The base case is tivial and it's directly true from the definition of Residual Assisted Conjugate Gradient: $r_0 \in \mathcal K_1(A|r_0), p_0 = r_0 \in \mathcal K_1(A|r_0)$. Next, we inductively assume that $r_k \in \mathcal K_{k + 1}(A|r_0), p_k \in \mathcal K_{k + 1}(A|r_0)$, then we consider: 

$$
\begin{aligned}
    r_{k + 1} &= r_k - a_kAp_k
    \\
    &\in r_k + A\mathcal K_{k + 1}(A|r_0)
    \\
    &\in r_k + \mathcal K_{k + 2}(A|r_0)
    \\
    r_k 
    &\in 
    \mathcal K_{k + 1}(A|r_0) \subseteq \mathcal K_{k + 2}(A|r_0)
    \\
    \implies r_{k + 1}
    &\in 
    \mathcal K_{k + 2}(A|r_0)
\end{aligned}
$$

At the same time the update of $p_k$ would asserts the property that: 

$$
\begin{aligned}
    p_{k + 1} &= r_{k + 1} + b_kp_k
    \\
    &\in 
    r_{k + 1} + \mathcal K_{k + 1}(A|r_0)
    \\
    &\in \mathcal K_{k + 2}(A|r_0)
\end{aligned}
$$

This is true because $r_{k + 1}$ is already a member of the expanded subspace $\mathcal K_{k + 2}(A|r_0)$. And from this formulation of the algorithm, we can update the Galerkin's Conditions to be: 

> $$
> \begin{aligned}
>     \text{choose: } x_k\in x_0 + \mathcal K_{k}(A|r_0) \text{ s.t: } r_k \perp \mathcal K_{k}(A|r_0)
> \end{aligned}
> $$

Take note that, $\text{ran}(P_k) = \mathcal K_k(A|r_0)$ because the index starts with zero. The above formulations gives theoretical importance for the Conjugate Gradient Algorithm. 

---
### **Full/partial Orthogonalizations**
To achieve better acurracy, we mantually enforce the conditions of orthogonality between residual vectors and A-Orthogonality between Conjugate Vectors. 



---
### **In Relations To Lanczos**

See [[From Lanczos to Conjugate Gradient]] for more information. 





