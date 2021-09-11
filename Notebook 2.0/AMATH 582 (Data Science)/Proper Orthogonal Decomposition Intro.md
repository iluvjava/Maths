Proper Orthogonal Decomposition (POD)

[Link](https://www.youtube.com/watch?v=YX24Jgd90uY)

We are going to need the idea of [[SVD]]

---

### Intro

We are interested in the PDEs in the format: 

> $$
> u_t = N(u, u_x, u_{xx}, \cdots, x, t, u)
> $$

For example:

$$
u_t + uu_x + \mu u_{xx} = 0
$$

And we are going to use discretization to turn it into  a finite system of ODEs. 

Consider: 

$$
u(x, t) \rightarrow u(x_n, t) = u_n \quad n = 1, 2,\cdots N
$$

Where, $u_n$ represent one of the discretization range of the point. 

So what ends up happening is a vector that is like: 

$$
u \approx
\begin{bmatrix}
    u_1 \\ u_2 \\ \vdots \\ u_N
\end{bmatrix}
$$

Now, we are interested in the derivative terms of the system. 

Which, we are going to use the Direction Method and Finite Difference Matrix to get this. 

$$
\frac{\partial u_n}{\partial x} = \frac{u_{n + 1} - u_{n - 1}}{2\Delta x}
\quad 
\frac{\partial^2 u}{\partial x^2} = 
\frac{u_{n + 1} - 2u_n + u_{n - 1}}{\Delta x^2}
$$

And the whole $N$ dimensional system is put together for by this linear operators for the PDEs discretization. 

And this is the formula for the Partial Differential Equations, approximated as a system of ODEs. 

---
### **Proper Orthogonal Decomposition**

Separation of Variables. 

This is one of the easier form of solutions to the PDEs system, and it's a very classic trick

The assumption here is:

$$
u(x, t) = \Psi(x) a(t) \quad x\in [-L, L]
$$

A solution to the PDEs system is a set of basis function, and described by time dynamic information. 

Notice that by expanding it (After discretization of course), we have the formula that looks like the Separation of variables trick: 

$$
u(x, t) = 
\sum_{i =1}^{N}\left(
    \Psi_i a_i(t)
    \right)
$$

$$
\sum_{i = 1}^{N}\left(
    \frac{d a_n}{dt}
    \Psi_n\right) = N \left(
        \sum_{i = 1}^{n}\left(a_n \Psi_n\right), 
        \sum_{i = 1}^{n}\left(a_n\partial_x\Psi_n\right), 
        \cdots
        x, t, u
    \right)
    \tag{1}
$$

And this how it gonna looks like. 

And especially, we want the orthogonality property that: 

$$
\langle \Psi_i, \Psi_j\rangle = \begin{cases}
    0 & i \ne j \\ 1 & i = j
\end{cases}
$$

So that the basis is orthogonal, notice that, the inner product of the function is defined to be the L2 Function Inner Product. 

Apply an integral wrt to $\Psi_m dx$ on expression (1), and then using the orthogonality property, we will have: 

> $$
> \frac{d a_m}{dt} = \langle N(\cdots), \Psi_m\rangle
> $$

Boom! We have an expression for the time dynamics for one of the modes!

Computationally, this is a system of ODEs that we are going to tackle. 

Now, we are interested n **solving the system of equations, with less than $N$ dimension**. And this is the goal here. 


---
### **Constructing the Basis set**

We are assuming a small dimension of the problem, which is going to help us with the problem and it's easier to solve as as well. 

**Problem: How do we represent some kind of function under the Basis Set?**

We are going to represent a function in terms of it's Fourier Modes. We will take a look at the Gaussian Function. 

Let's take a look at a code snippet: 

```matlab
% Discretization 
L = 20; n = 80; 
x2 = linspace(-L/2, L/2, n + 1); 
x = x2(1:n); 

% We got a guassian 
sigma = 1;
u = exp(-x.^2);
ut = fft(u);

k = (2*pi/L)*[0:(n/2 - 1) -n/2:-1]
subplot(2, 1, 2);
plot(x, u, "ro-");
plot(fftshift(k), fftshift(abs(ut)));
```
Pretty standard stuff. -w-

But the thing here is that Fourier Modes are pretty standard representation of the PDE modes. 

Boom! So then what we want is $\Psi_n(x)$ to be the Fourier Modes.