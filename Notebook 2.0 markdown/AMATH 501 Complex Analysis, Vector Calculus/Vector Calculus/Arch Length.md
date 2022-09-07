Here are interested to describing derive some of the thing about the arch length in the polar coordinates 

prereq: [Polar Coordinates](Polar%20Coordinates.md)

---

Let's stop using the vector notation and denotes the parametric function as: 
$$r(t) = \begin{bmatrix}
x(t) \\\\ y(t)
\end{bmatrix}
$$

First let's establish the arch length formula as 

>$$ \int_a^b \sqrt{||r'(t)||} dt$$

And this is literally the formula of the arch length. We just sum up the length traveled in all direction during each moment in time and then we have this. 

---

### Polar

Now, we can use the polar description of the motion to figure out what is the polar arch length equivalent of this thing, the quantity we are interested in is $||r'(t)||$ using an angle function called $\theta(t)$, and the radial distance called $||r(t)||$


$$r'(t) = \frac{d||r(t)||}{dt}e_r{\theta(t)} 
- 
||r(t)|| \hat{e}_{\theta}(\theta(t))\theta'(t)$$

Notice that, here we can use the fact that basis described by $\hat{e}_r$ and $\hat{e}_\theta$ are orthonormal basis, which will make the length of the vector to be the square sum of length on each of the individual components and when we will have that: 

$$||r'(t)|| = \sqrt{
	\left (\frac{d||r(t)||}{dt} \right)^2 + 
	\left (
		||r(t)|| (\theta'(t))
	\right)^2}
$$

And now we can convenient redefine things a bit and get a better picture: 

Let $R = ||r(t)||$ and let $\theta = \theta(t)$, these are the angle and the length that describes the motion of the particular in the polar coordinates 

So then we have 

> $$\int_a^b \sqrt{R^2 + R^2\left(\frac{d\theta}{dt} \right)^2} dt$$

and that is the arch length formula if we have the polar coordinates. 

**Note**:

We really need to understand what is going on here to get a better idea. The arch length is the same as the gradient of the curvilinear space, take a look at [The Gradient](The%20Gradient.md)


#### Arch Length Generalized With Lame Coefficients 

--- 
### Parameterization

Sometimes, we want to travel along the curve steadily, and that is why we have the idea of arch length Parameterization

So this is going to be given by the formula, it's like: 

>$$ s(t) = \int_{a}^{t} \left\Vert \frac{d\vec{r}}{dt}\right\Vert \;dt$$

So this is like, if take the derivative on this thing, we have the tiny amount of arch length, and that is the same thing as the **speed**. 

Now let's consider the following expression: 

> $$\vec{r}(s^{-1}(t)) =
> \begin{bmatrix}
	> x(s^{-1}(t)) \\ y(s^{-1}(t)) \\ z(s^{-1}(t))
> \end{bmatrix}$$

This actually has some interesting advantage: 

$$
\frac{d\vec{r}}{ds} = \frac{d\vec{r}/dt}{ds/dt} = 
\frac{d\vec{r}/dt}{\left\Vert \frac{d\vec{r}}{dt} \right\Vert} = 1
$$

So what happens is, I am going to to find the expression for $s(t)$ and then I am going to solve for the variable $t$ so it's expressed in terms of the variable $s$, and then, I substitute that expression into my parametric equations to get the arch length Parameterization of the function.