[Hessenberg Transform with Arnoldi Iterations](Hessenberg%20Transform%20with%20Arnoldi%20Iterations.md),
[Hessenberg Transform intro, HS Reflector](Hessenberg%20Transform%20intro,%20HS%20Reflector.md)

---
### **Intro**

Arnoldi Iterations, but this time for Hermitian Matrices. This has an intimate link to the Conjugate Gradient Algorithm, and it also has theoretical importance to the analysis of some classes of iterative algorithms. 

Let $A$ be a Hermitian Matrix and Consider it in Hessenberg Form:

$$
\begin{aligned}
    A &= QHQ^H
    \\
    A^H &= QH^TQ^H
    \\
    A &= A^H
    \\
    \implies H &= H^H
\end{aligned}
$$

The Hessenberg zeros below the sub-diagonal, if $H^H = H$, then $H$ is a Tri-diagonal Matrix and it's Symmetric: 

$$
H = \begin{bmatrix}
    \alpha_1 & \beta_1 & 0 & \cdots & 0
    \\
    \beta_1 & \alpha_2 & \beta_2 & \cdots & 0
    \\
    0 & \beta_2 & \alpha_3 & \cdots & 0
    \\
    \vdots & & & \ddots
    \\
    0 & \cdots & 0 & \beta_{n - 1} & \alpha_n 
\end{bmatrix}
$$

$$
\begin{aligned}
    AQ &= QH
    \\
    [AQ]_{:, 1< k < n} &= \beta_{k - 1}q_{k - 1} + \alpha_{k}q_k + \beta_{k}q_{k + 1}
    \\
    [AQ]_{:, 1} &= \alpha_1 q_1 + \beta_1 q_2
    \\
    [AQ]_{:, n} &= \beta_{n - 1}q_{n - 1} + \alpha_n q_n
\end{aligned}
$$

---
### **Algorithm**
With the assumption that $A$ is symmetric, or Hermitian, we can formulate the Lancosz algorithm as the following: 

> $$
> \begin{aligned}
>     &q_1 = \frac{b}{\Vert b\Vert}, \beta_0 = 0
>     \\
>     &\text{for } k = 1, 2, \cdots
>     \\
>     &\hspace{2em}
>     \begin{aligned}
>         & \tilde{q}_{k + 1} = Aq_k - \beta_{k - 1}q_{k - 1}
>         \\
>         & \alpha_k = \langle \tilde{q}_{k + 1}, q_k\rangle
>         \\
>         & \tilde{q}_{k + 1} = \tilde{q}_{k + 1} - \alpha_k q_{k}
>         \\
>         & \beta = \Vert \tilde{q}_{k + 1}\Vert
>         \\
>         & q_{k + 1} = \tilde{q}_{k + 1}/\beta_k
>     \end{aligned}
> \end{aligned}
> $$

Compare to Arnoldi algorithm, the complexity is smaller and it's much similar since we don't need to subtract the projections onto all previous $q_{i<k}$. 

**Hidden Conjugate Vectors**

Uroll the Algorithm, skipping some steps, we have the following relations between the new vector, $\tilde{q}_{k + 1}$, which is the new un-normalized vector from the Lancosz Algorithm, and previous 2 normalized eigenvector $q_{k}, q_{k - 1}$, giving us: 

$$
\begin{aligned}
    \tilde{q}_{k + 1} &= Aq_k - \langle q_k, Aq_k\rangle q_k - \langle Aq_k, q_{k - 1}\rangle q_{k - 1}
    \\
    \beta_j q_{k + 1} &= Aq_k - \langle q_k, Aq_k\rangle q_k - \langle Aq_k, q_{k - 1}\rangle q_{k - 1}
    \\
    Aq_k &= \langle q_k, Aq_k\rangle q_k + \langle Aq_k, q_{k - 1}\rangle q_{k - 1} + \beta_j q_{k + 1}
\end{aligned}
$$

Observe that $Aq_k$ will be conjugate vectors with $q_j$ where $j < k - 1$. 

---
### **Iterative Lanczos Algorithm**

Iterative Lanczos also computes a tridiagonalization to the matrix Hermitian matrix $A$, but it's performed on sparse matrices and take the advantage of the better complexity of computing matrix vector multiplications on sparse matrices.

**Algorithm Statement**

$$
\begin{aligned}
    & \text{Given arbitrary: } q_1 \text{ s.t: } \Vert q_1\Vert = 1
    \\
    & \text{set: }\beta_0 = 0
    \\
    & \text{For } j = 1, 2, \cdots 
    \\
    &\hspace{1.1em}\begin{aligned}
        & \tilde{q}_{j + 1} := Aq_j - \beta_{j - 1}q_{j - 1}
        \\
        & \alpha_j := \langle q_j,\tilde{q}_{j + 1}\rangle
        \\
        & \tilde{q}_{j + 1} \leftarrow \tilde{q}_{j + 1} - \alpha_j q_j
        \\
        & \beta_j = \Vert \tilde{q}_{j + 1}\Vert
        \\
        & q_{j + 1} := \tilde{q}_{j + 1}/\beta_j
    \end{aligned}
\end{aligned}
$$

The algorithm generates the following matrices at the kth iteration of the for loop: 

$$
\begin{aligned}
    Q_k &= \begin{bmatrix}
        q_1 & q_2 & \cdots & q_k
    \end{bmatrix}
    \\
    T_k &= 
    \begin{bmatrix}
        \alpha_1 & \beta_1 & & 
        \\[0.8em]
        \beta_1 & \ddots & \ddots & 
        \\[0.8em]
        &\ddots &\ddots & \beta_{k - 1}
        \\[0.8em]
        & & \beta_{k - 1} & \alpha_k
    \end{bmatrix}
