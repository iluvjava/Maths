It's 11.4 in the textbook of the course. 
This time, we are solving this in a cylinder. 

[[Separation of Variables]], [[Multi-Dimensional PDEs]]

We are going to use Separation of variable to solve a special case of the 3D wave equation. This time it's in a cylinder. And we will introduce the bessel's basis function for the solutions too, which is need to model the wave in a circle (periodic boundary conditions). 

---
### **Intro**

We are going to solve the PDEs in the cylindrical coordinates 

The Helmholtz equation IS the wave equation. 

And, the given PDE is in this form: 

$$
\nabla^2\cdot u = -\lambda^2 \partial_t^2[u]
$$


Here is the parameters for the cylinder: 

1. Cylinder radius: $a$
2. Radial direction of: $r$
3. Angular dependence: $\theta$
4. Height: $L$
5. Height Dependence: $z$

This is like a flute. The solution is going to satisfy the wave equation, and it's going to represent the waves inside of the cylinder. 

This is the boundary conditions for the equation: 

$$
u = 0 \quad z = 0, L
$$

There is no vibration on the cap of the cylinder. 

$$
u = 0  \quad r = a
$$

There is no vibration on the wall of the cylinder. 

Here is a summary on the procedures to take when solving this equation: 
1. Separate it into spatial domain and time domain, let the function takes the form: $\phi(x, y, z)T(t)$
2. Then for the spatial domain, using the separation of variables to get the solution for each of the function that governs each dimension in the Cylindrical coordinate, by assuming that $\phi(x, y, z) = Z(z)\Theta(\theta)R(r)$. 
3. Solve the ODE, starting with the part involving only $Z(z)$ using the boundary conditions that there is no vibrations on the cap of the cylinder, then $\Theta(\theta)$. And the function $\Theta(\theta)$ has a $2\pi$ period to it. Then finally, solve the $R(r)$ which is the bessel's equation, extract the bessel's of the first kind as the solution for functions $R(r)$ because of the boundary conditions that $R(0) \ne \inf$. When solving the bessel's equation, see: [[Bessel's Equation]] for a more formal treatment of the matter. 
4. Then, we get the solutions for all the basis functions, in which wee will also have accumulated all the constants we need, wrt to 2 indices: $m, n, l$. 
5. Then, we add the time domain into the picture and solve the ODE involving the time and get the full solution of the system. 

---
### **Cylindrical Coordinate**

The Laplacian operator in the cylindrical Coordinate is given by: 

$$
\nabla^2\cdot \bullet = 
\frac{1}{r} \partial_r[r\partial_r[\bullet]]
+ 
\frac{1}{r^2}\partial_\theta^2[\bullet] + 
\partial_z^2[\bullet]
\tag{1}
$$

And we never learned it, the proof or the derivation here is skipped. 

---
### **Separation of Variables**

We are going to pull the same trick again, and this time, in the cylindrical coordinate, but the assumption is still the same, and it's like; 

$$
u(r, \theta, z) = R(r)\Theta(\theta)Z(z)
\tag{2}
$$

**Note**: $T(t)$ is missing and we will come back to that later, and justify what is going on with it. 

Yeah, something like that, and putting it into the PDE will yield this: 

$$
\frac{1}{r}\partial_r[r\partial_r[R]]\Theta Z + 
\frac{1}{r^2}\Theta''RZ + 
R\Theta Z''
=
-\lambda^2R\Theta Z
\tag{3}
$$

And pulling the same trick of dividing both side by $R\Theta Z$ this will be like: 

$$
\underbrace{\frac{
    \frac{1}{r}\partial_r[r\partial_r[R]]
}{
    R
} + 
\frac{1}{R^2}\frac{\Theta''}{\Theta}}_{A} + 
\frac{Z''}{Z} = -\lambda^2
\tag{4}
$$

Take notice that this is the same trick, we have separated the expression, and these parts will have to be a constant for this expression to be equal for all values of $\theta, z, r$, and hence, we can say that: 

$$
\frac{Z''}{Z} = - \lambda^2 - A = - b^2
\tag{5}
$$
$$
\implies Z'' + b^2Z = 0
$$

