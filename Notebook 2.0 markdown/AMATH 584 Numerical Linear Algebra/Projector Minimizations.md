[Steepest Descend for Matrix Vector](../AMATH%20515%20Optimization%20Fundamentals/Steepest%20Descend%20for%20Matrix%20Vector.md)
[Deeper Look into Projector](Matrix%20Theory/Deeper%20Look%20into%20Projector.md)

---
### **Intro**

Our objective is to minimizes the error of norm along some subspace under some specific norm. And we are perticularly inerested in the case where that subspace is just one particular directions, which reduces to the case of Steepest Gradient Descend. The results of using a projector is equivalent to using gradient, or solving the norm equation in some form or another. This is in infact, the best way to do it beause it's **Generic to the subspace** that we are minimizing on, and it's very simple. Our goals here is to derive some of the Useulf formula for future quick use. 



Here, we use $P_{M}$ to denote an orthogonal projector that is projecting onto the define subapce $M$. 

For the sake of making things more concrete, consider this:

> Given any subspace $M$, we can create a basis of vectors packing into the some matrix, say $A$, then $P_M$ can simply be: $A(AA^T)^{-1}A^T$. Boom! 

**Projector Always Minimizes**

> $$
> \Vert P_Mx\Vert^2 \le \Vert x\Vert^2
> $$

**Proof:**
We simply denotes $P_M$ as $P$, and assume that it's a matrix instead of some generic transformation.

$$
\begin{aligned}
    x &= Px + (I - P)x 
    \\
    \Vert x\Vert^2 &= \Vert Px\Vert^2 + \Vert (I - P)x\Vert^2
    \\
    \Vert x\Vert^2 &\ge \Vert Px\Vert^2
\end{aligned}
$$

And this is true by the property of an Orthogonal Projector. Notice that, the northogonal projector decompose the vector into 2 orthogonal component, one in the subspace, the other in the orthogonal complement of the subspace. 

**Fundamental norm Minimizations using Projector**
> The Orthogonal Projector onto a subspace, say $P_M$ onto the subspace $M$ can be used to minimize distance $x -y$ where &x& from the subspace $M$ against another vecotr $y$. 
> $$
> \min_{x\in M} \Vert y - x\Vert_2^2 = \Vert y - P(y)\Vert_2^2
> $$
> Consequently, we have: $y - Py\perp M$.

**Proof**
$$
\begin{aligned}
    \Vert y - x\Vert_2^2 &= 
    \Vert y - Py + Py - x\Vert_2^2
	\\
    \Vert y - x\Vert_2^2 &= 
    \Vert y - Py\Vert_2^2 + \Vert Py - x\Vert_2^2
    \\
    \implies 
    \Vert y - Py\Vert_2^2 \le& \Vert y - x\Vert_2^2
\end{aligned}
$$

That concludes the proof. Observe that, $y - Py\perp M$ and $Py - x \in M$ because $Py, x \in M$, which allows us to split the norm of $y - x$ into 2 components. In addition using the fact that the projector is orthogonal. That concludes the proof.


---
### **Applications**


Shortest distance from a point to an affine space. This is a basic Example we had in muti-varible calculus class. 

$$
\begin{aligned}
    \min_{x \in x_0 + \text{span}(M)} \Vert y - x\Vert_2^2
    &= 
    \min_{x \in \text{span}(M)} \Vert y - (x + x_0)\Vert_2^2
    \\
    &= 
    \min_{x \in \text{span}(M)} \Vert (y - x_0) - x\Vert_2^2
    \\
    &= \Vert (y - x_0) - P_M(y - x_0) \Vert_2^2
    \\
    &= \Vert y - P_My - x_0 + P_Mx_0\Vert_2^2
    \\
    &= \Vert 
        (I - P_M)y - (I - P_M) x_0
    \Vert_2^2
\end{aligned}
$$

And that actually makes sense it's some pretty simple math. 

