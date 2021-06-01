Lecture 15: 
Applying Green's Function Method to 1D non-homogeneous wave equation under the infinite domain. 

--- 
### **Intro**

We will be solving some Wave's equation using green's functions. 


Non Homogeneous 1D wave equation on $\mathbb{R}$, the PDE is: 

$$
\begin{cases}
    (\partial_t^2 + c^2\partial_x^2)[u](x) = Q(x, t) & x\in \mathbb{R}, t > 0
    \\
    u = 0, \partial_t[u] = 0 & t = 0
    \\
    \lim_{|x|\rightarrow \infty} u = 0 &
\end{cases}
$$

Notice that, we have Homogeneous initial conditions, but in the future, we will be looking at boundary conditions that is a function, instead of a constant.

Consider the following 3D wave equation: 

$$
\begin{cases}
    (\partial_t^2 - c^2 \nabla^2)[u] = Q(x, t) & x \in \mathbb{R}^3, t > 0
    \\
    u \rightarrow 0 & \text{as } \Vert x\Vert \rightarrow \infty
    \\
    u = 0, \partial_t[u] = 0 & \text{at } t = 0
\end{cases}
$$


To start, let's define the Green's Function. 


---
### **Green's Function on 1D Wave Equation**
$$
\begin{cases}
    (\partial_t^2 + c^2\partial_x^2)[G](x) = \delta(x - \xi)\delta(t - \tau)& x\in \mathbb{R}, t > 0
    \\
    G = 0, \partial_t[G] = 0 & t = 0
    \\
    \lim_{|x|\rightarrow \infty} G = 0 &
\end{cases}
\tag{1}
$$

The delta function is representing the signal source at a point in time and space. $\tau, \xi$ are a scaler and a vector. $\tau > 0$. 

The reconstruction of the original solution using the Green's Function $u$ is given as: 

$$
\begin{aligned}
    u(x, t) &= \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            G(x, t, \xi, \tau)Q(\xi, \tau)
        d\xi
    d\tau 
    \\
    (\partial_t^2 - c^2\partial_x^2)[u](x, t) &= 
    (\partial_t^2 - c^2\partial_x^2)\left[
        \int_{0}^{\infty} 
            \int_{-\infty}^{\infty} 
                G(x, t, \xi, \tau)Q(\xi, \tau)
            d\xi
        d\tau
    \right]
    \\
    &= 
    \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            (\partial_t^2 - c^2\partial_x^2)
            [G(x, t, \xi, \tau)Q(\xi, \tau)]
        d\xi
    d\tau
    \\
    &= 
    \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            (\partial_t^2 - c^2\partial_x^2)
            [G](x, t, \xi, \tau)Q(\xi, \tau)
        d\xi
    d\tau
    \\
    &= 
    \int_{0}^{\infty} 
        \int_{-\infty}^{\infty} 
            \delta(x - \xi)\delta(t - \tau)Q(\xi, \tau)
        d\xi
    d\tau
    \\
    &= Q(x, t) 
\end{aligned}
\tag{2}
$$

* The differential operator can move in beacuse it's wrt to $x, t$, but the integral is wrt to $\xi, \tau$. 
* We use the property of the delta function on the last step to recover the RHS of the original PDE wrt $u$. 


---
### **Solving for G**

The PDE for G is expression (1). Ignoring the initial and the boundary conditions for this section. The approach we want to take is very similar to the heat equation. 

$$
(\partial_t^2 - c^2\partial_x^2)[G](x, t, \xi,\tau) = \delta(x - \xi)\delta(t - \tau)
\tag{3}
$$

**Consider the case when $t<\tau$:**

$$
\begin{aligned}
    (\partial_t^2 - c^2\partial_x^2)[G] &= 0    
\end{aligned}
\tag{4}
$$

