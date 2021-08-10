We are going to look at how Newton's method can be used in optimization and how we are going to analyze it. 


---
Newton's iteration in higher dimension is like: 

> $$
> x_{k + 1} = x_{k} - \nabla^2 f(x_{k})^{-1} \nabla f(x_{k})
> $$

And look for the point when the gradient of the function is zero. (Not always that case that it will give the optimal)

And notice that, this is very similar to the 1D case, but with Hessian and Gradient of the function. 

Observe that, this is adjusting the gradient descend direction in such a way that it's pointing to the smallest gradient as best as it can. 

**Assume that the Hessian is Positive Definite**: 

What can we say about the direction $\nabla^2 f(x_k)\nabla f(x_k)$? Is it a good direction for the newton's method to take if we want to optimize? 

**Def**: A direction $d$ is called a descent direction for $f$ at x if $d^T \nabla f(x) < \epsilon < 0$. 

Ex: When $\nabla^2 f(x)$ is positive definite, the the newton's direction is a descent direction. 

Because: 

$$
\nabla f(x_k)^T (\nabla^2 f(x_k)^{-1}\nabla f(x_k))
$$

Notice that is a an induced norm of the definite matrix, and it's equivalent to: 

$$
-\Vert \nabla f(x_k)\Vert^2_M \text{  Where: } M = \nabla^2 f(x_k)^{-1}
$$

Notice that, the inverse of an Positive Definite matrix is still an Positive Definite Matrix, because the eigenvalues of the inverse are just the reciprocal of the original. 

The Direction that the newton's Iterations is indeed going going into the descend direction. 

---
### Theorem: Descend Direction 

If $d$ is a descent direction then there is a $\gamma > 0$ so that: 
$$
f(x + rd) \le f(x)
$$

Assuming that the Hessian is positive definite at $x = x_0$

Proof: 

$$
f(x_0 + \gamma d) = f(x_0) + \gamma d^T\nabla f(x) + o(\gamma \Vert d\Vert)
$$

Exercise: Finish this proof. 

Questions and Observations: 
1. How do we find $\gamma$
2. Where do we use the Hessian? Did you use it anywhere? 

---
### Inspiration for Algorithm

$$
x_{k + 1} = x_{k} - \gamma_k H^{-1}_k \nabla f(x_k)
$$

Where $H$ is positive definite. 