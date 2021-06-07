Rehash on [[Helmholtz Equation in a Cylinder]], [[Separation of Variables]], [[Frobenius Method]]


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
\Theta'' = -m\Theta
$$

