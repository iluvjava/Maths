[[Complex Functions]]
Let's make the differential of complex function more detailed. 

---

The key here is the same as the real functions: 

> If we approach the point in the domain in anyways we want, the output of the differential quotients are going to be the same. 

#### **Example**

Fix some complex number $x_0$, 

$$
\begin{aligned}
    f(z) &= z^2
    \\
    f'(z_0) &= \lim_{z\rightarrow z_0} \frac{z^2 - z_0^2}{z - z_0}
    \\
    &= \lim_{z\rightarrow z_0}\frac{(z - z_0)(z + z_0)}{z - z_0}
    \\
    &= \lim_{z_0\rightarrow 0} {z + z_0} = 2z_0. 
\end{aligned}
$$

And take notice that, the expression is independent of the way we approaches the point $z_0$ under the complex plane, it works for all possible limiting sequence converging to $z_0$. However, here is another function that is not differentiable according the the definitions of complex differential: 

$$
\lim_{z \rightarrow z_0} \frac{|z - z_0| - |z_0|}{z - z_0}
$$

Take notice that, the numerator is real and the denominator is complex, and this means that, the choice of approaching the $z_0$ will give different complex values for the fraction, which then means that that this is path dependent. 