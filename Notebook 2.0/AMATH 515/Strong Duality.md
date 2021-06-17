[[Duality (Dualitzation More Examples)]]
We are going to discuss what strong duality is and stuff that is related to it. 

---
### Intro

Let's start with a primal and dual pair, the proof is skipped here;

Assuming that $h: Y \mapsto \mathbb{R}\cup \{-\infty, \infty\}$ and $g: E\mapsto \mathbb{R}\cup \{-\infty, \infty\}$, and $A$ is a matrix that maps from $E$ to $Y$. 

**Primal**: 

$$
\inf_{x\in E} \left\lbrace
    h(Ax) + g(x)
\right\rbrace
$$

And the Dual is given by dualizing the $h(Ax)$ function. 

$$
\sup_{y\in Y} \left\lbrace
    -h^*(y) - g^*(-A^Ty)
\right\rbrace
$$

And this is just a generic formulation for a class of primal and dual objectives 

However, say our objective is interested in the perturbations of the primal solutions. Hence let's define the perturbation function as: 

$$
p(y) := \min_{x\in E} \left\lbrace
    h(Ax + y) + g(x)
\right\rbrace
$$

Where, the perturbations are added to the function that we are dualizing. 

Take not that $p(0)$ is the primal problem, or the unperturbed problem is the primal problem. 

Observation: 

This is still not generic enough, we can make it more generic, and let's assume a function that contains both the primal and the dual variable in one system: 

$$
p(y) = \inf_ x F(x, y) \quad q(x):= \sup_y - F^*(x, y)
$$

The primal $p(y)$ is perturbing the parameters in the primal problem, and the $q(x)$ is perturbing the parameter in the dual problem. And they are linked in such a way that: 
1. Each of them is perturbating the other's parameters and optimizing their own objective decision variables. 

**Claim**: 

The double conjugate of the perturbation function on the primal, with $y = 0$, is the optimal objective with $x = 0$ for the dual. 

$$
p^{**}(0) = \sup_y \left\lbrace
    0^Ty - p^*(y)
\right\rbrace = \sup_y - F^*(0, y) = q(0)
$$

---
### Theorem 4.46

The strong duality basically said that the Primal Objective equals to the dual objective, and the sub differential at the objective value is the the solutions for the primal and the dual. 


