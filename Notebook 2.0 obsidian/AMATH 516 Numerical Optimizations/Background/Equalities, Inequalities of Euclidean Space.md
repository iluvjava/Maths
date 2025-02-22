---
alias: Cute Formula
---
### **Intro**

Unless specified, assume the ambient space is some Hilbert space $\mathcal H$. 
Holder, Cauchy Swchartz inequalities are basics stuff in Euclidean space. 
See [l-p Sequence Space](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/l-p%20Sequence%20Space.md) for more information. 



### **Equalities**

#### **Lemma | The cute equality**
> For any $a, b \in \mathcal H$, it has for all $\theta \in \R^n$: 
> $$
> \begin{aligned}
>     \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
>     (\theta)(1 - \theta)\Vert a - b\Vert^2 \quad \forall \theta \in \mathbb R. 
> \end{aligned}
> $$


**Observation**

The LHS is the norm of the affine combinations: $\Vert (1 - \theta) a + \theta b\Vert^2$, the first 2 terms on the RHS: $(1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2$ is the affine combination of the individual norms, and the final term is an extra term that makes the equality true. 

**Proof:** 

consider any $\lambda \in \mathbb R$, firstly

$$
\begin{aligned}
    &\quad \Vert (1 - \lambda)u + \lambda v\Vert^2 
    \\
    &= 
    (1 - \lambda)^2\Vert u\Vert^2 + 
    \lambda^2\Vert v\Vert^2 + 2(1 - \lambda)\lambda\langle u, v\rangle, 
\end{aligned}
$$

similarly

$$
\begin{aligned}
    &\quad \lambda(1 - \lambda) \Vert u - v\Vert^2
    \\
    &= 
    \lambda(1 - \lambda)\Vert u\Vert^2 + 
    \lambda(1 - \lambda)\Vert v\Vert^2 - 
    2(1 - \lambda)\lambda\langle u, v\rangle, 
\end{aligned}
$$

where adding these 2 terms together yields: 

$$
\begin{aligned}
    &\quad 
    \Vert (1 + \lambda)u + \lambda v\Vert^2 + \lambda(1 - \lambda)
    \Vert u - v\Vert^2
    \\
    &= 
    \lambda(1 - \lambda)\Vert u\Vert^2 + 
    \lambda(1 - \lambda)\Vert v\Vert^2 
    + 
    (1 - \lambda)^2\Vert u\Vert^2 + 
    \lambda^2\Vert v\Vert^2
    \\
    &= 
    (1 + \lambda^2 + 2\lambda + \lambda - \lambda^2)\Vert u\Vert^2
    + 
    (\lambda^2 + \lambda - \lambda^2)\Vert v\Vert^2
    \\
    &= 
    (1 - \lambda)\Vert u\Vert^2 + \lambda \Vert v\Vert^2
\end{aligned}
$$

Therefore, it yields the above equality but in a different format where the last term on the RHS is in the LHS. $\blacksquare$

**References**: 

Corollary 2.14 in Heinz's Monotone Operator's textbook. 

**Remarks**

Exchanging $\langle ,\rangle$ to be $\langle ,\rangle_H$ and $\Vert \cdot\Vert$ into $\Vert \cdot\Vert_H$ with $H$ being a positive definite operator in the space would yield the same results as the above. 


#### **A Generalized Version**

Consider an affine combination of vectors $\sum_{i\in I} \alpha_i = 1$ and a collection of vector $\{x_i\}_{i \in I}, \{u_j\}_{j \in J}$ in Hilbert space. 
Then it has the equality: 
$$
\begin{aligned}
    &
    \left\langle 
        \left.
        \sum_{i \in J}^{}\alpha_i x_i
        \right|
        \sum_{i \in I}^{}\alpha_i u_i
    \right\rangle +
    \sum_{i\in I}^{}\sum_{j\in I}^{}
        \frac{\alpha_i\alpha_j}{2}\langle x_i - x_j, u_i - u_j\rangle
    = 
    \sum_{i \in I}^{}\alpha_i \langle x_i, u_i\rangle. 
\end{aligned}
$$
By setting the $x_i = u_i$ on the first expression, we obtain a strengthened variant of the equality which is: 

$$
\begin{aligned}
    \left\Vert \sum_{i \in I}^{}
        \alpha_ix_i
    \right\Vert^2
    + 
    \sum_{i \in I}^{}
        \sum_{i \in I}^{}
            \alpha_i\alpha_j\Vert x_i - x_j\Vert^2/2
    = 
    \sum_{i \in I}^{}\alpha_i \Vert x_i\Vert^2.
\end{aligned}
$$


By setting the $I = \{1, 2\}$ for the second expression, we obtained the formula we proved for the Cute Equality. 

**Exercise**
> The reader should attempt proving this variant of Cute Equality as an exercise. 
> It looks hard but it's very easy. 


**Reference**:

Heinz's monotone operator textbook first edition, Lemma 2.13 (ii). Professor Heinz himself refers this formula as the cute formula. 

#### **An Augmented Version**

Differs from the generalized version, this rule is for convex combinations of 2 vectors in Hilbert Space. 
Here we derive another version of the same formula, which is occasionally useful: 

$$
\begin{aligned}
    \Vert (1 - \lambda)u + \lambda v\Vert^2 
    &= 
    (1 - \lambda)\Vert u\Vert^2 - (1 - \lambda)\lambda \Vert u - v\Vert^2 + \lambda \Vert v\Vert^2
    \\
    \Vert (1 - \lambda)u + \lambda v\Vert^2 
    &= 
    (1 - \lambda)\Vert u\Vert^2 - (1/\lambda - 1)\lambda^2\Vert u - v\Vert^2 + \lambda \Vert v\Vert^2, 
\end{aligned}
$$
Let $\alpha = \frac{1}{\lambda}$, we now assume that $\lambda \neq 0$, then: 

$$
\begin{aligned}
    \Vert (1 - \alpha^{-1})u + \alpha^{-1}v\Vert^2 &= 
    (1 - \alpha^{-1})\Vert u\Vert^2 - (1- \alpha^{-1})\alpha^{-1}
    \Vert u - v\Vert^2 + \alpha^{-1}\Vert v\Vert^2. 
\end{aligned}
$$

and we called that the augmented version of the cute formula.


**References**: 

Lemma 1.8, In professor's Heinz's Notes



---
### **Some other inequalities**

We introduce some other basic equalities and inequalities. 

1. The cosine law. It transfers inner product involving $x, y, z \in \R^n$ terms to the difference of normed squared edges on a triangle. 
2. The useful inequality came from the proof in Catalyst second paper. It's a cute formula being spotted me. It's using the cosine law in a peculiar manner. 

#### **Theorem | The cosine law**
> For all $x, y , z \in \R^n$, it has 
> $$
> \begin{aligned}
>     2\langle x - y, y - z\rangle &= 
>     \Vert x - z\Vert^2 - \Vert x - y\Vert^2 - \Vert y - z\Vert^2. 
> \end{aligned}
> $$

**Proof**

See exercise below. 

**Exercise**

Prove the above theorem, which is basic algebra like back in high school.

**Remarks**

This identity generalizes to the non-euclidean settings, see [Bregman Divergence](../Bregman%20Divergence.md) for more information. 

#### **Lemma | A useful inequality**
> For all $x, y , z \in \R^n$, $\theta > 0$, it has 
> $$
> \begin{aligned}
>     \Vert x - y\Vert^2 &\ge 
>     (1 - \theta)\Vert x - z\Vert^2 + (1 - \theta^{-1})\Vert z - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

$$
\begin{aligned}
    \Vert x - y\Vert^2 
    &= \Vert x - z + z - y\Vert^2
    \\
    &= \Vert x - z\Vert ^2 + \Vert z - y\Vert^2 + 2\langle x - z, z - y\rangle
    \\
    &= \Vert x - z\Vert ^2 + \Vert z - y\Vert^2 + 
    \Vert 
        \sqrt{\theta}(x - z) + 1/\sqrt{\theta} (z - y)
    \Vert^2
    - \theta \Vert x - z\Vert^2 - \theta^{-1}\Vert z - y\Vert^2
    \\
    &= 
    (1 - \theta)\Vert x - z\Vert^2 + (1 - \theta^{-1})\Vert z - y\Vert^2
    + \left\Vert 
        \sqrt{\theta} (x - z) + 1/\sqrt{\theta}(z - y)
    \right\Vert^2
    \\
    &\ge 
    (1 - \theta)\Vert x - z\Vert^2 + (1 - \theta^{-1})\Vert z - y\Vert^2. 
\end{aligned}
$$

$\blacksquare$


#### **Theorem | 4 Points equality**
> For any pair of points $(x, y), (x', y')$ in product space $\R^n \times \R^n$, they satisfy: 
> $$
> \begin{aligned}
>     2\langle x' - y', y - x\rangle
>     &= 
>     \Vert x' - y\Vert^2 + \Vert y' - x\Vert^2
>     - \Vert y' - y\Vert - \Vert x' - x\Vert^2. 
> \end{aligned}
> $$

**Proof**

We can derive the following equality individually for parts on the right hand side. 

$$
\begin{aligned}
    \Vert x' - y\Vert^2 - \Vert x' - x\Vert^2
    &= 
    \Vert x' - x + x - y\Vert^2 - \Vert x' - x\Vert^2
    \\
    &= \Vert x - y\Vert^2 + 2\langle x' - x, x - y\rangle. 
\end{aligned}
$$

Similarly

$$
\begin{aligned}
    \Vert y' - x\Vert^2 - \Vert y' - y\Vert^2
    &= \Vert x - y\Vert^2 + 2\langle y' - y, y - x\rangle. 
\end{aligned}
$$

The sum of both equalities yields: 

$$
\begin{aligned}
    \Vert x' - y\Vert^2 + \Vert y' - x\Vert^2
    - 
    \left(
        \Vert x' - x\Vert^2 + \Vert y' - y\Vert^2
    \right) &= 
    2\Vert x - y\Vert^2
    + 2\langle x' - x - y' + y , x - y\rangle
    \\
    &=  2 \langle x' - y', x - y \rangle. 
\end{aligned}
$$

$\blacksquare$
