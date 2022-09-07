
The Complex Logarithm is a bit trick, but we will introduce some way to make it to the complex plane while keeping it as an analytical function in the complex plane (With some trade off of course) 

prereq: [Analytic Functions (Exp, Poly)](Analytic%20Functions%20(Exp,%20Poly).md) Complex Exponential
prereq: [Complex Number](Complex%20Number.md) We need to know about the principal argument of a complex number to work with the new definition of the Logarithm. 
More resources: [Branch Cut](https://mathworld.wolfram.com/BranchCut.html)

---
### Introduction 

So the log function, the old version is going to return a set of arguments for a given complex function, and it's going to be a bit hard to handle as a function. (So the graph will be related to the Riemann Spiral and stuff like that. )

Let's stuff to the polar form and start investigating the function a big. 

Suppose that given any $z$, we want the function $\ln(z)$ to return all the solutions to this equation, we want to solve for $w$ for a given $z$, also let's also assume that the logarithm function is inverse function of the exponential. 

$$
\exp(w) = z
$$

And then in the end it will be like: 

$$\exp(w) = \exp(u + iv)$$ and then, let's see

$$
\exp(u + iv) = e^u + e^{iv} = |z| \exp(i\arg(z))
$$

Then we will have: 

$$
\ln(2) = \ln(u + iv) = \ln(|z|) + i\arg(z)
$$

Notice that $\arg(z)$ is a function the returns a set, and in this case it will be a lot of other angles that happen to give the number $z$ the same angle. 

It's all good until we want to take the derivative on this thing and we want it to still be analytical on the domain. But this function is bad because: 
* It has multiple returns values; $i(\theta + 2n\pi)$ where $n\in \mathbb{C}$
* It's derivative is not continuous even if we are making the $\arg(z)$ into a principle argument $\text{Arg}(z)$

---

### Principal Cuts 

Here we are going to introduce the idea of principal cut to the function, and then define a new function: 

$$
\text{Log}(z)
$$
Which is going to be the natural logarithm in the complex plane, and it's going to analytical, and it's going to have a single output. These useful properties will make out previous calculus math easier. 

#### Redefine 

Principle arguments. 

Let's redefine the thing using the idea of principle argument so it will have on return value instead of a lot of them. 

> $$
> \text{Log}(z) = \ln(|z|) + i\text{Arg}(z)
> $$

However, observe the fact that: when $\theta$ of a complex number is approaching $\pi$ in the negative direction (less than $\pi$), we have $\text{im}(\text{Log}(z))$  approaching the value $\pi$, however if we choose another direction, then the function $\text{Log}(z)$ is approaching the value $-\pi$. 

And this is not good, because under the principle value definition of the function $\text{Log}$ the function is not going to be differentiable $\forall z \in \mathbb{R}_{<0}$

---

**The Cut**

You know what, this is annoying cause we really want analytical functions in the complex plane, and guess what, if I cut out all the negative numbers from the complex plane, this thing is actually going to be just like real natural log, which also doesn't support negative numbers. 

So let's do that: 

> $$
> \text{Log}(z) =  \ln(|z|)  + i\text{Arg}(z)
> $$

And what a twist, the function will have the domain : 

$$
\mathbb{C}\setminus \mathbb{R}_{\leq 0} \mapsto \mathbb{C}
$$

Cool right. Such a simple and brutal solution. 

**Comment**
However I want to point out that, only the negative line is going to preserve some of the properties of the real logarithm function. And yes, there could be many other lines for cutting it, but this one is unique. 

Note that zero is included in the branch cut. 