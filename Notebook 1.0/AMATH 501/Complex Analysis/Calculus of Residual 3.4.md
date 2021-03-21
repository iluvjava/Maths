prereq: [[Calculus of Residual 3.3]]
Let's continue what we already had from the previous parts, but this time we use a more complicated contour involving a more creative branch cut for the integral. 

---


---
### Example 2
Today's Integral 

$$
\int_{1}^{\infty} \frac{dx}{x\sqrt{x^2 - 1}}
$$

Firstly, we are going to** choose a branch cut that is not interfering with the singularities of the function.**

The function $\sqrt{x^2 - 1}$ discussed in the [[Branch Cut]] note. And in that part, we use the Principal Argument for both $\theta_1$ and $\theta_2$ and then get that the "Cliff" is $[-1, 1]$. But in this case, it's not applicable because $z = 0$ is one of the singularities and it's in the $[-1, 1]$ interval, ruining everything for us. 
 
So here we suggest another Branch Cut with $\theta \in [0, 2\pi]$ for $\text{arg}(z \pm 1)$, and these angles will give us the branch cut: $(-\infty, -1] \cup [1, \infty)$. 

And then, we will need to **figure out the contour for the integral**, which is going to be a double keyholes in our case, this is the set up: 

![[doublekeyhole.png]]

Where the green line is highlighting the principal argument for both of the singularities. 

Let's define that: 
$$\theta_1 = Arg(z - 1) \quad \theta_1\in [0, 2\pi]$$

$$\theta_2 = Arg(z + 1) \quad \theta_2\in [-\pi, \pi]$$

Also let $\epsilon$  to be the radius of 2 of the circles around the singularities. 

And let $R$ to be the radius of the circle of the larger circle. 

#### A1, A2

The Parameterization of the $A1, A2$ contours travels around the singularities. 

$$
\theta_1, \theta_2: 0\rightarrow \pi \quad \text{For } A_1
\quad 
\theta_1 \rightarrow 2\pi \; ,\theta_2: \rightarrow -\pi \quad \text{For } A_2
$$

And each of the singularities with their own Principal Components are going to be play a role here, by which I mean: 

$$
\sqrt{z - 1} = \sqrt{|z - 1|}\exp(\theta_1/2) \quad 
\sqrt{z + 1} = \sqrt{|z + 1|}\exp(\theta_2/2) 
$$

Then it means that: 

$$
\sqrt{x^2 - 1} = \sqrt{|z - 1||z+1|}\exp
\left( 
	\frac{\theta_1 + \theta_2}{2}
\right)
$$

While also for the integrator: $z = R\exp(i\theta)$, where $\theta$ is another angle, independent of what we had for 2 of the singularities, and $R\rightarrow \infty$. 

So then it means that: 

$$
\int_{A1} \frac{dz}{z\sqrt{|z - 1||z+1|}\exp
\left( 
	\frac{\theta_1 + \theta_2}{2}
\right)}
$$

$$
I_{A1} =
\int_{0}^{\pi} \frac{iR\exp(i\theta)d\theta}
{\exp(i\theta)\sqrt{|R\exp(i\theta) - 1||R\exp(i\theta)+1|}\exp
\left( 
	\frac{\theta_1 + \theta_2}{2}
\right)} 
$$

And take notice that: 
$$
|I_{A1}| \leq \int_{0}^{\pi}\frac{d\theta}{\sqrt{R^2 - 1}} \quad R > 1
$$
An that just means: 

$$
\lim_{R\rightarrow\infty}|I_{A1}| = 0
$$

Notice that the argument of the complex number here has no contributions to the modulus of the number, and hence, after taking the limit, it's still going to approaches zero. 

#### C1, C2

So, amazingly, the interval in between the singularities, $(-1, 1)$ is going to be continuous, even if the principle angle $\theta_1, \theta_2$ are not, but the thing is, $(\theta_1 + \theta_2)$ are going to be continuous for the contour $C1, C2$. And this is just from what we had for the principal cut of the function. 

(Needs to show that These 2 contours integrals are going to zero)

When the contour $C1$ is parameterized, it's parameterized such that: 

$$
z - 1 = \epsilon\exp(i\theta_2) \implies z = \epsilon\exp(i\theta_2) + 1
$$

Where the angle, $\theta_1$ are going from $-\pi$ to $\pi$, and hence we have the substitution: 

$$
\int_{-\pi}^\pi
\frac{i\epsilon d\theta_2}{(\epsilon\exp(i\theta_2) + 1)
\sqrt{
	\epsilon\exp(i\theta_2)(\epsilon\exp(i\theta_2) + 2)}}
$$

And observer that you can take the limit directly, and the denominator will approach a constant while the numerator will decay to zero. 

Therefore, as the limit $\epsilon\rightarrow 0$, the integral will become zero. The same thing happens for $C_2$. 

It's zero for both contours. 



#### L1, L4

These 2 contours are going to evaluated together because it has some kind of symmetry.

* Then we know that for L1:  $\theta_1, \theta_2 = \pi$ as $\epsilon \rightarrow 0$
	* But the parameter, $x$ goes from $R$ to $1 + \epsilon$. 
	* $z = -x$
