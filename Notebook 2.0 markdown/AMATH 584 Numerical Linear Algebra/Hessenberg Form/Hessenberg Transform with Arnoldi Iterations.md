[Hessenberg Transform intro, HS Reflector](Hessenberg%20Transform%20intro,%20HS%20Reflector.md)
[Modified GS Process](../QR%20Decomposition/Modified%20GS%20Process.md)
[Krylov Subspace](../../MATH%20700%20Master%20Thesis/Krylov%20Subspace.md)


---
### **Intro**

The Hessenberg form for matrix decomposition is important for numerical interpretations of matrices. The arnoldi iterations is just another variations of looking for the Hessenberg form. 

Using Householder Triangularization, we will be able to make matrix $A$ into the project of 2 matrices $A = Q_n\tilde{H}_nQ_n^T$, where $Q_n$ is a unitary matrix. And $\tilde{H}$ is a matrix in Hessenberg Form. 

**Theoretical Importance**

* The matrix $\tilde{H}$, has the same eigenvalues as the matrix $A$
* The matrix $Q$, is the same $Q$ matrix gotten by orthogonalizing the Krylov Subspace matrix $K_n$. 


---
### **Algorithm**

Let $A\in \mathbb{R}^{n \times n}$, $Q_n$ be an $n\times n$ matrix, unitary, and $H_n$ be an upper triangular matrix, $n\times n$

$$
\begin{aligned}
    Q_n &= \begin{bmatrix}
        q_1 & q_2 & \cdots & q_n
    \end{bmatrix}
    \\
    H_n &= 
    \begin{bmatrix}
        h_{1, 1} & h_{1, 2} & \cdots & h_{1, n}
        \\
        0 & h_{2, 2} & \cdots & h_{2, n}
        \\
        0 & 0& \cdots & h_{3, n}
        \\
        \vdots & \vdots & \ddots & \vdots 
        \\
        0 & 0 & \cdots & h_{n, n}
    \end{bmatrix}
\end{aligned}
$$
Note: Yes, $H_n$ is a diagonal matrix here. 

**Hessenberg Transformation via Arnoldi Iterations**


Let the following algorithm be paramaterized by $n$. 

> $$
> \begin{aligned}
>     &\text{Choose Any: } q_1 \in \mathbb{C}^n \text{ s.t } \Vert q_1\Vert = 1
>     \\
>     & \text{for } k = 1 \text{ to } n - 1
>     \\
>     &\hspace{1em}
>     \begin{aligned}
>         (1.)\quad  & v^{(k)} = AQ_{n}[:, k]
>             \\
>         (2.)\quad  & H_n[1:k, k + 1] = Q_n[:, :k]^Hv
>             \\
>         (3.)\quad  & u^{(k)} = v^{(k)} - Q_n[:, :k]^HH_n[1:k, k + 1]
>             \\
>         (4.)\quad  & Q_n[:, k + 1] = \frac{u^{(k)}}{\Vert u^{(k)}\Vert_2}
>             \\
>         (5.)\quad & H_n[k, k + 1] = \Vert u^{(k)}\Vert_2
> \end{aligned}
> \end{aligned}
> $$
 
All variables only appears once in the statement of the algorithm, making it easier to refer to because it will have unique value throughout the runtime of the algorithm. 

**Concise Explaination** 

1. Iterate put $q_n$ into $A$, to see, generating new directions for the Krylov Subspace. 

2. Project $v^{(k)}$ to all previous orthogonal directions, $q_1, q_2 \cdots q_{k- 1}$. 

3. Subtrack the projections onto all previous orthogonal directions from $u^{(k)}$. 

4. Normalized the vector $q_{k}$, the new direction. 

5. Length of the vector $Q_n[:, k]$ are transferred to the diagonal of matrix $H_n$.

---
### **Hessenberg Form**

* Let $Q_n$, $H_n$ be produced from the above algorithm. $n - 1$, so that $Q_n, H_n$ are both $n\times n$ complex matrices. 

