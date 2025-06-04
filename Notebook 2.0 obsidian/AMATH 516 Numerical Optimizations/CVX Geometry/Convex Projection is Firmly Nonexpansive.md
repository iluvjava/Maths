1. [[AMATH 516 Numerical Optimizations/Background/Local, Global Lipschitz Continuity]]
2. [[Convex Sets Projection Obtuse Angle Theorem]]
3. Used in: [[Convex Sets Projections and Dist, Intro]]


--- 
### **Intro**

This theorem is beginning to get useful algorithmically. Another way of stating it is that, convex projections are **non-expansive**. 

---
### **Statement of Theorem**
We wish to prove the that projector as a function of $\mathbb{R}^n\mapsto \mathbb R$ is also a Lipschitz continuous function. To state the theorem: 

> $$
> \forall x, y \in \mathbb{R}^n: \left\Vert
>     \Pi_Q (x) - \Pi_Q(y)
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
    \left\Vert \Pi_Q(x_1) - \Pi_Q(x_2)\right\Vert_2^2
    &\le 
    \left\langle 
        \Pi_Q(x_1) - \Pi_Q(x_2), x_1 - x_2
    \right\rangle
    \\
    \implies 
    \left\langle 
            \Pi_Q(x_1) - \Pi_Q(x_2), x_1 - x_2
    \right\rangle
    &\le 
    \left\Vert 
	    \Pi_Q(x_1) - \Pi_Q(x_2)
	\right\Vert_2 
	\Vert x_1 - x_2\Vert_2
    \\
    \implies 
    \Vert \Pi_Q(x_1) - \Pi_Q(x_2)\Vert_2 &\le \Vert x_1 - x_2\Vert_2. 
\end{aligned}
$$

The first imply sign is by Cauchy Swarchtz, the second is direct. Let's prove the first statement by considering the fact that the set $Q$ is convex. W will make use of the *Obtuse Angle Property of Convex Sets* from [[Convex Sets Projection Obtuse Angle Theorem]]:  

$$
\begin{aligned}
    \forall x_1, x_2 \in Q:&   \\
    \left\langle 
        \Pi_Q(x_2) - \Pi_Q(x_1), 
        x_1 - \Pi_Q(x_1) 
    \right\rangle &\le 0 
    \\
    \left\langle 
    \Pi_Q(x_1) - \Pi_Q(x_2), 
    x_2 - \Pi_Q(x_1) 
    \right\rangle &\le 0. 
\end{aligned}
$$

For any 2 points, $x_1, x_2$ in the set $Q$, relative to each other they make a projection obtuse angle. Continuing we have: 

$$
\begin{aligned}
        \left\langle 
            \Pi_Q(x_2) - \Pi_Q(x_1), 
            x_1 - \Pi_Q(x_1) 
        \right\rangle &\le 0 
        \\
        \left\langle 
        \Pi_Q(x_2) - \Pi_Q(x_1), 
        \Pi_Q(x_1)  - x_2
        \right\rangle &\le 0
        \\
        \underset{\text{add them}}{\implies} \left\langle 
            \Pi_Q(x_2) - \Pi_Q(x_1), 
            x_1 - x_2 + \Pi_Q(x_2) - \Pi_Q(x_1)
        \right\rangle &\le 0
        \\
        \left\Vert 
	        \Pi_Q(x_2) - \Pi_Q(x_1)
	    \right\Vert_2^2
		- \left\langle \Pi_Q(x_2) - \Pi_Q(x_1), x_2 - x_1 \right\rangle &\le 0, 
\end{aligned}
$$

and this loop back to the claim that is stated at the start of the proof. Theorem is proved. 

**Remarks**: 

This theorem shows that, a projection operator is also a Nonexpansive operator, see [[../Operators Theory/Firmly Nonexpansive Operators]] for more details about this class of operators. 
