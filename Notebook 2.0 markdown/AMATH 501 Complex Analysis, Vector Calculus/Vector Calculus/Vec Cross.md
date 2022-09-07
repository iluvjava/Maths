Cross product of vectors are special to 2d vector, and it's widely used in science and engineering

---
## Basics
* **How to compute**
$$a\times b = |a||b|sin(\theta)\hat{n}$$
where $\theta$ is the smallest angle between 2 vectors and $\hat{n}$ is the unit vector that is perpendicular to both $a,b$ (**Right Hand Rule**), the vector can also be computed by: 
$$det
\begin{bmatrix}
i & j & k\\
a_1& a_2& a_3\\
b_1& b_2& b_3
\end{bmatrix}$$
By abusing the notation, we can have the det of the matrix to be a vector in Treeman's notation, and that vector is $\perp$ to $a, b$. The matrix det abuse comes from the rules on the basis vector
$i\times i = 0$, $j \times j =0$, $k\times k = 0$
$i\times j = k$, $j\times k = i$, $k\times i = j$
The basis vectors are still just a vector, combining it with the properties of the $\times$ to get full picture. 

* **Cool Properties**
  1. Perp
	Denotes $b'$ to be the complementary projection of $b$ onto $a$, computed by $b - (\hat{a}b)a$, then $a\times b = a\times b'$ (Easy to Proof)
  2. $$(a\times b)\cdot a = (a\times b)\cdot b = 0$$
  3.  Negative commutative: $a\times b = - b\times a$ (Trivial)
  4. Distributive: $a\times(b + c) = a\times b + a \times c$, and inverse distributive too: $(b + c)\times a = - a\times(b + c) = -a\times b - a \times c = b\times a + c \times a$ (Trivial)
* **Triplets (Scalar Triple Product)** $(a\times b)\cdot c = c\cdot (a\times b)$
	* It's equivalent to: 
		$$det
	\begin{bmatrix}
		c_1 & c_2 & c_3\\
		a_1& a_2& a_3\\
		b_1& b_2& b_3
	\end{bmatrix}$$which is the volume of the parallallagram in 3d, but do notice that we have to take the $\times$ first after the doc product, so the () doesn't really matter, but it's good to have it here. 
	* Denote $(a\times b)\cdot c$ as $[a, b, c]$ then $[a, b, c] = [b, c, a] = [c, a, b] = -[b, a, c] = -[a, c, b] = -[c, b, a]$, adhere to the rule of **matrix det**. 
	  * Because of this: $$a\times b \cdot c = b\cdot c \times a = a\cdot b \times c$$ ($(\times, \cdot)$ swappable) and (Tail and Head swappable)
	* ** Cute Properties**
		* **swapping** any 2 elements cases the sign to change, consider doing that to the standard basis, swaping the label of 2 of the axis is change the orientation of the coordinates. 
		* Notice that, **due to the property of the property of matrix det**, the triplets are **additive** $[a + d, b, c] = [a, b, c] + [d, b, c]$, etc. 
			* Similarly, by matrix det, we can know that repeated vector means zero triplets: $[a, a, b] = 0$, because there are no volume to 2d plan. 
			* Matrix det also allow the scalar to be taken out like: $[sa, b, c] = s[a, b c]$
			* Matrix det also allows that, if $a, b c$ are linearly independent, then $[a, b, c] = 0$
		* Another Interpretation 
			* $[i, j, k] = 1$, and using the addictive property, one can evaluate $[a, b c]$ without using the matrix determinant. 

---

### Applications
* Find a third vector perpendicular to any 2 vectors $a, b$, obeying the left hand rule. 
* Finding the area of the parallelogram by taking the absolute value of the cross product: $|a\times b|$
*  Find the equations of line intersected by 2 planes
	*  Planes's equations has the vector perpendicular to the pane it self.
	*  2 of the vector perpendicular to plane A, B can give a cross product to C
	*  The vector C will be point to the same direction as the line of intersection by A, B
*  $v = \omega\times R$
	*  $\omega$ is the angular speed in vector, perpendicular to the disk of rotation. 
	*  $R$ is the radius, a vector, located on any place the disk of rotation 
	*  The order is important and $v$ is a the velocity vector.

---

## Vector Identities
* Summary: 
  * Double Crosses (Triple Product\Jacobi Identity): $$a\times (b\times c) = (a\cdot c)b - (a\cdot b)c$$
  * Double Crosses Too (Triple Product\Jacobi Identity): $$(a\times b) \times c= (c\cdot a)b - (c\cdot b)a$$
  * Triple Crosses: $$(a\times b)\times(c\times d) = [a, c, d]b - [b, c, d]a = [a,b,d]c - [a,b,c]d$$
  * Cross dot Cross: $$(a\times b)\cdot(c\times d) = (b\cdot d)(a\cdot c) - (b\cdot c)(a\cdot d)$$
 
### Derivation
1. Double Crosses $a\times (b\times c) = (a\cdot c)b - (a\cdot b)c$
	* $b\times c$ is $\perp$ to both $b, c$, then $a\times(b\times c)$ will try to project it back to the subspace spanned by $b, c$, hence, the right hand side is a linear combination of $b, c\;$. 
	* Derive it by brute force, I don't think there are better way to do it. 
		* hand written proof: [Triple Product](../../Assets%20By%20Hands/Triple%20Product.jpg)
	* If $a, b, c$ are ortho, then this quantity is just zero. 
2. Double Crosses Too $(a\times b) \times c= (c\cdot a)b - (c\cdot b)a$
	* Using the previous one and cool properties, we know that: 
	* $-c\times(a\times b)$ by Cool properties
	* By the formula, this is gonna be: 
		* $-((c\cdot b)a - (c\cdot a)b)$
		* $(c\cdot a)b - (c\cdot b)a$
	* Although it's obvious but it's still worth pointing out that $$(a\times b)\times c \not= a\times (b\times c)$$
3. Triple Crosses: $(a\times b)\times(c\times d) = [a, c, d]b - [b, c, d]a = [a,b,d]c - [a,b,c]d$
	* $(a\times b)\times(c\times d)$
	* $(a\times b\cdot d)c - (a\times b\cdot c)d$ by **(1.)**
	* $[a,b,d]c - [a,b,c]d$, this is projecting onto $c, d$
	* Or we can use $a, b$ as the projection basis 
	* $(a\cdot (c\times d))b - (b\cdot(c\times d))a$ by **(2.)**
	* $[a, c, d]b - [b, c, d]a$
	* Regardless of with Triple Product we used, they should be the same. 
4. Cross dot Cross Product: $(a\times b)\cdot(c\times d) = (b\cdot d)(a\cdot c) - (b\cdot c)(a\cdot d)$
	* $(a\times b)\cdot(c\times d)$
		* Let $u = c\times d$
	* $(a\times b)\cdot u$
		* This is a Triple Product. 
	* $a\cdot b \times u$ Tail and head swappable
	* $a\cdot b\times (c \times d)$  !!Parenthesis Important
	* $a\cdot ((b\cdot d)c - (b\cdot c)d)$ By** (1.) **
	* $(b\cdot d)(a\cdot c) - (b\cdot c)(a\cdot d)$ By Dot Product Distribute

---
### Taking Derivative
It's not entirely obvious, but the product rule applies to the cross product operator.

$$(a\times b)' = (a' \times b) + (a\times b')$$

Notice that, because the operator is not commutative, hence we have to use this formula precisely the way it is. 