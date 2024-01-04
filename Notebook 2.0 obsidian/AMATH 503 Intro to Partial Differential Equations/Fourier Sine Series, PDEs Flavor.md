 Here we are going to use Fourier Series, with application in solving PDEs. 
Here are some other Fourier related stuff: 

[[Introduction to Fourier Transform Fourier Series]], [[Introduction to Fourier Transform Fourier Series]]

And we are using the Fourier Series for [[Separation of Variables for Heat and Waves in 1D]]

---
### **Intro**

Last time, we were  at solving Heat Equation with separation of variables, the final form of the solutions we obtained is like: 

$$
F(x) = u(x,0) =
\sum_{i = 1}^{\infty}
 T_n(0)\exp\left(
    \frac{-n^2t}{\tilde{t}}
\right)
\sin \left(
    \frac{n\pi x}{L}
\right)
$$

Where, the $\tilde{t}$ is a scale factor to hide some constants: 

$$
\tilde{t} = \left(
    \frac{L}{c\pi}
\right)^2 \implies T_n(\tilde{t})
$$

ANow, the problem remains, and we will need an expression for the initial values for all the time dependent eigenfunction $T_0(0)$, once this is solved, we will have the solution to the problem. 


---
### **Fourier Sine Series** 

Given a "reasonable"[^1] function $f(x)$, we can express the function as the sum of sines. 

$$
F(x) = \sum_{i = 1}^{\infty}a_n \sin \left(
    \frac{n\pi x}{L}
\right)
$$

Under an interval: $0 \le x \le Ls$

**Questions**: 
1. Can we express it like that? 
2. Does it converge does it still equal to that? 
3. What if the function it converging is not continuous, what do we get? 

The $\sin$ function is orthogonal. This is shown by that, the series converges uniformly, then we multiply it by 

$$
\sin\left(
    \frac{m\pi x}{L}
\right)
$$

Then we will have: 

$$
\int_{0}^{L}F(x)\sin\left(
    \frac{m\pi x}{L}
\right) 
dx
=
\sum_{i = 1}^{\infty}a_n 
\underbrace{
    \int_{0}^{L}
    \sin \left(
        \frac{n\pi x}{L}
    \right) 
    dx
}_{I_{mn}}
$$

Notice that, by unif convergence, we can move into the integral sign into the infinite sum. [^2]

$$
\int_{0}^{L}F(x)\sin\left(
    \frac{m\pi x}{L}
\right) 
dx
=
\sum_{i = 1}^{\infty}\left(a_n I_{mn}\right)
$$

And, we will skip some boring integrations here,[^3] and then we will get the fact that: 

$$
I_{mn} = \begin{cases}
    \frac{L}{2} & m = n 
    \\
    0 & m\ne n
\end{cases}
$$

So then: 

$$
\int_{0}^{L}F(x)\sin\left(
    \frac{m\pi x}{L}
\right) 
dx
=
a_m \frac{L}{2}
$$

And we can just solve for $a_m$ to get the coefficient, and thn this will give us the expression that: 

$$
a_n = \frac{2}{L} 
\int_{0}^{L} F(x)\sin\left(
    \frac{n\pi x}{L}
\right) dx 
$$

Then, the series will equal to $F(x)$ in the interval $[0, L]$. 

---
### **An Example**

Let's assume that $F(x)\equiv 100$, then what is the fourier series for that??? 

It's just an integral away and let' do this: 

$$
a_n = \frac{2B}{L} 
\int_{0}^{L} B\sin\left(
    \frac{n\pi x}{L}
\right) dx 
=
\frac{2B}{L}
\left.
\frac{-\cos
    \left(
        \frac{n \pi x}{L}
    \right)
}{\frac{n\pi}{L}}\right\vert_0^L
=
\frac{2B}{L}
\left.
\frac{\cos
    \left(
        \frac{n \pi x}{L}
    \right)
}{\frac{n\pi}{L}}\right\vert^0_L
$$

I replaced $100$ with $B$ to keep things generics. 

So then, this is just: 

$$
\frac{2B}{L}
\left[
    \frac{L}{n\pi} - \cos(n\pi) \frac{L}{n\pi}
    \right]
=
\frac{2B}{n\pi}
\left[
    1- \cos(n\pi)
    \right]
$$

And, there are 2 cases, if $n is even$, then $1 - \cos(n\pi)$ is $0$, when it's odd, it's $2$, so then we have the expression that: 

$$
a_n = \frac{4B}{n\pi}\sin\left(
    \frac{n\pi x}{L}
\right) \quad \forall  \text{ odd }n
$$

And the series is going to look like: 

$$
\sum_{k = \text{odd integers}}^{\infty}
\frac{4B}{\pi}
\frac{\sin\left(
    \frac{n\pi x}{L}
\right)}{k}
$$

### **Extra Stuff**

Notice that, the $\sin$ function are always odd, and we are approximating it on the interval $[0,L]$, and if we look at the series on the $[-L, L]$, we get an odd function, and then it will periodically repeat, just like how $\sin$ is supposed to behave. 


The series is only equal to $F(x)$ on the $[0, L]$ interval. 

**Over shoot**

One the boundary, $x = 0, x = L$, there is the **Gibbs Phenomena**[^4], it's over shooting on the edge just by a tiny bit whenever the function is not continuous when we augment it periodically, as $n\rightarrow \infty$, the width of the over shoot gets infinitely small. Note: It's a fixed amount of overshoot, it's not shooting to infinity or anything like that. 

**[[Dirichlet Theorem]]**

At the point of discontinuity, the Fourier Series is going to take the average between the points of discontinuity. Yes, it is not continuous regardless of the series being the sum of continuous functions. This occurs together with the Gibbs Phenomena. 

**Smooth F(x)**

If the function is smooth, it's going to have spectral convergence, if it's oscillating a lot, then we will need a lot of terms.

The best way is to pick the $x$ value, and then determine how many terms are needed for the accuracy, and then we can compute that, for each $x$. 


---
### **The Fun Problem**

> Is it possible to represent the $\cos$ function with $\sin$ Fourier Series? Oh yeah we can, on a small interval. 

Here, we are setting $L = \pi$, because we are dealing with $\cos$, and then, we will say that: 

$$
a_n = \frac{2}{\pi}
\int_{0}^{\pi}
    \cos(x)
    \sin(nx)
dx
$$

But, when we have the graph, something interesting is happening, using the [[Dirichlet Theorem]], and the fact that the function is odd, we have the positive part of $\cos$ on the interval $[0, \pi]$ reflected by the origin on the interval $[-\pi, 0]$. 

We cannot represent $\cos$ by $\sin$ on the $2\pi$ period. 




[^1]: (...)
[^2]: We assume convergence to get the $a_n$, and then we show that with the $a_n$, this thing does uniformly converges. 
[^3]: Trig identity: $\sin a\sin b = \frac{1}{2}(\cos(a - b) - \cos(a + b))$ is involved for showing that. Detailed in the lecture notes. 
[^4]: Gibbs Phenomena: [link](https://www.wikiwand.com/en/Gibbs_phenomenon)