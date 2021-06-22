We need the prelude: [[Steepest Descend for Matrix Vector]]

---
### **Intro**

Must read the Steepest Descned for Matrix Vector first before reading this many of the quantities are defined there and we continued using it. 

It's been show previously that just taking the best step at each iterations

We continue the sage from steepest gradient descend. And the method we introduced here is just an improvement of the steepest gradient descend for solving symmetric matrices. 

In Steepest descend we shown that it's slow when $\mu = \kappa$, to mitigate we think of the idea of $A$ orthogonal direction $d$, and by $A$ orthogonal we mean that: $d^TAd =0$. 

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

---
### **N Steps Convergence**

Claim: 

> Choosing a $A$ orthogonal directions for the steepest gradient descend will force the algorithm to converge in at most $n$ steps. 

Consider expression $e^{(0)} = x^{(0)} - x^{+}$, the first error on the input space for the matrix $A$, and then we project it onto the vector (Because $d^{(k)}$ are a special kind of orthogonal, more on this later). 

$$
\begin{aligned}
    e^{(0)} &= \sum_{j = 0}^{n - 1}\delta_jd^{(j)} 
\end{aligned}
\tag{2.1}
$$

Consider: 

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
    [b - A(x^{(k)} + \alpha d^{(k)})]^Td^{(k)} &= 0
    \\
    [b - Ax^{(k)} - \alpha A d^{(k)}]^Td^{(k)} &= 0
    \\
    [r^{(k)} - \alpha Ad^{(k)}]^Td^{(k)} &= 0 
    \\
    \alpha &= \frac{r^{(k)T}d^{(k)}}{d^{(k)T}Ad^{(k)}}
    \\
    \alpha &= \frac{r^{(k)T}d^{(k)}}
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
$$

* (1): Recall **Note(1)**

Therefore, after $n$ iterations, the error vector will goes to zero, which means that $x^{(k)} = x^+$


