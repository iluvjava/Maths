[[Eigen Decomp (Hessenberg Transform)]]
[[Modified GS Process]]

---
### **Intro**

Apply Gram Schidmtz decomposition to the Krylov Subspace of a matrix will is what the Arnoldi Iteration is doing. 

It's another way of looking for the Hessenberg Transform of a squared matrix. It's am implicit way of doing so because we don't need to know what vectors are in the matrix. 

What are the reasons to prefer the modified Gram Shimdtz based method over the Household reflector method? 

 * It treats the matrix as a blackbox, when the matrix is sparse, this is the go to. 

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

**Arnoldi Iterations**

Let the following algorithm be paramaterized by $n$. 

> defining $q_1$ to be any unitary vector in $\mathbb{C}^n$
> 
> for $k = 2$ to $n - 1$: 
> >$$
> >\begin{aligned}
> >   (1.) \quad  & v^{(k)} = AQ_{n}[:, k]
> >    \\
> >   (2.) \quad  & H_n[1:k, k + 1] = Q_n[:, :k]^Hv
> >    \\
> >   (3.) \quad  & u^{(k)} = v^{(k)} - Q_n[:, :k]^HH_n[1:k, k + 1]
> >    \\
> >   (4.) \quad  & Q_n[:, k + 1] = \frac{u^{(k)}}{\Vert u^{(k)}\Vert_2}
> >    \\
> >   (5.) \quad & H_n[k, k + 1] = \Vert u^{(k)}\Vert_2
> >\end{aligned}
> >$$

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

**Claim 1:** 

> $AQ_n =Q_{n + 1}H_{n + 1}[:, 2:]$

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

**Observe:** 

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
### **Extra**

Reference: [here](http://www.math.iit.edu/~fass/477577_Chapter_14.pdf), more lecture notes Krylov Subspace and Arnoldi Iterations and the iterative method call GMRes.


