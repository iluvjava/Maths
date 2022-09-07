[Complex Functions](Complex%20Functions.md)
Let's make the differential of complex function more detailed. 

---

The key here is the same as the real functions: 

> If we approach the point in the domain in anyways we want, the output of the differential quotients are going to be the same. 


Let's take a look at an example that it's differentiable. 

$$
f(z) = z^2
$$

Then 
$$
\lim_{z\rightarrow z_0} \frac{z^2 - z_0^2}{z - z_0}
$$
Which is just
$$
\lim_{z\rightarrow z_0}\frac{(z - z_0)(z + z_0)}{z - z_0}
$$

Then it's just: 
$$
\lim_{z_0\rightarrow 0} {z + z_0} = 2z_0
$$

And take notice that, the expression is independent of the way we approaches the point $z_0$ under the complex plane. 

However, here is another function that is not differentiable according the the definitions of complex differential: 

$$
\lim_{z \rightarrow z_0} \frac{|z - z_0| - |z_0|}{z - z_0}
$$

Take notice that, the numerator is real and the denominator is complex, and this means that, the choice of approaching the $z_0$ will give different complex values for the fraction, which then means that that this is path dependent. 


