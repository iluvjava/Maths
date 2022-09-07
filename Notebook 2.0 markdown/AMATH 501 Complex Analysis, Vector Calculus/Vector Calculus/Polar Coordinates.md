Here we are going to discuss something about the polar coordinates ans what happen when we try to do calculus on it. 

The polar coordinate system is one of the [Ortho Curvillinears Coord](Ortho%20Curvillinears%20Coord.md), and hence it follows rules from there. 

---

#### Polar

In polar coordinates, the most important component is a function $
\theta(t)$ that links the angle of the object and the time parameter of it. 

And hence, given any motion in 2d, summarized as: 

$$\vec{r}(t) = \begin{bmatrix}
	x(t) \\ \\
	y(t)
\end{bmatrix}$$

If, such a $\theta(t)$ exists that describes the angle the motion goes through, then we can do: 

$$
\vec{r}(t) = 
||\vec{r}(t)||\hat{e}_{r}(\theta(t))
$$
Which coorelates to some of the parameter that describes the motions under the polar coordinate: 

$$r = ||\vec{r}(t)||$$

and 
$$
\hat{e}_{r}(\theta(t)) = \begin{bmatrix} 
	\cos(\theta(t)) \\ \\
	\sin(\theta(t))
\end{bmatrix}
$$

Where this vector is the radial basis vector for the polar coordinate. 

And there is another unit vector that describe the tangential motion for the polar coordinates: 

$$
\hat{e}_{\theta}(\theta(t)) = \begin{bmatrix} 
	-\sin(\theta(t)) \\ \\
	\cos(\theta(t))
\end{bmatrix}
$$

Here are some of the important properties of the basis that forms the vector: 

* It's an ortho normal basis, it will make life easier when you try to figure out the size of the vector described by these 2 basis vector. 

* The derivative on this thing is like the derivative of the trignometric functions:
$$\hat{e}_{r}(\theta(t))' = \hat{e}_{\theta}(\theta(t))\theta'(t)$$	 $$\hat{e}_{\theta}(\theta(t)) = - \hat{e}_{r}(\theta(t))\theta'(t)$$ Which is kinda cool. 


#### Notes

For motions that has a polar and circular nature, prahsing the prablem in term of the polar orthogonal basis is one of the very cool way of doing things. 

#### Procedures

Find the $\theta(t)$ function for the given motion and then use it to construct the alterative polar coordinate function for the motion and then do calculus on the new coorditnates.  When the motion is not suited for polar coordinate, the $\theta(t)$ function will get pretty ugly. 

---

### Calc

[P Coord Deta T](P%20Coord%20Deta%20T.md) Taking Derivative on a parametric curve on the polar basis coordinates 

[The Gradient](The%20Gradient.md) It contains the general formula for taking the gradient of a scalar field that is defined via the polar coordinates in 2d. 