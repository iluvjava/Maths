[Convex Sets](../Background/Convex%20Sets.md)
[Generating Cone of a Set](../Background/Generating%20Cone%20of%20a%20Set.md)
[Set Addition](../Background/Set%20Addition.md)

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

Choose any 2 elements from the addition of the set: 

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

---
### **Intersection:** 

> Suppose that a sequence of convex set $Q_i$ is given, then $\bigcap_iQ_i$ is still a convex set. 

**Proof**
Trivial we skip that. 


---
### **Linear Mapping**

> If $Q \subset \mathbf{E}$ is convex, $L \subset \mathbf{Y}$ is convex, $A:\mathbf{E}\mapsto Y$, then $A(Q), A^{-1}(L)$ are convex, where $A^{-1}$ is the pre-image of the linear map. 

Choose $x, y$ from the image of $A$: $x, y \in A(Q)$, then $\exists u \in Q: A(u) = x, \exists v \in Q: A(v) = y$, by the definition of an image of the operator $A$. Here, $u, v$ belongs to the pre-image. Consider the convex combinations of $x, y$, we have: 

$$
\begin{aligned}
    \lambda x + (1 - \lambda) y &= \lambda A(u) + (1 - \lambda) A(v) \quad \forall \lambda \in (0, 1)
    \\
    &= A(\lambda u + (1 - \lambda) v)
\end{aligned}
$$

using the fact that $Q$ is a convex set, $\lambda u + (1 - \lambda)v$ is in $Q$, and $\lambda x + (1 - \lambda) y$ is in the range of the operator $A$. Next, Consider choices of $x, y$ from the pre-image of $A$ for $x, y$, let $U := \{u\in L: A^{-1}(u) = x\}$ and $V := \{v\in L: A^{-1}(v) = y\}$. Then consider the convex combinations of $x, y$: 

$$
\begin{aligned}
    \lambda x + (1- \lambda)y &= \lambda A^{-1}(U) + (1- \lambda)A^{-1}(V) \quad \forall \lambda \in (0, 1)
    \\
    &= A^{-1}(\lambda U + (1- \lambda)V)
\end{aligned}
$$

By the convexity of $L$, the set $\lambda U + (1 - \lambda)V$ is a subset of $Q$, therefore, the pre-image of the convex combinations of $x, y$ is still a preimage of $A$, and convex comb of $u, v$ is still in the range of $Q$. Therefore the set of pre-images of $A$ is convex if $L$ is convex. 


---
### **Remarks:Convexity of Functions**

[Convexity Preserving Operations of Functions](Convexity%20Preserving%20Operations%20of%20Functions.md)




