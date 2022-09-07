[From Conjugate Gradient to Lanczos](From%20Conjugate%20Gradient%20to%20Lanczos.md)
[Conjugate Gradient and Oblique Projectors](Conjugate%20Gradient%20and%20Oblique%20Projectors.md)

---
### **Intro**

This is the second attempt at deriving the Lanczos Algorithm from the conjugate Gradient. It's just a remake of the previous one nothing more. We aim for clearer presentation and a better handling with the sign problem for the residual of the conjugate gradient algorithm and the lanczos vectors. 

To introduce, we establish the base case of the Lanczos conjugate gradient algorithm and the matches it with the base case of the Lanczos Algorithm. Ultimately we wish to show that the orthogonal vectors generated from the lanczos algorithm are pointing in the same directions as the residual vectors from the Conjugate Gradient directions. 

---
### **Base Case from the Conjugate Gradient**

Our objective is to establish the equivalence between the parameters from the lanczos algorithm: $\alpha_k, \beta_k, q_k$ and the $a_j, b_j, r_j$ from the conjugate gradient algorithm. We establish it by going from the conjugate gradient to the Lanczos Algorithm. 

$$
\begin{aligned}
    r_0 &= p_0
    \\
    r_1 &= r_0 - a_0Ar_0
    \\
    Ar_0 &= a_0^{-1}(r_0 - r_1)
    \\
    Ar_0 &= \frac{\Vert r_0\Vert_A^2}{\Vert r_0\Vert^2}(r_0 - r_1)
\end{aligned}
$$

We aim to match the form of the first recurrence of Lanczos algorithm, between $q_1$ and $q_2$. We can do this because it's proven for the conjugate gradient that, the residual vectors $r_k$ are orthogonal to each other; but they are not yet unitary. To do that we need to do some substitutions.  Consider susbtituting $r_0 = \Vert r_0\Vert q_1, r_1 = -\Vert r_1\Vert q_2$, then: 

$$
\begin{aligned}
    A\Vert r_0\Vert q_1 
    &= \frac{\Vert r_0\Vert_A^2}{\Vert r_0\Vert^2}\left(
        \Vert r_0\Vert q_1 + \Vert r_1\Vert q_2
    \right)
    \\
    &= 
    \frac{\Vert r_0\Vert_A^2}{\Vert r_0\Vert^2}\Vert r_0\Vert q_1 + 
        \frac{\Vert r_1\Vert}{\Vert r_0\Vert} q_2
\end{aligned}
$$

And from this relation, it would imply that $\alpha_1 = a_0^{-1}$; $\beta_1 = \frac{\sqrt{b_0}}{\alpha_0}$. 


---
### **The Inductive Case**

Next, we wish to prove for the inductive case to match the parameters between the 2 algorithm. We start by considering the residuals of the Conjugate Gradient, giving us: 

$$
\begin{aligned}
    r_j &= r_{j - 1} - a_{j -1 }Ap_{j - 1}
    \\
    & =r_{j - 1} - a_{j - 1} A(r_{j - 1} + b_{j - 2}p_{j - 1})
    \\
    &= r_{j - 1} - a_{j - 1}Ar_{j - 1} - a_{j - 1}b_{j - 2}Ap_{j - 1}
\end{aligned}
$$

We make use of the recurrence asserted by the CG algorithm, giving us: 

$$
\begin{aligned}
    r_{j - 1} &= r_{j - 1} - a_{j - 2}Ap_{j - 1}
    \\
    r_{j - 1} - r_{j - 1} &= a_{j - 2} Ap_{j - 1}
    \\
    Ap_{j - 1} &= a^{-1}_{j -2} 
    \left(
        r_{j - 2} - r_{j - 1}
    \right)
\end{aligned}
$$

Here, we can susbtitute the results of for the term $Ap_{j - 1}$, and then we can express the recurrence of residual purely in terms of residual. Consider: 

$$
\begin{aligned}
    r_{j} &= r_{j - 1} - a_{j - 1}Ar_{j - 1} - a_{j - 1}b_{j - 2}Ap_{j - 2}
    \\
    &= 
    r_{j - 1} - a_{j - 1}Ar_{j - 1} - \frac{a_{j-1}b_{j-2}}{a_{j-2}}\left(
        r_{j - 2} - r_{j - 1}
    \right)
    \\
    &= \left(
        1 + \frac{a_{j - 1}b_{j -2}}{a_{j - 2}}r_{j - 1}
    \right)- a_{j - 1}Ar_{j - 1} - \frac{a_{j-1}b_{j-2}}{a_{j-2}}r_{j - 2}
    \\
    a_{j - 1}Ar_{j - 1} &= 
    \left(
        1 + \frac{a_{j - 1}b_{j -2}}{a_{j - 2}}r_{j - 1}
    \right)
    - \frac{a_{j-1}b_{j-2}}{a_{j-2}}r_{j - 2}
    \\
    Ar_{j - 1} &=
    \left(
        \frac{1}{a_{j - 1}} + \frac{b_{j - 2}}{a_{j- 2}}
    \right)r_{j - 1} + 
    \frac{r_{j}}{a_{j-1}} - 
    \frac{b_{j - 2}}{a_{j - 2}}r_{j - 2}
\end{aligned}
$$

Finally, we increment the index $j$ by one for notational convenience, and therefore we establish the following relations between the residuals of the conjugate gradient algorithm: 

