In this note, we explore taking the gradient for a function defined under another curvilinear coordinate system. 

preq: [[Ortho Curvillinears Coord]]
preq: [[The Gradient]]
extra materials: [Link](https://www.jfoadi.me.uk/documents/lecture_mathphys2_05.pdf)

$$\newcommand{\uvec}[1]{\boldsymbol{\hat{\textbf{#1}}}}$$

---

### Polar Coordinates

> $$\nabla  = e_r \frac{\partial}{\partial r} + e_\theta \frac{1}{r}\frac{\partial}{\partial \theta}$$

This is Gradient operator for 2d polar coordinate. 

The following section will illustrate how that, the gradient are viewed with curvilinear variables under the lense of the Cartesian coordinate. 

---

### Length of A Line Segment 

> $$d\vec{r} = \frac{\partial r}{\partial u_1}du_1 + \frac{\partial r}{\partial u_2}du_2 + \frac{\partial r}{\partial u_3}du_3$$ (1)

The above formula is the increment induced by changes in each of the variables: $u_1, u_2, u_3$, this is possible because the coordinate system is by definition: Orthogonal 

Notice that this quantity can be simplified with the usage of the Lame Coefficient, more specifically: 

### $$ d\vec{r} = h_1 du_1 \uvec{e}_1 + h_2 du_2 \uvec{e}_2 + h_3 du_3 \uvec{e}_3$$

Which is the same thing but this time we represent it as the sum of the 3 of the basis vector of this ortho linear coordinate system.


### The Gradient in Curvilinear Space

The gradient of a function in the ortho linear space is simply expressed as: 

> $$df = \nabla f \cdot d\vec{r}$$ (1.1)

Consider $f$ to be a multivariable scalar function that  is defined in the coordinate system using $(u_1, u_2, u_3)$. 

Observe that this relation is implicit, this is saying that, if we dot the incrementation vector $d\vec{r}$ with the gradient of the function then we will have the total amount of change of the function, $df$

The next step is going to view this formula through the lense of cartesian coordinate using the the property of the curvilinear coordinate system. 

Then the change of the function f induced by changes of variables on $(u_1, u_2, u_3)$ will be: 

> $$df = \frac{\partial f}{\partial u_1} du_1 + \frac{\partial f}{\partial u_2}du_2 + \frac{\partial f}{\partial u_3}du_3$$ (2)

And this can be interpreted as a product of the jacobian matrix with the delta vector, and keep in mind that the function $f$ is actually a vector function under this context, hence $df$ is the derivative vector too. 

Notice that, we can express each of the component $du_1, du_2, du_3$ using the basis for the orthogonal vector (from part **(1)**), and it's achieved with the following: 

$$\uvec{e}_1\cdot d\vec{r} = h_1du_1$$

The project of the changes insudced by $(u_1, u_2, u_3)$ in the direction of $\uvec{e}_1$ is simply the quantity $du_1$ scaled by the Lame Coefficient. 

Simularly, for the other quantity such as $du_2$, $du_2$ we can get the following: 

$$\uvec{e}_2\cdot d\vec{r} = h_2du_2$$

$$\uvec{e}_3\cdot d\vec{r} = h_3du_3$$

Therefore, we will have a new expression for the quantity $df$ (part **(2)**), the increment vector of $f$ when inducing the quantities $u_1, u_2, u_3$: 

> $$
> df = \frac{1}{h_1}\frac{\partial f}{\partial u_1}\uvec{e}_1\cdot d\vec{r}
> + 
> \frac{1}{h_2}\frac{\partial f}{\partial u_2}\uvec{e}_2\cdot d\vec{r}
> + 
> \frac{1}{h_3}\frac{\partial f}{\partial u_3}\uvec{e}_3\cdot d\vec{r}$$ 
> (3)

And then, we can say that: 

> $$df = \left(\frac{1}{h_1}\frac{\partial f}{\partial u_1}\uvec{e}_1  +  \frac{1}{h_2}\frac{\partial f}{\partial u_2}\uvec{e}_2  + \frac{1}{h_3}\frac{\partial f}{\partial u_3}\uvec{e}_3 \right)\cdot d\vec{r}$$ (4) 

Boom, combining (4) and (1.9), we will have the following expression for the gradient of $f$, induced by changes in $u_1, u_2. u_3$ and view under the basis of $\uvec{e}_1, \uvec{e}_2, \uvec{e}_3$, which will be giving us: 


>$$ \nabla f = \left(\frac{1}{h_1}\frac{\partial f}{\partial u_1}\uvec{e}_1 + \frac{1}{h_2}\frac{\partial f}{\partial u_2}\uvec{e}_2 + \frac{1}{h_3}\frac{\partial f}{\partial u_3}\uvec{e}_3 \right)$$

**Note**: it might look like the divergence, but this is a vector quantity. 

Ok, now let's put them into matrix and see its glory: 

$$
\nabla f = 
\begin{bmatrix}
	\frac{1}{h_1} & 0 & 0 \\ 
 	0 & \frac{1}{h_2} & 0 \\ 
	0 & 0 & \frac{1}{h_3} \\ 
\end{bmatrix}
\begin{bmatrix}
	\quad 
	\\[0.5em]
		\uvec{e}_1 &  \uvec{e}_2 & \uvec{e}_3
	\\[0.5em]
	\quad
\end{bmatrix}
\nabla f(u_1, u_2, u_3)
$$

It can also be expressed with respect to the Jacobi matrix of the function, denoted by $\mathbb{J}$ we have: 
$$
(\mathbb{J^T}\mathbb{J})\nabla f(x, y, z) = \nabla f(u_1, u_2, u_3)
$$

2 Expressions are exactly the same thing. 

---

**Key Exploit**

The key here is the fact that, the partial derivative is related to the basis vector, more specifically: 

$$
\frac{\partial r}{\partial u_1} = \left\Vert\frac{\partial r}{\partial u_1}\right\Vert \uvec{e}_{u_1} 
$$

So the key exploit here is the fact that the induced change is orthogonal, and that is each induced changes can be described by that one basis vector for that variable itself, instead of a linear combinations of other basis vectors. 


### Simple Example

Here we are interested in the gradient of the gravitational field, the vector field is expressed as: 

$$
F(x, y, z) = \frac{1}{\sqrt{x^2 + y^2 + z^2}}
$$

And then we can expressed this under the spherical coordinates, it's going to be like this: 

$$
F(r, \theta, \phi) = 1/r
$$

And then the formula for the gradient of this will be expressed like: 

$$\nabla
F(r, \theta, \phi) = 
\frac{\partial_r f}{h_r}\widehat{\textbf{e}}_r
+
\frac{\partial_\theta f}{h_\theta}\widehat{\textbf{e}}_\theta
+
\frac{\partial_\phi f}{h_\phi}\widehat{\textbf{e}}_\phi
$$

And then this is like the perfect thing, because the second 2 components are zeros and we are left with this expression for the gradient of the vector field it's like: 

$$
\nabla F(r, \theta, \phi) = \frac{-1}{r}\widehat{\mathbf{e}}_r
$$

And  this can be converted back to the Cartesian Coordinates and it will be looking like: 

$$
\nabla F(x, y, z) = \frac{-1}
{(x^2 + y^2 + z^ 2)^{3/2}}
$$

Boom, super easy, and also this field is conservative and we will be looking at this in the curl part I believe. 