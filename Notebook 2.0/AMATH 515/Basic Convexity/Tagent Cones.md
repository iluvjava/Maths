First-Order Approximation of Sets 

The idea of the tangent cone is relevant to approximating the set with another set, we call "Cone", which arise for the understanding of strong duality in Linear programming too. 

---
### Cone
Cone a is a special type of subspace. Let $C$ be an nonempty subset of a real linear space $X$, then: 

**Cone**: 
$$
x \in C, \lambda \ge 0 \implies \lambda x \in C 
$$

**Pointed Cone**: 
$$
x \in C, - x \in C \implies x = 0_x
$$
You can't place a double arrow inside the pointed cone. 

**Observe**: 
If you have the std basis vector, then the positive weighted span of these vector is just the whole subspace, and hence, subspace is a special type of cone. 

### Tangent Cone
Let $S$ be a nonempty subset of a real normed space ($X$, $||\bullet||$). A vector in $h$ is called a tangent vector to $S$ of $\bar{x}$ if there are sequence $(x_n)_{n \in \mathbb{N}}$ in $S$, such that: 
$$
\bar{x} = \lim_{n\rightarrow\infty} x_n
$$
And there exists another sequence of numbers $\lambda_n$ such that: 

$$
h = \lim_{n\rightarrow \infty}\lambda_n(x_n - \bar{x})
$$

**Note**: 
This is a concept that is applicable to all sets, and in that sense, given any sets in vector space and a point that is in, or on the set (Geometrically), there will be a tangent cone for it. 

**Observe**
One of the choice for the $\lambda$ sequence is simply: 
$$
\lambda_n = \Vert x_n - \bar{x}\Vert
$$
And in this case, the $h$ vector is going to be a unit vector. 

When the point $\bar{x}$ is on the boundary and it's smooth, then the cone is a half space. 

Here are some illustrations: 

![[tangent-cones.png]]