Using initial conditions $G(x, 0, \xi, \tau) = 0$ and $\partial_t[G](x, 0, \xi, \tau) = 0$. This is telling us $G = 0$. There is nothing at the start before the point $t < \tau$. 


**Consider the case $t > \tau$**. 

We are way pass the point $t = 0$, we would need to create a new initial conditions at the point $t = \tau$, which is giving us a new PDE.[^3]

$$
\begin{cases}
    (\partial_t^2 - c^2 \partial_x^2)[G] = 0 & 
    \\
    G(x,t=\tau, \xi, \tau) = ?, \quad \partial_t[G](x, t = \tau, \xi, \tau) = ? & 
\end{cases}
\tag{5}
$$

Take the integral on the DE satisfied by $G$ over $(\tau_-, \tau_+)$. We want to not consider the case when $t=\tau$, but that means we have to solve for the boundary conditions for this equation. 

$$
\begin{aligned}
    \int_{\tau_-}^{\tau_+} 
        \partial_t^2 [G]
    dt - 
    c^2\partial_x^2\int_{\tau_-}^{\tau_+} Gdt
    & = 
    \int_{\tau_-}^{\tau_+} 
        \delta(x - \xi)\delta(t - \tau)
    dt 
    \\
    \left.\partial_t[G](t)\right|_{\tau_-}^{\tau_+}d
    - c^2\partial_x^2\int_{\tau_-}^{\tau_+} Gdt 
    &= \delta(x - \xi)
\end{aligned}
$$

Take notice that, at $\tau_-$, $G$ is zero, so we are really evaluating on $\tau_+$. 

What is $G$ at the point $\tau_+$? 

**Consider:** 

Is it a function that has discontinuity which makes it's derivative shoots to infinity? Like a delta function. 

Then $G$ has a singularity, and it's derivative is going to be giving us weirder singularity and it's not a delta function anymore, taking another derivative will give many more singularitys at the point of discontinuity[^1]

The differential equation has a delta function on the right hand side. **So, the function $G$ is "likely" to be a function that is smoothly decaying after the point $t = \tau$. In the time domain.**

Let's assume that this is true, then the integral of $G$ over $(\tau_-, \tau_+)$ is going to be zero. Because we are integrating on a function that is continuous on the domain, and the integral bounds are shrinking. 

Then: 

$$
\partial_t[G](x, t=\tau, \xi, \tau) = \delta(x - \xi)
\tag{6}
$$

Boom! One of the initial conditions for (5) is sorted out! 

Let's consider the case when $G$ having a jump at $t = \tau$ and then smoothly decays. Then $\partial_t[G]$ is going to be a delta function. Then it means $\partial_t^2[G]$ is going to be having more singularity than delta function. Therefore, $G$ can't have a jump discontinuity. This means that $G$ has to be zero at $t = \tau$. So let's just assume that $G = 0$ at $t = \tau$. 

We have completed the boundary conditions using some really bad reasoning from the lectures so then we have: 

$$
\begin{cases}
    (\partial_t^2 - c^2 \partial_x^2)[G] = 0 & 
    \\
    G = 0, \partial_t[G] = \delta(x - \xi) & 
\end{cases}
\tag{7}
$$

This is just a wave equation. And we are going to solve using the D'Alembert method. The details for deriving the D'Alambert method is in [[1D Wave in Infinite Domain]]. Here we are skipping it and jumps straight to the solution of the wave equation.[^2]

$$
v(x, t) = \frac{f(x - ct) + f(x + ct)}{2} 
=
\frac{1}{2c}
\int_{x + ct}^{x - ct} g(\tilde{x})d\tilde{x}
$$

And in our case, $g(x) = \delta(x - \xi)$, $f(x) = 0$, therefore, we only have the integral part of the solution left. 

$$
\frac{1}{2c}\int_{x - ct}^{x + ct} 
\delta(\tilde{x})
d\tilde{x}
=
\frac{1}{2c}(H(x + ct) - H(x - ct))
$$

