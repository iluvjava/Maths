[[Laplace Transform]]

Previously we had the theory for Laplace Transform, now we will be interested in practicing it with some good examples. 

---
### **Intro**

Examples for Laplace Transform. 


---
### **A very General Example**

Here we are going to consider something cool, something a bit more general, and then we are going to take the Inverse Laplace transform on that: 

$$
g(t) = f(t)\exp \left(
-\alpha t
\right) \quad \alpha \in \mathbb{R}_+
\tag{1}
$$

So that in this case, the postive half of the function will always be ingetrable. 

**The Laplace Transform**: 


$$
\widetilde{g}(s) = \mathcal{L}[g](s) = \int_{0}^{\infty} 
    f(t)\exp \left(
    (-s-\alpha)t
    \right)
dt = 
\mathcal{L}[f](s + \alpha)
\tag{2}
$$

Multplying the exponential is just a including a linear transform on the parameter before feeding it to the Laplace Transform. 

In addition, define: $\tilde{f}(s) = \mathcal{L}[f](s)$ for notational convenience. 

What about the Inverse? 

**Inverse Laplace Transform**

$$
\mathcal{L}^{-1}[\widetilde{g}](s) =  
\frac{1}{2\pi i}\int_{-i\infty}^{i\infty} 
    \widetilde{f}(s + \alpha)\exp \left(
    st
    \right)
ds
=
\frac{1}{2\pi i}\int_{-i\infty}^{i\infty} 
    \widetilde{f}(s + \alpha)\exp \left(
    (s + \alpha)t
    \right)\exp \left(
    -\alpha t
    \right)
ds
\tag{3}
$$

$$
\exp \left(
-\alpha t
\right) 
\frac{1}{2\pi i}\int_{-i\infty}^{i\infty} 
    \widetilde{f}(s + \alpha)\exp \left(
    (s + \alpha)t
    \right)
ds
\tag{4}
$$

consider $s:= s + \alpha$

$$
\exp \left(
-\alpha t
\right) 
\frac{1}{2\pi i}\int_{-i\infty}^{i\infty} 
    \widetilde{f}(s)\exp \left(
    st
    \right)
ds
\tag{5}
$$
 
So then combine (3) and (5), we have: 

$$
\widetilde{g}(s) = f(t)\exp \left(
-\alpha t
\right) = \exp \left(
-\alpha t
\right) 
\frac{1}{2\pi i}\int_{-i\infty}^{i\infty} 
    \widetilde{f}(s)\exp \left(
    st
    \right)
ds
$$

$$
\implies f(t) = \frac{1}{2\pi i}\int_{-i\infty + \alpha}^{i\infty + \alpha} 
\widetilde{f}(s)\exp \left(
st
\right)
ds
\mathcal{L}^{-1}[\widetilde{f}](t)
\tag{6}
$$

And this, is what we call the **General Form for the Inverse Laplace Transfrom**

This will work even if $f(t)$ is not integrable. We start with depressing the function $f(s)$, which might not be integrable, and then taking the Laplace Transform on the function. 

And in this case, we **shifted the laplace Transfrom** of $f(t)$ along the vertical line on real $\alpha$.


---
### **A Concrete Example**

So here, we will consider a concrete function. 

Take this as a fact: 

$$
\mathcal{L}[\exp(t)](s) = \frac{1}{s - 1}
\tag{7}
$$

The to figure out the inverse Laplace Transform of such function, we need to solve: 

$$
f(t) = \frac{1}{2\pi i}\int_{-i\infty + \alpha}^{i\infty + \alpha} 
\frac{\exp(st)}{s - 1}
ds
\tag{8}
$$

This is a contour integral along the line $x = \alpha$ and $y$ is free. I goes along the vertical direction and the the real part of it is $\alpha$. 







