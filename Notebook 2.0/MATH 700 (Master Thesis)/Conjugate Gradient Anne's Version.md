[[Conjugate Gradient for Dummy]], [[Conjugate Gradient with Krylov Subspace]], [[Lanczos Algoritm]]

We are going to delve way deep into the Conjugate Gradient Algorithms. 

Tyler Chen's Work [here](https://chen.pw/research/cg/cg.pdf)

---
### **Intro**

Here, we are interested in the formulation made by professor Green Baum in her book. Which is simpler. 

Anne Greenbaum: 

> I can do it with the minimal amount of basics assumptions. To prove everything needed for the conjugate gradient algorithm, please consider the following formulations of the algorithms: 

**Assumptions for the Algorithm**

The matrix $A$ is positive semi-definite and hermitian. 

**The Core Part of the Algorithm**

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

Where, the parameter $a_{k - 1}$ is made to minimize the projection of $r^{(k)}$ along the direction of $Ap^{(k - 1)}$, which is the same as minimizing the energy norm of $e^{(k - 1)}$ defined via $A$ using the direction $p^{(k - 1)}$. The paramter $b_{k - 1}$ is made so that the next search direction $p^{(k)}$ is A-orthogonal to the previous search direction $p^{(k - 1)}$. 

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
> \langle r^{(k)}, r^{(j)}\rangle = 0 \quad \forall 1 \le j \le k - 1
> $$

The residual vectors are always orthogonal to each other. 

The proof here is skipped, I also proof all these properties in [[Conjugate Gradient with Krylov Subspace]], but the actual proof that uses minimal amount of information is done by Prof Greene Baum, please refer to her works and see how she did it. I might add then later. 


**The full Algorithm**: 

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
        & r^{(i + 1)} = r^{(i + 1)} + b_{i}p^{(i)}
    \end{aligned}
\end{aligned}\tag{5}
$$

Note, another equivalent of the above formulation for the coefficients are given as: 

$$
a_i = \frac{r^{(i)T}p^{(i)}}{\Vert p^{(i)}\Vert_A^2} \quad b_i=\frac{\Vert r^{(j + 1)}\Vert_2^2}{r^{(i)T}p^{(i)}}
$$

**Assumption**: 

The matrix is REAL and so are the RHS vector. 

For ease of notation, we are using subscript to denote which iteration the parameter comes from. To start, The core part of the algorithm is: 

$$
\begin{aligned}
    r_k &= r_{k - 1} - a_{k - 1}Ap_{k - 1}
    \\
    p_k &= r_k + b_{k - 1}p_{k - 1}
    \\
    a_{k - 1} &= \frac{\langle r_{k - 1}, p_{k - 1}\rangle}
    {
        \langle p_{k - 1}, Ap_{k - 1}\rangle
    }
    \\
    b_{k - 1} &=
    -\frac{\langle r_k, Ap_{k - 1}\rangle}
    {\langle p_{k - 1}, Ap_{k - 1}\rangle}
\end{aligned}\tag{6}
$$

---
### **A long Proof**

We make use one of the formulations for the coefficients to prove the properties of the algorithm. Consider the following list of Inductive Hypothesis, paramateraized by the iterations number of the forloop of the algorithm. 

$$
\begin{aligned}
    & \{r_i\}_{i = 0}^{k - 1} \text{ is orthogonal} \leftarrow \mathcal{H}_1(k - 1)
    \\
    & \{p_i\}_{i = 0}^{k - 1} \text{ is A orthogonal} \leftarrow \mathcal{H}_2(k - 1)
    \\
    & r_i \perp p_j \;\forall\;   0 \le j < i \le k - 1 \leftarrow \mathcal{H}_3(k - 1)
\end{aligned}\tag{7}
$$

Two vector $u, v$ are $A$ orthogonal if $\langle u, Av\rangle = 0$. Next, we prove that the inductive hypothesis remains true, using (6). 

$$
\begin{aligned}
    \langle r_k, p_{k - 1}\rangle &= 
    \langle r_{k - 1}, p_{k - 1}\rangle - a_{k - 1}\langle Ap_{k - 1}, p_{k - 1}\rangle
    \\
    &= 0
\end{aligned}\tag{8}
$$

It's true by the definition of $a_{k - 1}$ and $r_k$ from (6). 

