[[Lipschitz Continuity]]
[[Convex Sets Properties]]
[[Set Projections and Dist]]


--- 
### **Intro**



---
### **Statement of Theorem**
We wish to prove the that projector as a function of $\mathbb{R}^n\mapsto \mathbb R$ is also a Lipschitz continuous function. To state the theorem: 

> $$
> \forall x, y \in \mathbb{R}^n: \left\Vert
>     \underset{Q}{\text{proj}} (x) - \underset{Q}{\text{proj}}(y)
> \right\Vert_2 \le 
> \Vert 
>     x - y
> \Vert_2
> $$
> If the set $Q$ is closed and convex. The converse is unknown. 


**Proof**

Assume that following claim is true then we can derive the theorem from the claim. Follows as: 

$$
\begin{aligned}
    \Vert \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2)\Vert_2^2
    &\le 
    \left\langle 
        \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2), x_1 - x_2
    \right\rangle
    \\
    \implies 
    \left\langle 
            \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2), x_1 - x_2
    \right\rangle
    &\le 
    \Vert \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2)\Vert_2 \Vert x_1 - x_2\Vert_2
    \\
    \implies 
    \Vert \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2)\Vert_2 &\le \Vert x_1 - x_2\Vert_2
\end{aligned}
$$

The first imply is Cauchy Swarchtz, the second is direct. Let's prove the first statement by considering the fact that the set $Q$ is convex: 

$$
\begin{aligned}

\end{aligned}
$$
