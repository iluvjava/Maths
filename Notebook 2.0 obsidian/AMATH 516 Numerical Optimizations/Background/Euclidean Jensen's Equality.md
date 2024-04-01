---
alias: Cute Formula
---
### **Intro**

This formula is extremely useful when we are dealing with Euclidean norm (Also applicable for Hilbert space), with well defined inner products and norms. We show the proof for it and we will provide more variance for it. The cute formula is: 

$$
\begin{aligned}
    \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
    (\theta)(1 - \theta)\Vert a - b\Vert^2 \quad \forall \theta \in \mathbb R. 
\end{aligned}
$$

**Observation**

The lhs is the norm of the affine combinations: $\Vert (1 - \theta) a + \theta b\Vert^2$, the first 2 terms on the RHS: $(1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2$ is the affine combination of the individual norms, and the final term is an extra term that makes the equality true. 

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

Therefore it yields the above equality but in a different format where the last term on the RHS is in the LHS. 

**References**: 

Corollary 2.14 in Heinz's Monotone Operator's textbook. 

**Remarks**

Exchaging $\langle ,\rangle$ to be $\langle ,\rangle_H$ and $\Vert \cdot\Vert$ into $\Vert \cdot\Vert_H$ with $H$ being a positive definite operator in the space would yield the same results as the above. 


---
### **A Generalized Version**

In the general version of the theorem, we consider an affine combinations of vectors $\sum_{i\in I} \alpha_i = 1$ in the Euclidean space (Original statement is stated for the Hilbert spaces), and form the equality: 

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
    \sum_{i \in I}^{}\alpha_i \langle x_i, u_i\rangle
    \\
    &
    \left\Vert \sum_{i \in I}^{}
        \alpha_ix_i
    \right\Vert^2
    + 
    \sum_{i \in I}^{}
        \sum_{i \in I}^{}
            \alpha_i\alpha_j\Vert x_i - x_j\Vert^2/2
    = 
    \sum_{i \in I}^{}\alpha_i \Vert x_i\Vert^2, 
\end{aligned}
$$

the first expression is a more general case of the second expression. By setting the $x_i = u_i$ on the first expression, we obtain the second expression. By setting the $I - {1, 2}$ for the second expression, we obtained the formula proved in the previous section. 


**Reference**:

Heinz's monotone operator textbook first edition, Lemma 2.13 (ii). Professor Heinz himself refers this formula as the cute formula. 

---
### **An Augmented Version**

Differs from the generalized version, this rule is for convex combinations of 2 vector in Hilbert Space. 
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




