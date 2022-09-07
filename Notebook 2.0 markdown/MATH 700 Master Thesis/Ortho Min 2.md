[Ortho Min](Ortho%20Min.md), [Conjugate Gradient for Dummy](../AMATH%20515%20Optimization%20Fundamentals/Conjugate%20Gradient%20for%20Dummy.md)

This algorithm is just a special cause of the Conjugate Gradient. 

---
### **Intro**
The connection between steepest gradient and conjugate gradient is this algorithm. An algorithm that is made to minimize matrices that are symmetric but not necessarily positive definite. 

It's recommended to see the first formulations of the conjugate gradient to get some basic ideas for the connections between this algorithm and other algorithms. 

As its name suggest, the Ortho Min 2 algorithm will be orthogonalizing the residual at each step by 2 directions instead of one direction. 

### **Ortho Min (2)**

**The basic quantities are:**

$$
e^{(k)} = x^+ - x^{(k)} \quad r^{(k)} = b - Ax^{(k)} = r^{(k - 1)} + a_{k- 1}Ar^{(k - 1)}
$$

$$
p^{(k)} = r^{(k)} - b_{k - 1}p{(k - 1)}
$$


The step-size into the direction and the conjugatation direction are given as: 

$$
a_k = \frac{\langle r^{(k - 1)}, Ap^{(k - 1)} \rangle}{\langle Ap^{(k - 1)}, Ap^{(k - 1)}\rangle}
\quad 
b_k = \frac{\langle Ar^{(k)}, Ap^{(k - 1)} \rangle}{\langle Ap^{(k - 1)}, Ap^{(k - 1)}\rangle}
$$

And the algorithm is stated as: 

$$
\begin{aligned}
    & x^{(k)} = x^{(k - 1)} + a_{k - 1}p^{(k - 1)}
    \\
    & r^{(k)} = r^{(k - 1)} - a_{k - 1}Ap^{(k - 1)}
    \\
    & p^{(k)} = r^{(k)} - b_{k - 1}p^{(k - 1)}
\end{aligned}
$$

The algorithm seeks to assert the invariants: 

$$
\begin{cases}
    r^{(k + 1)} =r^{(k)} - a_kA(r^{(k)} - b_{k - 1}p^{(k - 1)})
    \\
    x^{(k + 1)} = x^{(k)} + a_k p^{(k - 1)}
\end{cases}\tag{1}
$$

---
### **Subspace Project Frameworks**

Yosef Saad highlithed a frameworks for a series of iterativeoptimization methods for solving linear system. Here is the taxonomy of the framework: 

> $$
> \text{Find } \tilde{x} \in \mathcal{K} : b - A\tilde{x} \perp \mathcal{L} 
> $$

Where $\mathcal{K}, \mathcal{L}$ are subspaces. That is. This algorithm fits this frameworks for the following ways: 

$$
\begin{aligned}
    & x^{(k + 1)} \in  x^{(k)} + \text{span}\{p^{(k)}\}
    \\
    & r^{(k + 1)} \perp \text{span}\{
            Ar^{(k)}, Ap^{(k - 1)}
        \}
    \\
    & p^{(k)} \in r^{(k)} + \text{span}(p^{(k - 1)})
    \\
    & p^{(k)} \perp \text{span}\{Ap^{(k - 1)}\}
\end{aligned}
$$

You can verify that solving the above problem gives the coefficients for the algorithm during the iterations. 

**Claim 1**

> $$
> r^{(k + 1)}\perp \text{span}\{Ar^{(k)}, Ap^{(k - 1)}\}
> $$

Proof Skipped, for now. 

**Claim 2**

> When we apply this to Hermitian matrices, we have 
> $$
> \begin{aligned}
>     \left\langle r^{(k + 1)}, Ap^{(j)} \right\rangle = 
>     \left\langle Ap^{(k + 1)}, Ap^{(j)} \right\rangle = 0
> \end{aligned}
> $$

**GreenBaum**

> No convergence proof for orthomin(2), but when $A$ is Hermitian, we have the above **claim 2**, and this algorithm will converge as long as $0 \in \mathcal{F}(A)$. 

**Claim 2 Proof**

By construction, the base case of the algorithm asserts that: 