The $H$ is the **Heaviside Function**. And it's like this: 

$$
H(x - ct) = \begin{cases}
    0 & x - ct < 0
    \\
    1 &x - ct > 0
\end{cases}
\quad 
H(x + ct) = \begin{cases}
    0 & x + ct < 0
    \\
    1 &x + ct > 0
\end{cases}
$$

Then their difference is gonna be like: 

$$
H(x + ct) - H(x - ct) = \begin{cases}
    1& |x| < ct 
    \\
    0 & |x| \ge ct 
\end{cases}
$$

Ok... But our problem has $x := x - \xi$ and $t := t - \tau$, it's shifted by $\xi, \tau$. Therefore we are going to have: 

$$
\begin{aligned}
    G &= \frac{1}{2c} \int_{x - \xi + c(t - \tau)}^{x - \xi + c(t - \tau)} 
    \delta(\tilde{x})
    d\tilde{x}
    \\
    &= 
    \frac{H(x - \xi + c(t - \tau)) - H(x - \xi - c(t - \tau))}{2c}    
    \\
    &=
    \begin{cases}
        \frac{1}{2c} & |x - \xi| < c(t - \tau)
        \\
        0 & \text{else}
    \end{cases}
\end{aligned}

$$

We have solved for G.  Basically this is a function that has an output value of $\frac{1}{2c}$ in the interval $c(t - \tau)$. 

---
### **Reconstruction of $u$**

$$
\begin{aligned}
    u(x,t) &= \int_{0}^{\infty}
    \int_{-\infty}^{\infty} 
        GQ(\xi, \tau)
    d\xi 
    d\tau 
    \\
    &= \frac{1}{2c} \int_{0}^{t} 
        \int_{x + c(t - \tau)}^{x - c(t - \tau)} 
            Q(\xi, \tau)
        d\xi
    d\tau
\end{aligned}
$$


---
### **3D Wave Equation**

**Variable List**


We will be concise this time because we already had some experiences from 1D. 

This is the formulation of the 3D wave equation: 

$$
\begin{cases}
    (\partial_t^2 - c^2 \nabla^2)[u] = Q(x, t) & x \in \mathbb{R}^3, t > 0
    \\
    u \rightarrow 0 & \text{as } \Vert x\Vert \rightarrow \infty
    \\
    u = 0, \partial_t[u] = 0 & \text{at } t = 0
\end{cases}
$$


And solution expressed using the Green's function is like: 
 
$$
u(x, t) = \int_{0}^{\infty} 
    \iiint_{\Omega}
        G(x, t, \xi, \tau)Q(\xi, \tau)
    d\xi d\eta d\mu
d\tau
$$

What is $G$? The green's function? Similar to what we did, we need this delta system for the $G$ function. 

$$
\begin{cases}
    (\partial_t^2 - c^2\nabla^2)[G] = \delta(x - \xi)\delta(t - \tau)& x, \xi \in \mathbb{R}^3, t > 0 
    \\
    G \rightarrow 0 & \text{as } \Vert x\Vert\rightarrow \infty
    \\
    G = 0, \partial_t[G] = 0 & \text{at } t = 0
\end{cases}
$$

We decomposed the function $Q(x, t)$ into space of delta function $\delta(\xi, \tau)$ paramaterized by $\xi, \tau$. 

Let's consider the case when $t < \tau$: 

$$
\begin{cases}
    (\partial_t^2 - c^2 \nabla^2)[G] = 0 & 
    \\
    G = 0, \partial_t[G] = 0 &
\end{cases}
$$

And the solution is $G\equiv 0$. 

Let's consider the case when $t > \tau$, then we can say that: 

$$
\begin{cases}
    (\partial_t^2 - c^2\nabla^2)[G] = 0
    \\
    G = 0, \partial_t[G] = \delta(x - \xi)
\end{cases}
$$

