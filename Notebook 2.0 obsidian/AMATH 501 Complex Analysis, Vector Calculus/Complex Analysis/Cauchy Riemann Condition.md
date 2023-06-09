- [[Complex Functions]], 
- [Complex Differential, Holomorphic](Complex%20Differential,%20Holomorphic.md). 

---
### **Intro**

It's not true that among all the complex functions, that we can take the derivative directly on it, because, they are multi functions, they have multiple outputs. The existence of derivative wrt to one complex variable is strong. Surprisingly,  the normal rule of differentials applies to complex functions, and it applies for an open region along that point, then Analyticity is true for that functions. 

#### **Def-1 | Analytical Complex Functions**
> An analytical complex function is a function that is infinitely differentiable, and it has a Taylor series that converges pointwise at an epsilon region around any point in the domain for the function. 

---
### **Cauchy Riemann Conditions | Necessary Condition**

The cauchy riemann condition characterizes the complex differentibility of a function at a point. 
#### **Def | Complex Differentiability, Holomorphic**

> A function $f: \mathbb C \mapsto C$ is complex differentiable at a point $z_0$ if and only if the limit 
> $$
>   \lim_{z\rightarrow z_0} \frac{f(z) - f(z_0)}{z - z_0}, 
> $$
> we amphasizes the fact that, $z \rightarrow z_0$ on the complex plane in all possible trajectories, with all possible paramaterization of the curves. 

**Remarks**

the world *Holomprhic* is another term for describing that a function is complex differentiable. And it means differentiable around a vicinity of a point $z_0 \in \mathbb C$. This condition is equivalent to the function being analytic around the point $z_0$. 

#### **Thm | Cauchy Riemann Conditions (Necessary)**
> Let $f: \mathbb C \mapsto \mathbb C := u(x, y) + i v(x, y)$ with $z = x + i y$ and $u, v$ maps from $\mathbb R^2 \mapsto \mathbb R$ has gradient at $(x, y)$, denoting the real and the imaginary part of the function. A necessary conditions for $f$ being differentiable around the point $z = x + iy$ is the cauchy Riemann conditions, stated as: 
> $$ 
> \begin{cases}
>   \partial_x u= \partial_y v, 
>    \\
>   \partial_x v = - \partial_y u.
> \end{cases}
> $$
> Which is also equivalent to the condition that $\langle \nabla u, \nabla v\rangle = 0$. 

**Proof**:  

Directly from the complex differentiable conditions, we claim that the local behaviors of the function is linear around the point, applying Frechet derivative, we have the claim that 

