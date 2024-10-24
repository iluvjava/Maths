1. [Lipschitz Continuity](../Background/Lipschitz%20Continuity.md)
2. [Convex Sets Projection Obtuse Angle Theorem](Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md)
3. Used in: [Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md)


--- 
### **Intro**

This theorem is beginning to get useful algorithmically. Another way of stating it is that, convex projections are **non-expansive**. 

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
    \left\Vert \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2)\right\Vert_2^2
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
    \left\Vert 
	    \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2)
	\right\Vert_2 
	\Vert x_1 - x_2\Vert_2
    \\
    \implies 
    \Vert \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2)\Vert_2 &\le \Vert x_1 - x_2\Vert_2. 
\end{aligned}
$$

The first imply sign is by Cauchy Swarchtz, the second is direct. Let's prove the first statement by considering the fact that the set $Q$ is convex. W will make use of the *Obtuse Angle Property of Convex Sets* from [Convex Sets Projection Obtuse Angle Theorem](Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md):  

$$
\begin{aligned}
    \forall x_1, x_2 \in Q:&   \\
    \left\langle 
        \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1), 
        x_1 - \underset{Q}{\text{proj}}(x_1) 
    \right\rangle &\le 0 
    \\
    \left\langle 
    \underset{Q}{\text{proj}}(x_1) - \underset{Q}{\text{proj}}(x_2), 
    x_2 - \underset{Q}{\text{proj}}(x_1) 
    \right\rangle &\le 0. 
\end{aligned}
$$

For any 2 points, $x_1, x_2$ in the set $Q$, relative to each other they make a projection obtuse angle. Continuing we have: 

$$
\begin{aligned}
        \left\langle 
            \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1), 
            x_1 - \underset{Q}{\text{proj}}(x_1) 
        \right\rangle &\le 0 
        \\
        \left\langle 
        \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1), 
        \underset{Q}{\text{proj}}(x_1)  - x_2
        \right\rangle &\le 0
        \\
        \underset{\text{add them}}{\implies} \left\langle 
            \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1), 
            x_1 - x_2 + \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1)
        \right\rangle &\le 0
        \\
        \left\Vert 
	        \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1)
	    \right\Vert_2^2
		- \left\langle \underset{Q}{\text{proj}}(x_2) - \underset{Q}{\text{proj}}(x_1), x_2 - x_1 \right\rangle &\le 0, 
\end{aligned}
$$

and this loop back to the claim that is stated at the start of the proof. Theorem is proved. 

**Remarks**: 

This theorem shows that, a projection operator is also a Nonexpansive operator, see [Firmly Nonexpansive Operators](../Operators%20Theory/Firmly%20Nonexpansive%20Operators.md) for more details about this class of operators. 
