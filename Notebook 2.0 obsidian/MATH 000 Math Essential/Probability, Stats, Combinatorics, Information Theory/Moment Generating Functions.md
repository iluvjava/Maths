[[Expectations of Random Variables without Measure Theory]], [[PDFs, PMFs]]

---
### **Intro**

A moment generating function is like the Laplace transform for the probability mass functions of a random variables. See [wiki](https://en.wikipedia.org/wiki/Moment-generating_function) for a comprehensive overview of this big topic. In this file, we define it, point out some of its properties, and then show some simple examples/applications of the concept. The most notable applications for the moment generating function involves: 
1. Sums of i.i.d random variables. 
2. Central limit theorem. 

Beyond this, there is also the characteristic function of a random variable, which is is pretty much a Fourier transform on the probability density function of the random variable. 

**Definition | The moment Generating Function**

> Let $M_X(t)$ denote the moment generating function for the random variable $X$ and
> $$
> M_X(t) = \mathbb{E}\left[\exp(t X)\right], 
> $$

Take note that, assuming that we have a PDF function $f_X(x)$ for the random variable then the definition of the moment generating function is given as: 

$$
\begin{aligned}
    \int_{\mathbb R}^{} \exp(tx)f_X(x) dx, 
\end{aligned}
$$

which is very similar to the Laplace transform, but the intervals and the sign of $t$ is different. It also looks similar to the Fourier transform except for the imaginary unit and a constant. 

**Method of the Moment**

The $k$ th moment of a random variable $x$ is $\mathbb{E}\left[X^k\right]$. When the moment generating function for the random variable, $M_X(t)$ is given, we can have the following: 

$$
\begin{aligned}
    \left.\frac{d^n}{dt^n}
    M_X(t) \right|_{t = 0}
    &= 
    \frac{d^n}{dt^n}
    \left.
    \mathbb{E}\left[\exp(tX)\right]
    \right|_{t = 0}
    \\
    &= 
    \frac{d^n}{dt^n}
    \left. 
        \int_{\mathbb R}^{} 
        \exp(tx)f_X(x)
        dx
    \right|_{t = 0}
    \\
    &= 
    \left. 
        \int_{\mathbb R}^{} 
            x^k\exp(tx)
        dx
    \right|_{t = 0}
    \\
    &= 
    \mathbb{E}\left[X^k\right], 
\end{aligned}
$$

and the usefulness of this property depends on the context. 

**Uniqueness of the MGF**

> Suppose that 2 random variable produces the same MFG, then their PDF has to be the same. 

Take this theorem for granted. 

---
### **Example | The MGF of Bernoulli Distributions**

Let $X$ be Bernoulli with parameter $p$, then the moment generating function of it can be computed the unconscious statistician law: 

$$
\begin{aligned}
    \mathbb{E}\left[\exp(Xt)\right] &= 
    \exp(0t)(1 - p) + \exp(t)p
    \\
    &= 
    \exp(t)p  + 1 - p, 
\end{aligned}
$$

which completes the demonstrations. 

---
### **Example | The MGF of the Binomial Distributions**

Let $X$ be a binomial distribution with parameters $p,n$, then the MFG can be computed: 

$$
\begin{aligned}
    \mathbb{E}\left[\exp(t Y)\right] &= 
    \sum_{k = 0}^{n}\exp(t k)\mathbb P(Y = k)
    \\
    &= \sum_{k = 0}^{n}
        \exp(tk) \frac{n!}{k!(n - k)!} p^k(1 - p)^{n - k}
    \\
    &= \sum_{k = 0}^{n}
        \frac{n!}{k!(n - k)!}(p\exp(t))^k(1 - p)^{n - k}
    \\
    &= (p\exp(t) + 1 - p)^n. 
\end{aligned}
$$

which is the MGF of the same Bernoulli MGF multiplied together. 

---
### **Adding i.i.d Variables**

One of the canonical use of the MGF is for summing up $X_i$, a sequence of random variables that are i.i.d. Adding the variable directly involves the use of convolution to figure out the distribution functions, however, the moment generating function of the sum of i.i.d variables are relatively easier to compute. 

#### **Claim | Sum of i.i.d variables**
> Suppose that we want to compute the MGF of $Y = \sum_{i = 1}^{N} X_i$ given that $N \in N$ and it's probability measure and $X_i$ are all i.i.d variable with the same distributions (The same distribution as $X$ I would say), then the moment generating function of the variable can be expressed as: 
> $$ M_Y(t) = \mathbb{E}\left[M_{X_i}(t)^N\right].$$

**Proof**

$$
\begin{aligned}
    M_Y(t) &= 
    \sum_{n\in \mathbb N}^{}
        \mathbb{E}\left[
            \left.
            \prod_{i = 1}^{N} \exp(X_it)
            \right|
            N = n
        \right]\mathbb P (N = n) &
    \\
    &= 
    \sum_{n \in \mathbb N}^{}
        \mathbb{E}\left[\exp(X_i t)\right]^n \mathbb P(N = n)
    \\
    &=
    \sum_{n\in \mathbb N}^{} M_{X}(t)^n 
    \mathbb P(N = n)
    \\
    M_Y(t)
    &= 
    \mathbb{E}_{\sim N}\left[M_X(t)^N\right], 
\end{aligned}
$$

where on the first line we use the law of total expectation on the second line we use the property that $X$ is i.i.d, and then we proceed to use the LOTUS theorem. This is an quick and easy way to produce the momoment generating functions. Once the momen generating function is identified, we can check the table to get the distribution, or we can use the method of moment to find the expected value and the variance of the sum distribution using the moment generating function. In fact, this is related to the central limit theorem. 


---
### **Example | The MGF for sum of Exponential (Gamma Distributions)**

A gamma distribution is the sum of i.i.d exponential distribution with the same parameter $\lambda$. Let $X$ be exponential with rate $\lambda$ computing the MFG for the exponential distribution yields: 

$$
\begin{aligned}
    \mathbb{E}\left[\exp(t X)\right] &= 
    \int_{0}^{\infty} 
    \exp(tx)\lambda \exp(-\lambda x)
    dx
    \\
    &= 
    \int_{0}^{\infty} 
        \lambda\exp((t - \lambda)x)
    dx 
    \\
    &= 
    \left.\frac{\lambda \exp((t-\lambda)x)}{t - \lambda}
    \right|_{0}^\infty
    \\
    &= 
    \left.
    \begin{cases}
        0 & t - \lambda < 0
        \\
        \frac{\lambda}{t - \lambda}  & t = \lambda
        \\
        \infty & t > \lambda
    \end{cases}
    \right\rbrace
    - \frac{\lambda}{t - \lambda}
    \\
    M_X(t)
    &= 
    \left.
    \begin{cases}
        \frac{\lambda}{\lambda - t} & t < \lambda
        \\
        0  & t = \lambda
        \\
        \infty & t > \lambda
    \end{cases}
    \right\rbrace
\end{aligned}
$$

and the function has a piecewise definition to it. Next, we consider the sum of all these random variables. Let random variable $Y:= X_1 + \cdots + X_n$ then for all $0\le t < \lambda$ the MGF for $Y$ is: 

$$
\begin{aligned}
    M_Y(t) = \mathbb{E}\left[\exp
    \sum_{i = 1}^{n}
        tX_i
    \right]
    &= 
    \frac{\lambda^n}{(\lambda - t)^n}
\end{aligned}
$$
using our previous theorem. It's not hard to find out the expected value and the variance of it using the method of moment introduced at the very start of this file. 

**Remark**

Reader should take this for granted. Up to the time this entry had been reviewed, no easy demonstration for showing that this is indeed the MGF of the Gamma distribution had been found by me. An integral of the form $\int t^k\exp(\alpha t)dt$ is involved and it's not easy to evaluate this one. 

