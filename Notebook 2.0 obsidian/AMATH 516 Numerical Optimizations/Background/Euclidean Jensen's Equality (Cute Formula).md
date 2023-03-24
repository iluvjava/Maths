### **Intro**

This formula is extremely useful when we are dealing with Euclidean norm, inner products, and convex combinations of things. We show the proof for it and we will provide more variance for it. The cute formula is: 

$$
\begin{aligned}
    \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
    (\theta)(1 - \theta)\Vert a - b\Vert^2 \quad \forall \theta \in \mathbb R, 
\end{aligned}
$$

**Observation**

The lhs is the norm of the affine combinations: $\Vert (1 - \theta) a + \theta b\Vert^2$, the first 2 terms on the RHS: $(1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2$ is the affine combination of the individual norms, and the final term is an extra term that makes the equality true. For more about Jensen's Inequality, 

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


---
### **A Generalized Version**

In the general version of the theorem, we consider an affine combinations of vectors in the Eulidean space, and form the equality: 

$$
\begin{aligned}
    \left\Vert \sum_{i \in I}^{}
        \alpha_ix_i
    \right\Vert^2
    + 
    \sum_{i \in I}^{}
        \sum_{i \in I}^{}
            \alpha_i\alpha_j\Vert x_i - x_j\Vert^2/2
    &= 
    \sum_{i \in I}^{}\alpha \Vert x_i\Vert^2, 
\end{aligned}
$$

which is the general case of the above Jensen's inequality. The proof is direct and follows a similar manner compare to the case where $|I| = 2$. 


**Reference**:

Heinz's monotone operator textbook, Lemma 2.13 (ii). Heinz himself refer this formula as the cute formula. 

---
### **An Augmented Version**







