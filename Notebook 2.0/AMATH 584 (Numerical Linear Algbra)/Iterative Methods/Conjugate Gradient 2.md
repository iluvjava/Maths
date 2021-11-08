[[Conjugate Gradient]], [[Conjugate Gradient with Krylov Subspace]], [[Lancosz Algoritm]]

We are going to delve way deep into the Conjugate Gradient Algorithms. 

Tyler Chen's Work [here](https://chen.pw/research/cg/cg.pdf)

---
### **Intro**

Here, we are interested in the formulation made by professor Green Baum in her book. Which is simpler. 

Anne Green Baum: 

> I can do it with the minimal amount of basics assumptions. To prove everything needed for the conjugate gradient algorithm, please consider the following formulations of the algorithms: 

**Assumptions for the Algorithm**

The matrix $A$ is positive semi-definite and hermitian. 

**The Algorithm**

> $$
> \begin{aligned}
>     & x^{(k + 1)} = x^{(k - 1)} + a_{k - 1}p^{(k - 1)}
>     \\
>     & r^{(k)}  = r^{(k - 1)} - a_{k - 1}Ap^{(k - 1)}
>     \\
>     & p^{(k)} = r^{(k)} + b_{k - 1}p^{(k - 1)}
> \end{aligned}\tag{1}
> $$

And we are going to assume the following for starting the algorithm: 

$$
r^{(0)} = b - Ax^{(0)} \quad e^{(k)} = x^+ - x^{(k)} \quad Ax^+ = b \quad p^{(0)} = r^{(0)} 
$$


**Interpreations of the constrant parameters**

$$
\begin{aligned}
    a_{k - 1} &= \arg\min_a \left\lbrace
        \left\Vert
             e^{(k - 1)} - ap^{(k - 1)}
        \right\Vert_A^2
    \right\rbrace
    \\
    -b_{k - 1} &= \arg\min_b \left\lbrace
        \left\Vert
             r^{(k)} - bp^{(k - 1)}
        \right\Vert_A^2
    \right\rbrace
\end{aligned}\tag{2}
$$

Where, the parameter $a_{k - 1}$ is made to minimize the projection of $r^{(k)}$ along the direction of $Ap^{(k - 1)}$, which is the same as minimizing the energy norm of $e^{(k - 1)}$ defined via $A$ using the direction $p^{(k - 1)}$. 

The paramter $b_{k - 1}$ is made so that the next search direction $p^{(k)}$ is A-orthogonal to the previous search direction $p^{(k - 1)}$. 

**Stepsize and conjugation Projection**

Solvin (2), we have: 

> $$
> \begin{aligned}
>     a_{k - 1} = \frac{\langle r^{(k - 1)}, p^{(k - 1)} \rangle}
>     {
>         \langle p^{(k - 1)}, Ap^{(k - 1)} \rangle
>     }
>     & \quad
>     b_{k - 1} = - \frac{\langle r^{(k)}, Ap^{(k - 1)} \rangle}
>     {
>         \langle  p^{(k - 1)}, Ap^{(k - 1)}\rangle
>     }
> \end{aligned}\tag{3}
> $$

The proof is skipped. 

**Consequences**

$$
\langle p^{(k - 1)},  Ap^{(k)}\rangle = 0 \quad \langle r^{(k)}, p^{(k - 1)} \rangle = 0\tag{4}
$$

The proof is trivial, derived directly from the definition in (3). 


---
### **Important Properties of the Algorithms**

During the running of the algoritm and under the assumptions with rational arithematic, the following conditions can be asserted: s

**Property 1**

> $$
> \langle e^{(k)}, Ap^{(j)} \rangle = 0 \quad \forall \; 1 \le j \le k - 1
> $$

Error vectors on the domain of operator $A$ is reduced on the direction of $p^{j}$

**Property 2**

> $$
> \langle  p^{(k)}, A p^{(j)}\rangle  = 0 \quad \forall 1 \le j\le k - 1
> $$

The directions generated are always A-orthogonal to all previous search direction. 

**Property 3**

> $$
> \langle r_k, r_j\rangle = 0 \quad \forall 1 \le j \le k - 1
> $$

The residual vectors are always orthogonal to each other. 

The proof here is skipped, I also proof all these properties in [[Conjugate Gradient with Krylov Subspace]], but the actual proof that uses minimal amount of information is done by Prof Greene Baum, please refer to her works and see how she did it. I might add then later. 

---
### **In Relations to Lanczos Algorithm**

**Claim 1**  

> The residual vectors generated during the iterations are the same as the $q^{(j)}$ vectors generated for the Lanczos algorithm. 

**Proof**:  

Recall that the Lanczos algorithm assert the following relationships between the orthogonal vectors: 

$$
\begin{aligned}
    Aq_j &= \beta_{j - 1}q_{j - 1} + \alpha_{j}q_j + \beta_{j+1}q_{j + 1}
\end{aligned}\tag{5}
$$

Let's start considering the removal of projections of $r^{(k)}$ onto the vector $Ap^{(j - 1)}$: 

$$
\begin{aligned}
    r^{(j)} &= r^{(j - 1)} - a_{j - 1}Ap^{(j - 1)}
    \\
    r^{(j + 1)} &= r^{(j)} - a_j Ap^{(j)}
    \\
    r^{(j + 1)} &= r^{(j)} - a_j A(r^{(j)} - b_{j - 1}p^{(j - 1)})
\end{aligned}\tag{6}
$$

Now, let's take note that the step direction can be expressed in term of the residual vector in the following way: 

$$
\begin{aligned}
    x^{(j - 1)} - x^{(j)} &= e^{(j - 1)} - e^{(j)}
    \\
    &= x^{(j - 1)} - x^{(j - 1)} - a_{j - 1}p^{(j - 1)}
    \\
    \implies 
    x^{(j - 1)} - x^{(j)} &= -a_{j - 1}p^{(j - 1)}
    \\
    \implies a_{j - 1}p^{(j - 1)} &= e^{(j - 1)} - e^{(j)}
\end{aligned}\tag{7}
$$

Then continuing the work on (6), we will have the following: 

$$
\begin{aligned}
    r^{(j + 1)} &= r^{(j)} - a_j A(r^{(j)} + b_{j - 1}Ap^{(j -1)})
    \\
    r^{(j + 1)} &= r^{(j)} - a_j Ar^{(j)} - a_{j}b_{j - 1}Ap^{(j -1)}
    \\
    r^{(j + 1)} &= r^{(j)} - a_j Ar^{(j)} - a_{j}b_{j - 1}\frac{r^{(j - 1)} - r^{(j)}}{a_{j - 1}}
    \\
    r^{(j + 1)} &= r^{(j)} - a_j Ar^{(j)} - \frac{a_j b_{j - 1}}{a_{j - 1}}\left(
        r^{(j - 1)} - r^{(j)}
    \right)
    \\
    Ar^{(j)} &= \left(
        \frac{1}{a_j} + \frac{b_{j - 1}}{a_{j - 1}}
    \right)r^{(j)} - \frac{b_{j - 1}}{a_{j - 1}}r^{(j - 1)} - \frac{r^{(j + 1)}}{a_j}
\end{aligned}\tag{8}
$$

And it's at this stage, one can ormalize the value of for $r^{(j)}$ and $r^{(j \pm 1)}$ to obtain the same type of recursion patterns stated in (5), and combining together with **property 3**, this is the same as the Lanczos algorithm. 


$\blacksquare$

---
### **In Relations to GMRes**



#TODO: GMRes and CG. 