By anchoring on $Z$, have will be able to apply the boundary conditions. 

$$
Z(0) = Z(L) = 0
\tag{6}
$$

Then, it's not hard to see that, this is just the classical Dirichilet Boundary conditions, for the basis function $Z(z)$, and then, it can be said that: 

$$
b_l = \frac{l\pi}{L} \quad Z_l(z) = \sin\left(
    \frac{l\pi z}{L}
\right)
\tag{7}
$$

And this is the configuration for $Z(z)$. 

Sub (5) --> (4) we will get: 

$$
A = - (\lambda^2 - b_l^2)
$$

$$
\frac{
    \frac{1}{r}\partial_r[r\partial_r[R]]
}{
    R
} + 
\frac{1}{R^2}\frac{\Theta''}{\Theta} 
= 
- (\lambda^2 - b_l^2)
$$

$$
\frac{\Theta''}{\Theta} = \underbrace{- (\lambda^2 - b^2)r^2 - 
\frac{r\partial_r[r\partial_r[R]]}{R}}_{-m^2}
\tag{8}
$$

$$
\implies \Theta'' + m^2\Theta = 0 
\tag{9}
$$

And now, we will be able to solve for another function with SOV. 

**Question**: 

Now, do we have any boundary conditions for $\Theta$? 

No. 

Hence we want to make sure that, the function is **periodic**. So the thing we want is: $\Theta(\theta)$ function **must be a $2\pi$ periodic function**. Remember the Heat conduction in circular rods (Periodic Boundary Conditions)? 

The periodic boundary property implies that:

$$
\Theta(-\pi) = \Theta(\pi) \wedge \Theta'(-\pi) = \Theta'(\pi)
$$

The most general solution for ODEs in (9) is in the form of: $\exp(-im\theta), \exp(im\theta)$. 

using the Periodic boundary conditions, we have: 

$$
\Theta(-\pi) = \Theta(\pi) = \exp(im\pi) = \exp(-im\pi) \implies m = 0, \pm 1, \pm 2, \cdots
\tag{10}
$$

Notice that, if we start with the other solution: $\exp(-im\pi)$, we will still get the same results, so just one of them will be sufficient. 

Hence, the basis functions will be like: 

$$
\Theta (\theta) = \exp(im\theta) \quad m\in \mathbb{Z}
$$

Now, we will start solving for $R(r)$. 

Substituting (8), (5) into (4) we will have: 

$$
r \partial_r[r\partial_r [R]] + ((\lambda^2 - b_l^2)r^2 - m^2)^2R = 0
$$


And we didn't see these type of ODEs before. These type of variations of these type of ODEs are called: **Bessel's Equation**. 

The **Bessel's Equation** is not involving $\sin$, $\cos$, the **standard form** of the Bessle's equation is like:[^1]  

> $$
> x \partial_x[x\partial_x[y]] + (x^2 - p^2)y = 0 
> \tag{11}
> $$

And he form of the ODE we have is: 

> $$
> r\partial_r[r\partial_r[R]] + [(\lambda^2 - b_l^2)r^2 - m^2]R = 0
> $$

Just compare it yourself I want state too much about it anymore. 

And let's just assume that we have the solutions for the equation now, and more details about the Bessel's function is not covering here.[^2]:

---
### **The Hidden Boundary Conditions**

**There are 2 solutions, one of them is blowing up, and the other one is not blowing up.**

We are going to assert another additional boundary conditions to restrain us to only solutions that are not blowing up. We want the solution to be bounded. 

We want: 

$$
R(0) \ne \pm \infty
$$

The Radial component at center axis of the Cylinder is bounded!

---
### **Solving the ODEs of Bessel's Equation**

Ok, we are actually going to solve in this file, because it's relevant to what we are doing. 

Power Series: This power series is centered at $x = 0$, and we are going to use this as the tool for solving the ODEs. 

In addition, we are making the assumption that: **The ODE does't have any singularity at $x = 0$**

Recall: **Singularity of ODEs**

$y'' + P(x)y' + Q(x)y = 0$, $a$ is a singularity of the ODE if $P(x)$ or $Q(x)$ diverges as $x\rightarrow a$. 

