- [[Analytic Functions, Polynomials and Exponentials]] Complex Exponential
- [[Complex Number]] We need to know about the principal argument of a complex number to work with the new definition of the Logarithm. 

---
### **Intro** 

Consider the polar form of a complex variable $z = |z|\exp(i\theta_z)$, where $\theta_z$ denotes a set of equivalent angle for $z\in \mathbb C$. It could imply that: $\ln(z) = \ln|z| + i\theta_z$. However, observe that, a complex number has a equivalent classes of values that it equals to, more specirically $z = |z|\exp(i\theta_z) = |z|\exp(i \theta_z + 2n\pi)$ for all $n \in \mathbb N$. The resolution is to use the idea of a Principal Branch, mapping the angle of $z$ to an half open interval of length $2\pi$. Usually we define
$$
\theta_{(\cdot)} : \mathbb C \mapsto (-\pi, \pi]. 
$$


#### **Def | Logartihm on Complex Numbers**
> Let $\theta_{(\cdot)} : \mathbb C \mapsto (-\pi, \pi]$ be the angle of some complex variables, restricted to the half open interval of length $2\pi$ center around the origin. By periodicity, modularizing complex variables can bring the argument of it to the desired interval. Therefore, now we will be able to define the complex logarithm as the following: 
> $$
>   \ln(z) := \ln|z| + i \theta_z
> $$

**Observations**

This function is discontinuous whenever $\theta_z$ approaches $\pm \pi$. The set of all complex variables with argument $\pm \pi$ is $[-\infty, 0] + i0$, the negative real lines. Otherwise, the logarithm is continuous on $\mathbb C \setminus \{[-\infty, 0] + i0\}$. In that way, the region of $\ln$ is defined for an open domain in the complex plane. 


---
### **Principal Cuts**

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