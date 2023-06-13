using [[Separation of Variables for Heat and Waves in 1D]], we found Bessel's equation, read more in [[Bessel's Equation]]. In this file, we introduce the *Legendre Equation*, similar to the Bessel's equation, it's pretty complicated. 

---
### **Intro**

Consider PDE: $\nabla^2 \cdot u = -\lambda u$, We are in a spherical coordinate, the boundary condition will be discussed during the solving process. There are 3 parameters describing the spherical coordinate, they helps with separation of variables: 

* $r$ is the radial distance, which is $0 < r < a$
* $\psi$ is the longitude, $-\pi \le \psi \le \pi$, and this is the same convention as the argument of a complex number.
* $\theta$ is the co-latitude, $0 \le \theta  \le \pi$,  where the north pole is $0$ and the south pole is $\pi$
 
**Avoiding solutions that blows up**: 

it's likely to blow up at the center and the poles of the sphere, and we want it to be $2\pi$ periodic at the longitude, meaning that function wrt to $\psi$ will be $2\pi$ periodic. 

**Spherical Laplacian Operator**

$$
\nabla^2 \cdot u = 
\frac{1}{r^2}\partial_r[r^2\partial_r[u]]
+ 
\frac{1}{r^2\sin(\theta)}\partial_\theta[\sin\theta\partial_\theta [u]]
+ 
\frac{1}{r^2\sin^2\theta} \partial_\psi^2[u]
$$

And we are going to take this for granted, and this crucial for solving in alternative coordinate.


**Objectives**

* Use the separations of variables. 
* Derive the Spherical Bessel's equation
* Derive the Legendre Equation 
* Reveal the relations of the eigenvalues. 

---
### **Separation of Variable**

Let: $u(r, \theta, \psi) = R(r)Y(\theta, \psi)$, recall $\nabla^2 \cdot u = -\lambda u$, then using the PDE: 

$$
\begin{aligned}
    u(r, \theta, \psi) &= R(r)Y(\theta, \psi)
    \\
    \underset{(1)}{\implies}
    \frac{\nabla\cdot [R(r)Y(\theta, \psi)] }
    {R(r)Y(\theta, \psi)}
    &= 
    \frac{\frac{1}{r^2}\partial_r[r^2\partial_r[R]]}
    {R} + 
    \frac{\frac{1}{r^2\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]]
     + 
    \frac{1}{r^2\sin^2\theta}\partial_\psi^2[Y]}{Y}    
    \\
    \underset{(2)}{\implies}
    -\lambda^2 
    &=
    \frac{\frac{1}{r^2}\partial_r[r^2\partial_r[R]]}
    {R} + 
    \frac{\frac{1}{r^2\sin\theta}\partial_\theta[\sin\theta \partial_\theta [Y]] + \frac{1}{r^2\sin^2\theta}\partial_\psi^2[Y]}{Y}
    \\
    \underset{(3)}{\implies}
    -\lambda^2r^2 
    &= 
    \frac{\partial_r[r^2\partial_r[R]]}
    {R} + 
    \frac{\frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]}{Y}
\end{aligned}
\tag{1}
$$

The separation of variable results are

$$
\underset{(4)}{\implies}
    \begin{cases}
        Y^{-1}
        ((\sin\theta)^{-1} 
        \partial_\theta[\sin\theta \partial_\theta[Y]] + 
        (\sin^2\theta)^{-2}
        \partial_\psi^2[Y])
        = -\eta &
        \\
        R^{-1}\partial_r[r^2\partial_r[R]] = -\eta &
        \\
        \eta = \lambda r^2
    \end{cases}
$$

**Explainations:** 
1. Expanding the Spherical Laplacian Operator. 
2. Substitute the expanded expression back to the original PDE, and put $-\lambda^2$ on the left hande side of the expression. 
3. Multipy $r$ on both side of the expression. 
4. Functions of $r, y$ are on the RHS and they equals to a constant, using the old trick from separations of variable, we get both equation equals to the same constant respectively. The sign for $\eta$ is not assumed. 

Focusing on the part involving $R$, firstly, divide by $r$, this will be:

$$
\begin{aligned}
    -\lambda^2 - \frac{\partial_r[r^2\partial_r[R]]}{Rr^2} &= \frac{-\eta}{r^2}
    \\
    -R\lambda^2 - \frac{\partial_r[r^2\partial_r[R]]}{r^2} &= \frac{-\eta R}{r^2}
    \\
    \text{Substitute: } \partial_r[r^2\partial_r[R]] &= 2r\partial_r[R] + r^2\partial_r^2[R]
    \\
    \implies 
    -R\lambda^2 - \left(
        \frac{2}{r}\partial_r[R] +\partial_r^2[R]
    \right) &= \frac{-\eta R}{r^2}
