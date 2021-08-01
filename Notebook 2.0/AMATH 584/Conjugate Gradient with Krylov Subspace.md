[[Conjugate Gradient]], [[Krylov Subspace]]

---
### **Intro**

There are a lot of ways to derive the conjugate Gradient algorithm. 

In [[Conjugate Gradient]] we derived the algorithm using the Gram Schmidt conjugation, here we will minimize the energy norm of the residual vector over the Krylov Subspace. 

Make you you know the Lancosz algorithm and its relations with Krylov Subspace. 

**Claim: 1** 

> The conjugate graidient algorithm minimizes the energy norm of the error vector at each iterations of the algorithm, which is to say: 
> 
> $$
> \begin{aligned}
>     x^{(k + 1)} &= \arg\min_{x\in \langle K_{k}\rangle} 
>         \Vert x - x^+\Vert_A^2
> \end{aligned} \quad  \text{where: } Ax^+ = b
> $$
> If we do this then we have the conjugate gradient algorithm. 

We make the implicit assumption that matrix $A$ is PSD, purely because it defines a norm for the vector space. 

**The Major Idea**

We need a set of vectors such that they are orthogonal under the A-Inner product space. 

Looking for the solution of a system involving sparse matrix is very similar to looking for the Eigen Decomposition of the matrix, and then modify it at each step during the iterations. 


---
### **Conjugate Directions, or the A-Orthogonal Directions**

Let $\langle d_1, d_2, \cdots, d_k\rangle$ be a set of $A$ orthogonal directions that equals the krylov subspace $\mathcal{K}_k$, the Krylov Subspace is initialized via vector $b$.

**The Hypotehsis** 

> $$
> \begin{aligned}
>     \langle  d_1\rangle  &= \langle  b\rangle
>     \\
>     \langle d_1, d_2\rangle &= \langle b, Ab\rangle
>     \\
>     \langle d_1, d_2, \cdots d_k\rangle &= \langle b, Ab, \cdots A^{k - 1}b \rangle
> \end{aligned}
> $$
> Inductively, let's also assume that: 
> $$
> x^{(k)} \in \langle \mathcal{K}_k \rangle
> $$
> And there exists a set of $n$ A-Orthogonal vector $d_i$ that spans $\mathcal{K}_n$ eventually. Recall that, this is possible through the process of **Gram Schimdtz Conjugation** from the previous section. It can be used to make A-Orthogonal vectors using the Evolving Krylov Subspace. Therefore, this assumption is legit. 



By the assumption that $x^{(k)} \in \mathcal{K}_k$, we know that $x^{(k)}\in \langle d_1, d_2, \cdots d_k\rangle$, giving us: 

$$
\begin{aligned}
    x^{(0)} &= \sum_{j = 1}^{n} a^{(0)}_j d_j
    \\
    x^{(k)} &= \sum_{j = 1}^{k} a^{(k)}_j d_j
    \\
    x^{+} &= \sum_{j = 1}^{n} a_j^+d_j
\end{aligned}
$$

Note: $x^{(0)}, x^+$ need to be expressed using all the conjugate, if we assume that the system is, solvable, it's solvable only if $b\in \langle\mathcal{K}_j\rangle$, $1 \le j \le n$. 

Which them means the statement we consider in **claim 1** would be 

$$
\begin{aligned}
    x^{(k+ 1)} &= \arg\min_{x\in \mathcal{K}_k} \Vert x - x^+\Vert_A^2
    \\
    \underset{[2]}{\implies}\text{let: } x &= \sum_{j = 1}^{k} a_j d_j 
    \\
    x^{(k+ 1)} &= \arg\min_{x\in \mathcal{K}_k} 
    \left\Vert
        \underbrace{\sum_{j = 1}^{k} (a_j - a_j^+)d_j}_{\in \mathcal{K}_k}
        + 
        \sum_{j = k + 1}^{n} a_j^+d_j
    \right\Vert_A^2
    \\
    \underset{[1]}{\implies} x^{(k+ 1)} &= \sum_{j = 1}^{k}a_j^+d_j \in 
    \langle  \mathcal{K}_{k + 1}\rangle