\end{aligned}
$$

And the following recurrences between these vectors are asserted by the algorithm:

$$
AQ_k = Q_kT_k + \beta_k q_{k + 1}\xi_k^T = Q_{k + 1}T_{k + 1, k}
$$

Where 
$$
T_{k, k + 1} = 
    \begin{bmatrix}
        T_k
        \\
        \beta_k \xi_k^T
    \end{bmatrix}
$$

Where $\xi_i$ denotes the ith canonical basis vector. 

**Take note**

Because of the initial guess of $q_1$ is arbitrary, I think the decomposition is not unique, however, the Tridiagonalization from the householder Implementations will give deterministic, unique factorizations. 

In fact, if $q_1$ is the eigenvector, then there is no factorizations at all. There is more to the Iterative Lanczos than the Other way of Lanczos algortihm. 

What is going on here? 

---
### **Iterative Lanczos, Factorizations Variance**

I modified the Lanczos Algorithm by a tiny bit to fit the needs for factorizing matrices. 

Algorithm Statement: 

$$
\begin{aligned}
    & \text{Given arbitrary: }q_1 \text{ s.t: } \Vert q_1\Vert = 1
    \\
    & \alpha_1 := \langle q_1, Aq_1\rangle
    \\
    & \beta_0 := 0
    \\
    & \text{Memorize}: Aq_1
    \\
    & \text{For }j = 1\cdots
    \\
    &\hspace{1.1em}
    \begin{aligned}
        & \tilde{q}_{j + 1} := Aq_j - \beta_{j - 1} q_{j - 1}
        \\
        & \tilde{q}_{j + 1} \leftarrow \tilde{q}_{j + 1} - \alpha_jq_j
        \\
        & \beta_j = \Vert \tilde{q}_{j + 1}\Vert
        \\
        & q_{j + 1}:= \tilde{q}_{j + 1}/\beta_j
        \\
        & \alpha_{j + 1} := \left\langle q_{j + 1}, Aq_{j + 1} \right\rangle
        \\
        & \text{Memorize: }Aq_{j + 1}
    \end{aligned}
\end{aligned}
$$

**Advantage of this variant**

It produces a square matrix $T_k$ after each for loop iterations, rather than a non-square one where we have a left over $\beta_k\xi_k^T$ row at the bottom. The word "Memorize" tells the algorithm to remember the results for future references, becaues here the most expensive computations is considered to be matrix vector multiplications: $Ax$. 

**Correctness**

To convince, assume that orthogonal of the $q_j$ vectors and then susbtitute the expression for $\tilde{q}_{j}$ to the dot product for $\alpha_j$ and simplifies. 

---
### **Proof of Correctness**

Early in the introduction part, we gave a quick justifications using the form of matrices that the short recurrecnes indeed gives a tridiagonal symmetric matrix. Here we are going to use induction, we are proving that the algorithm indeed asserts the rothogonality of the vectors in $Q$, and the resulting matrices is tridiagonal. 

**Proof**: 

Let's fix the quantity: $j$. It's obvious from that definition of $\alpha_j$ one can deduce that $\langle q_{j +1}, q_j \rangle = 0$. Inductively suppose that $\langle q_k, q_i\rangle = 0\; \forall k \neq j, k, i \le j$. We wish to prove $\langle q_{j + 1}, q_{j - 1}\rangle = 0$ and $\langle q_{j + 1}, q_i\rangle = 0 \; \forall i \le j - 1$, completing the inductive hypothesis for the case of $j + 1$. 

Consider: 

$$
\begin{aligned}
    & \langle 
       \underbrace{ Aq_j - \alpha_j q_j - \beta_{j - 1}q_{j - 1}}_{\beta q_{j + 1}}, q_{j - 1}
    \rangle
    \\
    &= \langle Aq_j, q_{j - 1}\rangle - \beta_{j - 1}
    \\
    &= \langle q_j, Aq_{j - 1}\rangle - \beta_{j - 1}
    \\
    &= \langle q_j, \beta_jq_j + \alpha_{j - 1}q_{j - 1} + \beta_{j - 1}q_{j - 2}\rangle - \beta_{j - 1}
    \\
    &= 0
    \\
    \implies \langle q_{j + 1}, q_{j - 1}\rangle &= 0
\end{aligned}
$$

It's zero using inductive hypothesis. 

Now consider the case $i < j - 1$, we have: 

$$
\begin{aligned}
    \langle \beta_{j + 1}q_{j + 1}, q_i\rangle &= \langle 
        Aq_j - \alpha_j q_j - \beta_{j - 1} q_{j - 1}, q_i
    \rangle
    \\
    &= \langle q_j, Aq_i\rangle
    \\
    &= \langle 
        q_j, \beta_{i + 1}q_{i + 1} + \alpha_i q_i + \beta_{i - 1}q_{i - 1}
    \rangle
    \\
    &= 0
    \\
    \implies \langle q_{j + 1}, q_i\rangle &= 0 \quad \forall i < j -1
\end{aligned}
$$

It's zero using inductive hypothesis. 

Combining the 3 we essentially have the statement that $\langle q_{j _ 1}, q_i\rangle = 0 \; \forall i \le j$, Completing the inductive proof. The base case is trivially true by how $\alpha_1$ is computed and how $q_{2}$ is computed. 



---
### **Extra Spicy Stuff**

> There is a block tridiagonalization algorithm, much similar to the QR Decomposition. 

See [here](http://www.cas.mcmaster.ca/~qiao/publications/spie05.pdf) for more. 
