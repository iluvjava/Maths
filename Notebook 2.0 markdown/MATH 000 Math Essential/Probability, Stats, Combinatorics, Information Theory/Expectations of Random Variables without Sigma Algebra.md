[PDFs, PMFs](PDFs,%20PMFs.md), [Conditional Probability, Expectations](Conditional%20Probability,%20Expectations.md)

---
### **Intro**

Suppose that $X$ is a continuous random variable with a PDF $f_X$, CDF(PMF) $F_X$ on all reals, then the expected value of the random variable $X$ would be 

1. $$\mathbb{E}\left[X\right] = \int_{\mathbb R} x f(x)dx$$ 
    when the variable is continuous and with a PDF. 
2. $$\mathbb{E}\left[X\right] = \sum_{x\in \Omega}^{} x p_X(x)$$ 
    when $X$ is discrete. 
3. $$\mathbb{E}\left[X\right] = \sum_{k\in \mathbb N}^{}\mathbb P(X \ge k)$$ 
    when $X$ is a discrete random variable. 
4. $$\mathbb{E}\left[\mathbf 1_A\right] = \mathbb P(A)$$
    where $A$ is an indicator of an event, and an event is some type of conditions such that the random variable $X$ satisfies. This property of the most fundamental amoung all other rules listed here. 

The above list is not a definition, but rather some way we can compute the expected value of a function. And take notice that, the expected value for a random variable is just the average value a random variable would take. Additionally, we introduce a list of straight forward properties that the expected value operator must satisfies: 

1. Linearity. 
2. Constant doesn't change the value of the expectations. 


---
### **Discrete Random Variable via Probability Measures**

A random variable $X$ that is discrete on $\mathbb Z$ can be viewed as $X = \sum_{j\in \mathbb Z}^{}X \mathbf 1\{X \ge j\}$, in which we put expected value on both sides and obtained: 

$$
\begin{aligned}
    \mathbb{E}\left[X\right] &= 
    \mathbb{E}\left[
        \sum_{j \in \mathbb Z}^{}
        \mathbf 1\{X\ge j\}
    \right]
    \\
    &= 
    \sum_{j \in \mathbb Z}^{}\mathbb{E}\left[
        \mathbf 1\{X\ge j\}
    \right]
    \\
    &= 
    \sum_{j \in \mathbb Z}^{}\mathbb P(X \ge j).
\end{aligned}
$$

Which concludes the proof. 


---
### **Law of the Unconscious Statistician (LOTUS)**

This name is canonical. See [wiki](https://en.wikipedia.org/wiki/Law_of_the_unconscious_statistician) so that you know I am not the bullshiting here. additionally, we quote the most important thing first: 

> This proposition is known as the law of the unconscious statistician because of a purported tendency to use the identity without realizing that it must be treated as the result of a rigorously proved theorem, not merely a definition.[4]

The law is used to find the expected value for a random variable $g(X)$ where $X$ is a random variable with know probability density functions. It's simply: 

$$
\begin{aligned}
    \mathbb{E}\left[g(X)\right] &= 
    \int_{\mathbb R}^{} 
        g(x)f_X(x)
    dx, 
\end{aligned}
$$

and we skip the proof here. Additionally, if the transformation function is of joint variables of $X, Y$ we have: 

$$
\begin{aligned}
    \mathbb{E}\left[g(X, Y)\right] = 
    \iint_{\mathbb R^2}^{} 
        g(x, y) f_{X, Y}(x, y)
    dxdy. 
\end{aligned}
$$

**Remarks**

This law is very non-trivial and its derivations in the most general case involving only the use of sigma algebra and probability measure is unclear to me. I haven't found references that uses an Lebesgue integral approach to derive the above law. For statisticians and daily practitioners of statistics, the above state should suffice most applications. 

---
### **Independent Expectations**

Suppose that $X, Y$ are to independent variables, then the joint probability density function is $f_X(x)f_Y(y)$ and the expected value of $XY$ can is: 

$$
\begin{aligned}
    \mathbb{E}\left[XY\right] &= 
    \int_{\mathbb (x, y)\in \mathbb R^2}^{} 
        xyf_X(x)f_Y(x)
    dxdy
    \\
    &=
    \int_{\mathbb R}^{} xf_X(x)dx
    \int_{\mathbb R}^{} yf_Y(y)dy
    \\
    &= 
    \mathbb{E}\left[X\right]
    \mathbb{E}\left[Y\right]
\end{aligned}
$$

which completes the proof. 

---
### **Conditional Expectations**

See [Conditional Probability, Expectations](Conditional%20Probability,%20Expectations.md) for more details. It requires some understanding of conditional probability for things to make sense. 




