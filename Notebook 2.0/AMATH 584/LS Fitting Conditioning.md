Here we will be focusing on the stability and conditioning of a particular problem, Linear least square fitting 

prereq: [[Stability and Conditioning]], [[SVD]]

SVD is need to understand some of the analysis of the condition of the least square problem. 

---

#### Setting Up The Problem 

Here, we first need to set up some of the quantities we are going to use for the LS square fitting, and hopefull some of them will draw some meaning for the analysis which comes in the later parts of the discussion. 

Assume a full rank matrix $A\in \mathbb{C}^{m\times n}$ with $n < m$. So this is an determined system where the null space of the matrix is empty. 

Here is a list of quantities we will be using to represent the stability properties of the lest-squared algorithm. 

Firstly, the condition number of the full-ranked matrix $A$ is going to be: 

> $$\kappa(A) = \frac{\sigma_1}{\sigma_n}$$

> $$y = Ax$$

Then, the projection angel from the vector $b$ to the subspace spanned by the range of the $A$ matrix.

> $$\theta = \arccos{\frac{\Vert y\Vert}{\Vert b\Vert}}$$

And this is the Eta, which is something bounded by the condition number of the matrix $A$: 

> $$\eta = \frac{\Vert A\Vert\Vert x\Vert}{\Vert y\Vert}$$

Now let's remind ourselves the, the relative condition number of a matrix is defined as: 
$$\underset{\Vert x\Vert = 1}{\sup} \frac{\Vert A\Vert \Vert x \Vert}{\Vert Ax\Vert}$$

And this is hinting that, some times, a solution of $x$,  might have the change os capping out the quantity $\eta$, and it's also true that: 

> $$1 < \eta \leq \kappa(A)$$

---
#### LS Problem

The Linear Least Square problem: 

The setup of our problem is perfect for the LS fitting problem, and it can be directly computed by using the Moore Penrose Inverse (Discussed here: [[Projector]]): 

$$x = A^\dagger y = (A^HA)^{-1}A^Hb$$

And the solution of the projection of the vector $b$ onto the range of the matrix. 

And notice that: $A^HAx = A^Hb$, which is easier to remember, and $range(A)\perp null(A^H)$ will give some intuition here because the complementary components of the $range(A)$ is in the null space of $A^H$

---

#### Theorem 18.1 (Trefethen)

This theorem is going to be cited directly from Trefethen's book on Numerical LInear Algebra: 

> $$\underset{b\mapsto y}{\kappa} = \frac{1}{\cos{\theta}}$$

This describes the conditioning when be pertubated the value $b$ and how it affects the $y$ on the output space of the problem. 

This is saying that, if the vector $b$ is perpendicular to the range of the matrix, then, a tiny pertubations on the vector b is going to cause big changes on the projection of the vector. (namely from zero to something that is nonzero). And this can happens in just right way that, catastrophic cacellation errors creeps into the system. 

**Note**:  it's linear, and therefore, combining the condition number is able to described composite pertubations on the inputs space of the function affecting the outputs of the function. 

> $$\underset{b \mapsto x}{\kappa} = \frac{\kappa(A)}{\eta \cos{\theta}}$$


Notice the pertubations on the quantity $x$ (The projection of b onto the range of the matrix and then described in the $\mathbb{C}^m$), will induce more changes if the matrix $A$ is ill-conditioned, and it also depends on how close $x$ is to the vector that produce the worst conditioning for the matrix $A$. 

Under the special case where: $\kappa(A) = \eta$, meaing that $x$ is the vector the gives he worst conditioning of the matrix $A$, then the conditiong becomes the same the conditioning to the vector $y$. 

> $$\underset{A\mapsto y}{\kappa} = \frac{\kappa(A)}{\cos{\theta}}$$

This is the conditioning for inducing on the quantity $A$ and measuring it on $y$. 

> $$\underset{A\mapsto x}{\kappa} = \kappa(A) + \frac{\kappa(A)^2 \tan\theta}{\eta} $$

--- 

#### Simple Demo

I am just going to demonstrate the conditioning for the easier ones in the Trefethen's book, and then the rest I will skip because it's a big topic and it's complicated. 

