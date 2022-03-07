[[Taxonomy of Subspace Projection Method]]
[[Ortho Min]]
[[Ortho Min 2]]
[[Hessenberg Transform with Arnoldi Iterations]]

---
### **Intro**

We are deriving the orthomin method, using the ideas we developed for iterative methods in general. At a high level, here is a summary of the algorithm: 

> The orthomin algorithm is mathematical equivalent to the GMRes algorithm. It uses the Gram Schidtz A-Orthogonalization procedues to produce conjugate vectors and minimizes the 2 norm of the residual along that direction. 

**2-Norm Minimization**

Assume that the objective of the ortho min method is to optimize for the 2-Norm of the residual. Then the equality introduced by the optimization framework is: 

> $$
> P_k^TAr_0 = P_k^TA^TAP_kw  \tag{1}
> $$


Where, the $P_k$ matrix is a matrix whose columns are chosen to be $[p_0, p_1, \cdots, p_{k - 1}]$, and we consider that $P_k$ has $A^TA$ Orthogonal Vectors in its column, then we wish to show that: 

**Claim 1**

> $$x_k = x_0 + PD^{-1}_k(AP_k)^Tr_0$$
> Alternatively: 
> $$
>     x_k = x_0 + \sum_{j = 1}^{k}
> \frac{\langle r_0, Ap_j\rangle}{\langle Ap_j, Ap_j\rangle}p_j
> $$
> 
> Where, the $D_k$ diagonal matrix is the matrix whose diagonal is $\langle Ap_j, Ap_j\rangle$. Or alternatively: $D_k = (AP_k)^T(AP_k)$, which make use of the $A^TA$ orthogonal matrix in $P_k$. 

**Derivation**

let $P_k$ be a matrix that such that its columns is a basis. 


$$
\begin{aligned}
    &\min_{x\in x_0 + \text{span}(P_k)}\Vert b - Ax\Vert_2^2
    \\
    \implies 
    & 
    P_k^TA^Tr_0 = P_k^TA^TAP_k w \quad \text{ where } x = x_0 + P_k w
\end{aligned}
$$

Orthomin considers the case where $AP_k$ are orthogoal, more specifically: 

$$
\text{span}(Ap_0, Ap_1, \cdots, Ap_{k - 1})
$$

Is an orthogonal set. Because it's orthogonal we know that $(AP_k)^T(AP_k)$ produces a diagonal matrix. Let $D_k = (AP_k)^T(AP_k)$, then $(D_k)_{i, i} = \langle Aq_i, Aq_i\rangle$, giving us: 

$$
\begin{aligned}
    P^T_kA^Tr_0 &= D_k w
    \\
    w &= D^{-1}_kP^T_kA^Tr_0
    \\
    x_0 + P_kw &= x_0 + P_kD^{-1}_k(AP_k)^Tr_0
    \\
    x_k &= x_0 + \sum_{j = 1}^{k}
    \frac{\langle r_0, Ap_j\rangle}{\langle Ap_j, Ap_j\rangle}p_j
\end{aligned}
$$


**Claim 2**

> $$
> x_{k + 1} - x_k = p_kd^{-1}_k p_k^TA^Tr_k
> $$

**Proof**

$$
\begin{aligned}
    x_k &= x_0 + P_k d^{-1}_k(AP_k)^Tr_0
    \\
    r_k &= r_0 - AP_kD^{-1}_k(AP_k)^Tr_0
\end{aligned}
$$

The recurrence of x_k can be derived and to begin with, we express it in term of $r_0$, giving us: 

$$
\begin{aligned}
    x_{k + 1} - x_k &= P_{k + 1}D^{-1}_{k + 1} (AP_{k + 1})^Tr_0 - P_k D_k^{-1}(AP_k)r_0
    \\
    &= 
    \begin{bmatrix}
        P_k \\ p_k
    \end{bmatrix}
    \begin{bmatrix}
        D_k^{-1} & 
        \\
        & d^{-1}_k
    \end{bmatrix}
    \begin{bmatrix}
        P_k^T \\ p_k^T
    \end{bmatrix}A^Tr_0 
    - 
    P_k D_k^{-1}(AP_k)r_0
    \\
    &= 
    \begin{bmatrix}
        P_k \\ p_k
    \end{bmatrix}
    \begin{bmatrix}
        D_k^{-1} & 
        \\
        & d^{-1}_k
    \end{bmatrix}
    \begin{bmatrix}
        P_k^TA^Tr_0 \\ p^T_kAr_0
    \end{bmatrix} - 
    P_k D_k^{-1}(AP_k)r_0
    \\
    &= 
    p_k d_k^{-1}p_k^TAr_0
\end{aligned}
$$

Next, we are looking for an alternative formulation of the changes in $x_k$ that doesn't make use of the $r_0$. Let's consider: 

