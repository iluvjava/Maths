Rehash on [[Helmholtz Equation in a Cylinder]], [[Separation of Variables for Heat and Waves]], [[Frobenius Method]]


---
### **Intro**

The PDE is: 

$$
\begin{aligned}
    \nabla^2 \cdot u(t, x, y, z)  = c^2\partial_t^2 [u](t, z, y, z)
\end{aligned}
$$

It models waves traveling in space. 

Consider Cylindrical coordinate system: 

$$
\begin{bmatrix}
    x \\ y \\ z
\end{bmatrix}
=
\begin{bmatrix}
    r\cos\theta \\ r\sin\theta \\z
\end{bmatrix}
$$

And consider boundary conditions defined using a cylinder. 

$$
\begin{cases}
    u = 0 & z = L, z = 0
    \\
    u = 0 & r = a
    \\
    u(t, r, \theta, z, ) = u(t, r, \theta + 2\pi, z) & \forall \theta, r, z 
    \\
    \partial_\theta[u](t, r, \theta, z, ) =\partial_\theta[u](t, r, \theta + 2\pi, z) & \forall \theta, r, z 
\end{cases}
$$

1. The wave is bounded by the top and bottom of the cylinder. 
2. The wave is bounded by the body of the cylinder. 
3. The function inside the cylinder, the solution, has to be $2\pi$ periodic wrt to variable $\theta$. 


Consider substitution with cylindrical variable and separation of time and space domain, meaning that the solution takes the form: 

$$
\begin{aligned}
    u(t, r, \theta, z) &= T(t)\phi(r, \theta, z)    
    \\
    T(t)\nabla^2 \cdot \phi(r, \theta, z) &= 
    c^2 T''(t) \phi(r, \theta, z)
    \\
    \frac{T(t)}{c^2T''(t)} &= \frac{\phi(r, \theta, z)}{\nabla^2\cdot\phi(r, \theta, z)} = -\lambda^2
    \\\implies 
    \phi(r, \theta, z) &= -\lambda^2 \nabla^2\cdot \phi(r, \theta, z)
\end{aligned}
$$

And that is the Helmholtz's equation.

$$
\phi(t, \theta, z) = -\lambda^2 \nabla^2\cdot \phi(r, \theta, z)
\tag{1}
$$

To solve that, we just use separation of variable. However, take notice that we are in the cylindrical coordinate, that means the Laplacian Operator will be: 

$$
\nabla^2\cdot \bullet = 
\frac{1}{r} \partial_r[r\partial_r[\bullet]]
+ 
\frac{1}{r^2}\partial_\theta^2[\bullet] + 
\partial_z^2[\bullet]
\tag{2}
$$

---
### **Separation of Variables**

$$
\begin{aligned}
    \phi(r, \theta, z) &= R(r)\Theta(\theta)Z(z)
    \\
    \underset{(0)}{\implies}
    \nabla^2\cdot \phi(r, \theta z)&= \frac{1}{r}\partial_r[r\partial_r[R]]\Theta Z + 
    \frac{1}{r^2}\Theta''RZ + 
    R\Theta Z''
    \\
    \underset{(1)}{\implies}
    \frac{1}{r}\partial_r[r\partial_r[R]]\Theta Z + 
    \frac{1}{r^2}\Theta''RZ + 
    R\Theta Z''
    &=
    -\lambda^2R\Theta Z
    \\
    \underset{(2)}{\implies}
    \underbrace{\frac{
        \frac{1}{r}\partial_r[r\partial_r[R]]
        }{
            R
        } + 
        \frac{1}{r^2}\frac{\Theta''}{\Theta}}_{A} + 
    \frac{Z''}{Z} &= -\lambda^2
    \\
    A + \frac{Z''}{Z} &= -\lambda^2
\end{aligned}
\tag{3}
$$

* (0): Using expression 2
* (1): Using expression (1)
* (2): Divides both side of the equation by $R\Theta Z$

Let's solve for $Z$: 

$$
\begin{aligned}
    \frac{Z''}{Z} &= - A -\lambda^2 = -b^2
    \\
    \underset{(0)}{\implies}
    Z_l(z) &= \sin \left(
        \frac{zl\pi  }{L}
    \right)
    \\
    \underset{(0)}{\implies}b_l &= \frac{l\pi}{L}
    \\
    - A - \lambda^2 &= \underbrace{\left(
        \frac{l\pi}{L}
    \right)^2}_{ =: - b_l^2}
    \\
    A &=  b_l^2 - \lambda^2
\end{aligned}
\tag{4}
$$

* (0): By the boundary condition of the PDE. 

We solve for the eigen functions $Z_l(z)$ staisfying the boundary conditions, and then we get the eigen values too, which is $b_l$. Then $b_l$ defined the variable $A$, which then means: 



