[[Fourier Transform (PDE Flavor Examples)]]
Let's take a look at some of the examples of using the Fourier Transform.

---
### **Intro**

Bounded function can still give us diverging integral even if we have the function bounded. 

We need $f(x)$ to be absolutely Integrable. 

**Relaxing the Conditions**? 

Yes, it's the squared infinite integrable function. 

We are picking up the Fourier Transfrom and the inverse Fourier Transfrom from the previous discussion: 

Here is the Fourier Transform Extracted from the above: 

$$
F(\omega) = \mathcal{F}[f(x)] = 
\int_{-\infty}^{\infty} 
    f(x)\exp(i\omega x)
dx
$$

Then, the inverse Fourier Transform is defined to be: 

$$
f(x) = \mathcal{F}^{-1}[F(\omega)] = \frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    F(\omega) \exp(-i\omega x)
d\omega
$$


---
### **When it Fails**

There are flaws in Fourier Transfrom. 

Consider: $f(x) = \exp(x), f(x) = \exp(-x)$, the function are not abs integrable, on the interval of reals. 

Showing that the integral for fourier transform DNE is trivial. 

Ok, what about: 

$$
f(x) = \exp(-|x|)\quad \forall x\in (-\infty, \infty)
$$

Then we know that this is like, absolutely integrable, because it's decaying on both side rather quickly

Consider: 

$$
\mathcal{F}[\exp(-|x|)](w) = 
\int_{-\infty}^{\infty} 
\exp(-|x| + iwx)
dx
$$

Split it and we have: 

$$
\int_{-\infty}^{0}
\exp(x + iwx)
dx
+
\int_{0}^{\infty}
\exp(-x + iwx)
dx
$$

Which is, skipping some maths: 

$$
\frac{1}{1 + iw} + \frac{1}{1 - iw} = \frac{2}{w^2 + 1}
$$

We can retrieve $\exp(-|x|)$ from $F(w) = \frac{2}{w^2 + 1}$, however, this is not easy, we are going to need some Contour Integral and Jourdan's Lemma. 

---
### **The Guassian Example**

$$
f(x) = \exp(-x^2)
$$

This is integrable on all reals, and this is the famous Gaussian Functions. 

It's also the famous Gaussian Integral: 

$$
I = 
\int_{-\infty}^{\infty} 
\exp(-x^2)
dx
$$

And then that can be viewed as a double integral, which can then be converted to a integral over the polar coordinates, giving us: 

$$
I^2 = 
\int_{-\infty}^{\infty}
    \int_{-\infty}^{\infty} 
        \exp(-(x^2 + y^2))
    dy
dx = \pi
$$

so, this function is integrable, what about the Fourier Transform for this function? 

Take the fourier transform on this function just need the extra tricks of completing the square and then we can use the results from the previous parts:

$$
F(w) = \mathcal{F}[\exp(-x^2)] = \int_{-\infty}^{\infty} 
    \exp(-x^2 + iwx)
dx
$$

Take note: 
$$
-x^2 + iwx = -\left(
    x - \frac{iw}{2}
\right)^2 - \frac{w^2}{4}
$$

Transforming the integral into: 

$$
\exp\left(
    \frac{-w^2}{4}
\right)
\int_{-\infty}^{\infty} 
    \exp\left(
        \left(
            x - \frac{iw}{2}
        \right)^2
    \right)
dx
$$

Using a susbtitution, where $u = x - \frac{iw}{2}$, we will be looking at this expression: 

$$
\exp\left(
    \frac{-w^2}{4}
\right)
\int_{-\infty - \frac{iw}{2}}^{\infty - \frac{iw}{2}} 
    \exp\left(
        -u^2
    \right)
du = \exp\left(
    \frac{-w^2}{4}
\right)\sqrt{\pi}
\tag{1}
$$

And, how exactly does  this new integral, where we made substitution that involving imaginary number, which literally, **shifted the contour of integral on the imaginary direction**, ended up with the same quantity for the integral?

These 2 integrals, are integrations over paths on the complex plane. 

How do we close that path? And use the **Cauchy's Integral Theorem?**

![[fourier-contour-integral-gaussian.png]]

This, is the path we are going to take. The top path that goes from the left to the right is the integral path for the unshifted Gaussian Integral. 

And the path that is below is the shifted integral. shifted by $\frac{iw}{2}$. And we are going to conssider the case as $R\rightarrow\infty$.

This is a simple closed curve with an analytica function, by Cauchy's Integral theorem, the contour integral over the path is zero. 

Denote the bottom, right, top, left edges of the contour to be $L_1, L_2, L_3, L_4$, then it can be said that:  

$$
\lim_{R\rightarrow \infty}\int_{L_2}^{} \exp(-u^2)du = 0 
$$

wher $u = x - \frac{iw}{2}$ will go to zero becausse, the real part controls the magnitude of the integral, and as it gets larger and larger, the exponent is negative, making it smaller and smaller, and hence, summing up along the imaginary part of the path is getting smaller as well. The integral is zero as a whole for left and right edge of the path on the Rectangle, which is just $L_2, L_4$. 

Then it can be said that taking the limit we have:

$$
0 = \int_{L_1}\exp(-u^2)du
+ \int_{L_3}\exp(-u^2)du
$$

However, take notice that the direction of $L_1$ and $L_3$ are oppostive, that means they are opposite of each other and equals in magnitude. 

Then it can be said that: 

$$
\int_{L_1}\exp(-u^2)du = -\int_{L_3}\exp(-u^2)du = -\sqrt{\pi}
$$

And take note that: 

$$
\int_{L_1}^{}\exp(-u^2) du = \int_{\infty - \frac{iw}{2}}^{-\infty - \frac{iw}{2}} 
    \exp(-u^2)
du
=
-\sqrt{\pi}
$$

Now, the shifted integral, expression (1), is the negative of the above quantity, hence, $\sqrt{\pi}$ is the ultimate answer for the integral in expression (1). 

---
### **The Inverse Gaussian Fourier Transform**


The inverse Fourier for that given function will be denoted as: 

$$
A = 
\mathcal{F}^{-1}[F(\omega)](x) = 
\frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    \sqrt{\pi}
    \exp\left(
        \frac{-w^2}{4}
    \right)
    \exp(-iwx)
dw
\tag{2}
$$

Notice that, we are back to the same looking function, it's the same format but with different parameters for it. Let's take out the constent and merge the exponent, this will be giving us:

$$
A = 
\frac{\sqrt{\pi}}{2\pi}
\int_{-\infty}^{\infty} 
    \exp\left(
        \frac{-w^2}{4}
        -
        iwx
    \right)
dw
$$

Now, consider the susbtitution $t = \frac{w}{2}$, then this integral transformed into: 


