Now, we are going to solve a wave equation inside of the Sphere. 
This is still using: [[Separation of Variables]] method for solving a major part of the equation. 

And to read this we at least need to recognize the Bessel's equation when it popped up, which can be read more on [[Bessel's Equation]]. 

---
### **Intro**

The equation on the space domain is phrased by the following PDE: 

$$
\nabla^2 \cdot u = -\lambda u
$$

We are in our traditional spherical coordinate. 

And the boundary condition will be discussed during the solving process. 

There are 3 parameters describing the spherical coordinate. 

* $r$ is the radial distance, which is $0 < r < a$

* $\psi$ is the longitude, $-\pi \le \psi \le \pi$, and this is the same convention as the argument of a complex number.

* $\theta$ is the co-latitude, $0 \le \theta  \le \pi$,  where the north pole is $0$ and the south pole is $\pi$
 
**Avoiding solutions that blows up**: 

from Prof: it's likely to blow up at the center and the poles of the sphere, and we want it to be $2\pi$ periodic at the longitude, meaning that function wrt to $\psi$ will be $2\pi$ periodic. 

**Phereical Laplacian Operator**

$$
\nabla^2 \cdot u = 
\frac{1}{r^2}\partial_r[r^2\partial_r[u]]
+ 
\frac{1}{r^2\sin(\theta)}\partial_\theta[\sin\theta\partial_\theta [u]]
+ 
\frac{1}{r^2\sin^2\theta} \partial_\psi^2[u]
$$

And we are going to take this for granted, and this crucial for solving in alternative coordinate. 

---
### **Separation of Variable**

Let: 

$$
u(r, \theta, \psi) = R(r)Y(\theta, \psi)
$$

Where, the function $y(\theta, \psi)$ is called the Sphereical Harmonics function. 

Subsitute into the ODE and then divide by $RY$, then we have: 

$$
\frac{\frac{1}{r^2}\partial_r[r^2\partial_r[R]]}
{R} + 
\frac{\frac{1}{r^2\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{r^2\sin^2\theta}\partial_\psi^2[Y]}{Y} = -\lambda^2
$$

Multiply by $r^2$ and then separate the variale: 

$$
\frac{\partial_r[r^2\partial_r[R]]}
{R} + 
\frac{\frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]}{Y} = -\lambda^2r^2
$$

$$
\frac{\frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]}{Y} 
= -\lambda^2r^2 - \frac{\partial_r[r^2\partial_r[R]]}
{R} = -\eta
\tag{1}
$$

Where $\eta$ is a constant for the SOV, and, the sign of $\eta$ is **not assumed**. 

**Let's focus on the part involving $R$, firstly, divide by $r$, this will be:**

$$
-\lambda^2 - \frac{\partial_r[r^2\partial_r[R]]}{Rr^2} = \frac{-\eta}{r^2}
$$

$$
-R\lambda^2 - \frac{\partial_r[r^2\partial_r[R]]}{r^2} = \frac{-\eta R}{r^2}
$$

Substitute: 

$$
\partial_r[r^2\partial_r[R]] = 2r\partial_r[R] + r^2\partial_r^2[R]
$$

$$
-R\lambda^2 - \left(
    \frac{2}{r}\partial_r[R] +\partial_r^2[R]
\right) = \frac{-\eta R}{r^2}
$$

So that mean: 

$$
R'' + \frac{2}{r}R' - 
\left(
    \frac{\eta}{r^2} - \lambda^2
\right) R = 0
\tag{1.1}
$$

**Expression 1.1 is called the Sphereical Bessel's Equation** 

Let's focus on the part of equation involving $Y$, then we will be looking at:

$$
\frac{\frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]}{Y}  + \eta = 0
$$

$$
\frac{1}{\sin\theta}\partial_\theta[\sin\theta \partial_\theta[Y]] + \frac{1}{\sin^2\theta}\partial_\psi^2[Y]  + \eta Y = 0
$$

And, take notice that, this is still a partial differential equation, which means that we are going to apply the SOV again here. 

This is call the **Sphererical Harmonic Equation**.

Let's assume that: 

$$
Y(\theta, \psi) = \Theta (\theta) \Psi(\psi)
$$

Substitute above equation back to equation above we have: 