$$
\begin{aligned}
    r_0 &= r_k + AP_k
    \\
    p_k^TA^Tr_0 &= p_k^TA^Tr_k + \underbrace{p_k^TA^TAP_k}_{= \mathbf{0}} D^{-1}_k (AP_k)^Tr_0
    \\
    &= \langle Ap_k, r_k\rangle
    \\
    \implies
    x_{k + 1}  - x_{k + 1} &= 
    p_kd^{-1}_kp_k^TAr_k
\end{aligned}
$$

The recurrence for the update has been proven at this point. 

---
### **Generation of The $P_k$**

We are interested in generating the subspace of $P_k$ matrix that is $A^TA$ orthogonal. The formula we proposed is the following: 

$$
p_k = r_k - P_kd^{-1}_k(AP_k)^TAr_k
$$

Take note that, this request a matrix multiplications, of projecting $Ar_k$ onto the subspace $AP_k$, an then use that to manipuate $P_k$ to generate the new vector $p_k$. 

**Claim 3**

> $$Ap_k \perp AP_k$$ 
> The newest generated vector by the formula is $A^TA$ orthogonal to all previous vectors. 

**Claim 4**

> suppose that we started with $p_0 = r_0$, then it will be the case that 
> $$
> p_k\in \mathcal{k}_k(A|r_0)
> $$

**Proof**

To start, we show that the base case is correct. Consider the basecase: 

$$
\begin{aligned}
    p_0 &= r_0 
    \\
    p_1 &= r_1 - 
    \frac{\langle Ar_1, Ap_0\rangle}
    {
        \langle Ap_0, Ap_0\rangle
    }p_0
\end{aligned}
$$

In this cause, it's trivial that $Ap_1 \perp Ap_0$, if we assume that $r_0$ is not in the span of $p_0$. Next, observe that: 

$$
\begin{aligned}
    x_1 & \in x_0 + \text{span}(r_0)
    \\
    r_1 &\in r_0 + \text{span}(Ar_0)
    \\
    r_0 + \text{span}(Ar_0) &\subseteq \mathcal{K}_2(A|r_0)
    \\
    \implies 
    p_1 \in& \mathcal{K}_2(A|r_0)
\end{aligned}
$$

The basecase has been proven. Inductively, we have the statement that: 

$$
\begin{aligned}
    p_k &= r_k - P_kD^{-1}_k(AP_k)^TAr_k
    \\
    Ap_k &= Ar_k - AP_kD^{-1}_k(AP_k)^TAr_k
    \\
    P_k^TA^TAp_k &= 
    P_k^TA^TAr_k - \underbrace{P_k^TA^TAP_k}_{=D_k} D^{-1}_kP^T_kA^TAr_k
    \\
    P_k^TA^TAp_k &= P_k^TA^TAr_k - P_k^TA^TAr_k = \mathbf{0}
\end{aligned}
$$

**Claim 3** is proven at this point. Next, we inductively consider $p_{k - 1}\in \mathcal{K}_k(A|r_0), \text{span}(P_k) = \mathcal{K}_k(A|r_0)$. From the formula for $p_k$, we know that $p_k \in r_k + \text{span}(P_k)$, next we have: 

$$
\begin{aligned}
    r_k &= r_0 - (AP_k)D^{-1}_k(AP_k)^Tr_0
    \\
    r_k &\in r_0 + \text{span}(AP_k)
    \\
    r_0 + \text{span}(AP_k) &\subseteq \mathcal{K}_{k + 1}(A|r_0)
    \\
    \implies r_k &\in \mathcal{K}_{k + 1}(A|r_0)
    \\
    \implies p_k &\in r_k + \text{span}(P_k)
\end{aligned}
$$

**Claim 4** has been proven by this point. 

---
### **Potential Link to Arnoldi Method**

There is a special equivalence between the orthomin method with full orthogonalization and the GMRes algorithm. More specifically, the Arnoldi method is the glue that connect these together. See [[GMRes]] for more on this. For inspiration, consider: 

$$
\begin{aligned}
    p_k &= r_k - P_kD^{-1}_k(AP_k)^TAr_k
    \\
    Ap_k &= Ar_k - AP_kD^{-1}_k(AP_k)^TAr_k
    \\
    Ap_k &= Ar_k - AP_kD^{-1/2}(D^{-1/2}_kAP_k)^TAr_k
\end{aligned}
$$

And, please observe that $D_k^{-1/2}AP_k$ is an orthogonal projector, beacause $AP_k$ would be $A$ orthogonal. And this is an Arnoldi Method in disguise. More specifically, we can write the [[Hessenberg Transform with Arnoldi Iterations]] in matrix form: 

$$
h_{k+ 1, k}q_k = Aq_k - Q_kQ_k^{T}Aq_k
$$



---
### **How Orthomin Reduces to Other Problems**