**Spoiler Alert**: Zero is the singular point of the Bessel's ODE. And the **Frobenius Method** and the method said that: 

$$
y(x) = x^s \sum_{n = 0}^{\infty}    a_nx^n = \sum_{n = 0}^{\infty} a_nx^{n + s}
\tag{12}
$$

**Note**: We can't use power series because the point $x = 0$ is a singularity of the ODEs. That is why we are using the Frobenius Method. Which, we multiply the series by a $x^s$, to smooth out the singularity. (Similar to figuring out the order of singularity of complex functions.)


And with this modifications of the Power series, we will be able to solve the ODE with the power series. Our goal is to see what the value for $s$ is. 

Substituting it into the Bessel's Equation:  

$$
y(x) = \sum_{n = 0}^{\infty}a_nx^{n + s}
\tag{13}
$$

Where Bessel's standard form is like: 

$$
\underbrace{x\partial_x[x\partial_x[y]]}_{x^2y'' + xy'} + (x^2 - p^2)y = 0
\tag{14}
$$

The underbrace on (14) contains trivial amount of math (Product rule). 

It will be like: 

$$
y'' = \sum_{n = 0 }^{\infty}
    (n + x)(n + s - 1)a_n^{n + s - 2}
    = \sum_{n = 2}^{\infty}
        (n + x - 2)(n + s - 3)a_nx^{n + s}
$$

$$
y' = \sum_{n = 0}^{\infty}a_n(n + s)x^{n + s - 1}=
\sum_{n = 1}^{\infty}
    a_n(n + s - 1)x^{n + s}
$$

So now we have the index shifted. 

Plugging it into the original equation with the shifted indices, we will have: 
(After non-trivial amount of math)



$$
\sum_{n = 0}^{\infty}
    [(n + s)^2 - p^2a_n]x^{n + s} + 
\sum_{n = 2}^{\infty}
    a_{n - 2}x^{n + s} = 0
\tag{15}
$$

Notice that in the case of $n = 0$, we will get: 

$$
a_0[s^2 - p^2]  = 0
$$

And this will imply that $s^2 = p^2$ implies that $s = \pm p$

There is another file the talks about the Bessel's Equation in more detail: [[Bessel's Equation]]. All the details go into that file so it's not too cluttered here. Because it's kinda complicated. 

Ans the solution for the standard form bessel's equation turns out to be: 

$$
y_1(x) = \sum_{n = 0}^{\infty}
    \frac{(-1)^n\left(
        \frac{x}{2}
    \right)^{2n + p}}{
        n!\Gamma(n + p + 1)
    } = J_p(x)
$$

Which is called **Bessel's Function of the First Kind**. And it will be used for solving the Helmholtz equation in a cylinder. 

---
### **Eigenfunctions**

Now, armed with the knowledge about the bessle's equation, we are ready reveal the full glory of all the basis function for each of funciton, and they will look like: 

* For $Z(z)$: 
$$
Z_l(x) = \sin(b_l z) \quad b_l = \frac{l\pi}{L} \quad l = 1, 2, \cdots
$$

* For $\Theta(\theta)$: 
$$
\Theta_m(\theta) \exp(im\theta) \quad m\in \mathbb{Z}
$$

Now, for the big reveal of the hardest one: $R(r)$, we are going to do simplify it to the standard form first. The form we had now is: 

$$
r\partial_r[r\partial_r[R]] +
((\underbrace{\lambda^2 - b_l^2)r^2 }_{x^2}- m^2)R = 0
$$

And the standard form we are trying to match is: 

$$
x\partial_x[x\partial[y]] + (x^2 - m^2)y = 0
$$

So then we need: 

$$
x = (\lambda^2 - b_l^2)r
$$

With this susbtitution above, we will be able to transform the boundary conditions, and it will be like: 

$$
R(0) \ne \infty
$$

And on the edge of the cap of the cylindar, the boundary conditions will be: 

$$
y\left(
    a \sqrt{\lambda^2 - b_l^2}
\right) = 0
$$
Boom, now the general solution will be like: 

$$
y(x) = AJ_{m}(x)
$$