$$
\begin{aligned}
    \lim_{h\rightarrow 0 + 0i} 
    \frac{f(x + h) - f(z) - f'(z)h}{h}
    &= 0 
    \\
    f(x + h) - f(z) - f'(z) h &= \epsilon(h), 
\end{aligned}
$$

where, $\epsilon(h)$ has the property that $\epsilon(h)/|h| = 0$ as $h\rightarrow 0 + i0$. Since the existence is not yet assured, let $L$ be the linear approximation for $f$ around $z_0$. The above expression can be splitted into a real and a imaginary parts, let $h = A + Bi$

$$
\begin{aligned}
    \begin{cases}
        u(x + A, y + B) - u(x, y) - \Re(Lh) = \Re(\epsilon (h)) & [1]
        \\
        v(x + A, y + B) - v(x, y) - \Im(Lh) = \Im(\epsilon(h)) & [2]
    \end{cases} 
\end{aligned}
$$

From Frechet differetibility, it must be the case that the limit of $\lim_{h\rightarrow 0 + 0i}([1])/\Re(h) = 0$ or $\lim_{h\rightarrow 0}([2])/\Im(h)$. A slightly stronger conditions would be that, the gradient of $u,v$ exists. And using that we have the condition that
$$
\begin{aligned}
    [3]: & \lim_{h\rightarrow 0 + i0} 
    \frac{u(z + h) - u(z) - \Re(Lh)}{h} = 0
    \\
    [3]\implies & \lim_{p\rightarrow 0} 
    \frac{u(x + p, y) - u(x, y) - \Re(Lp)}{p} = 0
    \\
    \iff & \partial_x u(x, y) = \Re(L) \text{ if }\partial_xu(x, y) \text{ exists}. 
    \\
    [3]\implies 
    & \lim_{q\rightarrow 0} 
    \frac{u(x, y + q) - u(x, y) -\Re(Lqi)}{q_i} = 0 + 0i
    \\
    \iff 
    & \lim_{q\rightarrow 0} 
    \frac{iu(x, y + q) - iu(x, y) + i\Re(Lqi)}{q_i} = 0 + 0i
    \\
    \iff & -i \partial_yu(x, y) = -i \Re(Li) \text{ if } \partial_y u(x, y) \text{ exists}
\end{aligned}
$$

similarly for the imaginary part of the condition, we have 

$$
\begin{aligned}
    [4] &
    \lim_{h\rightarrow 0 + 0i} 
    \frac{v(z + h) - v(z) - \Im(Lh)}{h} = 0
    \\
    [4]\implies & \lim_{p \rightarrow 0} \frac{v(x + p, y) - v(x, y) - \Im(Lp)}{p} = 0 + i0
    \\
    \iff 
    & \partial_xv(x, y) = \Im(L)
    \\
    [4]\implies & 
    \lim_{q\rightarrow 0}
    \frac{v(x, y + q) - v(x, y) - \Im(Lqi)}{qi} = 0 + 0i
    \\
    \iff &
    \lim_{q\rightarrow 0}
    \frac{-iv(x, y + q) +i v(x, y) + i\Im(Lqi)}{qi} = 0 + 0i
    \\
    \iff & 
    -i \partial_y v(x, y) = -i \Im(Li), 
\end{aligned}
$$

and we gained 4 pairs of conditions where when written down it looks like: 

$$
\begin{aligned}
    \partial_x u(x, y) &= \Re(L) = A 
    \\
    -i\partial_y(x, y) &= -i\Re(Li) = -i\Re(iA - B) = iB
    \\
    \partial_x v(x, y) &= \Im(L) = B
    \\
    -i\partial_yv(x,y) &= -i\Im(Li) =-i\Im(iA - B) =-iA, 
\end{aligned}
$$

which translates to the condition at the point $(x, y)$, it must be the case that
$$
\begin{aligned}
    \begin{cases}
        \partial_x u = A
        \\
        \partial_y u = -B
        \\
        \partial_x v = B
        \\
        \partial_y v = A
    \end{cases} \iff 
    \begin{cases}
        \partial_x u = \partial y v
        \\
        \partial y = -\partial_x v
    \end{cases}
    \iff 
    \langle \nabla v, \nabla v\rangle = 0. 
\end{aligned}
$$

which is the Cauchy Riemann conditions. 

**Remarks**

For the condition to be sufficient, it will also have to be the case that, $u, v$ are Frechet
diferetiable function as a $\mathbb R \mapsto R$ function on the real plane. We state this theorem next section. 

**References**: 

This condition is a bit too famous to have any references. 

#### **Thm | Cauchy Riemann Condition (Sufficient)**

> If $f = u + vi$ is a complex-valued function defined in a neighbourhood of $z \in \mathbb C$, with real and imaginary parts $u, v$, then $f$ has a complex derivative at $z$ if and only if $u, v$ are both differentiable (F-Differentiable at $(x, y)$ for $u, v: \mathbb R^2 \mapsto \mathbb R$), and satisfies the Cauchy Riemann condition at $z = x + yi$, them in this case, 
> $$
> \begin{aligned}
>   f' = \partial_x f=-i \partial_y f.  
> \end{aligned}
> $$

**References**

This is Theorem 2.2.9 in the book *Complex Analysis*  by Joseph L. Taylor. 


---
### **Cauchy Riemann | Extensions to Polar and Complex Conjugate**

We extend the conditions to better suit different scenarios. For the conjugate trick, we take reference from [this post](https://math.stackexchange.com/questions/1124506/cauchy-riemann-equations-written-as-complex-conjugate). 

#### **Condition-1 | Complex Conjugate Derivative**
> $$
> \frac{\partial f}{\partial z^*} = 
> \frac{1}{2}\left(\partial_x f + i \partial_y f\right) = 0
> $$

Take the conjugate of a complex number means. 

**Under Polar Coordinates**

yes, we are going to talk about how the Cauchy Riemann conditions feels like in the polar coordinates. Suppose we have a complex function expressed with the polar parameters in the following form: 

> $$
>   w = f(z) = u(r, \theta) + i v(r, \theta)
> $$
> And then the CR is like: 
> $$
>   u_r = \frac{v_\theta}{r} \hspace{2em} u_\theta = -rv_r
> $$

Yes, so each time the $\partial_r$ appeared, we are going to attach a Lame Coefficients to it and then it should be fine. 

**References**: 

Theorem 6.4, Theorem 6.5 in [Introduction to Complex Analysis](../Introduction%20to%20Complex%20Analysis.pdf). 

---
### **C.R and Null Space of The Laplacian**

For any function that is analytic (Cauchy Riemann is True), it's going to be a solution for the Laplacian (In the null space of the Laplacian Operator). Directly from the CR conditions we have:

$$
\begin{aligned}
    u_x &= v_y \implies u_{xx} = v_{xy}
    \\
    u_y &= - v_x \implies u_{yy} = -v_{yx},
\end{aligned}
$$

then $u_{xx} + v_{yy} = 0$ by the fact the the partial derivative are symmetric, notice that this is also the trace of t he Jacobi. These type of functions, in the null space of the Laplacian is called: **Harmonic Functions**.For example, $\sin$ and $\cos$ are Harmonic Functions. 

#### **Fact-1**
> If a function is analytic, then the function is going to be harmonic and it satisfied the Laplacian Operator. This is directly from the Cauchy Riemann Conditions. 