\end{aligned}
$$

\[1\]: Take notice that, because $d_j$ vector A-Ortho, therefore, it's directly: 

$$
    \sum_{j = 1 }^{k}(a_j - a_j^+)^2 - \sum_{j = k + 1}^{n}(a_j^+)^2
$$

We are implicitly using the PSD property of the matrix $A$ here. 

\[2\]: By the fact that $x\in \mathcal{K}_k$, the subscript for the denoted minimizer. However, because $a_j$ where $1 \le j \le k$ corresponds to components that spans $\mathcal{K}_k$, the minimization problem is just directly setting the conjugate vector to zero. 

**Observe:**

The inductive assumtpion $x\in \langle \mathcal{K}_k \rangle$ holds true. 

We found an expression for $x^{(k)}$ from it, which is going to be the guesses produced by the conjugate gradient algorithm. 

> Please compare the above formulation of Krylov Subspace to **Claim 1** in [[Conjugate Gradient]]

**Claim 1 Corolary 1**

> $e^{(k + 1)} \perp_A \langle \mathcal{K}_{k}\rangle$
> The error vector at the $k$ th step is the orthogonal to the Krylov Subspace $\mathcal{K}_k$, because the minimization process removes the components represented by $d_i$ for $\mathcal{K}_{k}$

**Claim 1 Corolary 2**
> $r^{(k)}\notin \langle \mathcal{K}_k \rangle$, but $r^{(k)}\in \langle \mathcal{K}_{k + 1} \rangle$, which them means that $r^{(k + 1)}\notin \langle \mathcal{K}_{k + 1} \rangle$ then $\langle r^{(k + 1)}, r^{(k)}  \rangle = 0$

**Proof**


$$
\begin{aligned}
    x^{(k)} &=  \sum_{j = 1}^{k - 1} a_j^+ d_j \in \langle \mathcal{K}_k \rangle
    \\
    b = Ax^+  \implies  b &= \sum_{j = 1}^{n} a^+_jAd_j
    \\
    \implies
    b - Ax^{(k)} &= \sum_{j = k}^{n}a_j^+Ad_j
    \\
    \implies 
    \forall 1 \le i \le k - 1 & \quad 
    \left\langle  
        \sum_{j = k}^{n}    
        a_j^+Ad_j, d_i
    \right\rangle = 0
    \\
    \implies
    r^{(k)} & \notin \langle d_1, d_2, \cdots d_{k - 1} \rangle
    \\
    \implies 
    r^{(k)} & \notin \langle \mathcal{K}_k \rangle
\end{aligned}
$$

**Claim 1 Corollary 3**

> $\langle r^{(k)}, r^{(j)}\rangle = 0$ for all $1 \le j \le k - 1$

Note the property of Krylov Subspace is: 

$$
\langle  \mathcal{K}_1\rangle \subseteq \langle  \mathcal{K}_2\rangle \subseteq \langle  \mathcal{K}_3\rangle \cdots \subseteq \langle  \mathcal{K}_n\rangle
$$

Here we assume that the subsets are strict, again, because the matrix is SPD. 

Since $r^{(k)} \notin \langle \mathcal{K}_k \rangle$ and $r^{(k)} \in \langle \mathcal{K}_{k + 1} \rangle$ then $r^{(k)}\in \langle \mathcal{K}_{k + 1} \rangle\setminus \langle \mathcal{K}_{k} \rangle$ 

So then basically, $r^{(j)}\in \langle \mathcal{K}_k \rangle$ for all $1 \le j \le k- 1$, but then this means $\langle r^{(j)}, r^{(k)}\rangle = 0$ for all $1 \le j \le k - 1$ by that property of the Krylov Subspace. 


