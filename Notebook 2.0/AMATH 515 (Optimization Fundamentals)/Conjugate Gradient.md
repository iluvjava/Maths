We need the prelude: [[Steepest Descend for Matrix Vector]]. 

The reference resource is [here](https://sites.math.washington.edu/~morrow/498_13/conjgrad.pdf)
 
---
### **Intro**

Must read the Steepest Descend for Matrix Vector first before reading this many of the quantities are defined there and we continued using it. 

It's been show previously that just taking the best step at each iterations doesn't make the algorithm converges with a maximal number of steps.

We continue the saga from steepest gradient descend. And the method we introduced here is just an improvement of the steepest gradient descend for solving symmetric matrices. 

In Steepest descend we shown that it's slow when $\mu = \kappa$, to mitigate we think of the idea of $A$ orthogonal direction $d$, and by $A$ orthogonal we mean that: $d^TAd =0$. 

**Major Inspiration**: 
> If the steepest direction is one of the eigen-vector, then the algorithm will converge at exactly one iteration. So... What if we always walk in directions that are orthogonal in term of projection onto the eigen vectors? 

**Consider:** 

$$
x^{(k + 1)} = x^{(k)} + \alpha_{k} d^{(k)}
\tag{1}
$$

$$
d^{(k + 1)} \perp \left\langle 
    d^{(1)}, d^{(2)}, \cdots,  d^{(k)}
\right\rangle_A
\tag{2}
$$

**Definition:**

Vector $u, v$ are conjgute for the matrix $A$ means that: 

$$
u^TAv = 0
$$

---
### **N Steps Convergence of Conjugate Direction**

**Claim 1:** 

> Choosing a $A$ orthogonal directions for the steepest gradient descend will force the algorithm to converge in at most $n$ steps. 

**Claim 2:**

> Vectors that point to conjugate direction are orthogonal under the eigen space of the matrix $A$. 

Consider expression $e^{(0)} = x^{(0)} - x^{+}$, the first error on the input space for the matrix $A$, and then we project it onto the vector (Because $d^{(k)}$ are a special kind of orthogonal, more on this later). 

$$
\begin{aligned}
    e^{(0)} &= \sum_{j = 0}^{n - 1}\delta_jd^{(j)} 
\end{aligned}
\tag{2.1}
$$

**Consider:** 

$$
\begin{aligned}
    e^{(0)} &= \sum_{j = 0}^{n - 1}\delta_jd^{(j)} 
    \\
    Ae^{(0)} &= 
    \sum_{j = 0}^{n - 1}
        \delta_j Ad^{(j)}
    \\
    d^{(k)}Ae^{(0)} 
    &=
    \underbrace{\sum_{j = 0}^{n - 1}
        \delta_j d^{(k)T}Ad^{(j)}}_{\delta_kd^{(k)}Ad^{(k)}}
    \\
    \delta_k 
    &= 
    \frac{d^{(k)T}Ae^{(0)}}
    {
        d^{(k)T}Ad^{(k)}
    }
    \\
    \underset{
        (1)
    }
    {\implies}
    \delta_k
    &= 
    \frac{
        d^{(k)T}A(e^{(0)} + \sum_{j = 0}^{k-1} \alpha_jd^{(j)})
    }
    {
        d^{(k)T}Ad^{(k)}
    }
    \\
    \underset{(2)}{
        \implies
    }
    \delta_k &= 
    \frac{
        d^{(k)T}Ae^{(k)}
    }{
        d^{(k)T}Ad^{(k)}
    }
    \\
    \delta_k &= 
    \frac{-d^{(k)T}r^{(k)}}{\Vert d^{(k)}\Vert_A^2}
\end{aligned}
\tag{3}
$$

* (1): At this point, we just added $\sum_{j = 0}^{k - 1}\alpha_jd^{j}$, but because all the $d^{(i)} \;\forall\; 0 \le i \le k - 1$ are $A$ orthogonal to $d^{(k)}$, so expanding it out will just give us zero. 

* (2): Because $e^{(k)} = x^{(k)} - x^{+} = x^{(0)} + \sum_{j = 0}^{k - 1}\alpha_kd^{(k)} - x^{+} = e^{(0)} + \sum_{j = 0}^{k - 1}\alpha_kd^{(k)}$. 

Consider doing steepest descend on the direction of $d^{(i)}$, which will be giving us: 

$$
\begin{aligned}
    \partial_\alpha [f(x^{(k + 1)})] &= 
    \partial_\alpha[f(x^{(k)} + \alpha d^{(k)})]
    \\
    &= 
    \nabla_x[f(x^{(k + 1)})]^Td^{(k)}
    \\
    \text{set:}\quad 
    \partial_\alpha [f(x^{(k + 1)})] &= 0
    \\
    \underset{(1)}{\implies}
    r^{(k + 1)T}d^{(k)} &= 0
    \\
    \implies 
    Ae^{(k + 1)T}d^{(k)} &= 0
\end{aligned}\tag{4}
$$

* (1): Recall that $r^{(k)} = b - Ax^{(k)}$ and $\nabla_x[f(x)] = Ax - b$ from Steepest Descend Matrix Vector. 

Therefore, we can figure out the $\alpha$ for the conjugate direction, similar to what we did for the steepest descend in the previous case. 

$$
\begin{aligned}
    r^{(k + 1)T}d^{(k)} 
    &= 0
    \\
    [b - Ax^{(k + 1)}]^Td^{(k)} &= 0
    \\
    [b - A(x^{(k)} + \alpha_k  d^{(k)})]^Td^{(k)} &= 0
    \\
    [b - Ax^{(k)} - \alpha_k A d^{(k)}]^Td^{(k)} &= 0
    \\
    [r^{(k)} - \alpha_k Ad^{(k)}]^Td^{(k)} &= 0 
    \\
    \alpha_k &= \frac{r^{(k)T}d^{(k)}}{d^{(k)T}Ad^{(k)}}
    \\
    \alpha_k &= \frac{r^{(k)T}d^{(k)}}
    {
        \Vert d^{(k)}\Vert_A^2
    }
\end{aligned}\tag{5}
$$

And that is the the step distance to take if the direction we are looking at is the conjugate direction. 

**Note (1)**: Reader, please compare (5) and (3) and conclude that $\alpha_k = -\delta_k$. 

Finally, if we use do this, we have a series of linear combinations on the conjugate directions, it's like $\alpha_0d^{(0)} + \alpha_1 d^{(1)} + \alpha_2 d^{(2)} \cdots$

Consider: 

$$
\begin{aligned}
    e^{(k)} &= e^{(0)} + \sum_{j = 0}^{k - 1}\alpha_jd^{(j)}
    \\
    \underset{(1)}{\implies}
    e^{(k)}&= 
    e^{(0)} - \sum_{j = 0}^{k - 1} \delta_jd^{(j)}
    \\
    \underset{2.1}{\implies}
    e^{(k)}&= 
    \sum_{j = k}^{n - 1} \delta_j d^{(j)}
\end{aligned}
\tag{6}
$$

* (1): Recall **Note(1)**

Therefore, after $n$ iterations, the error vector will goes to zero, which means that $x^{(k)} = x^+$


**Claim 1** Has been proven. 

---
### **Conjugation**

So, if we can have an algorithm that generate a sequence of vectors that are conjugate to each other, then we have a set of direction we can go to speed up the steepest descend algorithm. 

But, how? 

**Claim 3:**

> Gram Schmidt conjugate process is going to be slow if we are using it. And it has connection with Gaussian Elimination too. The process itself is a way of generating a set of conjugate vectors, similar to the Gram Schimidt process used for QR decomposition of matrices, but instead of ending up with orthogonal vectors, we start with orthogonal vectors and ends up with conjugate vectors. 

#### **Gram Schimidt Conjugation**

Given a set of orthogonal vectors $\{u_i\}_{i = 1}^n$ that spans the whole $\mathbb{R}^{n}$ (Standard Basis vectors are an ok choice here), where, the matrix $A$ is $n\times n$.

To construct a set of vectors that are $A$ orthogonal, we would need to subract from the vector $u_i$ with components span by the vectors $d^{(i < k)}$. Mathematically: 

$$
\begin{aligned}
    d^{(k)} &= u_{k} + \sum_{i = 1}^{k - 1}
        \beta_{k, i} d^{(i)}
\end{aligned}
\tag{7}
$$

Now, let's consider any $k > m$, which means that: 

$$
\begin{aligned}
    d^{(m)T}Ad^{(k)} &= d^{(m)T}Au_{k} + d^{(m)T}A 
        \sum_{i = 1}^{k - 1}\beta_{k, i}d^{(i)}
    \\
    0 &= d^{(m)T}Au_{k} + \beta_{k, m}d^{(m)T}Ad^{(m)}
    \\
    \beta_{k, m} &= 
    - \frac
    {
        d^{(m)T}Au_{k}
    }
    {
        \Vert d^{(m)}\Vert_A^2
    }
\end{aligned}
\tag{8}
$$

Therefore, we have a way of computing (7), because the coefficients are determined in (8), giving us the expression that: 

$$
\begin{aligned}
    d^{(k)} &= u_{k} - \sum_{i = 1}^{k - 1}
    \frac{
        d^{(i)T}Au_{k}
    }{
        \Vert d^{(i)}\Vert_A^2
    }
    d^{(i)}
\end{aligned}\tag{9}
$$

Claim 3 has been clarified. 

**Fact:** 

> If the set of vector $u_i$ where chosen to be the standard basis vector, $e_i$, then this conjugate direction steepest descend method is known as Gaussian Eliminations. 

It's stated as a fact because I don't want to prove it in this document yet, and it's also stated without a proof in the reference literature. 

**Why?**

> Walking in the conjugate direction is walking in a space stretched by eigenvectors of $A$, in an orthogonal manner. Recall that matrix $A$ is Sym Definite, which means that it's transformation it's described by stretching with an orghonal basis. 


---
### **Conjugation and Residual Direction**

We are interested in the residual direction $\{r^{(i)}\}_{i = 0}^{n - 1}$ when we use the conjugate directions for gradient descend. 

**Claim 3**

> The residual direction at the $j$ of the iteration is orthogonal to all previous conjugate direction, mathematically: 
> $$r^{(j)T}d^{(i)} = 0 \quad \forall i < j$$

Let's continue with (6.1), and then we have: 

$$
\begin{aligned}
    e^{(k)} &= \sum_{j = k}^{n - 1} \delta_j d^{(j)}
    \\
    e^{(j)} &= \sum_{k = j}^{n - 1} \delta_kd^{(k)}
    \\
    Ae^{(j)} &= \sum_{k = j}^{n - 1}
        \delta_k Ad^{(k)}
    \\
    -d^{(i)T}Ae^{(j)} &= \underbrace{-d^{(i)T}\sum_{k = j}^{n - 1}\delta_k Ad^{(k)}}_{= 0}
    \\
    d^{(i)T}r^{(j)} &= 0 \quad \forall\; i < j
\end{aligned}\tag{10}
$$

At the last step, the RHS equals to zero because, all the conjugate direction, $d^{(k)}$ inside the sum is going from $j$ to $n - 1$, but the vector outside of the sum, $d^{(i)}$ has $i < j$, therefore, it's by property of conjugation, all $d^{(k)}$ inside the sum is orthogonal to $d^{(i)}$. 

**Claim 3** has been proved. $\blacksquare$

**Claim 4**

> The residual direction at iteration $j$ is also orthongonal to all previous $u_i$, $i < j$, when conjugate direction is chosen. 

Start with expression (7) we have: 

$$
\begin{aligned}
    d^{(i)} &= u_i + \sum_{k = 0}^{i - 1} \beta_{i, k}d^{(k)}
    \\
    r^{(j)T}d^{(i)} &= r^{(j)T}u_i + r^{(j)T}\sum_{k = 0}^{i - 1}\beta_{i, k}d^{(k)}
    \\
    \underset{\text{claim 3}}{\implies} 0 &= r^{(j)T}u_i
\end{aligned}\tag{11}
$$

$\underset{\text{claim 3}}{\implies}$ we cancel out the summation because $r^{(j)}\perp d^{(k)}$ when $k$ goes from $0$ to $i - 1$, all values of $k$ inside the sum is less than $i$. 

Claim 4 $\blacksquare$

**Claim 4 Corollary**: 

> Choose $u_i = r^{(j)}$, then $r^{(i)T}r^{(j)} = 0$ whenever $i \ne j$. [^1]

**Claim 4 Corollary 2**
 
> Choose $i = j$, we have $r^{(i)T}d^{(i)} = r^{(i)T}u_i$

---
### **Conjugate Gradient Descend**

The direction of $\{u_i\}_i^{n}$ is the residual direction. 

**Claim 5**

> Using the residual vector during the iterations will simplify the Gram Schidt Conjugation process significantly. basically let $u_i = r^{(i)}$. 

Recall from expression (8), we have $\beta_{k, m} = -d^{(m)^T}Au_k/\Vert d^{(m)}\Vert_A^2$, the beta coefficient for the next step is $k + 1$, which means that we have: 

$$
\begin{aligned}
    \beta_{m + 1, m} &= -d^{(m)^T}Au_{m + 1}/\Vert d^{(m)}\Vert_A^2    
    \\
    \text{let: }\quad u_{m + 1} &= r^{(m + 1)} 
    \\
    -\beta_{m + 1, m} &= r^{(m + 1)T} Ad^{(m)} /\Vert d^{(m)}\Vert_A^2
\end{aligned}
\tag{12}
$$

We need to find $r^{(m + 1)T} Ad^{(m)}$. 

Starting with expression (6), we have: 

$$
\begin{aligned}
    e^{(k)} &= e^{(0)} + \sum_{j = 0}^{k - 1}
        \alpha_jd^{(j)}
    \\
    e^{(k + 1)} &= e^{(0)}  + \sum_{j = 0}^{k}\alpha_j d^{(j)}
    \\
    e^{(k + 1)} - e^{(k)} &= \alpha_k d^{(k)}
\end{aligned}\tag{13}
$$

Then, consider the expression for the residual vector at $j + 1$ iteration.

$$
\begin{aligned}
    r^{(j + 1)} &= -Ae^{(j + 1)}
    \\
    &= -A(e^{(j)} + \alpha_{j} d^{(j)})
    \\
    &= r^{(j)} - \alpha_{j} Ad^{(j)}
    \\
    r^{(i)T}r^{(j + 1)} &=  r^{(i)T}r^{(j)} - \alpha_{j} r^{(i)T}Ad^{(j)}
    \\
    \alpha_{j}r^{(i)T}Ad^{(j)} &= r^{(i)T}r^{(j)} - r^{(i)}r^{(j + 1)}
\end{aligned}
\tag{14}
$$

Now, there are several cases of values for $\alpha_i$, and it depends on the value of $i, j$. 

* Consider $i < j$, From the **corollary of claim 4**, when $i<j$, the right handside is always zero, which implies that $\beta_{i, j} = 0$. 

* When $i = j$, we have $\Vert r^{(i)}\Vert_2^2$, but we don't need this for the conjugation.

* Consider $i = j + 1$, then 

$$
\begin{aligned}
   \alpha_{j}r^{(j + 1)T}Ad^{(j)} &= r^{(j + 1)T}r^{(j)} - r^{(j + 1)}r^{(j + 1)}
   \\
   r^{(j + 1)T}Ad^{(j)} &= \frac{-\Vert r^{(j + 1)}\Vert_2^2}{\alpha_j}
   \\
   \frac{r^{(j + 1)T}Ad^{(j)}}{\Vert d^{(j)}\Vert_A^2}
   &= 
   \frac{-\Vert r^{(j + 1)}\Vert_2^2}{\alpha_j \Vert d^{(j)}\Vert_A^2}
   \\
   -\beta_{j + 1, j} &= \frac{-\Vert r^{(j + 1)}\Vert_2^2}{\alpha_j \Vert d^{(j)}\Vert_A^2}
   \\
   \beta_{j + 1, j} &= \frac{\Vert r^{(j + 1)}\Vert_2^2}{\alpha_j \Vert d^{(j)}\Vert_A^2}
\end{aligned}\tag{15}
$$

Now, we will have the ability to simplify expression (9), and the conjugate direction at the $j$ th iteration will be easier to compute because it doesn't require all the previous conjugate direction to compute the new conjugate direction anymore. 

$$
d^{(i + 1)} = r^{(i + 1)} + \beta_{i + 1, i} d^{(i)}\tag{16}
$$

Claim 5 $\blacksquare$

---
### **The Conjugate Gradient Algorithm**

The algorithm for the conjugate gradient is: 

$$
\begin{aligned}
    d^{(0)} &= b - Ax^{(0)} 
    \\
    \alpha_{i} &= \frac{r^{(i)T}d^{(i)}}
    {\Vert d^{(i)}\Vert_A^2}
    \\
    x^{(i + 1)} &= x^{(i)} + \alpha_i d^{(i)}
    \\
    r^{(i + 1)} &= r^{(i)} - \alpha_iAd^{(i)}
    \\
    \beta_{i + 1} &= \frac{\Vert r^{(j + 1)}\Vert_2^2}{r^{(i)T}d^{(i)}}
    \\
    d^{(i + 1)} &= r^{(i + 1)} + \beta_{i + 1}d^{(i)}
\end{aligned}
$$

Note: Corollary 2 of Claim 4 can help further simplifies the expression for $\alpha_i$, and hence, $\beta_{i + 1}$ too. [^2]

**Practical Concerns**

The residual will need to be recomputed every $N$ steps or so using $r^{(i + 1)} = b - Ax^{(i + 1)}$ to adjust for numerical precision. 


---
### **Preconditioning**




---
### **Augmentation**

> If the matrix is not SPD (Symmetric Positive Definite). 

Instead, we want to solve the equation $Ax = b$, then, consider $A^TAx = A^Tb$ instead, where, $A^TA$ will be symmetric and it will be positive definite when it's full rank.


> Given a matrix that is symmetric but it's not positive definite.

Then in that case, we want to solve $AAx = Ab$ instead, and in this case $A^2$ will be SPD, given that $A$ is symmetric. 

### **Misc** 

* Conjugate gradient is a special form of accelerated gradient. The residual vector is secretly a gradient, and the conjugation is secretly a momentumn term. 
* Bi-conjugate gradient stabalized is a mix of Conjugate Gradient and General Residual Method.  
* It can solve no-linear system, in a locally convex region, a trusted region of the objective function. 
* Conjugate Gradient has a connection to the 3 terms recurrences of suggested by the Lancozs Algorithm
 

[^1]: None
[^2]: Basically $d^{(i)}$ got swapped into $r^{(i)}$, in the case of CG the residual is the assisting subspace, the $u_i$ vectors. 