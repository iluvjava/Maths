[[Convex Sets Intro]]
[[Generating Cone of a Set]]
[[Set Addition]]

---
### **Intro**

There operations on sets that preserve the convexity of the sets. Here is the list of them: 

1. Scaling by a positive factor. Equivalent to generating a cone on the set. 
2. Set addition. $Q_1, Q_2$ are convex then $Q_1 + Q_2$ is also a convex set. 
3. Inersection of convex sets are stil convex. 
4. Linear Mapping of sets Preserves convexity, from the domain to the preimages. 

To clarify: 

---
### **Linear Scaling**

> $Q \in \mathbb{R}^n$ implies that $\mathbb{R}_+(Q)$ is also convex. 

**Proof**: 

$$
\begin{aligned}
    ax\in \mathbb{R}_+(Q), by \in \mathbb{R}_+(Q); x, y \in Q, a,b \ge 0
    \\
    rx + (1 - r)y \in Q \quad \forall r \in (0, 1)
    \\
    \implies \forall u \ge 0: urx + (1 - r)uy \in \mathbb{R}_+(Q)
\end{aligned}
$$


Next, we wish to form match the expression $urx + (1 - r)uy$ in the form of a line segment in the set $\mathbb{R}_+(Q)$. Consider the variable susbtitutions: 

$$
\begin{aligned}
    & 
    \begin{cases}
        ur = \lambda a \quad \lambda \in (0, 1), a \ge 0
        \\
        (1 - r)u = (1 - \lambda) by \quad b \ge 0         
    \end{cases}
    \\
    & 
    \begin{cases}
        u - ur = (1 - \lambda) by 
        \\
        u - \lambda a = (1 - \lambda)by    
    \end{cases}
    \\
    u &= (1 - \lambda)by + \lambda a \ge 0 
    \\
    r &= \frac{\lambda a}{u} = \frac{\lambda a }{(1 - \lambda)by + \lambda a} \in (0, 1)
\end{aligned}
$$

The new scalar variable depends on $a, b, \lambda$, and $u \ge 0$, $r\in (0, 1)$. In this sense, we have: 

$$
\begin{aligned}
    & \forall u\ge 0,r\in (0, 1)  : urx + (1 - r)uy \in \mathbb{R}_+(Q)
    \\
    \implies
    & \lambda a x + (1 - \lambda)by \in \mathbb{R}_+(Q); \lambda\in (0, 1), a,b \ge 0 
\end{aligned}
$$

For any 2 elements $ax, by$ in the set $\mathbb{R}_+(Q)$, we have shown that its convex combination is also in the set $\mathbb{R}_+(Q)$, by the variable susbtitutions of $u, r$ where $u \ge 0 \;\wedge\; r\in (0, 1)$. 


---
### **Sets Addition**: 

> Given 2 convex sets, $Q_1, Q_2$, their sum $Q_1 + Q_2$ is still a convex set. 

**Proof**: 

The definition of sets addition: 

$$
Q_1 + Q_2 = \left\lbrace
    q_1 + q_2: q_1 \in Q_1, q_2 \in Q_2
\right\rbrace
$$

Choose any 2 elements $x, y$ from the addition of the set: 

$$
\begin{aligned}
    & \exists\; q_1 \in Q_1, q_2 \in Q_2 : x := q_1 + q_2
    \\
    & \exists\; q_3 \in Q_1, q_4 \in Q_2 : y := q_3 + q_4
\end{aligned}
$$

Then consider: 

$$
\begin{aligned}
    \lambda x &= \lambda(q_1 + q_2)
    \\
    (1 - \lambda) y &= (1 - \lambda)(q_3 + q_4)
    \\\implies
    \lambda x + (1 - \lambda)y &= 
    \lambda(q_1 + q_2) + (1 - \lambda)(q_3 + q_4)
    \\
    &= 
    \lambda q_1 + \lambda q_2 + (1 - \lambda) q_3 + (1 - \lambda)q_4
    \\
    \text{By convexity of $Q_1, Q_2$}; &= \underbrace{\lambda q_1 + (1 - \lambda) q_3}_{\in Q_1} + 
    \underbrace{\lambda q_2  + (1 - \lambda)q_4}_{\in Q_3}
    \\
    \implies &
    \lambda x + (1 - \lambda)y\in Q_1 + Q_2
\end{aligned}
$$

And we have shown that any chosen 2 points from the set $Q_1 + Q_2$ will have has its convex combinations in the set as well.

**Remarks**:

The closedness of the set is not preserved. There are examples where 2 sets that are closed and convex but their sum is not closed. On primary example I would give involves the use of Asymptopes. Consider the epigraph of function $1/x$ for all $x \ge 0$ to be the set $C$, consider the set $\{(x, y)| y = 0\}$ to be the set $D$, then the sequence $(-t, 0)\in D, (t, 1/t)$ added together is $(0, 1/t)$. As $t \rightarrow \infty$, the point would be $(0, 0)$, which is definitely not an element of the set $C + D$. Finally, we actually have $C + D = \mathbb R \times \mathbb R_{++}$, which is not closed. 


---
### **Intersection:** 

> Suppose that a sequence of convex set $Q_i$ is given, then $\bigcap_iQ_i$ is still a convex set. 

**Proof**
Trivial we skip that. 


---
### **Linear Mapping**

> If $Q \subset \mathbf{E}$ is convex, $L \subset \mathbf{Y}$ is convex, $A:\mathbf{E}\mapsto Y$, then $A(Q), A^{-1}(L)$ are convex, where $A^{-1}$ is the pre-image of the linear map. 

The proof is direct. Define that $A^{-1}Q := \{x| Ax \in Q\}$, and we denote $AQ := \{Ax|x\in Q\}$, denote $x_\lambda = \lambda x_1 + (1 - \lambda)x_0$ then we can say that for any $x_0, x_1 \in A^{-1}Q$

$$
\begin{aligned}
    & x_0 \in A^{-1}Q \iff Ax_0 \in Q, Ax_1 \in Q
    \\
    \iff & 
    \lambda Ax_1 + (1 - \lambda)Ax_0 \in Q &  \quad \text{ convexity of } Q
    \\
    \iff
    & A(\lambda x_1 + (1 - \lambda)x_0)\in Q & \quad \text{ linearity of A}
    \\
    \iff 
    & x_\lambda \in A^{-1}Q, 
\end{aligned}
$$

and the last statement is by the definition of pre-image of the linear operator $A$. This completes the proof that the pre-image of a linear mapping of a whole set will preserves the convexity of the convexity. 



---
### **Applications: Convexity of Functions**

[[Convexity Preserving Operations for Functions]]




