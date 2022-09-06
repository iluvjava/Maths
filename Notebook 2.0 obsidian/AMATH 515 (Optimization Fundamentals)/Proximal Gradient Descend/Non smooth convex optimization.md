We are gonna look at another type of optimization problems, and we will look out for the case when the function is not smooth. 

Non-smooth: The functions don't have to be differentiable. 

However, we are also assuming that the function is the sum of a beta smooth function and a non-smooth function. This is a lot of assumptions and it actually enclose a lot of classes of problems. 

[[Introduction to Convexity]]

This file includes the following concepts: 

1. What specific type of optimization we are studying and some of the examples. 
2. Definition of the sub-gradient that can be mixed represented as convexity.
3. Definition of sub-differential, which is just the set of all possible sub-gradient. 
4. Merge the above concepts with the optimality conditions of the convex functions. 
5. The idea of using objective functions and augmented reals realm to represent constrained optimization problems
6. The Projection operator
7. The proximity operator. 
8. Key takeaway for these definitions in regards to problem we studied.

Here is a list of very interesting ideas: 
1. We can use the convex indicator function to change the objective function so the problem become an unconstrained optimization problem but the solution will remain the same as the constrained problem.
2. Choosing the step size for non-smooth convex function needs the Harmonic Sequence. 
3. When we have a convex indicator function, the gradient search process can be reduced into a geometrical process. Somewhat like non-linear convex optimization? 

---
### **Intro**
Target: 

$$
\min_x (f(x)) := g(x) + h(x)
$$

$g(x)$: **beta smooth**

$h(x)$: **non-smooth convex function** (Simple Functions for now).

Example: Constraints piece-wise functions

$$
\min_x (g(x)): x \ge 0
$$

So this is a piece wise function. 

Example: Non-smooth with indicator functions

$$
\min_x (g(x) + \delta_c(x))
$$

Where the indicator function is like: 
$$
\delta_c (x) := \begin{cases} 
    1 & x \in C \\ \infty & x \not\in C
\end{cases}
$$

So in the case of a constraints optimization, like linear programming, we can just take the constraints and use the indicator function to merge it into the objective function, reducing the problem to a non-smooth optimization problem. 

Example: **Non-smooth regularization**

Often we add the regularization term: $\lambda||x||^2$, which decreases the variance of the solution, and it adds biases to zero solutions. This is the famous **Ridge Regularization**, and there is also the **Lasso Regularization**, which uses the $||x||_1$ norm. 

This type of the regularization (**Lasso**) makes the coordinate of the solution to be zero, thus identifying the "Important" predictors.

Lasso Regularizer is a non-smooth optimization problem.

Group Penalty: 

$$
\lambda(||x_1||_2 + ||x_2||_2 + ||x_3||_2)
$$

This this will try to zero out a whole group of the predictors. Compare to Lasso, it won't try to zero out the predictors individually. **This is useful for testing some of the hypothesis, or it can try to include domain specific knowledge into the statistical optimization process**.

Example: Elastic Net

The regularization term is: 

$$
\lambda \left(
\frac{\Vert x\Vert_1}{2} + \frac{\Vert x\Vert_2}{2}
\right)
$$

It will identify **correlated groups**. Variables that has a high correlations will naturally comes together. The one-norm will helps us to identify it. 

**Note**: What is inside the parenthesis is some kind of linear combinations of the 1-norm and 2-norm 


**A High level Overview**: 

So In general, the non-smooth optimizations is involving the following elements: 
1. A Generalized Linear model
2. Severals Regularization
3. Some kind of constraint molded into the objective.


---
### **Subgradient and Sub-differential**

From characterization of the convex function we have: 
$$
f \text{ covex }, C^1 \iff f(y) \ge f(x) + \nabla f(x)^T(y - x)
$$

Building on this, we are going to build the idea of sub gradient. When the function is view at the point that is not smooth, we can view it as if it has a lot of tangent like at the point. 

**Subgradient**: Slope of the line such that the function still stays above the line. 

**Definition**: 

$v$ is a subgradient to $f$ at $x$ if: 

$$
f(y) \ge f(x) + v^T(y - x) \quad \forall y
$$

And in this case, the $v$ is just the slope. **Set of all sub-gradients** of the $f$ at the point $x$ is called the **sub-differential** of the function, which is written as: $\partial f(x)$

Fact: If $v$ is unique then $f$ is differentiable at $x$ then $v = \nabla f(x)$. 

Example: The absolute value: $|\cdot|$

$$
\partial (|\cdot|)(0) = [-1, 1]
$$

$$
\partial (|\cdot|)(1) = \{1\}
$$

---
#### **Optimality Conditions for Convex Function**

