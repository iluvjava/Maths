Continue on POD, previously we have [Proper Orthogonal Decomposition Intro](Proper%20Orthogonal%20Decomposition%20Intro.md), and the reference lecture video is: [link](https://www.youtube.com/watch?v=X5GhhjpX0ao). 

---
### **Intro**

We are interested in solving PDE of the form: 

$$
u_t = N(u, u_x, u_{xx}, \cdots)
$$

And the solution format is assumed to take the form of: 

$$
u = \sum_{n = 1}^{N}\left(
        a_n(t)\Phi_n(x)
    \right)
$$

Which is just, time dynamics on some kind of basis function. Most of the time when we did it, it was the Fourier Basis. 

If we have the right set of basis equation, the we substitute it back, then we should get a ODE system that allows for solving $a(t)$ the time dynamics. 

Notice that: $N$ is the number of basis. How do we do this? It should be way larger than N. 

---
### **Collecting the Data**

$$
X = 
\begin{bmatrix}
    u_1 & u_2 & \cdots & u_m
\end{bmatrix}
$$

This is the data matrix, it's a column data matrix and it can be complex. 

The singular value decomposition will be: 

$$
X = U\Sigma V^H
$$

The size of them will be: $n\times n, n\times m, m\times m$. The matrix $U$ contains the thing that we are interested for the system. 

Notice that, So far the SVD reduction is neither "econ" nor "reduced"

Now, consider taking a small subset of the SVD, let's say that it's $r$,then we obtain the reduces SVD in the form of: 

$$
X = \underset{n\times r}{U}\;\underset{r\times r}{\Sigma}\;\underset{r\times m}{V^H}
$$

Now, let's define the principal mode function $\Phi_i$ to tbe first $i$ modes in the column of matrix $U$. 

---
### **Example: Harmonic Oscillator**

The system is: 

$$
iu_t + \frac{1}{2}u_{xx} -\frac{x^2}{2}u = 0
$$

Which is a partial differential equation on the infinite domain. 

The solution of the system is nicely described as: 

$$
u(x,t) = a_n \Phi_n(x) \exp\left(-i
    \left(n + \frac{1}{2}\right)t\right)
$$

Note that the system is a separable function. And the dynamics on the spatial domain consists of what we call: "**Hermite Polynomials**". 

With the assumption that: 

$$
\Phi_n \rightarrow 0 \quad x \rightarrow \pm \infty
$$

Which is just a boundary conditions. 

Let's solve this computationally and peek into the Principal Modes. Under a finite domain: $[-L, L]$, where $L$ should be large. 

1. Solve things in the Fourier Domain first. Fourier Modes are not the best modes for the system. 


```matlab
L = 30; n = 512; t = 0:0.2:20
x2 = linspace(-L/2, L/2, n + 1); x = x2(1: end - 1); 
V = (x.^2).';

k = (2*pi/L)*[0:n/2 - 1  -n/2:-1].'    % Fourier Domain stuff. 
u = exp(-0.2*x.^2); 
ut = fft(u);                           % Initial conditions in Fourier Domain. 

[t, utsol] = ode45(@harmonic_rhs, t, ut, [], k, V);  
% [] dummy variable of ODE options. 

% Extract the solution in the Fourier Domain.
for j = 1: length(t)
    usol(j, :) = ifft(utsol(j, :));
end
surf(x, t, abs(usol));  % Complex outputs. 
shading interp;
```

Ok, then, how do we define the right hand side of the Harmonic oscillator under the Fourier Domain? How to implement the `@harmonic_rhs` function? 

The math: 

$$
iu_t + \frac{1}{2}u_{xx} - \frac{x^2}{2}u = 0
$$

$$
u_t = \frac{i}{2}u_{xx} - \frac{ix^2}{2}u
$$

Perform Fourier Transform on the expression: 

$$
\widehat{u}_t = \frac{-ik^2 \widehat{u}_t}{2} - \frac{i}{2}\text{fft}(x^2u)
$$

And this is really what we need to advance time dynamics of the Fourier Modes for this equation. 

The quantity $x^2$ has been defined and passed via the ODE45 into the RHS. 


```matlab
function rhs = harmonic_rhs(t, ut, dummy, k, V)
    u = ifft(ut); 
    rhs = (-i/2)*(k.^2).*ut - (i/2)fft(V.*u);
end
```

---
### **Ideal Modes**

After solving the system with FFT, we get data that can be observed, and let's pack the solutions into a column data matrix as said in Collecting the Data. 

$$
X = U\Sigma V^H
$$

Then we plot the modes of the system. And in the case for the Harmonic Oscillator, we only need 5 modes to describe the system. When plotting it, we should be looking at the modular, because the solution for the system is complex. 

**Note**: The above initial conditions only gives the even modes, by changing the value of the initial conditions, say: $\exp(-0.2(x - 2)^2)$, this will be a big problem and a lot more significant modes will be introduced into the system. At least 20 modes are needed for the alternative initial conditions. 