\end{aligned}
$$

So that mean: 

> $$
> R'' + \frac{2}{r}R' - 
> \left(
>     \frac{\eta}{r^2} - \lambda^2
> \right) R = 0
> \tag{1.1}
> $$
> This is the *Sphereical Bessel's equation*. 


Focusing $Y$, 

$$
\begin{aligned}
    \frac{\frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]}{Y}  + \eta &= 0
    \\
    \frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]  + \eta Y &= 0
\end{aligned}
$$

And, take notice that, this is still a partial differential equation, which means that we are going to apply the SOV again here. This is call the *Spherical Harmonic Equation*. using the same tricks, we begin with $Y(\theta, \psi) = \Theta (\theta) \Psi(\psi)$, then 

$$
\begin{aligned}
    \frac{\partial_\theta[\sin\theta \Theta'(\theta)\Psi(\psi)]}{\sin\theta} 
    + 
    \frac{1}{\sin^2\theta}\Psi''(\psi)\Theta(\theta)
    + 
    (\sin\theta)^2\eta Y &= 0
    \\
    (\sin\theta)
    \partial_\theta[\sin\theta \Theta'(\theta)\Psi(\psi)]
    + 
    \Psi''(\psi)\Theta(\theta)
    + 
    \eta \Theta(\theta)\Psi(\psi)(\sin\theta)^2 &= 0
    \\
    \frac{
    (\sin\theta)
    \partial_\theta[\sin\theta \Theta'(\theta)]
    }{\Theta(\theta)}
    + 
    \frac{\Psi''(\psi)}{\Psi(\psi)}
    + 
    \frac{\eta(\sin\theta)^2}{\Theta(\theta)} &= 0
    \\
    \text{ introduce new constant}\quad 
    \frac{
    (\sin\theta)
    \partial_\theta[\sin\theta \Theta'(\theta)]
    + 
    \eta (\sin\theta)^2
    }{\Theta} &= 
    \frac{-\Psi''}{\Psi} = \alpha^2 
    
\end{aligned}\tag{1.2}
$$

And we introduced another constant $\alpha^2$ for the separation of variables. For $\Psi(\psi)$, we have the ODE, $\Psi'' + \alpha^2 \Psi = 0,  -\pi \le \psi \le \pi$. And the boundary condition is periodic, and notice that this is the same as the $\Theta(\theta)$ function in the Cylinder case, see [Helmholtz Equation in a Cylinder](Helmholtz%20Equation%20in%20a%20Cylinder.md) for more information. Recall from there that we had $\alpha = m, \; m\in \mathbb{Z} = 0, \pm 1, \pm 2\cdots$, with basis the basis functions $\Psi_m = \exp \left(im\psi\right)$. Finally, for $\Theta(\theta)$, and we devide $\sin^2(\theta)$ on expression (1.2) to yield the ODE

$$
\frac{1}{\sin\theta} \partial_\theta[\sin\theta \partial_\theta[\Theta]] + 
\left(
    \eta - \frac{m^2}{\sin^2\theta}
\right)\Theta = 0
\tag{1.3}
$$

We also multiplied by $\Theta$ and at the same time, substitute the $\alpha= m$ for $\Psi''/\Psi$. Now, we know that $\theta\in[0, \pi]$, and we want out solution to be bounded at the poles (CLARIFICATION NEEDED), and this will mean that $\Theta(\pm \pi) \ne \infty$. To get insight, we make a *Change of Variable* with $x = \cos\theta$ so $dx = -\sin\theta d\theta$ then $\theta\in[0, \pi]$ means $x\in [-1, 1]$, let $y(x) = \Theta(\theta)$ For expression (1.3) we use the above *Change of Variable*, obtaining a new ODE: 

> $$
> \partial_x[(1 - x^2)\partial_x[y]]
>  + 
> \left[\eta - \frac{m^2}{1 - x^2}
> \right]y = 0
> \tag{1.4}
> $$
> Imposing condition: $y(\pm 1) \ne \infty$, and this is: *Associated Legendre Equation* a 2nd order ODE that is hard to solve. 

---
### **Solving the Associated Bessel's Equation**

For more information, please see [Legendre Polynomials](Legendre%20Polynomials.md), [Bessel's Equation](Bessel's%20Equation.md) for more information on how to solve these 2 complicated ODEs. 


