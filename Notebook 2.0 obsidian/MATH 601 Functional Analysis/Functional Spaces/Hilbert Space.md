- [Innert Product Space](Innert%20Product%20Space.md), 
- [Convex Sets Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Intro.md). 

---
### **Into**

[Hilbert space](https://mathworld.wolfram.com/HilbertSpace.html) is a complete inner product space. It's Banach space Enhanced with Euclidean geometry. There is one important results that come from the completeness of the Hilbert space, and that is the projection theorem. For more about the projection theorem in finite dimensional spaces, visit [Convex Sets Projections and Dist, Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) for more info. Other interests of Hilbert space includes orthogonal basis and linear operator, which will be more interesting due to the fact that [Hilbert spaces are self dual to each other](https://mathworld.wolfram.com/Self-Dual.html), which allows for an inner product, bilinear form representation for linear mapping, and the important Rietz Representation Theorem. 


---
### **Hilbert Space Projection Theorem**
> Let $\mathcal H$ be a Hilbert space, and $M\subseteq \mathcal H$, and $M$ is a closed, convex set, then $\forall x \in \mathcal H \; \exists ! y \in M: \Vert x - y\Vert = \inf_{y'\in M} \Vert y' - x\Vert$, in brief, there is a unique point in the set $M$ such that it's closest to any arbitrary point $x \in \mathcal H$. 

**Observations**: 

Take note that, this is a generalized case of the extreme-value theorem where, the function is the distance function from a convex set, which is continuous, and it's stronger in the sense that we have a unique minimizer to such function and without compactness to hold for the domain of the function, which is $M \subseteq \mathcal H$. In the proof, please observe how the properties of Hilbert space and inner product space is being used. To summarized: 

1. We make a sequence from the infimum, and then we take the limit of it. 
2. We show that the sequence has to be Cauchy, therefore it converges to limit, which it's in $M$. 
3. Next, we show that the projection point has to be unique. 

**Proof**: 

To start, we intent the following notations to make things better: 

$$
\begin{aligned}
    \Pi_M(x) &:= \left\lbrace
        y \in M \left| 
        \Vert y - x\Vert = \inf_{y'\in M} \Vert y' - x\Vert
        \right.
    \right\rbrace,\text{ Projection on M }
    \\
    d_M(x) &:= \inf_{y'\in M} \Vert y' - x\Vert, \quad \text{ The distance func. }
\end{aligned}
$$

From the property of $\inf$, take sequence $(y^{(n)})_{n\in \N}$ with $y^{(n)} \in M$, for all $n\in \N$, then we have $\lim_{n\rightarrow \infty} \Vert x - y^{(n)}\Vert = d_M(x)$. We show that the sequence $y^{(n)}$ is Cauchy. By $M$ is convex, we have: 

$$
\begin{aligned}
    \frac{y^{(m)} - y^{(n)}}{2} &\in M
    \\
    \implies d_M(x) &\le 
    \left\Vert
        x - \frac{y^{(n)} - y^{(m)}}{2}
    \right\Vert, 
\end{aligned}
$$

We now consider the paralelogram law: 

$$
\begin{aligned}
    \Vert 
        \underbrace{y^{(n)} - x - (y^{(m)}- x)}_{ = y^{(n)} - y^{(m)}}
    \Vert^2 + 
    \Vert y^{(n)} - x + (y^{(m)}- x)\Vert
    &= 
    2 \Vert y^{(n)} - x\Vert^2 + 2\Vert y^{(m)} - x\Vert^2
    \\
    \Vert y^{(m)} - y^{(n)}\Vert^2 &= 
    2\Vert y^{(n)} - x\Vert^2 + 2 \Vert y^{(m)} - x\Vert^2 
    - \Vert (y^{(m)} - x) + (y^{(n)} - x)\Vert^2
    \\
    &= 2(\Vert y^{(n)} - x\Vert^2 + \Vert y^{(m)} - x\Vert^2) 
    - \Vert y^{(m)} - y^{(n)} - 2x\Vert^2
    \\
    &= 
    2(\Vert y^{(n)} - x\Vert^2 + \Vert y^{(m)} - x\Vert^2) 
    - 4\left\Vert
        \frac{y^{(m)} - y^{(n)}}{2} - x
    \right\Vert^2
    \\
    &\le 
    2(\Vert y^{(n)} - x\Vert^2 + \Vert y^{(m)} - x\Vert^2) 
    - 4d_M^2(x), 
\end{aligned}
$$

by $\lim_{n\rightarrow \infty} \Vert y^{(n)} - x\Vert = d_M(x)$, we have: 

$$
\begin{aligned}
    \lim_{n, m\rightarrow \infty} \Vert y^{(n)} - y^{(m)}\Vert \le 
    2d^2_M(x) + 2d^2_M(x) - 4d^2_{M}(x) = 0, 
\end{aligned}
$$

therefore, the sequence $y^{n}$ is indeed a Cauchy sequence, it sure has a limit, and therefore, by closure of $M$, denote the limt $\bar y \in M\subseteq \mathcal H$, and $\bar y\in \Pi_M(x)$. Next we show that the projection point onto the set $M$ is unique. Choose $\bar y_0 \in \Pi_M(x)$, then $d_M(x) = \Vert y_0 - x\Vert$, we use the Parallarogram law and consider: 

$$
\begin{aligned}
    \left\Vert
        \frac{\bar y + \bar y_0}{2} - x
    \right\Vert &\ge d_M(x)
    \\ 
    \Vert \bar y - \bar y _0\Vert^2 &= \Vert (\bar y - x) - (\bar y_0 - x)\Vert^2
    \\
    &= 2\Vert \bar y - x\Vert^2 + 2\Vert \bar y_0 - x\Vert^2 - 4
    \left\Vert
        \frac{\bar y_0 - \bar y}{2} - x
    \right\Vert^2
    \\
    &\le 
    2d_M^2 + 2d_M^2(x) - 4d_M^2(x) = 0, 
\end{aligned}
$$

therefore, we have $\bar y = \bar y_0$. Therefore, the projection $\Pi_M(x)$, is a singleton set. 


---
### **The Obtuse Angle Theorem in Hilbert Spaces**

> Let $M\subseteq \mathcal H$ be closed and convex, then 


---
### **Orthogonal Normal Basis**

We introduce the idea of ortho-normal basis in the Hilbert space. A type of infinite dimension basis. 