And this is the same argument as the One dimensional case. Now all we needto do is solving this PDE problem. With the boundary conditions that: $||x||\rightarrow \infty$. 

Now, we are going to use Sphereical Coordinate, and $G$ will be a radial symmetric function. So it's like a wave travalling outwards in space in this case, with a given voice signal $Q(x, t)$. When we use a radial symmetric function to model it, we pretty much reduce the problem into simple 1D problem. 

The PDE will look like this: 

$$
\begin{cases}
    (\partial_t^2[\bullet] - c^2 \frac{1}{r^2}\partial_r[r^2\partial_r[\bullet]])[G] = 0
    & 
    t > \tau
    \\ 
    G = 0, \partial_t[G] = \delta(r)
\end{cases}
$$

What is happening here is that, we did the $\nabla^2$ under the sphererical coordinates, and then we just ignore all the other variables: $\theta, \phi$, because the solution function $G$ we want, has to be only a function wrt to $r$, forcing it to be Radially Symmetric. 

**Let $G = \frac{V}{r}$, where $V$ is another function wrt to r then**: 

$$
\begin{aligned}
    \partial_r[G] &= \frac{1}{r}\partial_r[V] - \frac{1}{r^2} V
    \\
    \partial_r[r^2\partial_r[G]] &= r\partial_r^2[V]
    \\
    \partial_t^2[G] = \partial_r^2[V] &= \frac{1}{r}\partial_t^2[V]
\end{aligned}
$$

Combining all of these to express the original PDE for $t> \tau$. 

$$
\begin{aligned}
    \frac{1}{r}\partial_t^2[V] - \frac{c^2}{r}\partial_r[V] &= 0
    \\
    \partial_t^2[V] - c^2 \partial_r^2[V] &= 0
\end{aligned}
$$

And this is just the 1D equation. 

No, according to D'Alambert, we have the solution in this form: 

$$
V(r, t) = R(r - c(t - \tau)) + L(r + c(t - \tau))
$$

Now, introducing the **initial conditions** for the Green's function, which is that $G = 0$, this will mean that:

$$
R(r) + L(r) = 0 \implies L(r) = -R(r)
$$

Giving us: 

$$
V(r, t) = R(r - c(t - \tau)) - R(r + c(t - \tau))
$$

And the other initial conditions is $\partial_t [G]= \delta(r)$, then we have: 

$$
\begin{aligned}
    \partial_t[G] = \frac{1}{r}\partial_t[V]
    \\
    -\frac{2c}{r}R'(r) = \delta(r)
\end{aligned}
$$

We basaically substitute $G = V/r$, and then we take the time derivative on $R$ and then we set $t = \tau$, cause that is the starting moment of the PDE. Don't forget that, thre is $C$ part coming when doing $R'$, because of $r - c(t - \tau)$ inside. 

And is is the soluiton expressed wrt to $R'$, next, we will ne taking the integral on $R(r)$ and figure out what it is.  Because of the $\delta(r)$, it will make $R'(r)$ equals to zero whenever $r \ne 0$, so hat means $R = B$ when $r > 0$. 

**We are going to set $B = 0$. Reasons come later.** 

**Trick**: Move a small distance away from $r = 0$, let that small distance be $\epsilon$, then we integrate the DE $-\frac{2c}{r}R'(r) = \delta(r)$ over a ball of radius $\epsilon$ centered at the origin. That ball is going to be $B_\epsilon$

