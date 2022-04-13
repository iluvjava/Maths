[[Convex Sets]]
[[Set Projections and Dist]]


---
### **Intro**

We list/prove some of the useful properties of convex sets, in Finite Euclidean spaces. 

---
### **Obtuse Angle Projection**

> For any closed, convex, non-empty set $Q$ in the finite Eulidean space, the projection (it's a singleton set) of any points on to the set to the point itself make an abstuse angle with all the other points in the set $Q$. Mathematically: 
> $$
> \begin{aligned}
>     \forall y \;\exists z: \{z\} &= \underset{Q}{\text{proj}}(y)
>     \\
>     \implies
>     \langle y - z, x - z\rangle &\le 0 \quad \forall x \in Q
> \end{aligned}
> $$

**Proof**:

The proof involves 2 directions, For the $\impliedby$ direction, consider for any $x\in Q$:

$$
\begin{aligned}
    x - z &= x - y + y - z
    \\
    \langle y - z, x - z\rangle
    &= 
    \langle y - z, x - y + y - z\rangle \le 0
    \\
    &= \langle y - z, y - z\rangle + 
    \langle y - z, x - y\rangle \le 0
    \\
    &= \Vert y - z\Vert_2^2 + 
    \langle x - y, y - z\rangle \le 0 
    \\
    \Vert y - z\Vert_2^2 &
    \le \langle x - y, z - y\rangle
    \\
    \Vert y - z\Vert_2^2 
    &\le
    \Vert x - y\Vert_2\Vert z - y\Vert_2 \quad \text{Cauchy}
    \\
    \Vert y - z\Vert_2 &\le
    \Vert x - y\Vert_2
\end{aligned}
$$

Which completes this part of the proof, because the last statement states that for all $x \in Q$, it's clear that the distance from $y$ to $z$ is smaller than any other $x$ to $z$. Weather this set $Q$ is convex or not it's still up to debate, but at we least do know that the point $z$ is an minimizer. 

**Please Observe:**

We didn't make use of the properties that $Q$ is convex, therefore this direction holds for non-convex set $Q$ (Some sets that has a point at the point $z$, and then flatten out, they don't have to be convex). Next, we prove that if $x \in \text{proj}_Q(y)$ then the obtuse angle part of the statement is true. Please consider: 

$$
\begin{aligned}
    x(t)& := z + t(x - z)\;\forall t \in [0, 1]
    \\
    \implies  x(0) &= z,  x(1) = x
    \\
    \varphi(t) &:= \frac{1}{2}\Vert y - x(t)\Vert_2^2
    \\
    \varphi(t) &\ge \varphi(0)
    \\
    Q \text{ Convex }\implies & 
    \varphi(t) \in Q\; \forall t \in [0, 1]
    \\
    \implies \lim_{t \searrow 0}
    \frac{\varphi(t) - \varphi(0)}{t}
    &= \varphi'(0) = 
    \langle  y - x(0), x'(t)\rangle
    \\
    &= \langle y - z, x - z\rangle \ge 0
    \\
    - 
    \langle z - y, x - z \rangle &\ge 0
\end{aligned}
$$

Take note that, $\varphi(t) \ge \varphi(0)$, which is how we get the inequality at the second last statement. In this statement we made use of the fact that the line segment is always in the set $Q$, and the monotone property of $\varphi(t)$ to get the proof work. 


---
### **Uniqueness**

> For an nonempty closed convex set $Q$ and any points $y\in \mathbb R^n$, the projection of $y$ onto $Q$ is unique and it's in the set $Q$. 


**Proof**:

The proof for this is stragiht forward if we make use of the previous proof. Consider: 

$$
\begin{aligned}
    & z, z' \in \underset{Q}{\text{proj}}(y)
    \\
    \implies
	&
    \langle y - z, z - z'\rangle \le 0 \;\wedge\;
    \langle y - z',z - z'\rangle \le 0
    \\
    \implies &
    \langle z - z', z - z'\rangle = \Vert z - z'\Vert_2^2 \le 0
\end{aligned}
$$

Take the difference between the 2 inner products and then get the norm less than zero, which implies that $z = z'$. 