$$
\begin{aligned}
    Ar_{j} &=
    \left(
        \frac{1}{a_{j}} + \frac{b_{j - 1}}{a_{j-  1}}
    \right)r_{j} + 
    \frac{r_{j + 1}}{a_{j}} - 
    \frac{b_{j - 1}}{a_{j - 1}}r_{j - 1}
\end{aligned}
$$

Reader please observe that, this is somewhat similar to the recurrence relations between the Lanczos vectors, however it's failing to match the sign, at the same time, it's not quiet matching the form of the recurrence of $\beta_k$ from the lanczos algorithm. To match it, we need the coeffcients of $r_{j - 1}$ and $r_{j + 1}$ to be in the same form, paramaterized by the same iterations parameter: $j$. To do that, consider the doing this:

$$
\begin{aligned}
    q_{j + 1} &:= \frac{r_{j}}{\Vert r_j\Vert}
    \\
    q_{j} &:= -\frac{r_{j - 1}}{\Vert r_{j - 1}\Vert} \quad 
    \text{Note: This is Negative}
    \\
    q_{j + 2} &:= \frac{r_{j + 1}}{\Vert r_{j + 1}\Vert}
    \\
    \implies 
    A\Vert r_j\Vert q_{j + 1} 
    &= 
    \left(
        \frac{1}{a_j} + \frac{b_{j - 1}}{a_{j - 1}}
    \right)\Vert r_j\Vert q_{j + 1}
    + 
    \frac{\Vert r_{j + 1}\Vert q_{j + 2}}{a_j}
    +
    \frac{b_{j - 1}\Vert r_{j - 1}\Vert}{a_{j - 1}}q_{j}
    \\
    Aq_{j + 1} &= 
    \left(
        \frac{1}{a_j} + \frac{b_{j - 1}}{a_{j - 1}} 
    \right)
    q_{j + 1}
    + 
    \frac{\Vert r_{j + 1}\Vert}{a_j \Vert r_j\Vert}q_{j + 2} + 
    \frac{b_{j - 1}\Vert r_{j - 1}\Vert}{a_{j - 1}\Vert r_j\Vert}q_j
\end{aligned}
$$

Recall that parameters from Conjugate Gradient, $\sqrt b_j = \Vert r_{j + 1}\Vert/\Vert r_j\Vert$, and $a_j = \frac{\Vert r_j\Vert^2}{\Vert p_j\Vert_A^2}$, and we can use the substitution to match the coefficients for $q_{j + 2}$ and $q_j$, giving us: 

$$
\begin{aligned}
    \frac{\Vert r_{j + 1}\Vert}{a_j\Vert r_j\Vert} &= 
    \frac{1}{a_j}\sqrt{b_j}
    \\
    \frac{b_{j - 1}\Vert r_{j - 1}\Vert}{a_{j - 1}\Vert r_j \Vert}
    &= 
    \frac{b_{j - 1}}{a_{j - 1}}\frac{1}{\sqrt{b_{j - 1}}}
    = 
    \frac{\sqrt{b_{j - 1}}}{a_{j - 1}}
    \\
    \implies& 
    \begin{cases}
        \alpha_{j + 1} = \frac{1}{a_j} + \frac{b_{j - 1}}{a_{j - 1}}
        & \forall 1 \le j \le n - 1
        \\
        \beta_{j} = \frac{\sqrt{b_{j - 1}}}{a_{j - 1}}
        & \forall 2 \le j \le n - 2 
    \end{cases}
\end{aligned}
$$

Take notes that the form is now matched, but the expression for $\alpha_{j + 1}$ has an extra $b_{j - 1}/a_{j - 1}$, to resolve that, we take the audacity to make $b_0$ so that it's consistent with the base case. 

---
### **Matching The Residuals and Lanczos Vectors**

We can't take the triumph yet; we need to take a more careful look into the sign between $q_j$ the Lanczos Vector and its equivalcne residual: $r_{j - 1}$ in CG. Here, I want to point out the fact that, there are potentially 2 susbstitution possible for the above derivation for the inductive case and regardless of which one we use, it would still preserve the correctness for the proof. By which I mean the following substitutions would have both made it work:

$$
\begin{aligned}
    \begin{cases}
        q_{j + 1} := \pm \frac{r_j}{\Vert r_j\Vert}
        \\
        q_{j} := \mp \frac{r_{j - 1}}{\Vert r_{j - 1}\Vert}
        \\
        q_{j + 2} := \pm \frac{r_{j + 1}}{\Vert r_{j + 1}\Vert}
    \end{cases}
\end{aligned}
$$

Under the context, the operations $\pm, \mp$ are correlated, choose a sign for one, the other must be of opposite sign. In this case both substitutions work the same because multiplying the equation by negative one would give the same equality, and we can always mulitply by and other negative sign to get it back. The key here is that, the sign going from $q_{j}$ to the next $q_{j - 1}$ will have to alternate. To find out precisely which one it is, we consider the base case for the Lanczos Vectors and Residuals:

$$
\begin{aligned}
    q_1 &= \hat r_0\\
    q_2 &= -\hat r_1
    \\
    \vdots
    \\
    q_j &= (-1)^{j + 1}\hat r_{j + 1}
\end{aligned}
$$

And at this point, we have established the equivalence going from the Conjugate Gradient algorithm to the Lanczos Algorithm.