$$
\begin{aligned}
    \langle r_k, p_j\rangle &= 
    \langle r_{k - 1} - a_{k - 1}Ap_{k - 1}, p_j \rangle \quad 0 \le j \le k - 2
    \\
    &= 0 \impliedby \mathcal{H}_2(k - 1) \wedge \mathcal{H}_3(k - 1)
    \\
    \implies & \mathcal{H}_3(k)
\end{aligned}\tag{9}
$$

Next, we wish to prove that $\mathcal{H}_1(k)$ is true. Consider: 

$$
\begin{aligned}
    \langle r_k, r_{k -1}\rangle &= 
    \langle  r_{k - 1}, r_{k-1}\rangle - a_{k - 1}\langle r_{k - 1}, Ap_{k - 1}\rangle
    \\
    \text{recall: }\quad  r_{k - 1} &= p_{k - 1} - b_{k - 2}p_{k - 2}
    \\
    \langle r_k, r_{k -1}\rangle
    &=
    \langle 
        r_{k - 1}, r_{k - 1}
    \rangle
     - 
    a_{k - 1}\langle 
        p_{k - 1} - b_{k -2}p_{k - 2}, Ap_{k - 1}
    \rangle 
    \\
    &= 
    \langle 
        r_{k - 1}, r_{k - 1}
    \rangle
    -
    a_{k - 1}\langle p_{k - 1}, Ap_{k - 1}\rangle \impliedby \mathcal{H}_2(k - 1)
    \\
    &= 
    \langle p_{k - 1} - b_{k - 2}p_{k - 2}, r_{k - 1}\rangle - a_{k - 1}\langle  p_{k - 1}, Ap_{k - 1}\rangle
    \\
    &= 
    \langle p_{k - 1}, r_{k - 1}\rangle - a_{k - 1}
    \langle p_{k - 1}, Ap_{k - 1}\rangle \impliedby \mathcal{H}_3(k - 1)
    \\
    &= 0 
    \\
    \langle r_k, r_j\rangle & \quad \forall\; 0 \le j \le k -2
    \\
    &=  
    \langle r_{k - 1} - a_{k - 1}Ap_{k - 1}, r_j\rangle
    \\
    &= 
    \langle  r_{k - 1} - a_{k - 1}Ap_{k - 1},
    p_j - b_{j - 1}p_{j - 1}
    \rangle
    \\
    &=
    \langle r_{k - 1}, p_j - b_{j - 1}p_{j - 1}\rangle - a_{k - 1}
    \langle Ap_{k - 1}, p_j - b_{j - 1}p_{j - 1} \rangle
    \\
    &= 0 \impliedby \mathcal{H}_2(k - 1)\wedge \mathcal{H}_3(k - 1)
    \\
    \implies & \mathcal{H}_1(k)
\end{aligned}\tag{10}
$$

Finally, we wish to prove that $\mathcal{H}_2(k)$ is true, let's start it by considering: 

$$
\begin{aligned}
    \langle p_k, Ap_{k - 1}\rangle &= 
    \langle r_k, Ap_{k - 1}\rangle + 
    b_{k - 1}\langle p_{k - 1}, Ap_{k - 1}\rangle
    \\
    &= 
    \langle r_k, Ap_{k - 1}\rangle - \langle r_k, Ap_{k -1}\rangle
    \\
    &= 0
    \\
    \langle p_k, Ap_j\rangle & \quad \forall \; 0 \le j \le k - 2
    \\
    &= 
    \langle
        r_k + b_{k - 1}p_{k - 1}, Ap_j
    \rangle 
    \\
    &= 
    \langle  r_k, Ap_j\rangle \impliedby \mathcal{H}_2(k -1)
    \\
    &= 
    \langle
        r_k , a_j^{-1}(r_j - r_{j + 1})
    \rangle
    \\
    &= 0 \impliedby \mathcal{H}_1(k)
    \\
    \implies& \mathcal{H}_2(k)
\end{aligned}
$$

Proved. 

**Comments**

This proof is made for this particular formulations of the conjugate gradient algorithms. It's elementary and complicated. But it doesn't reveal any kind of insights into the problem, or the algorithm. 

This proof turns out to be way more convoluted than I originally imagined. Big Oof for me. 


---
### **A Subtle Remark**

#TODO: GMRes and CG


---
### **Conjugate Gradient and Approximation Theory**
