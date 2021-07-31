[[Conjugate Gradient]]

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

We make the implicit assumption that matrix $A$ is PSD, purely because it defines a norm for the vector space. 

**The Major Idea**

We need a set of vectors such that they are orthogonal under the A-Inner product space. 

Looking for the solution of a system involving sparse matrix is very similar to looking for the Eigen Decomposition of the matrix, and then modify it at each step during the iterations. 


---
### **Conjugate Directions, or the A-Orthogonal Directions**

Let $\langle d_1, d_2, \cdots, d_k\rangle$ be a set of $A$ orthogonal directions that equals the krylov subspace $\mathcal{K}_k$, the Krylov Subspace is initialized via vector $b$. Now, conjugate directions are interesting in the regard that, if $D = [d_1 d_2...d_k]$, then $D^TAD$ is the identity. 

Notice that, inductively, we wish for the relations between the conjugate set and the Krylov Subspace to be: 

$$
\begin{aligned}
    \langle  d_1\rangle  &= \langle  b\rangle
    \\
    \langle d_1, d_2\rangle &= \langle b, Ab\rangle
    \\
    \langle d_1, d_2, \cdots d_k\rangle &= \langle b, Ab, \cdots A^{k - 1}b \rangle
\end{aligned}
$$

**FACT 1:**

> $x^{(k)}\in \langle \mathcal{K}_k\rangle$ but $r^{(k)}\notin \langle \mathcal{K}_{k} \rangle$

**Justification**
Assume $b\notin \mathcal{K}_k$, $x^{(k)} \in \mathcal{K}_k$[^1], say $x^{(k)} = b + \sum_{j = 1}^{k-1} A^jb$, then $b - Ax^{(k)} \notin \mathcal{K}_k$ which is just $r^{(k)}\notin \mathcal{K}_k$. 


By the face that $x^{(k)} \in \mathcal{K}_k$, we know that $x^{(k)}\in \langle d_1, d_2, \cdots d_k\rangle$, giving us: 

$$
\begin{aligned}
    x^{(0)} &= \sum_{j = 1}^{n} a^{(0)}_j d_j
    \\
    x^{(k)} &= \sum_{j = 1}^{k} a^{(k)}_j d_j
    \\
    x^{+} &= \sum_{j = 1}^{n} a_j^+d_j
\end{aligned}
$$

Note: $x^{(0)}, x^+$ need to be expressed using all the conjugate, if we assume that the system is, solvable, it's solvable only if $b\in \langle\mathcal{K}_k\rangle$

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
    \underset{[1]}{\implies} x^{(k+ 1)} &= \sum_{j = 1}^{k}a_j^+d_j
\end{aligned}
$$

\[1\]: Take notice that, because $d_j$ vector A-Ortho, therefore, it's directly: 

$$
    \sum_{j = 1 }^{k}(a_j - a_j^+)^2 - \sum_{j = k + 1}^{n}(a_j^+)^2
$$

We are implicitly using the PSD property of the matrix $A$ here. 

\[2\]: By the fact that $x\in \mathcal{K}_k$, the subscript for the denoted minimizer. 

However, because $a_j$ where $1 \le j \le k$ corresponds to components that spans $\mathcal{K}_k$, the minimization problem is just directly setting the conjugate vector to zero. 

> Please compare the above formulation of Krylov Subspace to **Claim 1** in [[Conjugate Gradient]]

**Claim 1 Corrolary 1**

> $e^{(k + 1)} \perp_A \langle \mathcal{K}_{k}\rangle$
> The error vector at the $k$ th step is the orthogonal to the Krylov Subspace $\mathcal{K}_k$, because the minimization process removes the components represented by $d_i$ for $\mathcal{K}_{k}$


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

**Simple Explanations** 

\[1\]: using the fact that $A$ is PSD. 

\[2\]: Using the fact that for all $1 \le j \le k - 2$ makes $\langle e^{(k)}, A^{j + 1}b\rangle_A$ true, hence it's also true for $\langle r^{(k)}, A^jb\rangle_A$

Claim 2 is proven $\blacksquare$ 

---
### **Stepsize and A-Orthogonalization**

**Stepping Along the Direction**

From the Recursive formulation of the proof for **Claim 1**, we can say that the reduction of the Relations between $x^{(k)}$ and $x^{(k + 1)}$ can be summarized as: 

$$
\begin{aligned}
    x^{(k + 1)} &= x^{(k)}  + \alpha_k d_k
    \\
    e^{(k + 1)} &= e^{(k)} + \alpha_k d_k
\end{aligned}
$$

Each step we only need to remove the nest components, $d_k$ to prepare for the next guess. Because all previous $d_j$ where $1 \le j \le k - 1$ are handled by previous iterations. 

$e^{(k + 1)}$ is A-Orghogonal to $\mathcal{K}_{k}$, then: 

$$
\begin{aligned}
    \langle  d_k, e^{(k + 1)}\rangle_A &= 0
    \\
    0 &= \langle d_k, e^{(k)} \rangle_A + \alpha_k \langle d_k, d_k \rangle_A
    \\
    \alpha_k &= - \frac{\langle d_k, e^{(k)} \rangle_A}
    {
        \langle d_k, d_k \rangle_A
    }
    \\
    \alpha_k &= - \frac{\langle d_k, Ae^{(k)}\rangle}
    {
        \Vert d\Vert_A^2
    }
    \\
    \alpha_k &= - \frac{d_k^Tr^{(k)}}{\Vert A\Vert_A^2}
\end{aligned}
$$

When the the algorithm starts, we can set the first search direction to be $r^{(0)}$, which is just $b - Ax^{(0)}$, and $x^{(0)}$ is a random guess, which then use $d_1 = r^{(0)}$ to get $\alpha_1$. 

**Updating the Direction**

Now we obtained $x^{(k + 1)}$, and we have $d_k$, we want to use $r^{(k + 1)}$ to fingure out $d_{k + 1}$ that is A-Orthogonal to $d_k$, then by **claim 2**, the new $d_{k + 1}$ is A-Orthogonal to all previous $d_j$ where $1 \le j \le k$

Then if we are considering 

$$
d_{k + 1} = r^{(k)} - \beta_k d_{k}
$$



looking for $\beta_k$, we are considering: 

$$
\begin{aligned}
    d^T_{k}Ad_{k} &= 0
    \\
    \implies 
    d^T_k Ar^{(k)} - \beta_k d_k^T Ad_{k-1} &= 0
    \\
    \beta_k = \frac{d^T_{k-1}Ar^{k}}{d_k^TAd_k}
\end{aligned}
$$

Inductively, I am saying $d_0 = \mathbf{0}$, then $d_1 = r^{(1)} - \beta_kd_0 = r^{(1)}$. 



---
### **Unusual Connections**

If we are dealing with Krylov Subspace, and we know that Krylov Subspace are relevant to Arnoldi Iterations, and Lancosz Iterations in the Symmetric Case. 

Therefore, there exists an Arnoldi Iterations interpretations of the conjugate gradient algorithm. 





[^1]: $x^{(k)}\in \langle \mathcal{K}_k\rangle$ because $x^{(k)}$ is constructed by a linear combinations of the first $d_k$ conjugate vectors, and the subspace spanned by those conjugate vectors are the same as $\langle \mathcal{K}_k\rangle$. 