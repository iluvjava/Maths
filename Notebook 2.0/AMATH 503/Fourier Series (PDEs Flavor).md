Here we are going to use Fourier Series, with application in solving PDEs. 
Here are some other Fourier related stuff: 

[[Fourier Transform]], [[Fourier Transform Fourier Series]]

And we are using the Fourier Series for [[Separation of Variables]]

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

### **An Example**

Let's assume that $F(x)\equiv 100$, then what is the fourier series for that??? 

It's just an integral away and let' do this: 

$$
a_n = \frac{2}{L} 
\int_{0}^{L} B\sin\left(
    \frac{n\pi x}{L}
\right) dx 
$$

I replaced $100$ with $B$ to keep things generics. 


[^1]: blahhhh
[^2]: We assume convergence to get the $a_n$, and then we show that with the $a_n$, this thing does uniformly converges. 
[^3]: Trig identity: $\sin a\sin b = \frac{1}{2}(\cos(a - b) - \cos(a + b))$ is involved for showing that. Detailed in the lecture notes. 