Then consider the following quantity: 

$$
AQ_n
$$

**Claim 1: The Recurrence** 

> $AQ_n =Q_{n + 1}H_{n + 1}[:, 2:]$, Basically it produces the Hessenberg form. 

**Proof**

$$
\begin{aligned}
    &A \begin{bmatrix}
        q_1 & q_2 & q_3 & \cdots & q_n
    \end{bmatrix}
    \\
    =& \begin{bmatrix}
        Aq_1 & Aq_2 & Aq_3 & \cdots Aq_n
    \end{bmatrix}
    \\
    \underset{(1)}{\implies}= &  
    \begin{bmatrix}
        v^{(1)} & v^{(2)} & v^{(3)} & \cdots v^{(n)}
    \end{bmatrix}
    \\
    \underset{(2)}{\implies}=& 
    \begin{bmatrix}
        \begin{pmatrix}
            q_2h_{2, 2}\\ + \\ q_1h_{1, 2}
        \end{pmatrix}
        \begin{pmatrix}
            q_3h_{3, 3}\\ + \\\sum_{i = 1}^{2}q_kh_{k, 3}
        \end{pmatrix}
        \begin{pmatrix}
            q_4h_{4, 4}\\ + \\ \sum_{i = 1}^{3}q_kh_{k, 4}
        \end{pmatrix}
        \begin{pmatrix}
            \cdots \\ + \\\cdots
        \end{pmatrix}
        \begin{pmatrix}
            q_{n + 1}h_{n + 1, n}\\ + \\ \sum_{i = 1}^{n}q_kh_{k, n}
        \end{pmatrix}
    \end{bmatrix}
    \\ 
    = &
    \begin{bmatrix}
        q_1 & q_2 & q_3 & \cdots & q_{n + 1} 
    \end{bmatrix}
    \begin{bmatrix}
        h_{1, 2} & h_{1,2} & \cdots & h_{1, n}
        \\
        h_{2, 2} & h_{2, 2} & \cdots & h_{2, n}
        \\
        & h_{3, 3} & \cdots & h_{3, n}
        \\
        & &\ddots & \vdots
        \\
        & & & h_{n + 1, n} 
    \end{bmatrix}
    \\
    =& Q_{n + 1}H_{n + 1}[:, 2:]
\end{aligned}
$$

The claim has been proven. 

* (1): By the (1.) in the arnoldi algorithm. 
* (2): By doing step (3), (4), (5) in reverse to obtain the value of $u^{(k)}$ using $q_{k}$

**Note**: For type setting reasons, I type the vector and their operations vertially inside the long parenthesis inside the matrix. 

**Observe: The Final Hessenberg Form** 

> Applying the matrix $A$ to the list of $n$ orthogonal vectors ithe same as chopping out the last row of the matrix $H_{n +  1}[:, 2:]$. Like that. Exactly. 

Let's continue by considering: 

$$
\begin{aligned}
    AQ_n &= Q_{n + 1}H_{n + 1}[:, 2: ]
    \\
    Q_n^H AQ_n &= Q_nQ_{n + 1}H_{n + 1}[:, 2:]
    \\
    Q_n^HAQ_n &= H_{n + 1}[:-1, 2: ]
\end{aligned}
$$


---
### **Partial Arnoldi Iterations**

Take note that, approximation of the matrix $A$, can be expressed via non-squared matrices $Q_k$, where $k < n$. 

This will be made clear during the Krylov Subspace interpretations of the Arnoldi Iterations. 

---
### **Another Algorithm of the Same Thing for Viewing Pleasures**

**Arnoldi Iterations**

