[[Conjugate Gradient]], [[Krylov Subspace]]

This is the link to the reference resources I used: [here](https://chen.pw/research/cg/cg.pdf)

---
### **Intro**

There are a lot of ways to derive the conjugate Gradient algorithm. 

In [[Conjugate Gradient]] we derived the algorithm using the Gram Schmidt conjugation, here we will minimize the energy norm of the residual vector over the Krylov Subspace. 


**Notations and Quantities** 

* $\langle \bullet \rangle$ means that span of a set of vectors that are in the angle bracket. 
* $\langle u,v \rangle$ is the inner product of 2 vectors
* $\langle u, v \rangle_A$ is the inner product of 2 vectors under the A SPD matrix, basically: $u^TAv$
* $Ax^+ = b$ the equation and it's soltuion is $x^+$, regarded as the optimal value $x^+$. 
* $e^{(k)} = x^{(k)} - x^+$ The error vector, when the solution $x^{(k)}$ is converging. 
* $r^{(k)} = b - Ax^{(k)}$, the residual vector, how far we are from the correct solution on the output space of matrix $A$. 
* $Ae^{(k)} = - r^{(k)}$, The relation between the input space error vector and the output space residual vector. 
* $\Vert x\Vert_A$ is the Energy norm of a vector $\Vert x\Vert_A^2 = x^TAx$, where $A$ is assumed to be SPD. 
* $u\perp_A v$, vector $u, v$ are A-orthogonal to each other, it's equivalent to $\langle u, v \rangle_A$



**Claim: 1** 

> The conjugate graidient algorithm minimizes the energy norm of the error vector at each iterations of the algorithm, which is to say: 
> 
> $$
> \begin{aligned}
>     x^{(k + 1)} &= \arg\min_{x\in \langle K_{k + 1}\rangle} 
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

Let $\langle d_0, d_1, \cdots, d_{k - 1}\rangle$ be a set of $A$ orthogonal directions that equals the krylov subspace $\mathcal{K}_k$, the Krylov Subspace is initialized via vector $v$.

**The Hypotehsis** 

> $$
> \begin{aligned}
>     \langle  d_0\rangle  &= \langle  v\rangle = \langle \mathcal{K}_1 \rangle
>     \\
>     \langle d_0, d_1\rangle &= \langle v, Av\rangle = \langle \mathcal{K}_2 \rangle
>     \\
>     \langle d_0, d_1, \cdots d_{k - 1}\rangle &= \langle v, Av, \cdots A^{k - 1}v \rangle = \langle \mathcal{K}_{k} \rangle
> \end{aligned}
> $$
> Inductively, let's also assume that: 
> $$
> x^{(k)} \in \langle \mathcal{K}_k \rangle
> $$
> And there exists a set of $n$ A-Orthogonal vector $d_i$ that spans $\mathcal{K}_n$ eventually. Recall that, this is possible through the process of **Gram Schimdtz Conjugation** from the previous section. It can be used to make A-Orthogonal vectors using the Evolving Krylov Subspace. Therefore, this assumption is legit. The hypothesis also assumes that $d_0$ is on the same line as $v$. 

By the assumption that $x^{(k)} \in \langle \mathcal{K}_k\rangle$, we know that $x^{(k)}\in \langle d_0, d_1, \cdots d_{k - 1}\rangle$, giving us: 

$$
\begin{aligned}
    x^{(0)} &= \sum_{j = 0}^{n-1} a^{(0)}_j d_j
    \\
    x^{(k)} &= \sum_{j = 0}^{k - 1} a^{(k)}_j d_j
    \\
    x^{+} &= \sum_{j = 0}^{n - 1} a_j^+d_j
\end{aligned}\tag{1}
$$

Note: $x^{(0)}, x^+$ need to be expressed using all the conjugate, if we assume that the system is, solvable, it's solvable only if $b\in \langle\mathcal{K}_j\rangle$, $1 \le j \le n$. 

To verify claim 1, we need to minimize the energy norm of $x$ under the subspace $\langle \mathcal{K}_{k + 1} \rangle$. 

Which them means the statement we consider in **claim 1** would be 

$$
\begin{aligned}
    x^{(k+ 1)} &= \arg\min_{x\in \langle  \mathcal{K}_{k + 1}\rangle} \Vert x - x^+\Vert_A^2
    \\
    \underset{[2]}{\implies}\text{let: } x &= \sum_{j = 0}^{k} a_j d_j 
    \\
    x^{(k+ 1)} &= \arg\min_{x\in \langle  \mathcal{K}_{k + 1}\rangle} 
    \left\Vert
        \underbrace{\sum_{j = 0}^{k} (a_j - a_j^+)d_j}_{\in \mathcal{K}_{k + 1}}
        + 
        \sum_{j = k}^{n - 1} a_j^+ d_j
    \right\Vert_A^2
    \\
    \underset{[1]}{\implies} x^{(k+ 1)} &= \sum_{j = 0}^{k}a_j^+d_j \in 
    \langle  \mathcal{K}_{k + 1}\rangle
    \\
    \implies
    \underbrace{x^{(k + 1)} - x^{+}}_{e^{(k + 1)}} 
    &= 
    - \sum_{j = k + 1}^{n - 1}a_j^+ d_j
\end{aligned}\tag{2}
$$

\[1\]: Take notice that, because $d_j$ vector is A-Ortho, therefore, it's directly: 

$$
    \sum_{j = 0}^{k}(a_j - a_j^+)^2 - \sum_{j = k + 1}^{n - 1}(a_j^+)^2
$$

We are implicitly using the PSD property of the matrix $A$ here. 

\[2\]: By the fact that $x\in \mathcal{K}_{k + 1}$, the subscript for the denoted minimizer. However, because $a_j$ where $0 \le j \le k$ corresponds to components that spans $\mathcal{K}_{k + 1}$, the minimization problem is just directly setting the conjugate vector to zero. 

**Observe:**

The inductive assumtpion $x\in \langle \mathcal{K}_k \rangle$ holds true. 

We found an expression for $x^{(k + 1)}$ from it, which is going to be the next guess produced by the conjugate gradient algorithm. 

At each iterations, the vector compnents for $x^{k}$ will get projected onto a A-Orthogonal Direction $d_{k}$. One by One, we get closer and closer to $x^{+}$, measured under the energy norm. And Mathematically, I am saying that: 

$$
x^{(k + 1)} - x^{(k)} = a_k^+d_k
$$



> Please compare the above formulation of Krylov Subspace to **Claim 1** in [[Conjugate Gradient]]

**Claim 1 Corolary 1**

> $e^{(k)} \perp_A \langle \mathcal{K}_{k}\rangle$
> The error vector at the $k$ th step is the orthogonal to the Krylov Subspace $\mathcal{K}_k$, because the minimization process removes the components represented by $d_i$ for $\mathcal{K}_{k}$

**Proofs**

Reconsider the results from expression (2).

$$
\begin{aligned}
    e^{(k)} &= - \sum_{j = k}^{n - 1}
        a_j^+ d_j
    \\\iff
    \langle e^{(k)}, d_j \rangle_A &= 0\quad \forall 
    \; 0 \le j \le k - 1
    \\ \iff
    e^{k} &\perp_A \langle 
        d_0, d_1, \cdots d_{k - 1}
    \rangle
    \\\iff
    e^{(k)} &\perp_A
    \langle \mathcal{K}_k \rangle
\end{aligned}\tag{2.1}
$$

However, as long as $e^{(k)}$ is not zero, it will be the case that $e^{(k)}\in \langle \mathcal{K}_n \rangle\setminus\langle \mathcal{K}_{k}\rangle$

**Claim 1 Corolary 2**
> $r^{(k)}\notin \langle \mathcal{K}_{k} \rangle$, but $r^{(k)}\in \langle \mathcal{K}_{k + 1}\rangle$, which them means that $r^{(k + 1)}\notin \langle \mathcal{K}_{k + 1} \rangle$ then $\langle r^{(k + 1)}, r^{(k)}  \rangle = 0$, because $\langle \mathcal{K}_k\rangle\subseteq \langle \mathcal{K}_{k + 1}\rangle$

**Proof**

Consider Results from expression (2): 

$$
\begin{aligned}
    x^{(k)} &=  \sum_{j = 0}^{k - 1} a_j^{+} d_j \in 
    \langle \mathcal{K}_k \rangle
    \\
    b = Ax^+  \implies  b &= \sum_{j = 0}^{n - 1} a^+_jAd_j
    \\
    \implies
    b - Ax^{(k)} &= - \sum_{j = k}^{n - 1}a_j^{+}Ad_j
    \\
    \implies 
    \forall 0 \le i \le k - 1 & \quad 
    \left\langle  
        \sum_{j = k}^{n}
        a_j^+Ad_j,
        d_i
    \right\rangle = 0
    \\
    \implies
    r^{(k)} & \notin \langle d_0, d_1, \cdots d_{k - 1} \rangle
    \\
    \implies 
    r^{(k)} & \notin \langle \mathcal{K}_{k} \rangle
\end{aligned}
\tag{3}
$$
In addition, notice that by setting $0\le i \le k$, we have: 

$$
\begin{aligned}
    \left\langle  
        \sum_{j = k}^{n}
        a_j^+Ad_j,
        d_i
    \right\rangle &= \Vert d_k\Vert_A^2 \neq 0
    \\\implies 
    r^{(k)} &\in \langle \mathcal{K}_{k + 1} \rangle
\end{aligned}
$$

**Proof 2**

Let's consider another that proof that is based on claim 1 corollary 1. 

$$
\begin{aligned}
    e^{(k)} & \perp_A \langle \mathcal{K}_k \rangle 
    \\
    \iff 
    \langle e^{(k)}, A^jb \rangle_A &= 0
    \quad \forall \; 0 \le j \le k - 1 
    \\
    \underset{[1]}{\iff}
    \langle Ae^{(k)}, A^jb \rangle &= 0
    \quad \forall \; 0 \le j \le k - 1 
    \\\iff
    \langle r^{(k)}, A^{j}b \rangle &= 0
    \quad \forall \; 0 \le j \le k - 1 
    \\
    \iff 
    r^{(k)} &\perp \langle \mathcal{K}_{k} \rangle
\end{aligned}
$$


**Claim 1 Corollary 3**

> $\langle r^{(k)}, r^{(j)}\rangle = 0$ for all $0 \le j \le k - 1$

Note the property of Krylov Subspace is: 

$$
\langle  \mathcal{K}_1\rangle \subseteq \langle  \mathcal{K}_2\rangle \subseteq \langle  \mathcal{K}_3\rangle \cdots \subseteq \langle  \mathcal{K}_n\rangle
$$

Here we assume that the subsets are strict, again, because the matrix is SPD. 

Since $r^{(k)} \notin \langle \mathcal{K}_{k} \rangle$ and $r^{(k)} \in \langle \mathcal{K}_{k + 1} \rangle$ then $r^{(k)}\in \langle \mathcal{K}_{k + 1} \rangle\setminus \langle \mathcal{K}_{k} \rangle$ 

So then basically, $r^{(j)}\in \langle \mathcal{K}_{k} \rangle$ for all $0 \le j \le k- 1$, but then this means $\langle r^{(j)}, r^{(k)}\rangle = 0$ for all $0 \le j \le k - 1$ by that property of the Krylov Subspace. 

One way to think about it is that, the residual vector gotten using the conjugate gradient is the orthogonal directions in which, the Krylov Subspace has evolved (or stretched) after that iterations. 


---
### **The Magics, The Residual Vector**

**Claim 2**
> Then, A-orthogonalizing the vector $r^{(k)}$ against the last search direction will allow us to get the next search directions. 

**Justification**: 

By the corolary 2 of claim 1, we have $e^{(k)} \perp_A \mathcal{K}_{k}$, but then this also means 

Then: 
$$
\begin{aligned}
    \langle e^{(k)}, A^jb\rangle_A &= 0 \quad \forall\; 0 \le j \le k - 1
    \\
\end{aligned}
$$

Consider:

$$
\begin{aligned}
    & \langle r^{(k)}, A^jb \rangle_A = 0
    \\
    &\langle Ae^{(k)}, A^jb \rangle_A = 0
    \\
    \underset{[1]}{\iff} &  
    \langle e^{(k)}, A^{j + 1}b \rangle_A = 0
    \\
    \iff &
    0 \le j \le k - 2
    \\
    \underset{[2]}{\implies} &
    r^{(k)} \perp_A \langle \mathcal{K}_{k - 1} \rangle
    \\
    \implies & 
    r^{(k)} \perp_A \langle d_0, d_1, \cdots, d_{k - 1} \rangle
\end{aligned}\tag{4}
$$

Therefore, we only need to orthogonalize the vector $r^{(k)}$ against $d_{k - 1}$ to determine the next A-Orthogonal (or the next conjugate vector) search direction. 

**Explanations** 

\[1\]: using the fact that $A$ is PSD. 

\[2\]: Using the fact that for all $0 \le j \le k - 2$ makes $\langle e^{(k)}, A^{j + 1}b\rangle_A$ true, hence it's also true for $\langle r^{(k)}, A^jb\rangle_A$

Claim 2 is proven $\blacksquare$ 

---
### **Stepsize and A-Orthogonal Direction (A step into the right direction)**

**Note:**  To avoid confuction, I will use $d_0$ as the initial stepsizes for improving $x^{(0)}$ for getting the next step of the iterations, $x^{(1)}$. But **remember**, the $d_0$ here is actually the $d_1$ for the theory part of the algorithm. 


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
    -\frac{\langle d_k, e^{(k)} \rangle_A}
    {\langle d_k, d_k \rangle_A}
    \\
    \alpha_k &= - \frac{\langle d_k, -r^{(k)} \rangle}
    {\langle d_k, d_k \rangle_A}
    \\
    \alpha_k &= \frac{\langle d_k, r^{(k)} \rangle}
    {\langle d_k, d_k \rangle_A}
\end{aligned}\tag{5}
$$

\[1\]: By **cororallary 1 of clam 1**, $e^{(k + 1)}$ is A-orthogonal to $d_k$, and we only need direction in $d_k$ to because all the other directions will just set the product with $d_k$ to zero. 

\[2\]: Solve for $\alpha_k$. 

Here, becareful about vector $d_k$ that makes the Energy Norm of A negative, or too close to zero, cause that saying that the matrix is not PSD, or, huge numerical errors exists in this context. 


**A-Orthogonal Direction**

From the conclusion of claim 2, we only need to remove components of $r^{(k)}$ (Which can be figured out based on $x^{(k + 1)}$) on the last direction $d_{k}$ to get the new direction $d_{k + 1}$ for figuring out $x^{(k + 1)}$

$$
\begin{aligned}
    d_{k + 1} &= r^{(k + 1)} + \beta_{k}d_{k} 
    \\\underset{[1]}{\implies}
    d_{k}^TAd_{k + 1} &= 0
    \\
    \underset{[2]}{\implies}
    0 &= d_k^TAr^{(k + 1)} + \beta_k d^T_{k}Ad_k
    \\
    \beta_k &= -\frac{d_k^TAr^{(k + 1)}}{d_k^TAd_k}
    \\
    \beta_k &= -\frac{\langle d_k, r^{(k + 1)} \rangle_A}
    {\langle  d_k, d_k\rangle_A}
\end{aligned}\tag{6}
$$

**Explanation**

\[1\]: We only need to remove project onto the last direction to make the next orthogonal vector. Let's asserts the fact that the A-Inner product with the previous direction is zero. 

\[2\]: Set the RHS to zero and solve for $\beta_k$. 

**Observe:** 

This still a very different results compare to the deriation of the CG without using the idea of Krylov Subspace. 

**Alternate Form for $\beta_k, \alpha_k$**

$$
\begin{aligned}
    \beta_k &= - \frac{\langle d_k, r^{(k + 1)}\rangle_A}
    {
        \Vert d_k\Vert_A^2
    }
    \\\underset{[1]}{\implies}
    \beta_k &= - \frac{\langle e^{(k + 1)} - e^{(k)}, r^{(k + 1)} \rangle_A}
    {\alpha_k \Vert d_k\Vert_A^2}
    \\\underset{[2]}{\implies}
    \beta_k &= -
    \frac{\langle -r^{(k + 1)} + r^{(k)}, r^{(k + 1)}\rangle}
    {
        \alpha_k \Vert d_k\Vert_A^2
    }
    \\
    \beta_k &=
    \frac{\Vert r^{(k + 1)}\Vert_2^2}
    {
        \alpha_k \Vert d_k\Vert_A^2
    }
    \\
    \beta_k &= \frac{\Vert r^{(k + 1)}\Vert_2^2}
    {
        \langle d_k, r^{(k)} \rangle
    }
\end{aligned}\tag{7}
$$

\[1\]: Break $\alpha_kd_k = e^{(k + 1)} - e^{(k)}$ using expression (5). 

\[2\]: Merge in the $A$ from the subscript to the inside of the inner product. 


$\langle d_k, r^{(k)} \rangle$ can be simplified with assumption $d_0 = r^{(0)}$, but we will need to unroll the recurrence and use the Third Corollary from claim 2. 


**Simplifying $\langle d_k, r^{(k)} \rangle$** 

---
### **Initializing the Residual $r^{(0)}$**

Consider the following recurrent based on expression (6), with the extra assumption that $d_0 = r^{(0)}$, which essentially makes $d_{k + 1}$ a linear combinations of residual. 

$$
\begin{aligned}
    d_{k + 1} &= r^{(k + 1)} + \beta_k d_k 
    \\
    &= r^{(k + 1)} + \beta_k(r^{(k)} + \beta_{k -1}d_{k - 1})
    \\
    &= r^{(k + 1)} + \beta_k (r^{(k)} + \beta_{k - 1}(r^{(k - 1)} + \beta_{k - 2}d_{k - 2}))
    \\
    &= r^{(k + 1)} + \sum_{i = 1}^{k}
        \left(\prod_{j = i}^{k} b_j\right) r^{(i)}
\end{aligned}\tag{8}
$$

Therefore, using Corollary 3 from claim 1, it's not hard to see that $d_k^Tr^{(k)} = (r^{(k)})^T r^{(k)} = \Vert r^{(k)}\Vert_2^2$. 

Then, we can simplify the stepsize $\alpha_k$ and conjugate coefficient $\beta_k$ into the following: 


$$
\alpha_k = \frac{\langle r^{(k)}, r^{(k)} \rangle}
                {\langle d_k, d_k \rangle_A}
\quad 
\beta_k = \frac{\Vert r^{(k + 1)}\Vert_2^2}
{
    \langle r^{(k)}, r^{(k)} \rangle
}\tag{9}
$$

Finally, we will be able to use phrase the algorithm and prove that that claim is corret. 

---
### **The Conjugate Gradient Algorithm**

> Choose any $x^{(0)}$ as the initial guess for the conjugate gradient iterations. 
> 
> $$
> \begin{aligned}
>     & d_0 = r^{(0)}
>     \\
>     & \text{for } k = 0, 1, \cdots , n - 1
>     \\ 
>     &\hspace{2em}
>     \begin{aligned}
>         & r^{(k)} = b - Ax^{(k)}
>         \\
>         & \alpha_k = \frac{\Vert r^{(k)}\Vert_2^2}
>         {
>             \Vert d_k\Vert_A^2
>         }
>         \\
>         & x^{(k + 1)} = x^{(k)} + \alpha_k d_k
>         \\
>         & \beta_k = \frac{\Vert r^{(k + 1)}\Vert_2^2}
>         {\Vert r^{(k)}\Vert_2^2}
>         \\
>         & d_{k + 1} = d_{k} + \beta_k d_k
>     \end{aligned}
> \end{aligned}
> $$

**Claim 1 has been proven**  $\blacksquare$

**Potential Failure**

This algorithm fails when the matrix is Symmetric Semi-Definite, but no positive definite. 

Depending on the Conditioning of the matrix $A$, a small residual doesn't imply a small error.


---
### **Unusual Connections**

If we are dealing with Krylov Subspace, and we know that Krylov Subspace are relevant to Arnoldi Iterations, and Lancosz Iterations in the Symmetric Case. 

Therefore, there exists an Arnoldi Iterations interpretations of the conjugate gradient algorithm. 

It's linked to **Claim 1 Corolarry 3**. 



[^1]: $x^{(k)}\in \langle \mathcal{K}_k\rangle$ because $x^{(k)}$ is constructed by a linear combinations of the first $d_k$ conjugate vectors, and the subspace spanned by those conjugate vectors are the same as $\langle \mathcal{K}_k\rangle$. 