[[Jacobian and Hessian]]
Here we get some of the practical stuff from hw of the class which involves taking the derivative of some wacky real value function. 

---

### Ax Composition

let $A$ be a $m\times n$ matrix, let $f$ be a $\mathbb{R}^m \mapsto \mathbb{R}$ function, then taking the gradient on $f(Ax)$ will be like: 

$$
\nabla [f(Ax)] = A^T \nabla f(Ax) \tag{1}
$$

And the Hessian of the function will be like: 

$$
\nabla^2 [f(Ax)] = A^T \nabla f(Ax) \tag{2}A
$$

Proof is investigated in HW1 for the class. 

---
### Example: Poisson Regression with Regularization

Consider the scalar function: 

$$
f(x):=
\sum_{i = 1}^{m} \left(
    \exp(a_i^Tx) - b_i (a_i^Tx)
\right) + \frac{\lambda\Vert x\Vert^2}{2}
$$

Which is a common type of regularized regression problem, in this case, we are looking for the gradient and the Hessian of the objective function. 

Firstly, notice that the function consists of 2 parts, the first part is a composite function involving a matrix vector product and the second part consists of the regularization term. Therefore we could have: 
$$
g(Ax) := \sum_{i=0}^{m} \left(
    \exp(a_i^Tx) - b_i (a_i^Tx)
\right)
$$
$$
g(x) = \sum_{i = 0}^{m} \left(
    \exp(x_i) - b_ix_i
\right)
$$
$$
\nabla g(x) = \exp^E(x) - b
$$

Where $\exp^E(x)$ is element wise operations on an array, which is like: 

$$
\exp^E(x) = \begin{bmatrix}
    \exp(x_1) \\ \exp(x_2) \\ \vdots \\\exp(x_m)
\end{bmatrix}
$$

And therefore, the gradient of $f$ is gonna be like: 
$$
\nabla f(x) = \nabla [g(Ax)] + \nabla[\lambda\frac{\Vert x\Vert^2}{2}]
$$
> $$
> \nabla f(x) = 
> A^T(\exp^E(Ax) - b) + \lambda x
> $$

And it's not hard to see that, taking the Jacobian on the function $\nabla g(x)$ will yields a diagonal matrix because each of the element of the vector only relates to one of the variable, and therefore, we have: 

$$
\nabla^2 g(x) = \text{diag}(\exp^E(x))
$$

And applying the rules from (1), we have: 

> $$
> \nabla^2[f(x)] = A^T\text{diag}(\exp^E(Ax))A + \lambda I
> $$

### Example: Logistic Regression with Regularization

> $$
> f(x):=
> \sum_{i = 1}^{m} \left( 
>     \ln(1 + \exp(a_i^T x)) - b_i(a_i^Tx)
> \right) + 
> \frac{\lambda\Vert x\Vert^2}{2}
> $$

Notice that the summation part can be an implicit composition function: 

$$
g(Ax) = \sum_{i = 1}^{m} \left(
    \ln(1 + \exp(a_i^T x))
\right) + b^TAx
$$

So then in this case, we can use the Ax composition rule and get the expression as: 

$$
\nabla [g(Ax)] = A^T \nabla g(Ax) = A^T \frac{\exp(Ax)}{1 + \exp(Ax)}+ A^Tb
$$

And hence with regularization, the gradient of the function is just: 
$$
\nabla f(x) = A^T \nabla g(Ax) = A^T \frac{\exp(Ax)}{1 + \exp(Ax)}+ A^Tb + \lambda x
$$

And the Hessian of the function will be: 

$$
\nabla^2 f(x) = 
A^T \text{diag}\left(
    \frac{\exp^E(x)}{(1 + \exp^E(x))^2}
\right)A + \lambda I
$$


---
### High Dimensional Composition

Composition type: 
$$
(f:\mathbb{R}^m \mapsto \mathbb{R})\mapsto(G:\mathbb{R}^n \mapsto \mathbb{R}^m)
$$

Then the composition of $f\circ G$ is gonna be  like: 
$$
\nabla G(x)^T\nabla f(G(x))
$$
The Jacobian transposed multiplied by Gradient of F with G. The easiest case for $G(x)$ is $A$, and the Jacobian of $Ax$ is just $A$, and hence, the Formula we already gotten. 

The Hessian will be a different story because we need product rule here. 