$0\in \partial f(x)$ and $f(x)$ is convex --> $x$ is a global min. This is the case because: 

$$
f(y) \ge f(x) + \mathbf{0}^T (y - x) \quad \forall y
$$

**Question:** Can we just use subgradient descent to optimize? 

**Answer:** We have to be careful, in some cases it works well. 

$$
\min_{x}(f(x))
$$

And the gradient descent with the sub-gradient is like: 

$$
x_{k + 1} = x_k - \gamma_k v_k \quad v_k \in \partial f(x_k)
$$

In some cases, we have no idea that we have reached the global optimal, because they can give you any gradient from the sub-differential, and then we will jump off from the optimal. This is very hard to get the entire set of sub-differential from a high dimensional function. 

**Strategy**: We want $\gamma_k$, **the step size to goes to zero, but not too fast**! So this means that, we goes into the global minimal, but we want the gradient to be less and less, so we don't bounce out of the optimal. (Not converging). Harmonic series does the trick. 

And here is the conditions we are expecting for the step-size for the non-smooth optimization: 

$$
\sum_k{\gamma_k} = \infty  \;\wedge \; \lim_k \gamma_k^2  = 0
$$

The first conditions assert that we will never stuck in a region that is inside the domain because the total mount of distance moved in the domain can sum up to infinity and the second condition is for analysis. 

Example for Stepsizes: 

$$
\gamma_k = \frac{1}{k}
$$

In this case, the sum of the distance moved is going to infinity, and the square of the terms will gives us a convergent series. And the simplest algorithm is gonna be like: 

$$
x_{k + 1} = x_k - \frac{1}{k}v_k
$$


And the convergent rate is gonna be like: 

$$
\mathcal{O}
\left(
    \frac{1}{\sqrt{k}}
\right)
$$
for convex function. 

**Note**: In this case, we don't know much about the function $f(x)$, and we didn't use the fact that the objective function is the sum of some non-smooth convex and beta smooth function. 

Using the assumption that the objective function is the sum of a non-smooth function and a beta smooth function, we can say the following thins about the sub-gradient of the function: 

$$
0 \in \partial f(x) \iff 0 \in \nabla g(x) + \partial h(x) \implies -\nabla g(x) \in \partial h(x)
$$
	
This is the Optimality conditions.

Notice that, we are assuming something that is true here: $\partial f(x)$ of any function is a "square" in $\mathbb{R}^n$, this allows we to **shift the set wrt to a vector**. 

---
### **Definition: Projection**

Give a set $C$ and a vector $z$, we call the **closest point** in $C$ to $z$ the Projection of $z$ onto $C$. 

$$
\text{proj}_{C}(z) := \underset{x\in C}{\text{argmin}} ||x - z||
$$

With the assumption that $C$ is convex, we know that $\text{proj}_C(z)$ is unique.  

This is the case because: 

$$
\text{proj}_{C}(z) = \underset{x\in C}{\text{argmin}}(||x - z|| + \delta_C(x))
$$

Where we include the convex set indicator function into the objective, this is the sum of the strong convex function and a convex function, so this is going to have a unique minimizer. 

These type of optimization problem can be solved easily with geometric principals. Recall: "**Hyper Plane Separations from linear programming?**"

---
### **Definition: Proximity**

Given any convex function $h(x)$ and $h>0$, define

$$
\underset{t,h}{\text{prox}}(z) := \underset{x}{\text{argmin}}
\left(
    \frac{1}{2t} \Vert x - z\Vert^2 + h(x)
\right)
$$

This is the proximity operator, and this is the generalization of the projection operators. 

Take $h(x)$ to be $\delta_C(x)$, the definition decays into the definition of set projection. 

**Upshot**: As for projection, we can compute $\text{prox}_{th}$ in closed form for many function $h(x)$. Under the case when $h(x)$ is simple, we can compute it as proximity fairly easily. 

---
### **Key Takeway**

$g(x)$: Beta smooth. 

$h(x)$: Is convex, and can be non-smooth 

$f(x) = g(x) + h(x)$

$$
g(y) + h(y) \le g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2}\Vert y - x\Vert^2 + h(y) \le m_x(y)
$$

We are going to break this down, and see what part of the these objective function we can best optimize and how it looks like, and in the end. 

The RHS can be simplified (completing the square): 

$$
g(x) + 
\left\lbrack
    \frac{\beta}{2} \left\Vert
    y - \left(
            x - 
            \frac{1}{\beta}\nabla g(x)
        \right)
    \right\Vert^2
    + h(y)
\right\rbrack
    - 
    \frac{1}{2\beta} \Vert 
        \nabla g(x)
    \Vert^2 
$$

