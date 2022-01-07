[[Lanczos Algoritm]]
[[Conjugate Gradient Anne's Version]]

---
### **Lanczos in Relations to CG**

Here is a list of variables: 

$$
\begin{aligned}
    & p^{(0)}, p^{(1)}, \cdots p^{(k)}
    \\
    & r^{(0)}, r^{(1)}, \cdots r^{(k)}
    \\
    & a_0, a_1, \cdots a_k
    \\
    & b_0, b_1, \cdots b_k
    \\
    & r{(k)} = b - Ax^{(k)}
\end{aligned}
$$

Our Objective is to find a one to one links between the Residual generated from the CG and the $Q$, the orthogonal vector generated from Lanczos.

The lanczos algorthm does: 

$$
\begin{aligned}
    Aq^{(k)} &= \alpha_k q^{(k)} + \beta_{k - 1}q^{(k - 1)} +  \beta_{k + 1}q^{(k + 1)}
    \\
    Aq^{(0)} & = \alpha_1 q^{(0)} + \beta_1 q^{(1)}
    \\
    & \alpha_{1 \le i \le k}, \beta_{1 \le i \le k}, q^{(0\le i \le k )}
\end{aligned}
$$

Where, **we are indexing with zero**, please take notice of that.

Let's consider the CG Algorithm real quick:

$$
\begin{aligned}
    r^{(j)} &= r^{(j - 1)} - a_{j -1 }Ap^{(j - 1)}
    \\
    & =r^{(j - 1)} - a_{j - 1} A(r^{(j - 1)} + b_{j - 2}p^{(j - 2)})
    \\
    &= r^{(j - 1)} - a_{j - 1}Ar^{(j - 1)} - a_{j - 1}b_{j - 2}Ap^{(j - 2)}
\end{aligned}\tag{1}
$$

using the CG algorithm, we deduce: 

$$
\begin{aligned}
    r^{(j - 1)} =& r^{(j - 2)} - a_{j - 2}Ap^{(j - 2)}
    \\
    r^{(j - 1)} - r^{(j - 2)} &= a_{j - 2} Ap^{(j -2)}
    \\
    Ap^{(j - 2)} &= a^{-1}_{j -2} \left(
        r^{(j - 2)} - r^{(j - 1)}
    \right)
\end{aligned}\tag{2}
$$

Substitude $(2)$ into $(1)$, we have: 

$$
\begin{aligned}
    r^{(j)} &= r^{(j - 1)} - a_{j - 1}Ar^{(j - 1)} - a_{j - 1}b_{j - 2}Ap^{(j - 2)}
    \\
    &= 
    r^{(j - 1)} - a_{j - 1}Ar^{(j - 1)} - \frac{a_{j-1}b_{j-2}}{a_{j-2}}\left(
        r^{(j - 2)} - r^{(j -1)}
    \right)
    \\
    &= \left(
        1 + \frac{a_{j - 1}b_{j -2}}{a_{j - 2}}r^{(j - 1)}
    \right)- a_{j - 1}Ar^{(j - 1)} - \frac{a_{j-1}b_{j-2}}{a_{j-2}}r^{(j -2)}
    \\
    a_{j - 1}Ar^{(j - 1)} &= 
    \left(
        1 + \frac{a_{j - 1}b_{j -2}}{a_{j - 2}}r^{(j - 1)}
    \right)
    - \frac{a_{j-1}b_{j-2}}{a_{j-2}}r^{(j -2)}
    \\
    Ar^{(j - 1)} &=
    \left(
        \frac{1}{a_{j - 1}} + \frac{b_{j - 2}}{a_{j- 2}}
    \right)r^{(j - 1)} + 
    \frac{r^{(j)}}{a_{j-1}} - 
    \frac{b_{j - 2}}{a_{j - 2}}r^{(j - 2)}
\end{aligned}\tag{3}
$$

**Reader Please Recall**

Recall the proof from the prereq of this discussion that residuals generated from the CG is orthogonal, and this is also, in much of a similar form compare to the Lanczos Recurrence. 

**Reader Please Recall**

The lanczos produces a matrix $T_k$ that is not only symmetric, but also contains all positive elements in it, this is true because $\beta_j = \Vert Aq_j\Vert$, and $\alpha_j$ is the energy norm of $q_j$, therefore it's all positive, and it will be important for us to form match it. 

Here, we wish to match $r^{(j - 1)}$ with $q^{(j - 1)}$, $r^{(j)}$ with $q^{(j)}$, and $r^{(j - 2)}$ with $q^{(j - 2)}$. However, to do that, we first need to multiply $q$ by the norm of $r$, and then we have to make sure that their sign matches. 

**To Remedy This**

Therefore, let's define: 

$$
\Vert r^{(j)}\Vert q^{(j)} \simeq r^{(j)}
$$

Where, $\simeq$ meaning that it's equal up to a sign difference. Where the sign is determined comes later.

Therefore: 

$$
\begin{aligned}
    \Vert r^{(j - 1)}\Vert A q^{(j - 1)} &= 
    \left(
        \frac{1}{a_{j -1}} + 
        \frac{b_{j - 2}}{a_{j - 2}}
    \right)\Vert r^{(j - 1)}\Vert q^{(j - 1)} + 
    \frac{\Vert r^{(j)}\Vert}{a_{j - 1}}q^{(j)}
    -
    \frac{b_{j - 2}\Vert r^{(j - 2)}\Vert}{a_{j - 2}}q^{(j - 2)}
    \\
    Aq^{(j - 1)} &= 
    \left(
        \frac{1}{a_{j - 1}} + \frac{b_{j - 2}}{a_{j - 2}}
    \right)q^{(j - 1)}
    + 
    \frac{\Vert r^{(j)}\Vert}{\Vert r^{(j -1)}\Vert a_{j -1}} q^{(j)} 
    - 
    \frac{b_{j - 2}\Vert r^{(j - 2)}\Vert}{a_{j - 2}\Vert r^{(j - 1)}\Vert}q^{(j - 2)}
\end{aligned}\tag{4}
$$

**Reader Please Observe**: 

The recurrence from lanczos gives the same form (paramaterized by $j$) on the coefficients for residual $q^{(k + 1)}, q^{(k - 1)}$, but here, they are obviously not in the same form. We want the coefficients for $q^{(j - 2)}, q^{(j)}$ to have the same form, so that it's form matching with what we had for the Lanczos Algorithm. 

**To Remedy This**

$$
\begin{aligned}
    b_{j - 2} &= \frac{\Vert r^{(j - 1)}\Vert^2}{\Vert r^{(j - 2)}\Vert_2} \quad \text{From Original CG Algorithm}
    \\
    \implies 
    \frac{b_{j - 2}\Vert r^{(j - 2)\Vert}}{a_{j - 2}\Vert r^{(j - 1)}\Vert} &= 
    \frac{
        \frac{\Vert r^{(j - 1)}\Vert^2}{\Vert r^{(j - 2)}\Vert}
    }{
        a_{j - 2}\Vert r^{(j - 1)}\Vert
    }
    =
    \frac{
        \frac{\Vert r^{(j - 1)}\Vert}{\Vert r^{(j - 2)}\Vert}
    }{
        a_{j - 2}
    }
    \\
    &= \frac{\Vert r^{(j - 1)}\Vert}{a_{j - 2}\Vert r^{(j - 2)}\Vert}
\end{aligned}\tag{5}
$$


Observe that we match the form for the coefficients between $q^{(j - 2)}, q^{(j)}$. Therefore, the coefficients of The lanczos and the Conjugate Gradient posses the following relationship: 

$$
\begin{aligned}
    \alpha_{j -1} &= \left(
        \frac{1}{a_{j - 1}} + 
        \frac{b_{j - 2}}{a_{j - 2}}
    \right)
    \\
    \beta_j &= \frac{\Vert r^{(j)}\Vert}{
        \Vert r^{(j - 1)}\Vert a_{j - 1}
    }
    \\
    \implies \Vert r^{(j)}\Vert &= 
    a_{j - 1}\beta_{j}\Vert r^{(j - 1)}\Vert
    \\
    \implies \frac{\Vert r^{(j)}\Vert}{\Vert r^{(0)}\Vert} &= 
    \prod_{i = 0}^{j} a_{i}\beta_{i+1} 
\end{aligned}\tag{6}
$$

Next, we wish to match the residual vectors from CG to the orthogonal vectors from Lanczos: 

$$
\begin{aligned}
    \frac{r^{(j - 1)}}{\Vert r^{(j - 1)}\Vert} &= 
    \left(
        \frac{1}{a_{j - 1}} + \frac{b_{j - 2}}{a_{j - 2}}
    \right)q^{(j - 1)}
\end{aligned}
$$

Notice that, we don't have to worry about the sign here because, the step size $a$, and the parameter $b_j$ are both positive. This is true because we are always walking towards the conjugate direction, and $b$ is positive because it's a fraction containing the norm of something in the original CG algorithm. Therefore, the sign of $q^{(j)}$ must come from the sign of $r^{(j)}$, and that is where the sign is missing. 

And from expression (6), we can also obtain an expression for $\beta$ on the tridiagonal matrix using the stepsize from the conjugate gradient algorithm: 

$$
\beta_j = \frac{\Vert r^{(j)}\Vert}{
        \Vert r^{(j - 1)}\Vert |a_{j - 1}|
    } = 
    \frac{\sqrt{b_j}}{a_{j - 1}}
$$

---
### **Story After This**

I used the last expression in $(6)$ to keep track of the residual of an variant of CG which uses the LDLT decomposition of the Tridiagonal matrix and the Lanczos Algorithm. 




