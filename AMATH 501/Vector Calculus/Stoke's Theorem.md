In this part, we will see a theorem has the surface integral on the LHS, and the line integral on the RHS. 
prereq: [[Surfaces]], [[Line Integral]]

NOTE: The stoke's theorem decays to **Green's theorem** when it's a simple surface on a region in 2d. 

---

#### Preconditions

* The surface is Orientable, mewing that there are 2 side, and no Mobius Strip. 
* Smooth surface and smooth boundary.  (Piece-wise smooth is OK too)
* Vector Field are continuous differentiable For the vector field, the derivative must be defined on every point, in addition, the derivatives must also be continuous functions too. 


This is the Stoke's Theorem: 

> $$
> \underset{S}{\iint} (\nabla\times \vec{F})\cdot d\vec{S} = \underset{C}{\oint} \vec{F}\cdot d\vec{r}
> $$

This is saying that, if I sum up all the curl in the surface, then it's equivalent to summing up all the dot product between the boundary line and the vector field. 

When solving these problem, this can be exploited, use which one seems easier to solve the line, or surface integral .

**Observe that**: 
If the given vector field is conservative, then there will be no curl, and this will mean that, all the closed loop will have zero line integral over the vector field, and this is just **a special cause of the Stoke's Theorem**. 

The Green's theorem is stated as: 

> $$\oint_C F_1dx + F_2dy = \iint_D (\partial xF_1 - \partial_y F_2)\;dA $$  (1.0)

Where, D is the region enclosed by the piece-wise smooth simple curve $D$. 

**Important Notes**: 
**Right hand rule** for the normal on the surfaces, and all the direction to circle around the line on the boundary has to be **counter-clockwise**. 

---

#### Fluid Dynamics Interpretations

So, this theorem is created at the dawn of Fluid Dynamics, hence some of the most relevant ideas related to it is fluid dynamics. 

def: $\vec{u}$: The fluid velocity field. 

Then consider the following quantities: 

$$\Gamma = \oint \vec{u} \cdot d\vec{r}$$

Where Gamma is the circulations of the fluid around a close line in the space. 

$$\vec{\omega} = \nabla\times \vec{u}$$

This is the vorticity of the fluid, it's measuring how the fluid spins at any infinitely small point in space. 

What Stoke's Theorem said is: 

$$\Gamma = \underset{S} \iint \vec{\omega} \cdot d\vec{S}$$

So, the aggregation of all the vorticity will be the total circulation of the fluid at the boundary. 

---

#### Area as a line Integral

Def: 

$$
\vec{F} = 
\begin{bmatrix}
	- y \\ x \\ 0
\end{bmatrix}
$$

Then, we will be able to fine the curl of the vector field, which is computed as: $2\hat{k}$, point upwards, meaning that our **contour is going to be oriented anti-clockwise.**

Now we use the Stoke's theorem and compute the area of any ellipse using the line integral around anything to figure out it's area. 

$$\oint
\begin{bmatrix}
	- y \\ x \\ 0
\end{bmatrix}
\cdot
\begin{bmatrix}
	dx \\ dy \\ 0
\end{bmatrix}
=
\oint xdy - ydx
$$

And notice that, this integral equals the area of the region enclosed by the closed loop; because the normal vector is perpendicular to the surface. 

By directly substituting the vector field into the Green's theorem (1.0), we got the thing we need. 

**Observe**: 

Notice that, if there are many difference surface that are sharing the same boundary, and they are laying in the same vector field, then according to Stoke's Theorem, we are going to have the same value for their Surface Integral, and line integral along the boundary too, however, it doesn't mean they share the same areas. 

Hence the area of a closed curve in 2d is given by Green's Theorem as: 

> $$\text{Area} = \frac{1}{2}\oint xdy - ydx$$