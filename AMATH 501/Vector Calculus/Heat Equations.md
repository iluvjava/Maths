Here we are going to take a look at the heat equations and how to derive some useful fact about it. But we probably need something about the divergence first. 

prereq: [[Divergence Theorem]], [[Div]]

---

Consider Dirichlet boundary conditions of heat equation, so we are interested in a 2d surface of heat distribution, which can be model by a function $u(x, y, t)$ over the closed squared box around the origin: 

$$
B = [-L, L] \times [-L , L]
$$

The Dirichlet Boundary Conditions are set to: 

$$
\begin{cases}
	u(\pm L, y, t) = 0  & \forall t \\[1em]
	u(x, \pm L, t) = 0  & \forall t
\end{cases}
$$

Ok, the heat equations is governed by this: 

$$
\partial_t u = \partial^2_x u + \partial^2_y u
$$

The laplacian of the govern over the temporal evolution of the field. 

We want to prove the following statement regarding the heat equation: 

> $$
> M(t) = 1/2\underset{B}{\iint} u^2 \;dxdy
> $$

Under the Dirichlet Boundary, we have: 

$$
M'(t) < 0
$$

**Proof**

$$
M'(t) = \frac{1}{2}\underset{B}{\iint}
\partial_tu^2 \; dxdy
$$ 
$$
M'(t) = \frac{1}{2} \underset{B}{\iint}
2u\partial_t u \; dxdy
$$
$$
M'(t) = \underset{B}{\iint}u(\partial^2_x u + \partial_x^2u) \; dxdy
$$
$$
M'(t) = \underset{B}{\iint}u(\nabla \cdot \nabla u) \; dxdy
$$

$$
M'(t) = \underset{b}{\iint}u(\nabla \cdot \nabla u) + \nabla u\cdot \nabla u - \Vert u\Vert^2 \; dxdy
$$
$$
M'(t) = \underset{B}{\iint}\nabla \cdot (u\nabla u) \;dxdy - \underset{B}{\iint} \Vert u\Vert^2 dxdy
$$

Using the divergence theorem, the first part is summing up all the divergence over the area, which is the same as the line integral along the boundary of the box, and then sum up all the dot product of the line integral and the vector field. However, on the boundary, it's asserted that $u(x, y, t) = 0$, therefore, the first integral will be zero. 


$$
 \underset{B}{\iint}\nabla \cdot (u\nabla u) \;dxdy = \underset{C}{\int} u\nabla u \;dxdy = 0
$$

And then the second term will be less than zero because $$\Vert u\Vert^2 > 0$$

$$
M'(t) = - \underset{B}{\iint} \Vert u\Vert^2 dxdy < 0
$$