> Initialize any unitary vector $q_1 \in \mathbb{C}^n$
> $$
> \begin{aligned}
>     &\text{for } k = 2, 3, \cdots ,n
>     \\
>     &\hspace{2em}
>     \begin{aligned}
>         & \tilde{q}_k = Aq_{k - 1}
>         \\
>         &\text{for } l = 1 \text{ to } k - 1
>         \\
>         &\hspace{2em}
>         \begin{aligned}
>             & h_{l, k - 1} = \langle \tilde{q}_k, q_l \rangle
>             \\
>             & \tilde{q}_k =\tilde{q}_k - h_{l, k - 1} q_l
>         \end{aligned}
>         \\
>         & h_{l, k - 1} = \Vert \tilde{q}_k\Vert_2
>         \\
>         & q_k = \tilde{q}_k / \Vert q\Vert
>     \end{aligned}
>      \\
>      & H[:, n] = Q^HAQ
> \end{aligned}
> $$

For each latest new vector $q_k$, get a new vector $Aq_k$ and then orthogonalize it on all existing orthogonal vectors

---
### **Julia Code** 

This is a Julia Implementation of the above formulatiosn of the Arnoldi Iterations: 

```julia
using LinearAlgebra

function ArnoldiIterate(A)
"""
    prototype first. 
#Arguments
- `A`: A complex matrix

Returns Q, H, where Q is the unitary matrix and H is in 
upper Hessenberg Form. 
"""
    @assert ndims(A) == 2 "A needs to be a 2d matrix"
    m, n = size(A)
    @assert m == n "A needs to be a square matrix"
    q1 = rand(n, 1)  + rand(n, 1)*im
    q1 = q1./norm(q1)
    H = similar(A, ComplexF64)
    Q = similar(A, ComplexF64)
    Q[:, 1] = q1
    for k in 2:n + 1
        q = A*Q[:, k - 1]
        for l in 1:k - 1
            H[l, k - 1] = Q[:, l]'*q
            q -= H[l, k - 1].* Q[:, l]
        end
        if k <= n
            H[k, k - 1] = norm(q)
            Q[:, k] = q./norm(q)
        end
    end
    return Q, H
end
```

---
### **Its Close Cousin: The Iterative Lanczos Algorithm**

The iterative lanczos algorithm performs exactly the same type of procedures but applied to Hermitian Matrices, and when that happens, we obtained a Tridiagonalization of the Hermitian Matrix.For more info, see a dedicated discussion about [Lanczos Iteration](Lanczos%20Iteration.md)

---
### **A Projector Based Approach to Hessenberg Form**

To analyze the recurrences using projector, we establish the $H_k$ matrix generated at each step of the iterations to be a $(k + 1)\times k$ matrix in the form of Upper hessenberg, written as: 

$$
\begin{aligned}
    \tilde{H}_k = 
    \begin{bmatrix}
        h_{1, 1} & h_{1, 2} & \cdots & h_{1, k} 
        \\
        h_{1, 2} & h_{2, 2} & \cdots & h_{2, k}
        \\
        \\
        & \ddots & &\vdots
        \\
        & & h_{k, k - 1}& h_{k, k}
        \\
        & & & h_{k + 1, k}
    \end{bmatrix}
\end{aligned}
$$

The algorithm can be inductively phrased as the process of projecting $Aq_k$ onto the orthogonal projector $Q_k$ to attain the newest column of $H_k$, and setting the last bottom right corner of the matrix $H_k$ to be $Aq_k$ after the orthgonalization process. Mathematically it can be described recursively as: 

$$
\begin{aligned}
    (\tilde{H}_k)_{2, 1}q_2 &= (I - q_1q_1^H)Aq_1
    \\
    (\tilde{H}_k)_{1, 1}q_1 &= q_1q_1^HAq_1
    \\
    Q_2 &:= \begin{bmatrix}
        q_1 & q_2
    \end{bmatrix}
    \\
    (\tilde{H}_k)_{3, 2}q_3 &= (I - Q_2Q_2^H)Aq_2
    \\
    (\tilde{H}_k)_{1:2, 2} &= Q_2Q_2^HAq_2
    \\
    Q_3 &:= \begin{bmatrix}
        q_1 & q_2 & q_3
    \end{bmatrix}
    \\
    & \vdots 
    \\
    Q_j &:= \begin{bmatrix}
        q_1 & q_2 & \cdots & q_j
    \end{bmatrix}
    \\
    (\tilde{H}_k)_{j + 1, j}q_{j + 1}&= (I - Q_jQ_j^H)Aq_j
    \\
    (\tilde{H}_k)_{1:j, j} &= Q_jQ_j^HAq_j
    \\
    &\vdots 
    \\
    Q_k &:= \begin{bmatrix}
        q_1 & q_2 & \cdots & q_k
    \end{bmatrix}
    \\
    (\tilde{H}_k)_{k + 1, k}q_{k + 1}&= (I - Q_kQ_k^H)Aq_k
    \\
    (\tilde{H}_k)_{1:k, k} &= Q_kQ_k^HAq_k