**BOOM**: This a nest sub-problem we solve for each step of optimization on the larger problem! because, it seems to mimizes over the local area around $x$, with the non-smooth assumption as well. However, $h(x)$ can't be too fancy. Or else this is going to be a very hard problem.

Notice that, we can optimize the part that is in the brackets, giving us: 

$$
\underset{y}{\text{argmin}}\left(
\frac{1}{2/\beta}  
\left\Vert
    y - \left(
            x - 
            \frac{1}{\beta}\nabla g(x)
        \right)
    \right\Vert^2
    + h(y)
\right)
$$

Notice that it's the fitting the definition of the proximity operator, which is: 
$$
\underset{h,1/\beta}{\text{prox}} \left(
    x - \frac{1}{\beta}\nabla g(x)
\right)
$$

When the function $h(x)$ can give us closed form solution $h(x) = \delta_C(x)$, we can use the set projection, which means that: 

$$
\underset{C}{\text{proj}} \left(
    x - \frac{\nabla g(x)}{\beta}
\right)
$$

This! Is an easier problem to solve.

The general algorithm them becomes: 

$$
x_{k + 1} = \underset{h,1/\beta}{\text{prox}}\left(
    x_k - \frac{\nabla g(x_k)}{\beta}
\right)
$$

This is very interpretable. 

#### **Optimality Conditions When not an Indicator Function**

Here, we are interested in the the optimality conditions for the proximal operator: 
$$
\underset{t, h}{\text{prox}}(y) := 
\underset{x}{\text{argmin}}\left(
    \frac{1}{2t} \Vert x - y\Vert^2 + h(x)
\right)
$$

We make the assumption that $h(x)$ is convex but it could be non-smooth, and this leads to taking the derivative on the smooth function, and sub-differential on the non-smooth function: 

$$
0 \in \frac{1}{t}(x - y) + \partial f(x)
$$
$$
0 \in (x - y) + t\partial f(x)
$$
$$
y\in x + t\partial f(x)
$$

And it's not that nice if we don't have some kind of concrete examples. 

---
### **Exercise Proximal Projection**: 

Given: $l\le x \le u$
$$
C:= \{x: l\le x \le u\}
$$

Where $u$, $l$, are vectors with matching size compare to $x$. 

This is like a box, and we can write it like: 

$$
l\le
\begin{bmatrix}
x_1 \\ x_2 \\ \vdots \\ x_n
\end{bmatrix}
\le
u
$$

And that means the projection is basically, element-wise we can say that: 

$$
(\underset{C}{\text{proj}}(z))_i = 
\begin{cases}
    l_i & z_i > u_i \\
    z_i & l_i \le z_i \le u_i \\
    u_i & z_i > u_i
\end{cases} \quad \forall i
$$

In addition, notice that, the problem can be translated in another way that helps us here. 

Let's consider that: 

$$
C: = \left\lbrace 
    x \in \mathbb{R}_{+}: x\le l
\right\rbrace
$$

Then: 

$$
\underset{C}{\text{proj}}(z) = \max(\min(z, l), 0)
$$

so in general is gonna be like: 

$$
\max(\min(z, u), l)
$$

**Note**: The min, max operators here apply to the vector in an element wise fashion.

---
### **Simple L1 Norm and Regression**

$$
\arg\min_x \left\lbrace
    \frac{1}{2} \Vert x - c \Vert^2 + \lambda\Vert x\Vert_1
\right\rbrace
$$

This is just a general quadratic. We want to optimize this, to get some idea on how sub-gradient works on in this case. 

Consider the sub gradient of this: 

$$
0 \in (x - c) + \partial[\Vert x\Vert_1]
$$

Let's assume that $x = 0$, so that $\partial [\Vert x\Vert_1] = 0$

$$
0 \in [-c - \lambda, -c + \lambda]
$$

$0$ is the optimal, whenever $[-c -\lambda, -c + \lambda]$ includes lambda, not hard to see it's the case when $c < \lambda$. 

Let's assume that $x\ne 0$, so that $\partial[\Vert x\Vert_1] = \text{sign}(x)$ then: 

$$
0 \in (x - c) + \text{sign(x)} \implies x \in \text{sign(x)} - c
$$


**What is the deal here**? 

This is written way after the course ended. It's made to highlight the fact that, the nested, inner optimization problem we solved, call the proixmal problem, directly solves the 2-norm with any other non-smooth function. It's like, we are solving this, easier version of the optimization problem locally, with the proximal gradient in order to get closer to the real optimization peoblem. 

It's like, Ok, we are going for that best point which optimize the Smooth part of the function, but then, we have to deflect ourself for the non-smooth part. Then Boom, Proximal Operator was born. 