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

The modular squared $|\psi|^2$ is the probability of finding an electron at a specific position. 

$\psi$ is a complex function.

$\mu$ is the mass of the electron 

$\hbar$ is the reduc ed plank constant, $\hbar = \frac{h}{2\pi}$

This is the boundary conditions: 

$$
\psi = 0 \text{ when} \quad x = 0, A \quad Y = 0, A\quad A = 0, A
$$

The particle is not present on the boundary of the box. 

---
### **Separation of Variables**

**Spatial Solve**

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
\frac{Z''}{Z} = -(\lambda - a^2 - b^2) = -c^2 \tag{9.1}
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
\tag{13}
$$

Then from the ODEs, all $X, Y, Z$ is going to be composed with $\sin$, and it's going to be like: 

$$
a_n \frac{n\pi}{A}  \implies X_n =\sin\left(
    \frac{n\pi x}{A}
\right) \quad n\in \mathbb{N}
$$

So then for the other 2 we have: 

$$
b_m = \frac{m\pi}{A} \implies
Y_m = \sin\left(
    \frac{m\pi y}{A}
\right) \quad n \in \mathbb{N}
$$

And then: 

$$
c_l = \frac{l\pi}{A} \implies \sin\left(
    \frac{l\pi z}{A}
\right)\quad n \in \mathbb{N}
$$

then, there are 3 integers governing different types of $X, Y, Z$, then the solution for $u$ will depend on all 3 of the parameters $m, n, l$, therefore it will be like: 

$$
u_{m, n, l} = X_nY_nZ_n = \sin\left(
    \frac{n\pi x}{A}
\right)
\sin\left(
    \frac{ m\pi y}{A}
\right)
\sin\left(
    \frac{l\pi z}{A}
\right)
\tag{14}
$$

from (5), (8), (9), (9.1), can express $\lambda_n$ to be: 

$$
\lambda_{n,m,l} = a_n^2 + b_m^2 + c_l^2 = 
\frac{\pi^2(n^2 + m^2 + l^2)}{A^2}
\tag{15}
$$

Then, we will be able to get expression the solution. 


**Temporal Solve**

The time solution is also going to depend on $m, n, l$, and we need to susbtitute the expression for $\lambda$ back to get it. 

$$
\frac{i\hbar T'}{T} = E = \frac{\hbar^2\lambda^2}{2\mu}
$$

$$
T'(t) = \frac{\hbar^2\lambda^2}{2\mu}
\frac{1}{i\hbar}T(t)
=
\frac{-i\hbar \lambda^2}{2\mu}T(t)
$$

$$
T'_{m, n, l} = \frac{-i\hbar \lambda^2_{m, n, l}}{2\mu}T(t)
\tag{16}
$$

Then, the solution of it will be like: 

$$
T_{n, m, l}(t) = 
T_{n, m, l}(0)
\exp \left(
\frac{-i\hbar \lambda_{n, m, l}^2}{
    2\mu
}t
\right)
$$


And, this function is going to oscillate. Because of the imaginary units in the exponent of the exp. 

The frequency is given by: 

$$
\frac{-i\hbar \lambda_{n, m, l}^2}{
    2\mu}
    = 
\frac{\hbar}{2\mu} 
\frac{\pi^2}{A^2}(n^2 + m^2 + l^2)
\tag{17}
$$


And notice that, the frequencies are quantize, because of the fact that $n, n, l$ are integers in this case. 


---
### **Quantum Mechanics**

Let's talk abut the energy of an electron, it's computed by: 

$$
\hbar \omega = \hbar \left(
    \frac{\hbar \lambda^2_{m, n, l}}{2\mu}
\right) = E_{m, n, l}
$$

Interesting, that is the constant we had on the right handside of the PDE. 

In the problem above, the electron is not going to escape, but in the reality, the electron will be able to escape. 

This model is only accurate for the first few values of $m, n, l$. 

The lowest energy level of the electron is when $m, n, l = 1, 1,1$. 

Which is something like: 

$$
E_{1, 1,1} = \frac{3\hbar^2 \pi^2}{2\mu}
$$

Assuming that $A = 1$. 

This is a constant that is not zero. 

This is called the **ground state**. 

And the ther state where higher harmonics are involved, that is thelelevated states, and it's like $E_{1, 1, 2}, E_{1, 2 , 1}, E_{2, 1,1}$. And these excited state is like: 

$$
\frac{6\hbar \pi^2}{2\mu}
$$

Fascinating. 









