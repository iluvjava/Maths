let's talk about some Fancier Power Series

prereq: [[Power Series]], [[Cauchy Integral]], [[Complex Integration (CG)]]

---


### Laurent Series

If there is a singularity inside the region $|z - z_0|$, where $z_0$ is the point we are centering at for the Taylor Series, then we cannot do it because the Cauchy Integral Theorem failed when there are Singularities inside of the contour. 

And that is the reason that we are introducing the Laurent Series, where **even if there is some singularities in inside of the disk $|z - z_0|$, we can still find a way to represent the function as a infinite power series. **

---
#### Laurent Series Centered Zero

By Cauchy integral and placing key hole **around the the origin**, and wrap around a larger contour, breaking the point of the function into 2 path integral, with C1 wrapping around C2 and rotating in different direction. 

$$
f(z) = \frac{1}{2\pi i} \oint_{C1}\frac{f(t)}{t - z}dt 
-
\frac{1}{2\pi i} \oint_{C2}\frac{f(t)}{t - z} dt
$$

Let's denote the first integral as $I_1$ and the second integral as $I_2$, then for $I_1$, the contour $t$ must be enclosing the point $z$,** which means that**: $|z| < |t|$. Hence we can write the following: 

$$
I_1 = \frac{1}{2\pi i}
\oint_{C1}\frac{f(t)}{t}\frac{1}{1 - z/t} dt
$$
Because $|z| < |t|$, there inner fraction can be expressed as a uniformly convergent power series, which means that: 

$$
I_1 = \frac{1}{2\pi i}
\oint_{C1}\frac{f(t)}{t}
\sum_{n = 0}^\infty\left(\frac{z}{t}\right)^n
dt
$$

$$
I_1 = \frac{1}{2\pi i}
\sum_{n = 0}^\infty
\oint_{C1}\frac{f(t)}{t}
\left(\frac{z}{t}\right)^n
dt
$$
> $$
> I_1 = \frac{1}{2\pi i}
> \sum_{n = 0}^\infty
> \oint_{C1}\frac{f(t)}{t^{n + 1} - 0}
> dt\; z^n
> $$

**NOTE**: We cannot reduce the path integral inside of the infinite sum anymore because the **function $f(t)$ might have singularity inside of the contour hence** It has to remain as a path integral. 

Take notes that that first part of the Laurent Series is the same as the Taylor series, but at let's see the part where it's different: 

**Assuming that** $|t|< |z|$, which means that, the contour we draw around this thing is smaller than the point we are looking at, or equivalently the point is definitely outside the contour. 

$$
I_2 = \frac{-1}{2\pi i}\oint_{C2}\frac{f(t)}{t - z}dt
$$
Absorb the negative sign 
$$
I_2 = \frac{1}{2\pi i}\oint_{C2}\frac{f(t)}{z - t}dt
$$
Extracting out the term for Geometric Series
$$
I_2 = \frac{1}{2\pi i}\oint_{C2}\frac{f(t)}{z}
\frac{1}{1 - t/z}
dt
$$

$$
I_2 = \frac{1}{2\pi i}\oint_{C2}\frac{f(t)}{z}
\sum_{n = 0}^\infty \frac{t^n}{z^n}
dt
$$
Change the index a bit and absorb the term $z$
$$
I_2 = \frac{1}{2\pi i}\oint_{C2}\frac{f(t)}{1}
\sum_{n = 1}^\infty \frac{t^{n-1}}{z^n}
dt
$$

$$
I_2 = \frac{1}{2\pi i}\sum_{n = 1}^\infty
\oint_{C2}\frac{f(t)}{1}
\frac{t^{n-1}}{z^n}
dt
$$

Another trick where the index for the infinity sum is going to turn into negative numbers, then we are having the good stuff of turning the express into a familiar form. 

> $$
> I_2 = \frac{1}{2\pi i}
> \sum_{n = -\infty}^{-1}
> \oint_{C2}\frac{f(t)}{t^{n + 1}}
> dt
> z^n
> $$

**Note**: Depending on the singularities of the function, one of the series will be convergent. 

If this is expanded around the singularity (The origin in this case), then one of the series is not going to be defined, more specifically, the negative part (The Principal Part) is not gonna converge. 

If this is expanding around any points, then it converges just fine, and the coefficient is evaluated via the contour integral. 

---

### Laurent Series, The General Case

The proof of the full Laurent Series centered at any point $z_0$ is pulled off by first considering this representation of the inner quotient in the line integral: 

$$
\frac{f(t)}{t - z} = \frac{f(t)}{t - z_0}\frac{1}{1 - \frac{z - z_0}{t - z_0}}
$$

And then use the proof for $z_0 = 0$, and that is all. 

Let's switch gears a bit and make the series into 2 components for the function, and here is the full representation. 

> $$
f(z) = 
> \sum_{n = 1}^\infty 
\frac{b_n}{(z - z_0)^n} + \sum_{n = 0}^\infty a_n (z - z_0)^n
> $$

And the coefficient for the 2 components are: 
 
$$
a_n = \frac{1}{2\pi i}
\oint_{C1} \frac{f(t)}{(t - z_0)^{n - 1}}dt
$$

and 
$$
b_n = \frac{1}{2\pi i}
\oint_{C2} f(t)(z - z_0)^n dt
$$

Notice that, here we are not letter $n$ be a negative number, and if we can do that, then we have a more compact representation for the series

> $$
> f(z) = \sum_{n = -\infty}^{\infty}
> a_n (z - z_0)^n
> $$

And the coefficient: 

$$
a_n = \oint_{
n < 0? C2:C1
}
\frac{f(t)}{(t - z_0)^{n}}dt
$$

Depending on the quantity of $|z - z_0|$ or $|t - z_0|$, one of the series is going to converge. 

##### Comments

Suppose that the function is not analytic around the point $z_0$, well in that case, the negative series (The Principal Part) is going to converge for all of the $z$, but then for the positive component (The Analytic Part), that series is the regular Taylor series and it's not going to converge. 

So basically this is saying that, we can break find a series representation for function where the power series allow the use of negative power on the variable when summing up. 

A Laurent Series expended at the points of singularity will **reveal the nature of the singularity, so it's used to define singularities**. 

---

