[[Lanczos Algoritm]]
[[Conjugate Gradient 2]]

---
### **In Relations to Lanczos Algorithm**

Here is a list of variables: 

$$
\begin{aligned}
    & p^{(0)}, p^{(1)}, \cdots p^{(k)}
    \\
    & r^{(0)}, r^{(1)}, \cdots r^{(k)}
    \\
    & a_0, a_1, \cdots a_k
    \\
    & b_0, b_1, \cdots beta_k
    \\
    & r{(k)} = b - Ax^{(k)}
\end{aligned}
$$

Our Objective is to find a one to one links between the Residual generated from the CG and the $Q$, the orthogonal vector generated from Lanczos.

The lanczos algorthm does: 

$$
\begin{aligned}
    Aq^{(k)} &= \alpha_k q^{(k)} + \beta_{k - 1}q_{k - 1} +  \beta_{k + 1}q^{(k + 1)}
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
\tilde{q}^{(j)} =  \text{sign}(r^{(j)}q^{(j)})q^{(j)}
\implies 
r^{(j)} = \Vert r^{(j)}\Vert \tilde{q}^{(j)}
$$

Here, the sign function is applied elemenwise to the product of the vector. If they have the same sign, then $q^{(j)}$ remains unchanged, if they don't, it will reverse the sign to match then.

Therefore: 

$$
\begin{aligned}
    \Vert r^{(j - 1)}\Vert A \tilde{q}^{(j - 1)} &= 
    \left(
        \frac{1}{a_{j -1}} + 
        \frac{b_{j - 2}}{a_{j - 2}}
    \right)\Vert r^{(j - 1)}\Vert \tilde{q}^{(j - 1)} + 
    \frac{\Vert r^{(j)}\Vert}{a_{j - 1}}\tilde{q}^{(j)}
    -
    \frac{b_{j - 2}\Vert r^{(j - 2)}\Vert}{a_{j - 2}}\tilde{q}^{(j - 2)}
    \\
    A\tilde{q}^{(j - 1)} &= 
    \left(
        \frac{1}{a_{j - 1}} + \frac{b_{j - 2}}{a_{j - 2}}
    \right)\tilde{q}^{(j - 1)}
    + 
    \frac{\Vert r^{(j)}\Vert}{\Vert r^{(j -1)}\Vert a_{j -1}} \tilde{q}^{(j)} 
    - 
    \frac{b_{j - 2}\Vert r^{j - 2}\Vert}{a_{j - 2}\Vert r^{(j - 1)}\Vert}\tilde{q}^{(j - 2)}
\end{aligned}\tag{4}
$$

**Reader Please Observe**: 

The recurrence from lanczos gives the same form (paramaterized by $j$) on the coefficients for residual $q^{(k + 1)}, q^{(k - 1)}$, but here, they are obviously not in the same form.

**To Remedy This**

