[[Complex Functions]]
Let's make the differential of complex function more detailed. 

---
### **Intro**

Complex differentiation at a point is quite a strong condition. We define a complex differentiation first, which is exactly the same as a real differentiation, but with complex numbers and complex function. 

#### **Def | Complex Differentiation at a point**



### **Simple Examples**

Fix some complex number $x_0$, 

$$
\begin{aligned}
    f(z) &= z^2
    \\
    f'(z_0) &= \lim_{z\rightarrow z_0} \frac{z^2 - z_0^2}{z - z_0}
    \\
    &= \lim_{z\rightarrow z_0}\frac{(z - z_0)(z + z_0)}{z - z_0}
    \\
    &= \lim_{z\rightarrow z_0} {z + z_0} = 2z_0. 
\end{aligned}
$$

And take notice that, the expression is independent of the way we approaches the point $z_0$ under the complex plane, it works for all possible limiting sequence converging to $z_0$. However, here is another function that is not differentiable according the the definitions of complex differential: 

$$
\lim_{z \rightarrow z_0} \frac{|z - z_0| - |z_0|}{z - z_0}
$$

Take notice that, the numerator is real and the denominator is complex, and this means that, the choice of approaching the $z_0$ will give different complex values for the fraction, which then means that that this is path dependent. 