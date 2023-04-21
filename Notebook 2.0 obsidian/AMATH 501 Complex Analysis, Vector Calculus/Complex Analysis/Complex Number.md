Here we will discuss some of the important basics for complex number that is going to be the foundations for a lot of other things. 

---
### Introduction 

This is the complex number: 

> $$z = x + yi$$

And the imaginary unites is famous, we don't need to talk about this here. 

Exploit:  Conjugate

The conjugate of a number $z = x + yi$ and then the conjugate of this number will be: $x - yi$, and it's denoted as: $z^*$

And notice the following good stuff that comes with the definition, where we will be table to talk about properties of the complex number using only the complex number and its conjugate. 

> $$\Re(z) = \frac{1}{2}(z + z^*)$$

> $$\Im(z) = \frac{1}{2i}(z - z^*)$$

And then we can also have the following representation on the modulus of the complex number. 

> $$|z|= \sqrt{x^*x}$$

Also, the conjugate can pass through the multiplication and the addition process: 

> $$(ab)^* = a^*b^*$$

And then it's like: 

> $$(a + b)^* = a^* + b^*$$

And dividing 2 complex number is gonna be like: 

$$\frac{a}{b} = \frac{ab^*}{|b|^2}$$

See how simple this is. 

--- 
### **Polar Form and Arguments**

The argument of a complex number is a set of angles. 

let's define that the angle of the complex number is as simple as the angle in the Cartesian coordinates. 

$$
\theta = \arctan{\frac{y}{x}}
$$

Notice that the range of the function is in $(-\pi/2, \pi/2)$, Which is not good because it's only returning angles that are present in the first and the last quadrant on the 2d coordinates. 

If 2 number has the same argument, $\arg{(a)} = \arg{(b)}$ then it will mean that the relations between their angles is like: $\phi_1 = \phi_2 + 2k\pi$ where $k$ can be any integers. 

In addition, 

In addition, there is another definition of the angle but it's going to be a single output instead of a set of angles. Also, notice how the number zero is not defined in the domain of the function?

Let's define a better function for this shit: 

$$
\mathbf{A r g}(z)=\left\{\begin{array}{cc}
\arctan \frac{y}{x} & \text { if } x>0, y \in \mathbb{R} \\
\arctan \frac{y}{x}+\pi & \text { if } x<0, y \geq 0 \\
\arctan \frac{y}{x}-\pi & \text { if } x<0, y<0 \\
\frac{\pi}{2} & \text { if } x=0, y>0 \\
-\frac{\pi}{2} & \text { if } x=0, y<0 \\
\text { undefined } & \text { if } x=0, y=0
\end{array}\right.
$$

Notice that, this time, we use the capital letter to denote out new function. 

The domain of the $\mathbf{Arg}$ is covering all the possible value for $x,y$ under the domain except for the case where it's like both of them are zero, then the domain of the function can be summarized by: 

$$
	\mathbb{C}\setminus\{0\} \mapsto (-\pi, \pi]
$$

Where the positive value for $\pi$ will be inclusive but not for the negative value of $\pi$. 

**Summary**: 
So if the complex number goes under, then it's going to be $[-\pi, 0]$ and if it goes above then it's going to be $[0, \pi]$  and that is about it. 
It looks complicated but it's just a smoothed out and a bit more organized version of it. 

And the output of the $arg{z}$ as a set for all the complex numbers in the surface can be visualized using the Riemann Surface, like: 

[Riemann Surface](https://www.wikiwand.com/en/Riemann_surface)

---

### Polar Form and Exponential

The polar form takes the number and combine with the exponent. It's from the Euler's Formula for complex number: 

> $$
> z = |z|(\cos(\theta) + i\sin(\theta))
> $$

Which conveniently we have: 

> $$
> z = |z|e^{i\theta} 
> $$

And this is very helpful when doing the multiplications on complex number because for any complex numbers written in the Canonical Form (The Cartesian Coordinates), we have: 

$$
z = |z| e^{\text{Arg}{(z)}i}
$$

---

### De Moirvre's Formula

This is a formula that connects taking the exponent of a complex number to spinning the complex number in the complex plane. Let's take a look: 

> $$(e^{i\theta})^n = e^{i n \theta}$$

However, this is not trivial because we are actually doing a binomial expansion on this thing, so it's like: 

$$
(\cos(\theta) + i\sin(\theta))^n = (\cos(n\theta) + i \sin(n\theta))
$$

And this is very very interesting because is it's imply some kind of decomposition of high frequency waves into a sum of waves but raise to some kind of exponent and this is very interesting. 