* And also for L4: $\theta_1, \theta_2  = 0$ as $\epsilon \rightarrow 0$
	* And the parameter, $x$ goes from $1 + \epsilon$ to $R$. 
	* $z = x$

So basically, as we travel along L1, or L4, and getting close to the limit, we ask ourselves, what is the Parameterization for $z$ and what is the angle of $\theta_1$ and $\theta_2$. 

Then, let's simplify some of the components in the integrand so we know what is going on here. 

$$
\sqrt{(z - 1)(z + 1)} = \sqrt{|-x - 1||-x + 1|}\exp\left 
(\frac{\theta_1+ \theta_2}{2}
\right)
$$

so then

$$
I_{L1} = 
\int_{R}^{1+\epsilon}
\frac{-dx}{-x \sqrt{|x + 1||x - 1|}\exp\left 
(\frac{\theta_1+ \theta_2}{2}
\right)}
$$

$$
I_{L1} = 
\int^{R}_{1+\epsilon}
\frac{-dx}{x \sqrt{|x + 1||x - 1|}\exp\left 
(\frac{\theta_1+ \theta_2}{2}
\right)}
$$

Do notice that when we take the limit of $\epsilon \rightarrow 0$ and $R\rightarrow \infty$, we will have: $\theta_1 + \theta_2 = 2\pi$, and hence the final piece will be the numerator giving us a -1. 

$$
\lim_{\substack{\epsilon\rightarrow 0\\ R\rightarrow \infty}}
I_{L1} = 
\int^{\infty}_{1}\frac{dx}{x\sqrt{|x + 1||x - 1|}} =I 
$$

And this is the original integral. Similarly, for the contour L4, we will have: 

$$
I_{L4} = 
\int^{R}_{1+\epsilon}
\frac{dx}{x \sqrt{|x + 1||x - 1|}\exp\left 
(\frac{\theta_1+ \theta_2}{2}
\right)}
$$

And it's not hard to see that taking the limit we have: 
$$
\lim_{\substack{\epsilon\rightarrow 0\\ R\rightarrow \infty}}
I_{L4} = I
$$

#### L2, L3

Let's summarize what is happening to the angles as we travels around the contour in this case: 

* For L2: 
	* $\theta_2 \rightarrow -\pi$, $\theta_1 \rightarrow \pi$ As $\epsilon \rightarrow 0$ and $R\rightarrow \infty$
	* And pointing to the negative direction, we have $z = -x$ as $x$ goes from $1 + \epsilon$ to $R$. 
* For L3: 
	* $\theta_1 \rightarrow 2\pi$ and $\theta_2 \rightarrow 0$ while $\epsilon \rightarrow 0$ and $R\rightarrow \infty$. 
	* And point to the positive direction, we have: $z = x$ as $x$ goes from $R$ to $1 + \epsilon$. 

**Then we know that for L2, we have: **

$$
\sqrt{z^2 - 1} = \sqrt{|z - 1||z + 1|}\exp\left(
\frac{\theta_1 + \theta_2}{2}
\right)
$$

Taking the limit we have: 

$$
\sqrt{z^2 - 1} = \sqrt{|z - 1||z + 1|}
$$

So then with the substitution, the contour integral becomes: 

$$
I_{L_2} = \int^{R}_{1 +\epsilon} \frac{-dx}{-x
\sqrt{|-x - 1||-x + 1|}
}
$$

And using the fact that x goes from $R$ to $1+\epsilon$ we can simplify the absolute value, and then giving us: 

$$
I_{L2} = \int^{R}_{1 +\epsilon} \frac{-dx}{-x
\sqrt{(x + 1)(x - 1)}
}
$$

And then we will know that: 

$$
\lim_{\substack{R \rightarrow \infty \\ \epsilon\rightarrow 0}} I_{L2} = I
$$

**And Now for L3, we should have the following**. 

$$
\sqrt{z^2 - 1} = \sqrt{|z - 1||z + 1|}\exp\left(
\frac{\theta_1 + \theta_2}{2}
\right)
$$

Taking the limit we have: 

$$
\sqrt{z^2 - 1} = \sqrt{|z - 1||z + 1|}\exp\left(
\frac{0 + 2\pi}{2}\right)
= -\sqrt{|z - 1||z + 1|}
$$

And then, we make the substitution to the contour integral, we will have the following: 

$$
I_{L3} = \int_{R}^{1 + \epsilon} \frac{dx}{x
(-\sqrt{|x - 1||x + 1|})
}
$$

And take notice that $x$ is always going to be larger than 1, and then we can swap the bounds of the integral and then have it canceled out with the negative sign from the substitution of the variable, giving us: 

$$
\lim_{\substack{
\epsilon\rightarrow 0 \\ R\rightarrow \infty
}}
\int^{R}_{1 + \epsilon} \frac{dx}{x
(\sqrt{|x - 1||x + 1|})
}= I = I_{L3}
$$


#### Smashing the Contours all Together

Combining all the contours integral together into one, closed contour integral, we will have the fact that: 

$$
\oint_{C} \frac{dz}{z\sqrt{(z^2 - 1)}} = 4I
$$

And this will mean that, we can use the residual theorem to calculate the contour integrals. 



