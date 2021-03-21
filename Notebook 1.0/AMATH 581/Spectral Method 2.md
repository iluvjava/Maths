prereq: [[Spectral Method, Discrete Fourier]]
Here we are going to deal with non-linear cases and more advance usage of spectral method approach to solving PDEs, or PDEs system. 


--

### Finite Diff Approach Non-Linear

Let's take a look at the Non-linear quantum oscillator example: 

> $$
> u_t = iu_{xx} + i|u|^2u
> $$

And it has a linear term, the second derivative, and t he non-linear term, the first derivative. 

Substituting the finite diff formula into the equation, we will get the following: 

$$
\frac{du_n}{dt} = \frac{i}{\Delta x^2}
\left(
	u_{n + 1} - 2u_n + u_{n - 1}
\right) + i|u_n|^2u_n
$$

Let's take a look at the *Spectral Approach**

$$
\widehat{u}_t = \widehat{L}\widehat{u} + \widehat{N(u)}
$$

 This is a generic formulation of the problem, let's further assume that the Linear operator is taking the form: 
 
$$
\widehat{L(\partial x)}  = \alpha \partial_x^2 + \beta \partial_x + \gamma
$$

And then after the transformation, we get a function that operates within the frequency domain, and this will be giving us: 

$$
\widehat{L(k)} = -k^2\alpha + ik\beta + \gamma
$$

$$
\widehat{u}_t = (-k^2\alpha + ik\beta + \gamma)\widehat{u} + \widehat{u(u)}
$$

And this will be the **RHS** of the PDE which is going to give the spatial revolution of the system of PDEs. 

This is how the non-linear term procedures look like: 

> $\widehat{u}$ --> {ifft} --> $u$ --> {Non linear function} --> N(u) --> {fft} --> $\widehat{N(u)}$

So we need to take back to the original space and then transform it with the non-linear space, and then transform it back to the Fourier Space for this equations. 

---

### Spectral Method for Streamline Vorticity (Non-Linear)

The system of equations can be summarized as the following: 

> $$
> \omega_t = -[\psi, \omega] + v\nabla^2\omega \quad (1)
> $$

> $$
> \nabla^2 \psi = \omega  \quad (2)
> $$

Last time we did the spectral method only on the second (2) equations, and on that part, we have the following procedures for solving the system, and it's like: 

$$
\widehat{\psi} = \frac{-\widehat{\omega}}{k_x^2 + k_y^2}
$$

Now, let't look at the non-linear component $[\psi, \omega]$ and we will see that it's non-linear and it includes derivative as its components: 
$$
[\psi, \omega] = -\psi_x \omega_y + \psi_y\omega_x
$$

The input is: $\widehat{\omega}, \widehat{\psi}$. We need to evaluate their derivative, and then we will have: 

$$
\psi_x = ik\widehat{\psi}
$$
apply **IFFT** to the above expression. 

And then we evaluate the bracket term: $[\psi, \omega]$, which is evaluating the non-linear expression here, and then we will apply **FFT**  to the whole expression, and then we will get: 

$$
\widehat{[\psi, \omega]}
$$

And then we can integral the non-linear components here for our problems. 

Note that, this is a bit better than using the matrix version, especially when people made the decision of not using sparse matrix, then it's going to be really slow. 

### Example Codes

