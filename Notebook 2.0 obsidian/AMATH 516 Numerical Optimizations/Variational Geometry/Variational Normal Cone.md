
- [Normal Cone](Normal%20Cone.md)
- [Regular Subgradient](Subgradient%20Intro.md)

---
### **Intro**

We discuss some of the properties expected of Variational normal cones. 
Recall the definition of a regular Frechet normal cone defined on set $C \subseteq \mathbb R^n$: 

#### **Def | Frechet Regular Normal Cone**

$$
\begin{aligned}
    v \in \widehat N_C(\bar x) \iff 
    \limsup_{
        \substack{
            x \rightarrow \bar x 
            \\
            x \in C}
        }
    \frac{\langle c, x - \bar x\rangle}{\Vert x - \bar x\Vert} \le 
    0 \quad 
    \forall c \in C. 
\end{aligned}
$$


**Remarks**
The reader should realize the similarity between the definition of the limiting normal cone and the limiting subgradient. 

---
#### **Def | Limiting Normal Cone**
> Let $C \subseteq \mathbb R^n$. Let $\bar x \in C$. 
> Then we define $v \in N_C(\bar x)$ to be the limiting normal cone and $v$ is defined by the characterization that: 
> $$
> \begin{aligned}
>     N_C(\bar x) := 
>     \left\lbrace
>         v \in \mathbb R^n\left| 
>             \exists\; 
>              x^{(\gamma)}  \overset{\in C}{\longrightarrow} \bar x \text{ s.t: }
>             v^{(\gamma)} \in \widehat 
>             N\left(x^{(\gamma)}\right), v^{(\gamma)}\rightarrow v
>         \right.
>     \right\rbrace
> \end{aligned}
> $$
> In short, the outer set limit of the set operator $\widehat N_C(\bar x)$ is the limiting normal cone. 


### **The Basics**

We introduce some basic properties of the normal based on the definition of the normal cone. 

#### **Thm | The Basics of Regular Normal Cone**
> Let $C \subseteq \mathbb R^n$, let $\widehat N_C(\bar x)$ be the regular normal cone then 
> 1. $\widehat N_C(\bar x)$ is a closed convex cone. 
> 2. $N_C(\bar x)$ is a closed cone. 
> 3. $\mathbf 0 \in \widehat N_C(\bar x) \subseteq N_C(\bar x)$. 

**Proof** 

From the definition it's direct that $\widehat N_C(\bar x)$ is a cone and it's closed. 
To see (1.) is true, so that C is convex, observe that for non-negative $\alpha, \beta$, and $u \in \widehat N_C(\bar x), v \in \widehat N_C(\bar x)$, then $\alpha u \in \widehat N_C(\bar x)$ and $\beta v \in \widehat N_C(\bar x)$. 
Consider the expression 

$$
\begin{aligned}
    \frac{\langle \alpha u + \beta v, x - \bar x\rangle}{ o(\Vert x - \bar x\Vert)} 
    &= 
    \alpha\left(
        \frac{\langle  u, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)} 
    \right) + 
    \beta
    \left(
        \frac{\langle v, x -\bar x\rangle}{o(\Vert x - \bar x\Vert)}
    \right)
    \\
    \limsup_{x \overset{\in C}{\rightarrow } \bar x}
        \frac{\langle \alpha u + \beta v, x - \bar x\rangle}{ o(\Vert x - \bar x\Vert)} 
    &= 
    \limsup_{x \overset{\in C}{\rightarrow } \bar x}
    \alpha\left(
        \frac{\langle  u, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)} 
    \right) + 
    \beta
    \left(
        \frac{\langle v, x -\bar x\rangle}{o(\Vert x - \bar x\Vert)}
    \right)
    \\
    &= 
    \alpha \limsup_{x \overset{\in C}{\rightarrow } \bar x}
        \frac{\langle  u, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)} 
    + 
    \beta \limsup_{x \overset{\in C}{\rightarrow } \bar x}
    \frac{\langle v, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)}. 
    \\
    & \le 0
\end{aligned}
$$

At the last line we used the fact that the limit exists due $\alpha v, \beta u \in \widehat N_C(\bar x)$. 
And the conclusion of the above derivation would be that $\alpha u + \beta v \in \widehat N_C(\bar x)$ as well, and therefore the cone is a convex cone. 
The set is closed because by the definition we have that $\mathbf 0 \in \widehat N_{C}(\bar x)$ trivially. 

#### **Thm | Parallelization Properties of Normal Cone**
> Let $C = A \times B$, so that it can be represented as the product space of 2 vector spaces. 
> I.e: $A \subseteq \mathbb R^k$, $B \subseteq \mathbb R^l$, with $k + l = n$. 
> Then the regular normal cone has $\widehat N_C(\bar x) = \widehat N_A(\bar x) \times \widehat N_B(\bar x)$


**Proof**

