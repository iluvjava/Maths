Chapter 11 Materials 
[[Separation of Variables]] <-- This is the technique we are going to apply here. 


---
### **Intro**

Our example today is an electron in a box.

This is the example we are going to use. 

Let the electron be in a box of dimension: $A\times A\times A$. 

The PDE for the Shordinger equation is like: 

$$
i\hbar \psi_t = -\frac{\hbar^2}{2\mu}\nabla^2\psi
$$

**Facts**: 

And the function $\psi(x, y, z, t)$ is a function of space and time. 

The modular squared $|\psi|^2$ is the probability of finding an electron at a specific poisition. 

$\psi$ is a complex function.

$\mu$ is the mass of the electron 

$\hbar$ is the reduc ed plank constant, $\hbar = \frac{h}{2\pi}$

This is the boundary conditions: 

$$
\psi = 0 \text{ when} \quad x = 0, A \quad Y = 0, A\quad A = 0, A
$$

The particle is not present on the boundary of the box. 

---
**Separation of Variables**

Let 

$$
\psi(x, y, z, t) = u(x, y, z)T(t)\tag{1}
$$

Then susbtituting it back: 

$$
i\hbar T'u = \frac{-\hbar^2}{2\mu}\nabla^2 uT
\tag{2}
$$

Divides both hands by $uT$, then: 

$$
\frac{i\hbar T'}{T} = -\frac{\hbar}{2\mu}\frac{\nabla^2 u}{u} = E
\tag{3}
$$

By separation of variables, the expression equals to a constant, denoted by $E$, which also turns out to be a constant for the system. It's the energy level of the electron 

Focus on the special part of the equation, we have: 

$$
\nabla^2 u = u \underbrace{\frac{-2E\mu}{\hbar}}_{\lambda^2}
\tag{4}
$$

This is called: **Helmholtz Equatio**

$$
\nabla^2 u = \lambda^2 u \tag{5}
$$

This is the multiple dimension version of the ODEs we got for the 1D case. 

And then, we are going to use separation of variable again on this equation

Suppose that $u = X(x)Y(y)Z(x)$, then susbtituting it backwe have: 

$$
X''YZ + XY''Z + XYZ'' = -\lambda^2 XYZ
$$

$$
\implies 
\frac{X''}{X} + \frac{Y''}{Y} + \frac{Z''}{Z} = - \lambda^2
\tag{6}
$$

Big Spoiler: 

Each of the fraction must be equaled to a constant. 

Consider: 

$$
\frac{X''}{X} = \underbrace{- \left(
    \lambda^2 + \frac{Y''}{Y} + \frac{Z''}{Z}
\right)}_{-a^2}
\tag{7}
$$

This is true for all value of $x, y, z$, if we fix the value of x, then the right hand side must be the same for all $y, z$, if I change the value of $x$ for a new value, they have to be equal to that as well. Hence the only way to make it true is that, both the LHS and the RHS are constants. 

$$
\implies \frac{X''}{X} = -a^2
\tag{8}
$$

And at the same time we know that: 

$$
\implies\frac{Y''}{Y} = \underbrace{-(\lambda^2 - a^2) - \frac{Z''}{Z}}_{-b^2}
$$

$$
\implies \frac{Y''}{Y} = -b^2
\tag{9}
$$

And then in the end: 

$$
\frac{Z''}{Z} = -(\lambda - a^2 - b^2) = -c^2
$$

Now, we have system of ODEs, with all the constant defined in terms of each other. 

a -> b -> c, a is the most primordial

The system is like:

$$
\begin{cases}
    X'' + a^2 X &= 0
    \\
    Y'' + b^2 Y &= 0
    \\
    Z'' + c^2 Z &= 0
\end{cases}
\tag{10}
$$

For the boundary condition, lets focus on one of the case when $X = 0, A$, and then by symmetry, we can just get all the others as well. 

$$
\psi(0, x, y, t) = 0 = \psi(A, x, y, t)
$$

Then it can be translated to: 

$$
X(0)YXT = 0 = X(A)YXT  \implies X(0) = 0 = X(A)
$$

Assume that the solution is non-trivial

So then this is like: 

$$
X'' + a^2x = 0 \quad X(0) = X(A) = 0
\tag{11}
$$

From expression (10), so then in the end we have: 

$$
Y'' + b^2Y = 0 \quad Y(0) = Y(A) = 0
\tag{12}
$$


$$
Z'' + c^2Z = 0 \quad Z(0) = Z(A) = 0
\tag{12}
$$





