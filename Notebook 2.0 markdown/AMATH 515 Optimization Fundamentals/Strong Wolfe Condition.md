[Line Search Gradient Descend](Gradient%20Descend/Line%20Search%20Gradient%20Descend.md)

Major Reference: `<Numerical Optimization>`

---
### **Intro**

> Given a descend direction, we search for the best step size into the direction that assures a balance between sufficient objective decrease and sufficient stepsizes. 
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

* The first conditions prevent it from over stepping, stepping pass the local minima of a convex region (If there is any local minima and it's a convex region)

* The second condition will assert some kind of convexity constraint. It also makes sure that the step size is not too small. For sufficiently small stepsize, say $\alpha = 0$, it decreases the objective too much compare to the relaxed second ray, $c_2p^T\nabla[f](x^{(k)})$[^2]

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
### **Basic Line Search Algorithm**

Armijo line search introduced in: [Line Search Gradient Descend](Gradient%20Descend/Line%20Search%20Gradient%20Descend.md) it's a simple implementations that eliminates over stepping and ensures sufficient objective decrease by terminating the forloop once sufficient decrease is satisfied. 


---
### **Sophisticated Line Search Algorithm**

Another approach will be more involved, it seeks to keep both wolfe conditions without too much evaluations of the gradient/value on the function. But it's actually not too hard. Let's take a look. 

What it tries to do is: 

> It tries to prob for a step size as long as possible, and then decide on an window before it starts searching. (This part is algorithm 3.5, 3.6 in the Numerical Optimization textbook)

Let's define a scalar function: 

$$
\phi(t) = f(x^{(k)} + t p^{(k)})
$$

The function achored at the previous guess of the solution and prob into the direction of $p^{(k)}$ with distance $t$. 

**Preconditions**

$\phi(0) \ge 0$, $\phi(t)$ is bouned blow. 

**Algorithm 1: Forward Probing**

Initialize: 

$\alpha_0 = 0$, choose $\alpha_{\max} \ge 0$ and $\alpha_1 \in (0, \alpha_{\max})$


> $$
> \begin{aligned}
>     & i := 1
>     \\
>     & \text{while true:}
>     \\
>     &\hspace{1.1em}
>     \begin{aligned}
>         & \text{if } \phi(\alpha_i) \ge \phi(0) + c_1 \alpha_i \phi'(0) \text{ OR } (\phi(\alpha_i) \ge \phi(\alpha_{i - 1}) \text{ AND } i > 1) \quad \#[1]
>         \\
>         &\hspace{1.1em} \alpha_* \leftarrow \text{zoom}(\alpha_{i - 1}, \alpha_i)
>         \\
>         &\hspace{1.1em} \text{return } \alpha_*
>         \\
>         & \text{if } |\phi'(\alpha_i)| \le - c_2 \phi'(0) \quad\#[2] 
>         \\
>         & \hspace{1.1em} \text{return }\alpha_* \leftarrow \alpha_i
>         \\
>         & \text{if } \phi'(\alpha_i) \ge 0 \quad \#[3]
>         \\
>         & \hspace{1.1em} \alpha_* \leftarrow \text{zoom}(\alpha_i, \alpha_{i - 1})
>         \\
>         & \hspace{1.1em} \text{return }\alpha_*
>         \\
>         & \alpha_{i + 1} \in (\alpha_i, \alpha_{\max}) \quad \#[4]
>         \\
>         & i \leftarrow i + 1
>     \end{aligned}
> \end{aligned}
> $$

The High Level Idea: 

We want to step as much as possible, without breaking the strong wolfe conditions due to overstepping in this direction. 

**Explanations** 

`[1]`: If the current step size, $\alpha_i$ breaks the first wolfe condition by not creating enough decrease on the relaxed tagent line, OR, It's the first step and we over stepped leading to objective increase, then: 
  * Shrinks the search step by zooming in between the previous step size and the current step size.

`[2]`: The first wolfe conditions is satisfied, and the magnitude of the gradient along the step size satisfied the second wolfe conditions, decreasing in magnitude. 
  * Strong Wolfe conditions satisfied, terminates. 

`[3]`: Second and first wolfe conditions are not satisfied, and the gradient along the step size is increasing, we need to shrink the step size. 
 * zoom into $\alpha_i$ and previous stepsize $\alpha_{i - 1}$

`[4]`: The objective direction doesn't satisfies any of the wolfe conditions, and the gradient is getting smaller along the direction, we can be greedy and push further. 
  * Probe further by choose a new step size $\alpha_i\in(\alpha_i, \alpha_{\max})$. 


**Algorithm 2: Local Zooming**

**Inputs**: $\alpha_h$, $\alpha_l$, an upper bound and an lower bound for the search. 

**Initialization**: choose any bounded scalar optimization subroutine to choose $\alpha_i\in (\alpha_l, \alpha_h)$. It could be parabolic search, cubic search, tri-section search of golden section search. 

> $$
> \begin{aligned}
>     & \text{while True:}
>     \\
>     & \alpha_j \leftarrow \text{Subroutine}(\alpha_l, \alpha_h)
>     \\&\hspace{1.1em}
>     \begin{aligned}
>         & \text{if }\phi(\alpha_j) \ge \phi(0) + c_1 \alpha_j \phi'(0) \text{ OR } \phi(\alpha_j) \ge \phi(\alpha_l)\quad \#[1]
>         \\
>         &\hspace{1.1em} \alpha_h \leftarrow \alpha_j
>         \\
>         & \text{else}
>         \\ 
>         &\hspace{1.1em} 
>         \begin{aligned}
>             & \text{if } |\phi'(\alpha_j)| \le - c_2 \phi'(0)
>             \\
>             & \hspace{1.1em}\text{return } \alpha_j
>             \\
>             & \text{if } \phi'(\alpha_j) (\alpha_h - \alpha_l) \ge 0 \quad \#[2]
>             \\
>             &\hspace{1.1em} \alpha_h \leftarrow \alpha_l
>             \\
>             & \alpha_l \leftarrow \alpha_j
>         \end{aligned}
>     \end{aligned}
> \end{aligned}
> $$

**Explanation:**

After probing for a accepted shortest length by **algorithm 2** is invoked to shorten the step size given by **algorithm 1**. **Algorithm 2** runs a subroutine to search for minimum then check for Wolfe conditions. If we over stepped, then we shrinks, if we overstep so much it increases the objective, then we swap the search direction. 

`[1]`: Wolfe first conditions is not satisfied, or the objective is increasing, then we shorten the search range. 

`[2]`: The first Wolfe and second Wolfe conditions are not satisfied and along the direction going from $\alpha_l \rightarrow \alpha_h$, we made the objective increases. Then: 
  * Swaps the search direction and shrink the interval to be $(\alpha_l, \alpha_j)$
  * This is done by a trick to change the upper and lower bound. 

**Note**, it doesn't matter whether $\alpha_h$ is less than $\alpha_l$. 

---
### **Good Properties**

It always decrease the objective. 

[^2]: The ray is $c_1 p^T\nabla[f](x^{(k)})$, which is a hyper plane above the second ray $c_2 p^T\nabla[f](x^{(k)})$ because $c_1 < c_2$ and we assume that $p$ is a search direction that induces objective decrease for the function. 