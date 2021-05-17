[Legendre Equation](Legendre%20Equation.md)
Let's investigate the polynomials that we discovered by solving the Legendre Equation. 


---
### **Intro**

The Legendre Polynomials are orthogonal, this is very important. Hence, we will be interested in: 

$$
f(s) = \sum_{n = 0}^{\infty}
    a_nP_n(x)
$$

and 

$$
a_n = \frac{2n + 1}{2}\int_{-1}^{1}f(x)P_n(x) dx
$$

Which is how we figure out the coefficients. 

And, Because of orthogonality, we can say that: 

$$
P_n(x) = \int_{- 1}^{1} P_n(x) P_m(x)dx = 
\begin{cases}
    0 & m \ne n
    \\
    \frac{2}{n + 1} & m = n
\end{cases}
$$

Just like the Fourier Series. Yeah...

There are 2 things we want to prove: 

1. They are orthogonal
2. They are complete (Span the while space)

Complete Means: 

> For any bounded piece-wise continuous function, we will be able to write it in terms of the Legendre series that converges to $f(x)$. Similar to the Dirichelet Theorem. 

Chapter 12 will be focusing on the complete property, and there is also an easier proof for the orthogonality. 

Here, we will be only proving the orthogonality property with a rather, complicated proof. And we want to get a moral out of it while skipping some maths

---

### Justifying Orthogonality

**The rodrigues Formula**:

$$
P_n(x) = \frac{1}{2^nn!}\partial_x^n[(x^2 - 1)^n]
$$

Define: 

$$
I = \int_{-1}^{1} 
    f(x)P_n(x)
dx
$$

And all we want from that function is that, it should be $n$ times differentiable on the interval $-1 \le x \le 1$, then by the Rodrigues formula: 

$$
I = \frac{1}{2^nn!}\int_{-1}^{1} 
    f(x)\partial_x^n[(x^2 - 1)^n]
dx
$$

And then, we use the integration by parts on the integral. We will be doing this integraltion by parts for $n$ times. Quiet complicated.  

We can start of with some: 

$$
\left.I = \frac{1}{2^nn!}f(x) \partial_{x}^{n - 1}(x^2 - 1)^n \right|_{-1}^1
-
\frac{1}{2^nn!}\int_{-1}^{1} 
    f'(x)\partial_{x}^{n - 1}[(x^2 - 1)^n]
dx
$$

And take notice that, using the product rule and chain rule, the derivative of $(x^2 - 1)^n$ is still going to be a polynomial with $(x^2 - 1)$, and hence the first term in the above expression is going to be evaluated to zero. 

$$
I = - \frac{1}{2^nn!}\int_{-1}^{1} 
    f'(x)\partial_{x}^{n - 1}[(x^2 - 1)^n]dx
$$

Doing this again we have: 