$$
\begin{aligned}
    \frac{\frac{1}{r}\partial_r[r\partial_r[R]]}{R} + 
    \frac{1}{r^2}\frac{\Theta''}{\Theta}
    &= 
    b_l^2 - \lambda^2
    \\
    \frac{1}{r^2}\frac{\Theta''}{\Theta} &= b_l^2 - \lambda^2 -\frac{\frac{1}{r}\partial_r[r\partial_r[R]]
        }{
            R
        }
    \\
    \frac{\Theta''}{\Theta} &= 
    \underbrace{r^2(b_l^2 - \lambda^2) - \frac{r\partial_r[r\partial_r[R]]}{R}}_{-m^2}
\end{aligned}\tag{5}
$$

Therefore, we have: 

$$
\begin{aligned}
    \Theta'' &= -m\Theta    
    \\
    \implies
    \Theta &= A\exp(im\theta) + B\exp(-im\theta)
\end{aligned}
\tag{6}
$$

Take note that, because the function has to be $2\pi$ periodic, it means that the value for $m$ must be integers, so: $m \in \mathbb{Z}$. 

The value for $m$ is all we need, the coefficients might be determined not by the boundary conditions, but the initial conditions[^1]. 

Finally, we can consider the function $R(r)$, using expression (5) we have: s

$$
\begin{aligned}
    r^2(b_l^2 - \lambda^2) - \frac{r\partial_r[r\partial_r[R]]}{R} 
    &= -m^2
    \\
    Rr^2(b_l^2 - \lambda^2) - r\partial_r[r\partial_r[R]] &= -Rm^2
    \\
    r\partial_r[r\partial_r[R]] - Rr^2(b_l^2 - \lambda^2) -Rm^2 &= 0
    \\
    r\partial_r[r\partial_r[R]] - (r^2(b_l^2 - \lambda^2) + m^2)R &= 0
    \\
    r\partial_r[r\partial_r[R]] + (r^2(\lambda^2 - b_l^2) - m^2)R &= 0
\end{aligned}
\tag{7}
$$

And this, this is the Cylindrical Bessel's equation, and it's solution is tied to Bessel's equation. 

---
### **Bessel's Equation**

The equation we are trying to solve is: 

$$
\begin{aligned}
    r\partial_r[r\partial_r[R]] + (r^2(\lambda^2 - b_l^2) - m^2)R &= 0
\end{aligned}
\tag{7}
$$

But, this one is hard and that is why we will be solving another equation, and then use the solution for the other equation to solve this one. 

The other equation we are solving instead is called the Bessel's Standard Form: 

$$
x\partial[x\partial_x[y]] + (x^2 - m^2)y = 0
\tag{9}
$$

where, $y$ is a function of $x$. For more about actually solving this equation above using Frobenius method and all those cool shit, check out [[Bessel's Equation]] for a more detailed discussion. 

I assume you read the part "Bessel's Non-standard form" for the file Bessel's Equation, if that is the case, then we know that the solution to expression (7) is in fact: $J_m(\sqrt{\lambda^2 - b_l^2}r)$

Please recall that $z_{m, n}$ is the $n$ th roots for the Bessel's equation $J_m(x)$, for the Bessel's First kind. 

Boundary conditions asserts: 

$$
\begin{aligned}
    J_m\left(
        \sqrt{\lambda^2 - b_l^2}a
    \right) = 0 \wedge J_m(0) &\neq \infty    
    \\
    \implies 
    a\sqrt{\lambda^2 - b_l^2} &= z_{m, n}
    \\
    \lambda^2 &= \frac{z_{m, n}^2}{a^2} + b_l^2
    \\
    \lambda_{l, m, n} &= \sqrt{\frac{z_{m, n}^2}{a^2}+ b_l^2}
\end{aligned}
\tag{10}
$$

We assme that the eigenvalues for the original PDE to be positive, from the separation of variables. This also makes sense [^2]

---
### **Solution** 

Therefore, the solution of the Helmholtz equation is: 

$$
\phi(\theta, r, z) = \sum_{m\in \mathbb{Z}, n, l \in \mathbb{N}}^{}
    R_{m, n}(r)\Theta_m(\theta)Z_l(z)
$$

Where the Eigenfunction is like: 

$$
u_{m, n, l}(\theta, r, z) = J_m(z_{m, n}/a)\Theta_m(\theta)\sin\left(
    \frac{zl\pi}{L}
\right)
$$

**Note**
The frequency of oscillation for waves in the cylinder is given as: 

$$
\omega_{l,m, n} = c\lambda_{l,m, n} = c\sqrt{\frac{z_{m, n}}{a^2} + \frac{l^2\pi^2}{L^2}}
$$

And the unit is Radius Per minutes to get frequencies in Hz, please divides $\omega_{l,m, n}$ by $2\pi$. The Radius. 


[^1]: This is my speculation, in truth, I have no idea since it's not covered in the class notes nor lecture, please investigate when this footnote is read in the future. 
[^2]: Bessel's equation is a special kind of Sturm Loiuville System. 
