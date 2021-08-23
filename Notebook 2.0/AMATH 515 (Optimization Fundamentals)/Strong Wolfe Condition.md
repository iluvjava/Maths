[[Line Search Gradient Descend]]


---
### **Intro**

> Given a descned direciton, we search for the best step size into the directon that assures a balance between sufficient objective decrease and suffcient stepsize. 
> 

In the relevant file above, we had steepest descend and the armijo line search. 

Here we introduce the: **Strong Wolfe Condition**. 

List of parameters: 

$$
c_1, c_2, \alpha, x^{(k)}, p, \nabla[f]
$$

* $\alpha$ is the step size that we want to determine, easily. 
* $0 < c_1 < c_2 < 1$ are 2 of the small constant that determines the behaviors of the line search algorithm. 
* $x^{(k)}$, the point are currently at. 
* $p$, the search direction, we **assume** that this is a search direction vector that brings decreases to the objective function. 
* $\nabla[f]$ The gradient operator. 

### **Wolfe Conditions**

> $$
> \begin{aligned}
>     f(x^{(k)} + \alpha p) \le& f(x^{(k)}) + c_1 \alpha \nabla [f^T](x^{(k)})p
>     \\
>     \nabla [f](x^{(k)} + \alpha p)^T p \ge& c_2 \nabla [f^T](x^{(k)}) p
> \end{aligned}
> $$

* The first conditions prevent it from over steping, stepping pass the local minima of a convex region (If there is any local minima and it's a convex region)

* The second condition will assert some kind of convexity constraint. It also makes sure that the step size is not too small. For sufficnetly small stepsaize, say $\alpha = 0$, it decreases the objective too much compare to the relaxed second ray, $c_2p^T\nabla[f](x^{(k)})$[^2]

The second condition is sometimes wrote as: 

$$
\left|
    p^T \nabla[f](x^{(k)} + \alpha p)
\right| - 
c_2
\left|
    p^T \nabla[f](x^{(k)}) 
\right| \le 0
$$

* Along the search direction, the gradient of the objective function is at least, decreasing, and increasing by a bit is allowed if $c_2 < 1$. 
* The absolute value ignore the direction information. 

**Intuitive Understanding People should have**

> The stepsize will have to stay below the first ray and the gradient at the new point must be less steep compare to the second ray. (The gradient is at least, decreasing). 



---
### **There exists a Stepsize that Satisfies the Wolfe Conditions**

I will call upon you imagination to imagine this proof as a 1d optimization problem. 

Let $f$ be $\mathbb{R}^n \mapsto \mathbb{R}^n$, consider a search direction that decreases the objective, meaning $\nabla[f^T](x_{\langle k\rangle})p_{\langle k\rangle} < 0$. Assuming $f$ is analytic and has a minima. 

Define: 

$$
\begin{aligned}
    \phi(\alpha) &= f(x_{\langle k\rangle}) + \alpha\nabla [f^T](x_{\langle k\rangle}) 
    \\
    l(\alpha) &= f(x_{\langle k\rangle}) + \alpha c_1 \nabla [f^T](x_{\langle k\rangle}) 
\end{aligned}
$$

Where $c_1\in (0, 1)$

Then, there exists $\delta$ such that the objective function is in between the 2 rays, by the assumption that it's continuous and the function has a minima. 

$$
\exists \;\delta : \phi(\delta) < f(x_{\langle k\rangle} + \delta p_{\langle k\rangle}) < l(\delta)
$$

Because $f$ bounded below but $l$ decreases indefinitely, choose smallest $\alpha'$ such that: 

$$
\begin{aligned}
    f(x_{\langle k\rangle} + \alpha' p_{\langle k\rangle}) &= f(x_{\langle k\rangle}) + c_1\alpha' \nabla [f^{T}](x_{\langle k\rangle})p_{\langle k\rangle}
    \\
    f(x_{\langle k\rangle} + \alpha' p_{\langle k\rangle}) - f(x_{\langle k\rangle}) &= c_1\alpha'\nabla[f^T](x_{\langle k\rangle})p_{\langle k\rangle}
\end{aligned}
\tag{1}
$$

By mean value theorem and the smooth assumption, there exists $\alpha'' \in (0, \alpha')$ such that: 

$$
f(x_{\langle k\rangle} + \alpha' p_{\langle k\rangle}) - f(x_{\langle k\rangle}) = 
\alpha' \nabla [f^T](x_{\langle k\rangle} + \alpha'' p_{\langle k\rangle})p_{\langle k\rangle} 
\tag{2}
$$

Combining (1) and (2) we have: 

$$
\begin{aligned}
    \alpha' \nabla[f^T](x_{\langle k\rangle} + \alpha'' p_{\langle k\rangle}) 
    &= 
    c_1 \alpha' \nabla[f^T](x_{\langle k\rangle})p_{\langle k\rangle}
    \\
    \underset{[1]}{\implies}
    \nabla[f^T](x_{\langle k\rangle} + \alpha'' p_{\langle k\rangle}) 
    &= 
    c_1 \nabla[f^T](x_{\langle k\rangle})p_{\langle k\rangle} > c_2 \nabla[f^T](x_{\langle k\rangle})p_{\langle k\rangle}
\end{aligned}
$$

\[1\]: This uses the fact that $c_2 > c_1$, therefor it will induce a larger amount of objective decrease compare to $c_1$ on the descend direction. 

Once the equality holds, it's not hard to choose a $\delta \in (0, \alpha'')$ to be the stepsize that satisfies the strong Wolfe conditions, with the smooth assumptions on the objective function $f$. 


---
### **Line Search Algorithm**

Armijo line search introduced in: [[Line Search Gradient Descend]] it's a simple implementations that eliminates over stepping and ensures sufficient objective decrease by terminating the forloop once sufficient decrease is satisfied. 


---
### **Sophisticated Line Search Algorithm**

Another approach will be more involved, it seeks to keep both wolfe conditions without too much evaluations of the gradient/value on the function. But it's actually not too hard. Let's take a look. 

What it tries to do is: 

> It tries to prob for a step size as long as possible, and then decide on an window before it starts searching. 






---
### **Good Properties**

It always decrease the objective. 

[^2]: The ray is $c_1 p^T\nabla[f](x^{(k)})$, which is a hyper plane above the second ray $c_2 p^T\nabla[f](x^{(k)})$ because $c_1 < c_2$ and we assume that $p$ is a search direction that induces objective decrease for the function. 