$$
\left\langle r^{(1)}, Ap^{(0)} \right\rangle
= 
\left\langle Ap^{(1)}, Ap^{(0)} \right\rangle = 0
\tag{Base case}
$$

Let's construct the strong inductively hypothesis, which is: 

$$
\left\langle r^{(k)}, Ap^{(j)} \right\rangle 
= 
\left\langle Ap^{(k)}, Ap^{(k)} \right\rangle = 0 
\quad \forall \; j \le k - 1 
\tag{Inductive}
$$

At the $k^{th}$ iteration of the algorithm, it will asserts the fact that: 

$$
\left\langle r^{(k + 1)}, Ap^{(k)} \right\rangle
=
\left\langle Ap^{(k + 1)}, Ap^{(k)} \right\rangle 
\tag{1}
$$

Consider the inner product between $r^{(k + 1)}$ and $Ap^{(k)}$:

$$
\begin{aligned}
    & \left\langle r^{(k + 1)}, Ap^{(j)} \right\rangle
    \\
    & \left\langle r^{(k)} - a_k Ap^{(k)}, Ap^{(j)} \right\rangle
    \\
    \underset{(\text{Inductive})}{\implies}
    &
    \left\langle r^{(k)} - a_k Ap^{(k)}, Ap^{(j)} \right\rangle = 0
    \quad
    \forall 1 \le j \le k - 1
    \\
    \underset{(1)}{\implies}
    & 
    \left\langle \underbrace{r^{(k)} - a_k Ap^{(k)}}_{r^{(k + 1)}}, Ap^{(j)} \right\rangle = 0
    \quad \text{when: }
    j = k
\end{aligned}
$$

Therefore, we have this claim: 

$$
\left\langle r^{(k + 1)}, Ap^{(k)} \right\rangle = 0 \quad \forall j \le k 
\tag{3}
$$

Now consider: 

$$
\begin{aligned}
    & \left\langle Ap^{(k + 1)}, Ap^{(j)} \right\rangle 
    \\
    = &
    \left\langle A(r^{(k + 1)} - b_k p^{(k)}), Ap^{(j)} \right\rangle
    \quad \forall j \le k  - 1
    \\
    \underset{[1]}{\implies}
    =& 
    \left\langle Ar^{(k + 1)}, a_j^{-1}(r^{(j)} - r^{(j - 1)}) \right\rangle
    \\
    \underset{[2]}{\implies}
    =&
    \left\langle A^{(k + 1)}, a_j^{-1}(p^{(j)} + b_{j - 1}p^{(j - 1)} - p^{(j + 1)} - b_j p^{(j)}) \right\rangle
    \\
    \underset{[3]}{\implies} = & 
    \left\langle r^{(k + 1)}, a^{-1}_j A(p^{(j)} + b_{j - 1}p^{(j - 1)} - p^{(j + 1)} - b_j p^{(j)}) \right\rangle
    \\
    \underset{(3)}{\implies} = & 0 \quad \forall j \le k - 1
\end{aligned}
$$

The algorithm will assert the case when $j = k$, and here are some explanations: 

**Explainations**

\[1\]: 
$$
\begin{aligned}
    a_jp^{(j)} & = x^{(j + 1)} - x^{(j)} 
    \\
    a_j Ap^{(j)} & = Ax^{(j + 1)} - Ax^{(j)}
    \\
    a_j Ap^{(j)} &= -b + Ax^{(j + 1)} + b - Ax^{(j)}
    \\
    a_j Ap^{(j)} & = r^{(j)} - r^{(j + 1)}
\end{aligned}
$$

\[2\]: 
$$
\begin{aligned}
    p^{(j)} &= r^{(j)}  - b_{j - 1}p^{(j - 1)}
    \\
    r^{(j)} &= p^{(j)} + b_{j - 1}p^{(j - 1)}
    \\
    \implies \quad 
    r^{(j)}  - r^{(j + 1)}  &= 
    p^{(j)} + b_{j - 1}p^{(j - 1)} - p^{(j + 1)} - b_j p^{(j)}
\end{aligned}
$$

\[3\]: Because matrix $A$, is Hermitian. 

Note: Here we assume that, none of the cofficients $a_k$ are zero, which means that, $0\notin \mathcal{F}(A)$.  $\blacksquare$


---


