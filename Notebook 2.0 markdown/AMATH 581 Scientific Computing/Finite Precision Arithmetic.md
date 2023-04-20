### **Intro**

Computer represents numbers using Floating point protocols. The standards is made by people and it's called IEEE 754. In this file, we will use type FLOAT64 as an example to illustrate how a floating point numbers are represented by a computer. Computer represents a FLOAT64 using 1 bit for sign, 10 bits for the exponent, and then 53 bit for the actual number, called the *mantissa*. 

![Pasted image 20230117182205](../Assets/Pasted%20image%2020230117182205.png)

For comparison, it's essentially the same as scientific notations but instead of binary, we have that in decimal. More precisely, an binary number in the computer is represented like a scientific notation: 

$$
(-1)^{s}\left(\sum_{i = 0}^{51} d_{i}10_b^{-i}\right)\times 10_b^{e}, 
$$

where the ditis $d_i\in{0, 1}$ because we are in binary. And we have $e$ denoting the exponential, and it's $-1027\le e \le 1027$, represented as signed integer. Let me make a joke: "Observe that $10$ is actually 2 in binary, and that is not a mistake, if, we are writing in binary." 

The intrinsic representation of numbers are discrete, further more, the larger the numbers are, the bigger the gap between. More precisely, the gap is given by $2^{e - 52}$. Further more, due to the limit for exponent, the number can over/under flow depending on the size of the exponent. 

**What can create more error?** 

1. **Adding**: The error is created when doing operations with numbers whose relative sizes are in different magnitudes. Allow me to illustrate it using addition in binary with 3 significant 4 for simplicity. Suppose that we have the number $a = 1.00\times 2^3$ and $b = 1.11\times 2^{-1}$, adding then together involves shifting $b$ by 4 digits, resulting in $0.00111\times2^{3}$ so that they have the same power. Adding them gives: $1.00111\times 2^3$, then, we perform chopping to fit into the memory, giving us: $1.00\times 2^3$. The absolute error is proportional to $\max(a, b)$, in this case, it's $2^{3}\times 2^{-2} = 2$.
2. **Representation Error**: Given a number in decimal form, in any programming language, it will get represented as a binary and losing significant digits because some decimal numbers are recurrent in binary. This is due to gaps between the discrete representations of floating point. 


---
### **Fixed Relative Error for Additions**

The relative error between addition of 2 floating point number is a fixed quantity, and using rounding/chopping doesn't improve the accuracy significantly. We wish to model the behaviors. To do it precisely is to go through pain, but we can approximate it in a smart way and then justify it. The following claim summarizes the behaviors of errors when it comes to adding 2 floating points number together: 

> Let $\epsilon$ denotes the intrinsic precision of the significant (In FLOAT64, it's $2^{-51}$, and in nth decimal digits rounding or chopping it's $10^{-n}$), then the error of the floating point representations of a number $x$, denoted using $fl(x)$ is $fl(x) = (1 \pm \epsilon)x$, proportional to the size of the number. 

**Proof**

Firstly we assume that $x$ be a non-zero number, then we can represent the number using scientific notations in the following way: 

$$
\begin{aligned}
    x &= (-1)^{s}\left(
        \sum_{k = 0}^{\infty}x_k2^{-k}
    \right)2^{\lfloor \log_2(x)\rfloor}
    \\
    \text{denote: } 
    e_x &= \lfloor\log_2x\rfloor, 
    \\
    \text{assume: }
    x_0 &\neq 0
\end{aligned}
$$

where, we represent the number using an infinite series that goes from the highest digits all the way to the end, and $x_0$ is the highest non-zero digits of the number, and we shift it by the multiplying by $\lfloor \log_2x\rfloor$, which denotes the position of the highest digit. The multiplier $(-1)^{-s}$ denotes the sign of the number. we approximate the relative error of $\text{fl}(x)$ by considering: 

$$
\begin{aligned}
    \left|
        \frac{\text{fl}(x) - x}{x}
    \right| &= 
    \left|
        \frac{\left(
            \sum_{k = 0}^{n}x_k2^{-k} - \sum_{k = 0}^{\infty}x_k 2^{-k}
        \right)2^{e_x}}{
            \left(
                \sum_{k = 0}^{\infty}x_k2^{-k}
            \right)2^{e_x}
        }
    \right|
    \\
    &= 
    \left|
        \frac{
            \sum_{k = 0}^{n}x_k2^{-k} - \sum_{k = 0}^{\infty}x_k 2^{-k}
        }{
            \sum_{k = 0}^{\infty}x_k2^{-k}
        }
    \right|
    \\
    &= 
    \left|
        \frac{
            \sum_{k = n + 1}^{\infty} x_k 2^{-k}
        }{
            \sum_{k = 0}^{\infty}x_k2^{-k}
        }
    \right|
    \\
    &= 
    \left|
        \frac{
            \sum_{k = 0}^{\infty} x_{k + n + 1} 2^{-k - n - 1}
        }{
            \sum_{k = 0}^{\infty}x_k2^{-k}
        }
    \right|
    \\
    &\le 
    \left|
        \frac{
            2^{-n}
        }{
            \sum_{k = 0}^{\infty}x_k2^{-k}
        }
    \right| \quad (*)
    \\
    &\le 
        \left|
        \frac{
            2^{-n}
        }{
            2^{0}
        }
    \right| = \epsilon \quad (\star)
\end{aligned}
$$

At $(*)$ we used the fact that the series expansion $\sum_{k = 0}^{\infty} x_{k + n + 1} 2^{-k - n - 1}$ is less than $\sum_{k = 0}^\infty 2^{-k-n-1}= 2^{-n}$, and for $(\star)$ we used the fact that the denominator $\sum_{k = 0}^{\infty}x_k2^{-k}$ is clearly $\ge 2^{0}$ by the assumption that $x_0 \neq 0$, which is a consequence with the assumption that $x \neq 0$. In the case when $x = 0$, the floating point representation error can be summarized as $\text{fl}(0) \in [-\epsilon, \epsilon]$. 

---
### **Analysis for Multiplications and Division via Interval Arithmetic**






---
### **Good References**

- [What every computer scientists should know about floating point arithemtic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html). 
- [Stack overfloat: Rounding or chopping for Java IEEE](https://stackoverflow.com/questions/38245511/which-rounding-method-is-used-in-java-when-operating-on-floating-point-numbers).
- [Stack Overflow: Is floating point broken](https://stackoverflow.com/questions/588004/is-floating-point-math-broken). 
- [IEEE 754 wiki](https://en.wikipedia.org/wiki/IEEE_754)