\end{aligned}
$$

The first line is saying that the bottom right corner of the $(k + 1)\times k$ element of the matrix $H_k$ scales $q_k$ would equal to the orthogonal projection of $Aq_{k-1}$ onto the orthogonal subspace spanned by the range of $Q_k$. 

$$
\begin{aligned}
    \\
    \implies
    (H_k)_{k + 1, k}q_k &= Aq_{k - 1} - Q_k \underbrace{Q_k^HAq_{k - 1}}_{(H_k)_{1:k, k}}
    \\
    (H_k)_{k + 1, k}q_k &= Aq_{k - 1} - Q_k (H_k)_{1:k, k}
    \\
    Aq_{k - 1} &= (H_k)_{k + 1, k}q_k + Q_k (H_k)_{1:k, k}
    \\
    Aq_{k - 2} &= (H_k)_{k, k - 1}q_{k - 1} + Q_{k - 1} (H_k)_{1:k - 1, k - 1}
    \\
    \vdots & 
    \\
    Aq_{1} &= h_{1, 2}q_1 + h_{2, 2}q_2
    \\
    \implies 
    AQ_{k - 1} &= Q_kH_k
\end{aligned}
$$

And this completes the recurrences for the Arnoldi Iterations, in other literatures, the recurrence might be rephrased using the $H_k$ that is the $k\times k$ submatrix on the top left of the above matrix $H_k$.



---
### **Krylov Subspace and Termination Conditions of the Arnoldi Iterations**

The idea here is that the range of the matrix $Q_k$ is the same as the krylov subspace $\mathcal K_k(A|q_1)$, which again, using the grade of the krylov subspace, we will be able to find the maximal number of iterations underwent by the algorithm. Consider the following claim and we will proceed to prove it: 

$$
\begin{aligned}
    Q_k\in \mathcal K_k(A|q_1)
\end{aligned}
$$

The base case is simple: $q_1 \in \mathcal K_1(A|q_1)$, inductively assuming that this is true, we consider: 

$$
\begin{aligned}
    Q_k &\in \mathcal K_k(A|q_1)
    \\
    \iff w_k^+: \exists\; p_k(A|w_k^+)q_1 &= q_k
    \\
    \implies Aq_k &= \; Ap_k(A|w_k^+)q_1 \in \mathcal K_{k + 1}(A|w_k^+)
    \\
    q_{k + 1} &\in \mathcal K_{k + 1}(A|q_{1})
    \\
    \implies \text{ran}(Q_{k + 1}) &= \mathcal K_{k + 1}(A|q_1)
\end{aligned}
$$

The Arnoldi Algorithm terminates if the value $h_{k + 1, k}$ is set to be zero. This is the case because the normalization process is dividing by $h_{k + 1, k}$ to get $q_{k + 1}$. This only happens when $Aq_{k}\in \text{ran}(Q_k)$; because $h_{k +1, k}$ is given by the projector of $I - Q_kQ^H$ applied to $Aq_k$ and the null space of this projector is $\text{ran}(Q_k)$, resulging in $h_{k + 1, k} = 0$. 


---
### **Extra**

Reference: [here](http://www.math.iit.edu/~fass/477577_Chapter_14.pdf), more lecture notes Krylov Subspace and Arnoldi Iterations and the iterative method call GMRes.