---
### **The Magics, The Residual Vector**

**Claim 2**
> Then, A-orthogonalizing the vector $r^{(k)}$ against the last search direction will allow us to get the next search directions.  

**Justification**: 

$r^{(k)} \notin \langle \mathcal{K}_k\rangle$ but $r^{(k)} \in \langle \mathcal{K}_{k + 1}\rangle$, similar to the behaviors of $q$ vector in Arnoldi Iterations.

By the corolary of claim 1, we have $e^{(k)} \perp_A \mathcal{K}_{k - 1}$, but then this also means 

Then: 
$$
\begin{aligned}
    \langle e^{(k)}, A^jb\rangle_A &= 0 \quad \forall 1 \le j \le k - 1
    \\
\end{aligned}
$$

Consider:

$$
\begin{aligned}
    & \langle r^{(k)}, A^jb \rangle_A
    \\
    &\langle Ae^{(k)}, A^jb \rangle_A
    \\
    \underset{[1]}{\implies} &  
    \langle e^{(k)}, A^{j + 1}b \rangle_A
    \\
    \implies &
    1 \le j \le k - 2
    \\
    \underset{[2]}{\implies} &
    r^{(k)} \perp_A \langle \mathcal{K}_{k - 1} \rangle
    \\
    \implies & 
    r^{(k)} \perp_A \langle d_1, d_2, \cdots d_{k - 2} \rangle
\end{aligned}
$$

Therefore, we only need to orthogonalize the vector $r^{(k)}$ against $d_{k - 1}$ to determine the next A-Orthogonal (or the next conjugate vector) search direction. 

**Explanations** 

\[1\]: using the fact that $A$ is PSD. 

\[2\]: Using the fact that for all $1 \le j \le k - 2$ makes $\langle e^{(k)}, A^{j + 1}b\rangle_A$ true, hence it's also true for $\langle r^{(k)}, A^jb\rangle_A$

Claim 2 is proven $\blacksquare$ 

---
### **Stepsize and A-Orthogonalization**

So inductively, we an figure out the stepsize by considering: 

$$
\begin{aligned}
    e^{(k + 1)} &= e^{(k)} + \alpha_k d_k
    \\
    \underset{[1]}{\implies}
    d_k^TAe^{(k + 1)} &= 
    \langle d_k, e^{(k)} \rangle_A + \alpha_k \langle d_k, d_k \rangle_A = 0
    \\
    \underset{[2]}{\implies} \alpha_k &= 
    - \frac{\langle d_k, e^{(k)} \rangle_A}
    {\langle d_k, d_k \rangle_A}
    \\
    \alpha_k &= - \frac{\langle d_k, r^{(k)} \rangle}
    {\langle d_k, d_k \rangle_A}
\end{aligned}
$$

\[1\]: By **cororallary 1 of clam 1**, $e^{(k + 1)}$ is A-orthogonal to $d_k$, and we only need direction in $d_k$ to because all the other directions will just set the product with $d_k$ to zero. 

\[2\]: Solve for $\alpha_k$. 

Here, becareful about vector $d_k$ that makes the Energy Norm of A negative, or too close to zero, cause that saying that the matrix is not PSD, or, huge numerical errors exists in this context. 

---
### **Determing the Search Directions**





---
### **Unusual Connections**

If we are dealing with Krylov Subspace, and we know that Krylov Subspace are relevant to Arnoldi Iterations, and Lancosz Iterations in the Symmetric Case. 

Therefore, there exists an Arnoldi Iterations interpretations of the conjugate gradient algorithm. 

It's linked to **Claim 1 Corolarry 3**. 



[^1]: $x^{(k)}\in \langle \mathcal{K}_k\rangle$ because $x^{(k)}$ is constructed by a linear combinations of the first $d_k$ conjugate vectors, and the subspace spanned by those conjugate vectors are the same as $\langle \mathcal{K}_k\rangle$. 