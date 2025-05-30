[[Image Processing]]
[[Spectral Method 2]]
Instead of denoising, now we are interested in smoothing the images. 
And we are going to use some ideas from scientific computing, especially the parts where we use numerical method to time step the heat equation. 

The diffusion equation is the way to smooth an image. 

[lecture reference](https://www.youtube.com/watch?v=m1YqnJNziWU&feature=youtu.be&ab_channel=NathanKutz)

---

### Intro
Remember the Diffusion equation. 

Start off with some choppy data, then the evolution of the heat equation is going to smooth that out. 

And, our Laplacian is back. 

$$
u_t = D(u_{xx} + u_{yy})
$$
Using the properties of Fourier Transform on $x$ we have: 

$$
\widehat{u}_t = D(-k_x^2 \widehat{u}_{xx} + \widehat{u}_{yy})
$$
$$
\widetilde{\widehat{u}}_t = D(-k_x^2 \widetilde{\widehat{u}}_{xx} - k_y^2 \widetilde{\widehat{u}}_{yy})
$$
And there is an Analytical solution to the problem, which is: 

$$
\tilde{\widehat{u}}  = \widetilde{\widehat{u}}_0 \exp(-D(k_x^2 + k_y^2)t)
$$

And notice that, this is just the same as applying Gaussian Filter on the image. (The discrete interpretation of the analytical solution of the heat equation.)

Diffusion is like filtering

---
### Diffusion Coefficients 

That is all basic, now let's consider the case where the diffusion term is not a constant anymore, notice that it can be written in the following way: 

> $$
> u_t = \nabla\cdot(D(x, y)\nabla\cdot u)
> $$

Notice  that, the diffusion depends on where we are in the image. Notice this stucked in between the 2 Divergence Operator. 

Why? 
**Given an image that is only having noise around one small region,** then we can use this idea to control the diffusion on different places of the images. 

Even Fancier (Non Linear diffusion)
> $$
> D = D(u, \nabla\cdot u)
> $$

Which is a nonlinear function, which takes in the Divergence and the Function value to determine the diffusion coefficients. 

**Notice**: This is similar to the Gobar Transform, instead, this is done in the differential equation, but for Gabor it's acted on the spatial domain.

---
### 1D Diffusion

Recall that, finite difference method can be used to take the partial differential equation for the 1D or the 2D equation. 

[[Finite Difference]], [[Direct Method]]. These 2 ideas can be apply here too. 

And then using the idea of Finite Diff and Direct method, the image, will be reduced to a system of ODEs, which can be represented as: 

---
### MATLAB Demo

### Practice