And we only need the Bessel's firt kind, the bessel's second kind is not bounded at $r = 0$, or $x = 0$. 

Applying the boundary condition, that will imply: 

$$
R(a) = 0 \implies J_m\left(
    a \sqrt{\lambda^2 - b_l^2}
\right) = 0
$$

This is true because we want the function to have zero value at the circumference on the top and bottom cap of the cylinder. 

Ok, what does this means... It means that the quantity: $a\sqrt{\lambda^2 - b_2^2}$ are representing the zeros of $J_m(x)$. 

Now, let's denote $z_{m, n}$ to be the $n$ th roots of $J_m(x)$, then it can be said that: 

$$
\lambda^2 - b_l^2 = \frac{z_{m, n}}{a^2}\implies
\lambda =
\sqrt{\frac{z_{m,n}^2}{a^2} + 
\left(
    \frac{l\pi}{L}    
\right)^2}
$$

Where we made the substitution of $b_l = \frac{l\pi}{L}$. And there are 3 parameters that determines the value of $\lambda$, and it's not hard to see that: 

$$
\lambda_{m, n, l} = \sqrt{
    \frac{z_{m, n}^2}{a^2} + \left(
        \frac{l\pi}{L}
    \right)^2
}
$$

Notice that, it makes sense to have 3 indices to control the basis function for $R(r)$, because this is the RHS expression: (4). Let's see how this helps with looking for the basis function: 

$$
R(r) = J_m(x) = J_m \left(
    r \sqrt{
        \lambda_{m, n, l}^2 - b_l^2
    }
\right) 
= J_m \left(
    r \sqrt{\lambda_{m, n, l}^2 - \left(
        \frac{l \pi}{L}
        \right)^2
    }
\right)
\implies 
J_m 
\left(
    r\sqrt{
        \frac{z_{m, n}^2}{
            a^2
        }}
\right) = J_m\left(
    \frac{rz_{m, n}}{a}
\right)
$$

And this will imply that the final solution possesses this kind of format: 

$$
u_{m, n, l}(r, \theta, z) = 
J_m \left(
    \frac{r z_{m, n}}{a}
\right)\exp(im\theta)\sin\left(
    \frac{l\pi z}{L}
\right)
\tag{16}
$$

Up to this point, we have all the boundary conditions for the **Helmholtz Equation in a cylinder Satisfied**. 


---
### **The Time Dimension**

We need time domain so we can have initial conditions and then solve to see how things evolve. 

We only have the spatial domain solved, what about the time domain? Let's denote $\phi_{n, m, l}(x, y, z) = u_{n, m, l}(x, y, z)$. 

The story is similar to what we did in one dimension and it will be like: 

$$
\nabla^2 \cdot [\phi_{n, m, l}(x, y, z)T(t)] = c^2 \partial_t^2[\phi_{n, m , l}T(t)]
$$

$$
T(t) \nabla^2\cdot[\phi_{n, m, l}(x, y, z)] = c^2 \phi_{m,n,l}T''(t)
$$

And previously we figured out that 

$$
\frac{\nabla^2 \cdot u_{n, m, l}(x, y, z)}
{u_{n, m, l}(x, y, z)} = -\lambda^2
$$

Then we get an ODE for $T(t)$ which is: 

$$
-\lambda^2 T(t) = c^2T''(t) \implies T'' + c^2\lambda^2 T = 0
$$

Solving the ODE, it's not hard to see that it yields: 

$$
T(t) = C\sin(c\lambda t) + D\cos(c \lambda t)
$$

**The frequency of the sound save in the cylinder** is: $c\lambda$

Now, let $\omega = c \lambda$, where $c$ is given and $\lambda$ depends on $m, n, l$, meaning that $\omega$ also depends on $m, n, l$. 

Then it means that: 

$$
\omega_{n, m, l} = c \sqrt{\frac{z_{m, n}^2}{a^2}
+ \left(
    \frac{l\pi}{L}
\right)^2
}
$$

And recall that $n, l \in \mathbb{N}$, $m\in \mathbb{Z}$.



[^1]: It's in the chapter 10 of the textbook of the class. 
[^2]: [wiki link](https://www.wikiwand.com/en/Bessel_function)