```matlab 

%% - main file
clear all;
close all;
clc;

% initial setup
tspan = [0: 0.5: 40];
nu    = 0.001;
L     = 20;
n     = 64;
x2    = linspace(-L/2,L/2,n + 1);
x     = x2(1: n);
y     = x;

kx    = (2*pi/L)*[0:(n/2 - 1) (-n/2):-1]; 
kx(1) = 1e-6;
ky    = kx;

[X, Y]   = meshgrid(x,y);
[KX, KY] = meshgrid(kx,ky);

K    = KX.^2 + KY.^2;
Kvec = reshape(K, n^2, 1);  % Vectorize it TOOO

% initial conditions
 winit = exp(-0.25*(X).^2-2*Y.^2);
%winit = exp(-0.25*(X-2).^2-2*Y.^2)-exp(-0.25*(X+2).^2-2*Y.^2);

% initial conditions in fourier space, vector form
wfinit    = fft2(winit);
wfvecinit = reshape(wfinit,n^2,1);

% integrate in fourier space 
[t, wfvecsol] = ode45(@(t,wfvec) ... 
vortrhs(t, wfvec, nu, K, Kvec, n, KX, KY), tspan, wfvecinit);

% return to solution space and show as movie
for j = 1: length(t)
    curw = real(ifft2(reshape(wfvecsol(j, :), n, n)));
    pcolor(X, Y, curw); 
	shading interp;
    drawnow;
    pause(0.05);
end

%%%% - vortrhs
function rhs = vortrhs(t, wfvec, nu, K, Kvec, n, KX, KY)
	
	% Solve for stream functions. 
	wf   = reshape(wfvec, n, n);
	psif = -wf./K;
	
	% Derivatives in normal domain. 
	psi_x = real(ifft2(i*KX.*psif));
	psi_y = real(ifft2(i*KY.*psif));
	w_x   = real(ifft2(i*KX.*wf));
	w_y   = real(ifft2(i*KY.*wf));
	
	% RHS in fourierdomain: 
	rhs   = -nu*Kvec.*wfvec + ... 
		reshape(fft2(-psi_x.*w_y + psi_y.*w_x), n^2, 1);  % Most of the actions. 
end
```

#### Comments

The whole thing is converted to the Fourier space and then plug into the `ode45` for evolution. 

---

### Alternative Discretization of the Spatial Dimension

Take notice that in the Fourier Series, there are 2 basis functions, and they have different properties. 

$\sin(kx)$, as the basis functions, but it's having a pinned boundary. It's called the **Dirichlet** boundary conditions. 

This is the case because for  $\forall i \;\sin(k_ix)$, the function is hitting $y = 0$. 

consider $\cos(k_ix)$, we have the boundary conditions that is equaling to some kind of constant. Then the derivative of the basis function will equal to zero. And this is the **Noflux** boundary conditions, or the **Neumann Boundary Conditions**. 

These are called the: 
* Discrete Sin transform
* Discrete Cos transform

And using different basis function will have good compatibility on different types of boundary conditions.  
 

---
### Pinned and No Flux Boundary Conditions
In matlab, it's possible to use t he FFT algorithm for Discrete Sine and Cosine Transform on a input data vector. 

This is also useful for other types of Boundary conditions, suppose that we were given the function to simulate over the interval: $[0, L]$, and we want to apply the Fourier Sine, Cosine transform. 

For cosine transform, we mirror image around the y-axis and then apply the Fourier transform. The Fourier series is: 

$$
f(x) = \sum_{n = -\infty}^{\infty}
c_n \exp
	\left( 
		\frac{n\pi x}{L}
	\right) 
$$
Where the $c_n$ is just the Fourier Coefficients. 

And take notice that because we mirror the function, then the function will be an even function, therefore, it only has projection on the the $\cos$ component, which means that it's: 

$$
f(x) = \sum_{n = -\infty}^{\infty}
c_n \cos
	\left( 
		\frac{n\pi x}{L}
	\right) 
$$

The $\cos$ it able to model any type of boundary conditions for the function $f(x)$, and the derivative will be given as: 

$$
f'(x) = \sum_{n = -\infty}^{\infty}
-c_n 
\left( 
	\frac{n\pi}{L}
\right)
\sin
	\left( 
		\frac{n\pi x}{L}
	\right) 
$$

And take not that, for any $n\in\mathbb{Z}$, we will have that $x = L, 0$ on the boundary conditions and then it will mean that we are summing up $\sin(0)$ or $\sin(n\pi)$, and this means that: 

$$
f'(L) = f'(0)= 0
$$

And this is the **Neuamnn Boundary Conditions**, or the no flux boundary conditions. 

Similarly, if we interpolate the boundary using the $\sin$ function by reflecting the function from the $[0, L]$ to the $[-L, 0]$ domain, then: 

$$
f(L) = f(0)
$$
And this is the **Pinned Boundary Conditions**.