$$
\begin{aligned}
    -\frac{2c}{r}R'(r) &= \delta(r)
    \\
    -2c \iiint_{B_\epsilon} \frac{R'(r)}{r}dV
    &= 
    \iiint_{B_\epsilon} \delta(r)dV
    \\
    -2c \iiint_{B_\epsilon} \frac{R'(r)}{r}dV &= 1 
    \\
    -2c \int_{0}^{\epsilon}
            \int_{0}^{2\pi}
                \int_{0}^{\pi} 
                    \frac{1}{r}R'(r)r^2\sin(\theta)
        d\theta d\phi dr
        &= 1
    \\
    -8\pi c \int_{0}^{\epsilon} 
        rR'(r)
    dr &= 1
    \\
    -8\pi c \left[
            rR(r)|_0^{\epsilon} - \int_{0}^{\epsilon} R(r)dr
        \right]
        &= 1
    \\
    -8\pi c \left[
            \underbrace{R(\epsilon)}_{B = 0} - \int_{0}^{\epsilon} R(r)dr
        \right]
        &= 1
    \\
    8\pi c \int_{0}^{\epsilon} R(r)dr &= 1
\end{aligned}
$$

Since $B = 0$, and $R(r) = 0$ whenever $r\neq 0$, but that integral will have to be $1$, so it's behaving like a delta function, in that sense we have: $R(r) = A\delta(r)$, but what is $A$ in this case? We know that: 

$$
A\int_{-\epsilon}^{\epsilon}\delta(r) dr = A \implies \int_{0}^{\epsilon} 
    A\delta(r)
dr = \frac{A}{2}
$$

Then we have: 

$$
\begin{aligned}
    \int_{0}^{\epsilon} 
        R(r)
    dr &= \frac{1}{8\pi c}
    \\
    \int_{0}^{\epsilon} 
        A\delta(r)
    dr &= \frac{1}{8\pi c}
    \\
    \frac{A}{2} &= \frac{1}{8\pi c}
    \\
    \implies A &= \frac{1}{4\pi c}
    \\
    \implies R(r) &= \frac{1}{4\pi c}\delta(r)
\end{aligned}
$$

And, this is the $R(r)$ function, the traveling waves of the D'Alambert's method. 

**Note**:

**We set the $B = 0$ at the beginning, and at the end we had this delta function. Everything sorted out with this assumption. Let's just keep that and sweep it under the rug.** 

Consider $V$; 

$$
\begin{aligned}
    V &= R(r - c(t - \tau)) - R(r + c(t - \tau))
    \\
    &= 
    \frac{1}{4\pi c}(\delta(r - c(t -\tau)) - \delta(r + c(t - \tau)))
    \\
    \implies R = \frac{V}{r} &= \frac{1}{4\pi cr}(\delta(r - c(t -\tau)) - \delta(r + c(t - \tau)))
\end{aligned}
$$

Remember that $t \ge \tau$, so then $\delta(r + c(t - \tau)) = 0$, because the thing inside of it is always going to be larger than 0, then we have: 

$$
G = \frac{1}{4\pi c r}\delta(r - c(t - \tau))
$$

Remember that $r = x - \xi$ from the parameteriazation for the $G$ function on the Non-Homogenous $Q$ function. 

Let's reconstruct the original solution $u$: 

$$
\begin{aligned}
    u(x, t) &= \int_{0}^{\infty} 
        \iiint_{\Omega}
            G(x, t, \xi, \tau) Q(\xi, \tau)
        d\xi d\eta d\mu 
    d\tau
    \\
    &= 
    \frac{1}{4\pi c}
    \int_{0}^{\infty} 
        \iiint_{\Omega}
            \frac{\delta(t - c(t - \tau))}{r}Q(\xi, \tau)
        d\xi d\eta d\mu 
    d\tau
\end{aligned}
$$

**Physical Interpretation**? 






[^1]: Prof and the text book gives this explanation, but the behaviors are just too pathological, so we have to assume continuous function after that point $\tau$. But how the heck people can have multiple singularities at one point??? 
[^2]: That D'Alambert's method didn't talk about the case when $\partial_t[u]=g(x)$, in that example we had $g(x) = 0$, therefore some modificaitons will be need to suit in this case. 
[^3]: Yes, we made the arbitrary choice of integrating it over the domain $(\tau_-, \tau_+)$ 