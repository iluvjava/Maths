We are going to talk about the gradient of of a scalar field, and directional derivative and shit like that you know, dope shit like that. 

---
Gradient definition: 
> $$\nabla f(x, y) = \begin{bmatrix}
> \frac{\partial f}{\partial x} \\[0.5em] \frac{\partial f}{\partial y}
> \end{bmatrix}$$

This is the case for 2d. 

Geometrically, given any point on the scalar function: 
* Gradient at that point points to the **direction of the fastest increase** on the scalar field in $\mathbb{R^n}$ in the case of multi-dimensional function. 

* The gradient at that point is **orthogonal to the level curve** of the surfaces: $f(x, y) = k$ for some value of $k$, and it's **parallel to the normal vector** of of the surfaces. 

* The magnitude of the gradient at the point is the same as the rate of fastest increase for that point.  

**Calculus on Gradient: **
* Product Rules
> $$\nabla(fG) = \nabla (f)G + f\nabla(G)$$
> Where $f$ is a scalar function. 

---
### Simple Example

Find a unit normal vector to the cone $z^2 = 4x^2 + 4y^2$ at the point $P = (1, 0, 2)$. 

Fact: The gradient parallel to the normal of the level curve of the scalar function. 

Consider the cone as a level curve of 3d: 

$$f(x, y, z) = 4(x^2 + y^2) - z^2$$

**Note**: $f(x, y, z) = 0$ when $P$ is substituted into the scalar function (Which it should always be the case really)

And then we figure out the normal vector at the point of $P$ by computing: 

$$\nabla f \vert_P$$

And we also need to normalize it. 

$$\nabla f = (8x, 8y, -2z)$$ 
and at the point of $P$ we will have: $(8, 0, -4)$ and normalizing the vector we have the unit vector parallel of the normal vector to the surface: 
$$\frac{1}{\sqrt{5}} (8, 0 ,-4)$$

**Note:**
So, the moral of the story is the gradient can find unite normal vector for implicitly defined surfaces, and in this case, given any function $0 = f(x, y, z)$, find the gradient of the function, say $\nabla f$, and then substitute the point we are interested in into the gradient function, and then normalize the vector that comes out of it, and then that will be the normal vector got the implicit surface at that particular point. 

----
### Motivating Example 

Given a position vector in the polar coordinates; here the baiss vector for the polar coord is going to be simply denoted as $e_\theta$ and $e_r$. 

Let's rethink these things in terms of gradient, we are going to redefine it with gradients. 

$$f(x, y) = \sqrt{x^2 + y^ 2}$$

And this function in polar is: 
$$f(r, \theta) = r$$

And the level sets of this scalar function is simply just concentric circle, certered at the origin and evenly spaced. 

Since the gradient is normal to the level set: Then the gradient of $f$ is just gonna be the gradient of r: $\nabla f = \nabla r$, this is simply just a geometric argument. 

And hence the basis vector is gonna be: 

$$\nabla f = e_r = \frac{\nabla r}{||\nabla r||}$$


And if you take the gradient on $f$ in the cartesian coordinates, we are actually getting the same thing as above. 

Moreoever, the $$||\nabla r|| = \left\Vert\frac{dr}{ds}\right\Vert = 1$$ in this case .


### Motivating Example 

$$f(x, y) = \tan^{-1} (\frac{y}{x})$$

$$f(r, \theta) = \theta$$

And then $e_\theta = \frac{\nabla \theta}{||\nabla \theta||}$

And then: $||\nabla \theta|| = \frac{1}{r}$

And then: $$||\nabla \theta|| = \frac{d\theta}{ds}$$

---

### Polar Coordinates and Curvilinear Coordinate

It's pretty complicated but the important thing to remember is that, given a scalar function which are represented in 2d with the polar coordinate variable, we have the following operator for such a function to figure out the gradient vector under the polar coordinate too: 

> $$\nabla f = e_r \frac{\partial}{\partial r} + e_\theta \frac{1}{r}\frac{\partial}{\partial \theta}$$

The formula is derived via the Jacobian of the inverse transform from $(x,y)$ to $(r, \theta)$ with the coordinate transform from $(r, \theta)$ to $(x, y)$. 

Note: 

The proof is not trivial, and for more info about taking the gradient of funciton in another curvilinear space, check out: [[Curvilinear Gradient]]


