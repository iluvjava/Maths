Here we are going to talk about surfaces. 

---

In 3d, there are 2 major ways of representing a surface: Parametric, Implicit 

> $$f(x, y, z) = 0$$

This is an implicit representation of a 3d surface, and it doesn't have to be a function and it might not look nice at all. 

> $$\vec{r}(u, v) = (x(u, v), y(u, v), z(u, v))$$

This is the parametric representaiton of the curve where 2 parameters is used to draw the curve in the 3d space. 

This is different representation, but the curve doesn't have to be nice too. 

The most traditional way of representing a curve is actually an implicit way of representing the curve. 

$$z = f(x, y)$$ 

Which is an implicit way of representing the curve because by defining $g(x, y, z) = z - f(x,y)$ and then set $g(x, y, z) = 0$ then we will have an implicit representation of the curve in 3d. 

#### Unit Vector on Surfaces 

If we were given the implicit scheme, then this is the formula: 

> $$\vec{n} = \frac{\nabla f}{||\nabla g||}$$

This is true because the gradient is always normal to the level curve at the point of evaluation. 

If we were presented with the parametric representaiton of the curve, then we wiwll use the cross produce to look for the normal vector: 

> $$
	> \vec{n} = \frac{\partial_u \vec{u} \times \partial_v \vec{v}}
	>{||\partial_u \vec{u} \times \partial_v \vec{v}||}
> $$

And this will give us the normal tagent vector at the point of evaluation. 

---

#### Surface Integral

Now we understand the basics of the surface integrals, it will be easy for us to understand the the surface integrals, which are just duble integrals. 

Here is the generic definition of a surface integral: 

> $$\iint \vec{F}\cdot d\vec{S}$$

Now, the integrator at the end of the integral is actually this: 

> $$\left( \partial_u S(u, v) \times \partial_v S(u, v)\right) dudv$$

Where $S(u, v)$ is a parametrid representation of a given surface in 3d. 

 However, when the vector upper script is not there, it means the following: 
 
 > $$dS = ||\partial_u S(u, v) \times \partial_v S(u,v)||dudv$$

And hence it's not hard to see that $d\vec{S} = \hat{n}dS$

#### Surface Area

> $$\iint dS$$

Yeah, this integral will give the surface area of a given parametric curve. 

--- 

Surface in tegrands in Curvilinear Coordinates: 

[[Surfaces Curvilinear]]