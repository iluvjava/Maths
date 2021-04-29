It's 11.4 in the textbook of the course. 
This time, we are solving this in a cylinder. 

[[Separation of Variables]]

---
### **Intro**

We are going to solve the PDEs in the cylindrical coordinates 

The Helmholtz equation IS the wave equation. 

And, the given PDE is in this form: 

$$
\nabla^2\cdot u = -\lambda^2 u
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

There is no vibration on the wall of the cylindar. 

---
### **Cylindrical Coordinate**

The Laplacian Opeartor in the cylindrical Coordinate is given by: 

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

We are going to pull the same trick again, and this time, in the cylindrical coordiant, but the assumption is still the same, and it's like; 

$$
u(r, \theta, z) = R(r)\Theta(\theta)Z(z)
\tag{2}
$$

Yeah, somehing like that, and putting it into the PDE will yield this: 

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

$$
