This method is a continuation of the method of multiple time scale, but this time, we use fourier series to get rid of the resonance term. 

[[Method of Multiple Time Scale 2]]
[[Introduction to Fourier Transform Fourier Series]]

---

### Intro: Fourier Series and 2 Pi Periodic Functions

Here, we will use the idea of fourier series. Please take a look at the reference above. 
The key part is Fourier Series, not transform.

For convention, that angle is denoting the average value of the function. 

And here, for simplicity, we are assuming that the function is periodic on the interval: $[-\pi, \pi)$ (Or any $2\pi$ Periodic function), so we don't have to worry about the multiplier of the fourier series. 

$$
\langle g\rangle = \frac{1}{2\pi}
\int_{0}^{2\pi} g(\theta)d\theta
$$

And so it's not hard to see the functional L2 inner product and this notation will be connected by: 

$$
\langle f, g\rangle_{-\pi, \pi} = \int_{-\pi}^{\pi} f(x)g(x)dx = 2\pi \langle fg\rangle
$$
And the angle notation on the product of 2 functions $f, g$ is the same as taking the inner product and then normalize it by the width of the interval. This **new notation will make our life easier**, but it's L2 Functional Inner product under the hood. 


And some facts here: 

$$
\langle \sin(n\theta)\rangle \quad \langle \cos(n\theta)\rangle = 0 \quad \forall n \in \mathbb{Z}
$$
are the average value of $\sin, \cos$ over the $2\pi$ periodic domain.

And this means that the fourier series have the form: 

$$
f(\theta) = \frac{a_0}{2} + 
\sum_{n = 1}^{\infty}\left(
        a_n \cos(n\theta) + b_n \sin(n\theta)
    \right)
$$

And the first coefficient $a_0$ is 2 times the average of the function $f$, and it will be like: 

$$
a_0 = 2 \langle  f(\theta)\rangle
$$

Now let's talk about the idea of inner product in function space, and it will be like: 

$$
\langle \sin(n\theta) \cos(k\theta)\rangle = 0 \quad \forall k, n \in \mathbb{Z}
$$

$$
\langle \sin(n\theta) \sin(k\theta)\rangle = 0 \quad \forall k, n \in \mathbb{Z} \wedge k \neq n
$$
$$
\langle \cos(n\theta) \cos(k\theta)\rangle = 0 \quad \forall k, n \in \mathbb{Z} \wedge k \neq n
$$

$$
\langle \sin(n\theta) \sin(n\theta)\rangle = \langle \sin^2(n\theta)\rangle = \frac{1}{2}
$$

And similarly: 
$$
\langle \cos(n\theta) \cos(n\theta)\rangle = \langle \cos^2(n\theta)\rangle = \frac{1}{2}
$$

And fourier coefficients is literally the scaler projection of the function onto the basis function $\cos, \sin$ over the interval. And the key here is to realize that, there is a multiplier of 2 because the basis function we used here, $\cos, \sin$ are not exactly unitary, and it's on the last statement above. 

$$
a_k = 2 \langle f(\theta) \cos(k\theta)\rangle \quad b_k = 2 
\langle f(\theta) \cos(k\theta) \rangle \quad k \neq 0
$$

---
### Method of Averaging

$$
x'' + x + \epsilon h(x, x') = 0
$$

And we are still looking at weakly non-linear system, with perturbations. 

Let's skip the same math we did for the method of multiple time scale, we should have: 

For the zero th order perturbations, we have: 

$$
x_0 = R(T) \cos(\tau + \phi(T))
$$

And from the first order perturbations we will have the system of equation: 

$$
\partial_\tau^2 + x_1 + 2 \partial_\tau \partial_Tx_0 + h(x_0, \partial_\tau x_0) = 0
$$

Notice that the $h$ function that makes it non-linear is carried over to the analysis on the first order perturbations term. 

Taking the derivative on things and make the substitution for $x_0$, we will have: 

$$
\partial_\tau^2x_1 + x_1 = 
2R'\sin(\tau + \phi) + 2 R \phi' \cos(\tau + \phi) - h(R\cos(\tau + \phi), - R \sin(\tau + \phi))
$$

Pay attention to the parameters passed to the function $h$. 

And, let's make the substitution on the parameter $\theta = \tau + \phi$, and another substitution: 

$$
H(\theta) = h(R\cos(\theta), -R\sin(\theta))
$$

And, let's say that, there is a Fourier series for the function $h$ in terms of trigs, and some of the will be the resonance terms with the perturbations term $x_0$, which are the terms that should have an undetermined coefficients of zero.

$$
a_1 = 2 \langle H(\theta)\cos\theta\rangle = 0 
$$
$$
b_1 = 2 \langle H(\theta)\sin(\theta)\rangle = 0
$$

And, notice that the coefficient of the term $\cos(\theta)$ should be set to zero, so that the undetermined coefficients are zero, this will give: 
$$
2R\phi' - 2 \langle H(\theta)\cos(\theta)\rangle = 0
$$
$$
\phi' = \frac{1}{R} \langle H(\theta)\cos(\theta)\rangle
\tag{1}
$$
And the coefficients for the $\sin(\theta)$ will be: 
$$
R' = \langle H(\theta)\sin\theta\rangle
\tag{2}
$$

**Observe**: 

For system (1), it's implying that for any weakly non-linear system, the rotation is going have a derivative that equals to zero, if $R$ fixed (Meaning the scenario of a limit cycle occurring)

And the cool part is, we have a very general way of solving the problem, if we were to approximate the behavior of the limit cycle given a weakly non-linear system then we can just do: 

1. Find the function $H(\theta)$ from the function $h(x, x')$, the perturbation part of the system (Method of multiple time scale is now skipped)
2. Using expression (2) to get the polar description of the limit cycles for the system, this will be in term of the radius ($R(T)$) for the larger time scale. 

---
### Van der Pol Oscillator 

Let's use this on the Van der Pol oscillator, which is also used as an example for the limit cycles using multiple time scale. 

For this weakly non-linear system, the perturbation term $h(x, x')$ is: 

$$
h(x, x') = (x^2 - 1) x'
$$

And hence consequently, we have: 

$$
H(\theta) = h(R\cos\theta, -R\sin\theta) = (R^2\cos^2\theta - 1)(-R\sin\theta) = R\sin\theta - R^3\cos^2\theta\sin\theta
$$

Using result (2) we have: 

$$
R' = \langle H(\theta)\sin(\theta)\rangle = R \langle \sin^2\theta\rangle - R^3 \langle \cos^2\theta\sin^2\theta\rangle
$$
And notice that, for the second term, we can have the trig identity to be: 

$$
\cos^2\theta\sin^2\theta = \frac{1}{4}\sin(2\theta)
$$

And then this will be like: 

$$
R' = R \langle \sin^2\theta\rangle - \frac{R^3}{4} \langle \sin^2(2\theta)\rangle
$$

Which simplifies to: 

$$
R' = \frac{R}{2} - \frac{R^3}{8} = \frac{R}{8}(4 - R^2)
$$

And this is the exact same results from the method of multiple time scale. 

This method is easier as long as we have a good way too identify the weakly non-linear perturbation term: $h(x, x')$, then we can just use results from (1), (2) to analyze the approximate perturbation system. And if there is a fixed point for the quantity $R$, then boom, we have an approximated limit cycle for the system! 








