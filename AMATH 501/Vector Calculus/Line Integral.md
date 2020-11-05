Here we are going to define and invesitate the line integral for different types of vector field, paths, with curvilinear coordinates. 
[[Ortho Curvilinears Coord]]

---

Here is the definition of a line integral. 


> $$\int_{\vec{r}(1)}^{\vec{r}(b)} \vec{F}\cdot d\vec{r}$$ def(1)

And we also have the choice to convert things so that they are expressed in terms of the  time parameter. 

$$\int_{t = a }^{t = b} \vec{F}\cdot\vec{r}\;'dt$$def (2)

Where, the $\vec{r}\;'$ can be interpreted as the velocity here, and the $\vec{F}$ can be interpreted as the force field, then by high school physics, this is the work done of a path on the vector field $\vec{F}$. 

And we also have the option to break then apart, by assuming that the $\vec{r} = (x(t), y(t), z(t))$. And this will give us this: 

> $$\int_{t = a }^{t = b} \vec{F}\cdot\vec{r}\;'dt = F_1\frac{dx}{dt} + F_2\frac{dy}{dt} + F_3\frac{dy}{dt} dt$$

Notice that, we can also use the explicit representations for the line integral if we are talking about with all the curves that can go through the area. 

>  $$\int_{a}^b \vec{F}\cdot d\vec{r} = \int_{a}^bF_1dx + F_2dy + F_3dz
> $$ 

And notice that in this rerpesentation, the parameter $t$ is gone. 

### Parametrization

In this case, if we are given a contour on the vector field, what we want to do is to use parametrize the contour into a path using the time variable T, and then use def (2) for taking the line integral. 

Given any line in the space say $\vec{u} = (x(t), y (t))$, with the gradient field $\vec{F}(t)$, then the line integral will be expressed as $\int_a^b \vec{F}\cdot \vec{u}(t)\; dt$ . 

Another way to do is it do it implicitly. Say we are given a line in the 3d, then we want to express $x$ as a function of $x$, and y as a function of $x$, and $z(x)$ too. And when we take the derivative on $d\vec{r}$, we add a $dx$ by the end of the integral. 


### Curvilinear Space 

You might have already guessed, if we want to get the work done of some kind of lines in the curvilinear space, then we probably want to the arch length formula for the curvilinear space: 

$$\newcommand{\uvec}[1]{\boldsymbol{\hat{\textbf{#1}}}}$$


> $$d\vec{r} = h_1du_1\uvec{e}_1 + h_2du_2\uvec{e}_2 + h_3du_3\uvec{e}_3$$

Then, we can simply use the definition, def(1) to calculate the error we want. Sometimes using curvilinear coordinate will simply the computation for the line integral tremendously. 


For example if we were given a matrix that is defined in the 2d polar coordinate, $\vec{r}(r, \theta)$, then the integral is going to be expressed as: 

> $$\int_{a}^{b} \frac{dr}{dt}rd\theta +\theta r\;d\theta$$

Hence in the general case, we can express the line integral with the curvilinear coordinate using the Lame Coefficients: 

>$$ \int_{t = a}^{t = b} \left(F_1 h_1du_1 +  F_2 h_2du_2 + F_3h_3du_3 \right)$$

And this is just the dot product of the line segment in the curvilinear coordinates and t he field vector function, with some abuse of notations. 

#### Conservative Field

If, there eixsts a scalary field $\Phi(x)$ such that its gradient is the the vector field $F$, with the additional constraint that $\Phi(x)$. 
I am not sure about the details of the conservative vector field, but here is the wiki [link](https://www.wikiwand.com/en/Conservative_vector_field)

Then the following statements will be true simultaneously: 

* $\vec{F} = \nabla\Phi$
* All close loop, simply line integral is going to be zero. 
* $F$ is an **irrational** field; Irrational meaning that the curl of the vector field is zero everywhere. 

Notes: 

1. The $\vec{F}$ needs to be continously differentiable, so the the derivative of the vector field is a continous function. 


Then if the $F$ is conservative, then the line integral for a certain function can be simply expressed as: 

> $$\int_{a}^{b} F\cdot dr = \Phi(b) - \Phi(a)$$

Which is super convenient to evaluate. 

For more about how to deal with the conservative vector field over the Cuvilinear coordinates, please read [[Conservative Vector Field Extra]] for more. 




