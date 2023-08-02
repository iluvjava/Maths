This is the Jacobian for a coordinate transformation between the Cartesian coordinates system and other alternative coordinate system. This is for Mathjax in Obsidian Notebook: 
$$
\newcommand{\uvec}[1]{\boldsymbol{\hat{\textbf{#1}}}}
$$

---
### **Introduction**
Consider a bijective mapping function that maps between 2 different coordinates, or $\mathbb R^3 \mapsto \mathbb R^3$, such that all angles remains orthogonal after the transformation. For example the polar coordinate transform has this property. Consider the transformation $[r\cos \theta\; r\sin \theta]$, which is $U(r, \theta) = r\cos \theta \uvec{i} + r\sin \theta \uvec{j}$, the Jacobian of the transformation is a orthogonal matrix because 

$$
\begin{aligned}
	\mathbb J [U](r, \theta) &= 
	\begin{bmatrix}
		\cos \theta & -r\sin \theta
		\\
		\sin \theta & r\cos \theta
	\end{bmatrix}
	\\
	\mathbb J[U]^T\mathbb J[U](r, \theta)&= 
	\begin{bmatrix}
		\cos \theta & \sin \theta
		\\
		-r\sin\theta & r\cos\theta
	\end{bmatrix}
	\begin{bmatrix}
		\cos \theta & -r\sin \theta
		\\
		\sin \theta & r\cos \theta
	\end{bmatrix}
	
	\\
	&= \begin{bmatrix}
		1 & 0 \\
		0 & r^2
	\end{bmatrix}, 
\end{aligned}
$$
i.e: the Jacobi matrix of the transform is orthogonal, describing a coordinate transformation that is locally orthogonal. In this case, it's orthogonal on all $\mathbb R^2$. For simplicity let's say that this coordinate transform is invertible everywhere and orthogonal everywhere. For some generality, we use $U(v_1, v_2, v_3) = [u_1 + u_2 + u_3](v_1, v_2, v_3)$ to describe a point under the alternative, curvilinear coordinate system $(\uvec e_1, \uvec e_2, \uvec e_3)$, and $V(u_1, u_2, u_3)$ to map the same point to the cartesian coordinate system $(\uvec i, \uvec j, \uvec k)$. 

**Definition**

> The curvilinear coordinates $(u_1, u_2, u_2)$ are said to be orthogonal if the $u_1$, $u_2$, $u_3$ coordinates curves (Fix 2 variable constant and vary the other one) are perpendicular to each other in every point in space. Succinctly put it means that Jacobian of the mapping is an orthogonal matrix. 


---
#### **Alternate Basis Vectors**

We investigate the relations between the basis vectors representations of the other coordinate system. Suppose we have the given vector (It's actually a transformation): 

$$
\begin{aligned}
	V (u_1, u_2, u_3)
	&= 
	v_1(u_1, u_2, u_3)\uvec{i} + v_2(u_1, u_2, u_3)\uvec{j} + v_3(u_1, u_2, u_3)\uvec{k}
	\\
	&= [x\uvec{i} + y\uvec{j} + z\uvec{k}](u_1, u_2, u_3) \text{, for short. }
	\\
	U(v_1, v_2, v_3)
	&= 
	[u_1\uvec{e}_1 + u_2\uvec{e}_2 + u_3\uvec{e}_3](v_1, v_2, v_3), 
\end{aligned}
$$

$\partial_{u_1} V$ gives the direction of the vector pointing perpendicular to the surface of fixing $u_2, u_3$ to be a constant. The vector is $\partial_{u_1} V = \partial_{v_1}x\uvec{i} + \partial_{v_2}y\uvec{j} + \partial_{v_3}\uvec k = h_1\uvec{e}_1$. $h_1$ is the *Lame coefficient*, it's a normalizing constant for the tangential vector. This is the cartesian representation of a basis vector of the alternative coordinate system. Packing the basis vector $\uvec{e}_1, \uvec{e}_2, \uvec{e}_3$ produces the following matrix representation: 

$$
\begin{aligned}
	(\mathbb J[V]^T \mathbb J[V])^{1/2}
	\begin{bmatrix}
		\\[1em]
			\uvec{e}_1 & \uvec{e}_2 &\uvec{e}_3
		\\[1em]
		\\
	\end{bmatrix}
	&=  \mathbb J[V](u_1, u_2, u_3).
\end{aligned}
$$

The vectors $\uvec e_1, \uvec e_2, \uvec e_3$ are orthogonal by the fact that the mapping produces orthogonal directions, we make the following observations for the Jocbian of the transformation 

$$
\begin{aligned}
	U\circ V(u_1, u_2, u_3) &= I\vec u
	\\
	\mathbb J[U\circ V](u_1, u_2, u_3) &= I
	\\
	\mathbb J[U]\mathbb J[V] &=  I
	\\
	\mathbb J[U]^{-1} &= \mathbb J[V] = 
	(\mathbb J[U]^T \mathbb J[U])^{-1}
	\mathbb J[U]^T, 
\end{aligned}
$$

giving us $\mathbb J[V]= J[U]^T$ which is implying that

$$
\uvec{e}_1 =  \frac{\nabla u_1}{||\nabla u_1||} = h_1\nabla u_1, 
$$

giving us another formula for the basis vector in terms of $(v_1, v_2, v_3)$. 


**Remarks**

I read it again in 2023 summer, and this part is not entirely understood. I think there is something wrong or unexplained in the original notes. Starting from above all the way to the end of the document. Tag: #INCORRECT. 

---
### **Jacobi Matrix**

There is some relations we can say about curvilinear coordinates and the Jacobi Matrix of the coordinate transform. Let the transformation function be: $(x, y, z)\mapsto (u, v, w)$. Rewrite it in a better way: 

$$
\begin{bmatrix}
	u(x, y, z) \\ 
	v(x, y, z) \\ 
	w(x, y, z) 
\end{bmatrix}
$$

And then the Jacobi matrix is gonna be: 

$$
\mathbb{J} = 
\begin{bmatrix}
	u_x & u_y & u_z
	\\
	v_x & v_y & v_z
	\\
	w_x & w_y & w_z
\end{bmatrix}
$$

And in the case when the Mapping happens to be orthogonal, the matrix $\mathbb{J}$ is going to be orthogonal. There for a set of orthogonal basis can be identified, which is computed via: $\mathbb{J}\sqrt{(\mathbb{J}^T\mathbb{J})^{-1}}$

