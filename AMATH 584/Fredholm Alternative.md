Some of the proofs need properties of [[Complex Vec Dot]]

---

#### Lin Alg: Only the Real

* Let's say that: $A \in \mathbb{R}^{m\times n}$, then we will know that: 
$$y^TAx = xA^Ty$$
replace the transpose with $*$ so it's compatible with complex matrix. 
* Consider the expression: $A^Ty = 0$, we can say that: 
	* $y$ is a zero eigen vector of $A^T$, or $y\in null(A^T)$. 
	* $y\in null(A^T) \implies xA^Ty = 0$ by def. 
	* Choose $x\notin null(A)$ making $Ax\in range(A)$
	* then $y\perp Ax$ because $y^TAx = 0$
	* which is $$null(A^T) \perp range(A)$$ and amazingly it's also true that $$null(A) \perp range(A^T)$$ **(1)**

* And you know what this means for solving $Ax = b$??? It means that $b\perp null(A^*)$ implies that the system is solvable because $b\in range(A)$ by (1). 
* Then the space is not spanned by the $A^T$, the adjoin operator is
*  the null space of the original operator called: $A$
* The complex equivalent for the Fredholm Alternative is simply changing transpose to Conjugate Transpose. 


---

#### Another proof but more concise.

Given any $A\in \mathbb{C}^{n\times n}$, let's start with the statement: 

> $$y^HAx = (x^HA^Hy)^*$$

Choose $y$ such that $A^Hy = \mathbb{0}$, then: 
$$x^HA^Hy = 0 \quad \forall x$$
$$y\in \text{null}(A^H)$$
But at the same time: 
$$y^HAx = 0 \quad \forall x$$
Which is saying: 
$$ 
y \perp \text{range}(A)
$$
$$
\text{null}(A^H) \perp \text{range}(A)
$$

So, let's frame this results here, this results is obtained by exploiting the properties of the Hermitian Adjoin: 

> $$
> \text{null}(A^H) \perp \text{range}(A) \hspace{2em} \text{null}(A) \perp \text{range}(A^H)
> $$

--- 


#### The Norm Equations