$$
\frac{\partial_\theta[\sin\theta \Theta'(\theta)\Psi(\psi)]}{\sin\theta} 
+ 
\frac{1}{\sin^2\theta}\Psi''(\psi)\Theta(\theta)
+ 
(\sin\theta)^2\eta Y = 0
$$

Multiply $\sin^2\theta$ on both side: 

$$
(\sin\theta)
\partial_\theta[\sin\theta \Theta'(\theta)\Psi(\psi)]
+ 
\Psi''(\psi)\Theta(\theta)
+ 
\eta \Theta(\theta)\Psi(\psi)(\sin\theta)^2 = 0
$$

Dividing both size by $Y$ we will be getting: 

$$
\frac{
(\sin\theta)
\partial_\theta[\sin\theta \Theta'(\theta)]
}{\Theta(\theta)}
+ 
\frac{\Psi''(\psi)}{\Psi(\psi)}
+ 
\frac{\eta(\sin\theta)^2}{\Theta(\theta)}  = 0
$$

$$
\frac{
    (\sin\theta)
    \partial_\theta[\sin\theta \Theta'(\theta)]
    + 
    \eta (\sin\theta)^2
}{\Theta} = 
\frac{-\Psi''}{\Psi} = \lambda^2
\tag{1.2}
$$

And we introduced another constant $\alpha^2$, because of the usage of SOV. 

And it's not hard to see that we have a pretty simple ODE: 

$$
\Psi'' + \alpha^2 \Psi = 0\quad -\pi \le \psi \le \pi
$$

And the boundary condition we want to apply here is that the function $\Psi$ is a $2\pi$ Periodic function, and notice that this is the same as the $\Theta(\theta)$ function in the Cylinder case, see [[Helmholtz Equation in a Cylinder]] for more information. 

So then, we have: 

$$
\alpha = m, \quad m\in \mathbb{Z} = 0, \pm 1, \pm 2\cdots
$$

And the basis function will be:

$$
\Psi = \exp \left(
im\psi
\right)
$$

Now, we will need to focus on $\Theta(\theta)$, and we will be dividing by $\sin^2(\theta)$ on expression (1.2), giving us:

$$
\frac{1}{\sin\theta} \partial_\theta[\sin\theta \partial_\theta[\Theta]] + 
\left(
    \eta - \frac{m^2}{\sin^2\theta}
\right)\Theta = 0
\tag{1.3}
$$

We also multiplied by $\Theta$ and at the same time, substitute the $\alpha= m$ for $\frac{\Psi''}{\Psi}$. 

Now, we know that $\theta\in[0, \pi]$, and we want out solution to be bounded at the poles, and this will mean that: 

$$
\Theta(\pm \pi) \ne \infty
$$

And this is important.

Now we are going to make a **Change of Variable**, this means that: 

$$
x = \cos\theta\implies dx = -\sin\theta d\theta
$$

$$
\theta\in[0, \pi] \implies x\in [-1, 1]
$$

Let: 

$$
y(x) = \Theta(\theta)
$$

And for the expression (1.3) we are going to use the above **Change of Variable**, giving us a new Differential Equation: 

$$
\partial_x[(1 - x^2)\partial_x[y]]
 + 
\left[\eta - \frac{m^2}{1 - x^2}
\right]y = 0
\tag{1.4}
$$

And we want: $y(\pm 1) \ne \infty$, and this is called the **Associated Legendre Equation**, a 2nd order ODE and the coefficients are not all constant. 

The technique we are going to try to solve it, is the power series method, and it's goign to be centered at point $b$ where $b$ is a non-singular point of the differential equation. 

**Spoiler Alert**: The singular point happens when $x = \pm 1$. Then we let $b = 0$. 

This will mean that, the series we are goign to try is: 

$$
y(x) = \sum_{n = 0}^{\infty}
    a_n x^2
$$

Then in this case, we don't want the series to be blowing up, especially at the point where $x = \pm 1$. 

We want this series to be convergent at the point wher $x = \pm 1$, which means that we will be interested in the **radius of convergence** for the series. 

Ok, using basic complex analysis, it's the Radius of convergence at the point of expansion is the distance from that point to the closest singularity. 

And it turns out that, The radius of convergence is... Less than one. Because we already said that the singulraity is at $\pm 1$... 

So then in this case, it would imply that the solution of the series, might blow up at the point $x = \pm 1$, unless... **The series somehow terminates** (so it's not an infinite sum). 

**And Spoiler Alert**, we are goign to show that, the series is not going to blow up for certain values of $\eta$, especially: $\eta_n = n(n + 1)$ for $n\in \mathbb{Z}_{\ge 0}$, and in that case, tthese $\eta$ will be our eigenvalues, and the correspondign eigenfunctions are denoted as: $y(x) = P_{n}^m(x)$. This is going to be proved LATER. 

Ok, let's assume that we know: 

$$
\eta_n = n(n + 1) \quad n = 0, 1, 2, 3, \cdots
$$

Now with $\eta$ we will be able to go back to (1) and get some info out for expression $R(r)$, so after that, the ODE for $R(r)$ will be like: 

$$
    r^2R''+ 2rR' + [\lambda^2 r^2 - n(n + 1)]R(r) = 0 \quad R(0)\ne \infty \wedge R(a) = 0
$$

This is called the **spherical Bessel's Equation**. It is a bessel's equation, it's just not in the std form yet. 

Now, with the substitution that: 

$$
x = \lambda r \quad R(r) = x^{\frac{-1}{2}}y(x)
$$

Skipping some non-trivial math: 

$$
x^2y'' + xy' + (x^2 - p^2)y = 0
$$

This is the Bessel's function in its standard form (After some simplification)

Where $p = n + \frac{1}{2}$ wher $n = 0, 1, 2, 3\cdots$

And, we are going to use the solution of the first kind, because we want the boundary condition $R(0)\ne \infty$ to be true, and that means: 

$$
R(r) = x^{\frac{-1}{2}}y(x)  = Ax^{-\frac{1}{2}}J_p(x)
$$

If we spcify: $A = \sqrt{\frac{\pi}{2}}$, then, $R(r) = \sqrt{\frac{\pi}{2x}}J_p(x)$ which will be: 
 
$$
R(r) = \sqrt{\frac{\pi}{2\pi}}J_{n + \frac{1}{2}}(x) = j_n(x)
$$

Where we introduce the $j_n(x)$ as the Spherical Bessels function. 

Looking at the boundary conditions: $R(a) = 0$: 

$$
R(a) = 0 \implies j_n(\lambda a) = 0 \implies J_{n + \frac{1}{2}}(\lambda a) = 0
$$

$$
\implies \lambda a= z_{n + \frac{1}{2}, k}
$$

$$
\lambda = \frac{z_{n + \frac{1}{2},k}}{a}
$$

And recall that $z_{m, n}$ is used to denote the roots of the bessel's funtions. Boom, we had an expression for the constant for the eigen function for $R(r)$. 


