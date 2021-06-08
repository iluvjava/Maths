[[Schordinger Eqn in Box]] 
Here, we are sticking with the same thing, but we are going to look into some concrete examples for it. 


---
### **Intro**

We are interested in a sound waves in a rectangular cavity. 

The system of equations is given like: 

$$
\partial_t^2[\psi] = 
\alpha^2\nabla^2\psi
$$

And $\psi$ is the displacement. 

And the box is rectangular. 

$$
\psi = 0 \quad \text{when: } x = 0, L_1\quad y = 0, L_2\quad z = 0, L_3 
$$


---
### **Separation of Variables**

The assumption for the solution format is: 

$$
\psi(x, y, z, t) = X(x)Y(y)Z(z)T(t) 
\tag{1}
$$

Substituting it back to the original equation yields

$$
T''XYZ = \alpha^2(X''YZT + XY''XT + XYZ''T)
$$

Dividing both size by $XYXT$, we have: 

$$
\frac{T''}{T} = \alpha^2 \left(
        \frac{X''}{X}
        + 
        \frac{Y''}{Y}
        + 
        \frac{Z''}{Z}
\right)
$$

and, spoiler alert, because this is true for all value of $x, y, z, t$, the left hand side and the RHS will have to be a constant. But there will be many constants for us to locate the basis function in the spatial domain. 

**Note**: The $\alpha$ is going to be with $T$, on the left hand side of the equation. 

And we are going to make the assumption that the constant on the RHS is $-\lambda^2$, this is true because we are looking at dirichlet boundary conditions for the system. 

Applying the SOV, then we will have: 

$$
\frac{X''}{X}
+ 
\frac{Y''}{Y}
+ 
\frac{X''}{Z}
= 
-\lambda^2
$$


Then, we will know that: 

$$
\frac{X''}{X} = -a^2
\quad 
\frac{Y''}{Y} = -b^2
\quad 
\frac{X''}{Z} = -c^2
\tag{2}
$$


Well in this case, we will be getting basis functions for $X, Y, Z$, and each of then will be identified with a natural numbers. Which determines the frequencies of the Basis function. 

Notice that it's hinted that: 

$$
-\lambda^2_{m, n, l} = -(a^2_n  + b^2_m  + c^2_l)
$$

Combining what I just said about a lot of solutions each of them being identified with a natural number, we will have: 

$$
a_n = \frac{n\pi}{L_1} \quad b_m = \frac{m\pi }{L_2}\quad c_l = \frac{l\pi}{L_3}
$$


And then those are the frequencies for basis function $X, Y, Z$, and the basis function is $\sin$ hence the solution will be in the form of: 

$$
u_{n, m, l}(x, y, z, t) = \sin \left(
    \frac{n\pi x}{L_1}
\right)\sin\left(
    \frac{m\pi y}{L_2}
\right)\sin\left(
    \frac{l\pi z}{L_3}
\right)T_{m, n, l}(t)
$$

Amazing. 

$$
\lambda_{m, n, l}^2 = \pi^2\left(
    \left(
        \frac{n}{L_1}
    \right)^2
    + 
    \left(
        \frac{n}{L_2}
    \right)^2
    + 
    \left(
        \frac{n}{L_3}
    \right)^2
\right)w
$$


**The Time domain**

$$
T''_{m, n, l} + \alpha^2\lambda_{m, n, l}^2T_{m, n, l} = 0
$$

Then it can be said that: 

$$
T_{n, m, l} = A\sin(w_{n, m, l}t) + B\cos(w_{n, m, l}t)
$$

Where

$$
w_{n, m, l} = \alpha\pi \sqrt{ 
    \left(
        \frac{n}{L_1}
    \right)^2
    +
    \left(
        \frac{m}{L_2}
    \right)^2
    + 
    \left(
        \frac{l}{L_3}
    \right)^2
}
$$

Notice that the frequencies of the sound wave is quantized. 

The lowest frequency will be given by $w_{1, 1, 1}$ 

**Some Important Facts**

This means that, for higher requencies, it cannot be written as an integer multiple of $w_{1, 1, 1}$. 

Notice that, in the first dimension, the harmonics of the basis function is given as: 

$$
w_n = \frac{n\alpha\pi}{L}
$$

Which means that $w_2$ is a multiple of $w_4$, it's like a combination of ordered harmonics. 

In the case of 3D partial standing waves, the harmonics is different, and they are not 2x multiple of each other. 

That is also the reason why some of the instruments that make standing waves on a string has more of a soothing affect, it's because of the properties of the harmonics on the 1D vibrating string.   