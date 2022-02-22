[[Steepest Descend for Matrix Vector]]
[[Deeper Look into Projector]]

---
### **Intro**

Our objective is to minimizes the error of norm along some subspace under some specific norm. And we are perticularly inerested in the case where that subspace is just one particular directions, which reduces to the case of Steepest Gradient Descend. The results of using a projector is equivalent to using gradient, or solving the norm equation in some form or another. This is in infact, the best way to do it beause it's **Generic to the subspace** that we are minimizing on, and it's very simple. Our goals here is to derive some of the Useulf formula for future quick use. 



Here, we use $P_{M}$ to denote an orthogonal projector that is projecting onto the define subapce $M$. 

**Projector Always Minimizes**

> $$
> \Vert P_Mx\Vert^2 \le \Vert x\Vert^2
> $$

**Proof:**
We simply denotes $P_M$ as $P$.

$$
\begin{aligned}
    x &= Px + (I - P)x 
    \\
    \Vert x\Vert^2 &= \Vert Px\Vert^2 + \Vert (I - P)x\Vert^2
    \\
    \Vert x\Vert^2 &\ge \Vert Px\Vert^2
\end{aligned}
$$

And this is true by the property of an Orthogonal Projector. 

**Fundamental norm Minimizations using Projector**




