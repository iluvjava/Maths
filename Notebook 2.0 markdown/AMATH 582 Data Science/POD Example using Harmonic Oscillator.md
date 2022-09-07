[Proper Orthogonal Decomposition](Proper%20Orthogonal%20Decomposition.md)

Reference Video: [link](https://www.youtube.com/watch?v=sK0cUVD7mxw)


---
### **Intro**

Consider the system: 

$$
u_t = \frac{i}{2}u_{xx} + i|u|^2u
$$

This time, it's bit different as we changed the potential for the system. 

Consider Applying Fourier Transform on both side of the equation giving us: 

$$
\text{fft}(u_t, x) = \frac{ik^2}{\text{fft}(u, t)} + (i)\text{fft}(|u|^2u)
$$

That is how we are going to evolve the system if we were going to use FFT, spectral method. 

This is ok if we consider the fact that the solution decays to zero on the infinite domain. 

---
### **MATLAB** 

What is the optimal embedding space? 

```matlab
L = 30; n = 512; t = linspace(0, 2*pi, 41);
x2 = linspace(-L/2, L/2, n + 1); x = x2(1: end - 1); 
k = (2*pi/L)*[0:n/2 - 1, -n/2 - 1].'; % Has to be a column vector for the rhs

u = 2*sech(x); % initial conditions in the spatial domain. 
ut = fft(u);

[t, utsol] = ode45(@nls_rhs, t, ut, [], k);

for j = 1: length(t)
    usol(j, :) = ifft(utsol(j, :));
end
surf(x, t, abs(usol)); 
```

Let's code in the RHS of the $u_t$

```matlab
function rhs = nls_rhs(u, ut, dummy, k, v)
    u = ifft(ut); 
    rhs = - (i/2)*(k.^2).*ut + i*fft(abs(u)^2.*u);
end
```

And, in fact, the function $\text{sech}(x)$ is the solution of the system, it's and it's also one of the Eigenmode of the system. 

---
### **POD**

```matlab
x = usol.';
[u, s, v] = svd(x); 
plot(diag(s)); 
```

And, in fact, there is only one mode in the system. The first mode will describe 100% of the variance. 

The choice of plotting the modes will also reveal on what kind of thing we are looking at. 

What is the time dynamics of the first mode? The first mode is complex too. 

```matlab
plot(real(v(:, 1)));
plot(imag(v(:, 1)));
```

And it will show that he real part and the complex part, which is the $a(t)$ function that describes the time dynamics for the modes $\Phi_1$. 

---
### **Analytical Process: One Mode**

We are solving: 

$$
u_t = \frac{i}{2}u_{xx} + i|u|^2u \implies iu_t + \frac{1}{2}u_{xx} + |u|^2u = 0
$$

The solution is assumed to be in the form of: 

$$
u = a(t)\Phi(x) \implies u_t = ia'(t)\Phi(x) + \frac{1}{2}a(t)\Phi_{xx} + |a(t)|^2|\Phi^2|\Phi = 0
$$

Notice that, we are just considering one mode: $\Phi(x)$. 

Where, $a(t)$ and te function $\Phi(x)$ should be considered function with complex output and inputs. 

Then, consider 

$$
\langle 
u_t, \Phi
\rangle
$$

The inner product between the PDE, or the RHS of the PDE. With the Unitary nature of the Principal Modes, we will have: $\langle\Phi, \Phi\rangle = 1$, therefore, the inner product above will produce: 

$$
\langle u_t, \Phi\rangle = 
ia' + \frac{1}{2}a \langle \Phi_{xx}, \Phi\rangle + |a|^2a
\langle |\Phi|^2\Phi, \Phi\rangle = 0
$$

And notice that, this is a first oder differentia equation wrt to $a$! The solution is completely independent. 

In fact, there is an analytical solution to this, which is out of the scope here. 


---
### **More Modes: 2**

By tweaking the initial condition to be $2\text{sech}(x)$, which introduced 3 important modes into the system. 

General Architecture: 

$$
u_t = Lu + N(u)
$$

Where the first part $L$ represents some combinations of linear, differential operators. 

Consider the solution in the form of: 

$$
u = \Phi_r a(t)
$$

Where this is descritized, meaning that, $\Phi_r$ is a matrix containing all the column vectors as the descritized modes for the function. And the quantity $a(t)$ is a vector of function wrt to $t$, each elements represent the time dynamics of one of the modes in the matrix $\Phi_r$. 

Substituting it back to the system, we have the formulation that: 

$$
\Phi_r a'(t) = L\Phi_ra  + N(\Phi_ra)
$$

Now, for the above equation, we take the functional inner products of all the functions at once, by multiplying both side by the matrix: $\Phi_r$, giving us the time dynamics ODE:

$$
a' = \underbrace{\Phi_r^HL\Phi_r}_{\text{Pre-compute}}a + \Phi_r^HN(\Phi_ra) \leftarrow \text{Non Linear System of ODE}
$$

Where, it's possible to pre-compute the quantity $\Phi_r^HL\Phi_r$, because it's not time dependent.

Assuming that there are 2 **Significant Modes** Boom, then we have some time dynamics ODE in the form of: 

$$
\begin{cases}
    a_1' = f_1(a_1, a_2) \\ 
    a_2' = f_2(a_1, a_2)
\end{cases}
$$

Note, when we solved for the time dynamics, it's a matrix, it's in the form of: 

$$
a = 
\begin{bmatrix}
    a_1(t_1) &  a_1(t_2) & \cdots & a_1(t_n) 
    \\
    a_2(t_1) & a_2(t_2) & \cdots & a_2(t_n)
\end{bmatrix}
$$

When descritized, and after it's being solved by the ODE solver. Because matlab is Row Major, we have to transpose this thing before projecting the time dynamics onto the modes: $\Phi_r$. 

What is the initial conditions for the time dynamics? Assume that the initial conditions is given by the function: 

$$
u(x, t) \underset{\text{Descritized Spatial}}{\rightarrow} u_0
$$

Then, we need to describe the initial conditions with some linear combinations of the modes, giving use the expression that: 

$$
a_0 = \Phi_r^Hu_0
$$

By taking advantage of the fact that the modes are Unitary. Boom! We solve the system in a much lower dimension using the dynamics of the optimal basis. 