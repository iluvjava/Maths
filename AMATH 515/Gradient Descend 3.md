Prereq: [[Gradient Descend 2]]
Here we talk more on detail about non-fixed step size gradient descend method, some other advanced gradient method. And other Gradient Descend method that is fast, and state of the art. 

---

### Intro

For the class of beta smooth function, the gradient descend algorithm has an lower bound on its complexity. 

For all function that are Beta Smooth, there is an lower bound such that the gradient descend algorithm can never goes faster than that. 

### Definition: LEFM
One of the way for the analysis of the gradient descend algorithm to realized the fact that for each of the iterates during the gradient descend algorithm will have the relationship that: 

$$
x_k \in x_0 + \text{span}\left\lbrace
    \nabla f(x_0), \nabla f(x_1), \cdots \nabla f(x_{k - 1})
\right\rbrace
$$

### Theorem 2:30: Nesterov

$$
f(x_k) - f^* \ge \frac{3\beta \Vert x_0 - x^*\Vert^2}{32(k + 1)^2}
$$
$$
\Vert x_k - x^*\Vert^2 \ge \frac{1}{8}\Vert x_0 - x^*\Vert^2
$$
For all function of the Beta Smooth Class, the gradient descend algorithm is not going to be descending faster than this. 


---
#### Back Tracking Line Search Algorithm (Armijo)

The Armijo back tracking method make an initial step size that is huge, and then it decreases the step sie and probes until the desired objective decrease has been achieve. 

Let's take a look at the math: 

> $$
> f(x + \alpha \nabla f(x)) \le f(x) + \alpha c\nabla f(x) \tag{C1}
> $$

Where $c$: is the control parameter, $c\in (0, 1)$, and $\alpha$ is the step size, less than zero so it goes to the descend direction. 

This conditions is testing if alpha is over stepping, in the case of over stepping the objective value bounces back, but when it's not overstepping, the objective value should be less than the adjusted gradient approximate of the objective value. 

Algorithm: 

```python
set alpha = # Some negative number that you want. 
set c = # Some Control parameter in between 0 and 1
while not (C1): 
    alpha *= 0.5
```

#### Nesterov Accelerated Gradient (One of the Momentum Based GD)

The idea is to involve the previous step, and then use it to adjust the step for going to the next step. Let's take a look at the expression: 



#### Gauss Newton's Algorithm

it's a structure specific gradient descend algorithm apply for minimization problem of the form: 

$$
\min_x(f(x)) \quad \text{ Where }\quad f(x) = \frac{1}{2}\Vert F(x) - d\Vert^2
$$

Where $F(x): \mathbb{R}^n \mapsto \mathbb{R}^m$


#### Quasi-Newton Algorithm


