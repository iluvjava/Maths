[[Lanczos Algoritm]]
[[Conjugate Gradient 2]]

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