$$
I = - \left[
        \frac{1}{2^nn!}f'(x)\partial_x^{n - 2}(x^2 - 1)^n
    \right|
    +
    \frac{1}{2^nn!}\int_{-1}^{1} 
        f''(x)
        \partial_{n - 1}
        [(x^2 - 1)^n]
    dx
$$

And, similar thing happends, we have zero on the first term. 

And then we have: 

$$
I = (-1)^n\frac{1}{2^nn!}\int_{-1}^{1} 
        f''(x)
        \partial_{n - 1}
        [(x^2 - 1)^n]
    dx
$$

Take notice of the $(-1)^n$, it's there to showcase a pattern. 

And... eventually, after applying the integration by parts for $n$ times, we will end up with: 

$$
I = 
\frac{(-1)^n}{2^nn!}\int_{-1}^{1} 
    f^{(n)}(x)(x^2 - 1)^n
dx
\tag{1}
$$

Now, let's say that $m\ne n$, assume that $m < n$, then let $f(x) = P_m(x)$, e have: 

$$
I = 
\frac{(-1)^n}{2^nn!}\int_{-1}^{1} 
    P_m^{(n)}(x)(x^2 - 1)^n
dx
$$

Ok, so we are taking $n$ derivative on a polynomial of degree $m$, with $m < n$, so that is just zero. 


Let's consider the otehr acse that $m > n$, and in this case, all we need to do is switch the $P_m(x)$ and the $P_n(x)$ and go through what we already had, and in that case, we will get the same result. 

Now, consider the case that $m = n$, then we et $f(x) = P_n(x)$, then the integral is like: 

$$
I = \frac{(-1)^n}{2^nn!} \int_{-1}^{1} 
    P_n^{(n)}(x)(x^2 - 2)^n
dx
$$

Recall the Rodrigues' formula, stated at the intro part of the file. 

We are applying $n$ derivative on the $P_n(x)$ polynomial, and take notice that, that means we are looking at this: 

$$
P^{(n)}_n (x) = \partial_x^{n} \left[
        \frac{1}{2^nn!}\partial_x^n[(x^2 - 1)^n]
    \right]
$$

$$
P^{(n)}_n(x)  = \frac{1}{2^nn!} \underbrace{\partial_{x}^{2n} [(x^2 - 1)^n]}_{(2n)!}
$$

And notice that $(x^2 - 1)^{n}$ is a polynomial with degree $2n$, in fact, the leading power is exactly $x^2n$, taking $2n$ derivative on that will result in a muliplier of $(2n)!$

And what we are going to end up is going to be like: 

$$
I = \frac{(-1)^n}{(2^nn!)^2}(2n)!\int_{-1}^{1} 
(x^2 - 1)^n
dx
$$

Don't forget there is a square on the term $(2^nn!)$, one from the $I$, the other oen is from the $P^{(n)}_n(x)$. 

$$
I = \frac{(2n)!}{(2^nn!)^2}\int_{-1}^{1} 
\underbrace{(-1)^n(x^2 - 1)^n}_{(1 - x^2)^n}
dx
$$

And here, we can use trig substitution of $x =\sin(x)$ ,and in that case, we will end up with: 

$$
I = \frac{(2n)!}{(2^nn!)^2}\int_{0}^{2\pi} 
    \cos^{2n + 1}\theta
d\theta
$$

**Skipping some non trivial amount of math, we will end up with:** 

$$
I = \frac{(2n)!}{(2^nn!)^2}\times
\frac{2^{2n + 1}(n!)^2}{(2n)!(2n + 1)} = \frac{2}{2n + 1}
$$

Boom! The Legendre Polynomials are all orthogonal to each other, and the inner product with itself is $\frac{2}{2n + 1}$. 

This is a complicated way of showing the Orthogonality of the polynomials. 


---
### **Associated Legendre Equation**

The original equation is from the Latitude parts of the Helmholtz equation in the sphere. 

And that is the original function that we generate the problem: 

$$
\frac{1}{\sin\theta} \partial_\theta[\sin\theta \partial_\theta[\Theta]] + 
\left(
    \eta - \frac{m^2}{\sin^2\theta}
\right)\Theta = 0
\tag{1.3}
$$

And with the substitution that $x = \cos\theta$ and $y = \Phi$, then: 

$$
\partial_x[(1 - x^2)\partial_x[y]]
 + 
\left[\eta - \frac{m^2}{1 - x^2}
\right]y = 0
\tag{1.4}
$$

See [[Helmholtz Equation in a Sphere]] for more info. 

Where, we want the solutions to be bounded on the $\pm 1$. 

**There is a relation between The Eigenfunctions we found for the Sphere problem, AND the general solution of the Legendre Eqn solutions.** Recall that $m\in \mathbb{Z}$. 

And, after solving the equation, the solutions we found that satisfies the boundary is: 

$$
\eta_k = k(k + 1) \quad \forall k\in \mathbb{Z}_{\ge 0}
$$

And in that case, we have: 

$$
y(x) = P_k^m(x)
$$

As the general solution of the Legendre equation. 

And, the relation is specified by this: 

$$
P^{m}_n(x) = 
\begin{cases}
    (1 - x^2)^{m/2} \partial_x^m[P_n(x)] & m > 0 \quad m \le n
    \\
    0 & m > n
\end{cases}
$$

And if $m \le 0$, we have: 

$$
P^{m}_n(x) = 
(-1)^m\frac{(n + m)!}{(n - m)!} P^{-m}_n(x)
$$

**Recall that**, we let $x = \cos\theta$. 

Boom, check this out: 

$$
P_1^{1} = (1-x^2)^{1/2}\partial_x[P_1(x)] = (1 - x^2)^{1/2} \partial_x[x] = \sqrt{\sin^2\theta} = \sin\theta
$$

And: 

$$
P_2^1(x) = \cdots = \frac{3}{2}\sin(2\theta)
$$

$$
P_3^1(x) = \cdots = \frac{3}{8}(\sin\theta + 5\sin(5\theta))
$$



