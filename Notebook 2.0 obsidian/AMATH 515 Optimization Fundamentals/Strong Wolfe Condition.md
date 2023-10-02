[[Line Search Gradient Descend]]

Major Reference: `<Numerical Optimization>` by Stephen J. Wright. 

---
### **Intro**

> Given a descend direction, we search for the best step size into the direction that assures a balance between sufficient objective decrease and sufficient stepsizes. 

In the relevant file above, we had steepest descend and the armijo line search. Here we introduce the: *Strong Wolfe Condition*, an method that has a similar spirit as Armijo Line search. List of parameters: 

$$
c_1, c_2, \alpha, x^{(k)}, p, \nabla[f]
$$

* $\alpha$ is the step size that we want to determine, easily. 
* $0 < c_1 < c_2 < 1$ are 2 of the small constant that determines the behaviors of the line search algorithm. 
* $x^{(k)}$, the point are currently at. 
* $p$, the search direction, we **assume** that this is a search direction vector that brings decreases to the objective function, implying that we need $\nabla f(x^{(k)})^T p < 0$. 
* $\nabla[f]$ The gradient operator of function $f$. For our purposes, we assume it is Lipschitz continuous. 

### **Wolfe Conditions**

Wolfes condition imposes decrase in the objective value and convexity along the search direction, for an appropriately small value $\alpha$, and some other parameters $0 < c_1 < c_2 < 1$. 

#### **Def | Wolfe Conditions**
> The conditions are: 
> $$
> \begin{aligned}
>     f\left(x^{(k)} + \alpha p\right) 
>     \le& 
>     f\left(x^{(k)}\right) + c_1 \alpha \left\langle \nabla f(x^{(k)}), p\right\rangle
>     \\
>     \left\langle \nabla f(x^{(k)} + \alpha p), p\right\rangle \ge& c_2 \left\langle \nabla f(x^{(k)}), p\right\rangle
> \end{aligned}
> $$

**Observations**

* The first condition put a threshold on the amount of decrease from current function value $f(x^{(k)})$ by an amount proportional to $\langle \nabla f(x^{(k)}), p\rangle$, by the assumption that $p$ is a descent direction. 

* The second condition will assert convexity constraint. It also makes sure that the step size is not too small. Taking the limit of $\alpha\searrow 0$ yield the the projection of $p$ onto hessian's matrix at $x^{(k)}$. The value of $c_2$ adjust how much Positive Definiteness we want from the Hessian near the region of $x^{(k)}$ in the direction of $p$. To clarify, re-arranging we have: 
  $$
  \begin{aligned}
      \frac{1}{\alpha}\left\langle \nabla f(x^{(k)} + \alpha p), \alpha p \right\rangle 
      &\ge 
      \frac{c_2}{\alpha}\left\langle \nabla f(x^{(k)}), \alpha p \right\rangle
      \\
      \left\langle 
         \nabla f(x^{(k)} + \alpha p) - \nabla f(x^{(k)}), \alpha p 
      \right\rangle
      &\ge 
      \left\langle (c_2 - 1)\nabla f(x^{(k)}), \alpha p \right\rangle > 0 \quad \textcolor{gray}{\triangleright c_2 - 1 < 0}, 
  \end{aligned}
  $$
  and therefore, by descent direction, it's negative, and the multipler $(c_2 - 1)$ is also negative, this allows the local Hessian estimate to be, greater than zero, meaning in the direction of $f$, the function might be convex, assuming small enough $\alpha$. 

The second condition is sometimes wrote as: 

$$
\left|
    \left\langle p, \nabla f (x^{(k)} + \alpha p) \right\rangle
\right| - 
c_2
\left|
    \left\langle p, \nabla[f](x^{(k)}) \right\rangle
\right| \le 0, 
$$

* Along the search direction, the gradient of the objective function is at least, proportional to $c_2$. 

**Intuitive Understanding People should have**

> The stepsize will have to stay below the first ray and the gradient at the new point must be less steep compare to the second ray. (The gradient is at least, decreasing). 


---
### **There exists a Stepsize that Satisfies the Wolfe Conditions**

It suffice to prove the claim as a 1D optimization problem because the wolfe line search condition is designed for just one step of gradient descent. 

#### **Thm | Existence of a Stepsize**
> Let $f$ be $\mathbb{R}^n \mapsto \mathbb{R}$, consider a search direction that decreases the objective, meaning $\nabla[f^T](x^{(k)})p^{(k)} < 0$. Assuming $f$ is analytic and has a minima. Define quantities: 
> $$
> \begin{aligned}
>     \phi(\alpha) &= f(x^{(k)}) + \alpha \left\langle \nabla f(x^{(k)}), p^{(k)}
>     \right\rangle
>     \\
>     l(\alpha) &= f(x^{(k)}) + \alpha c_1 \left\langle \nabla f (x^{(k)}), p^{(k)} \right\rangle
> \end{aligned}
> $$
> Where $c_1\in (0, 1)$ Then, there exists $\delta$ such that the objective function is in between the 2 rays, by the assumption that it's continuous and the function has a minima. Mathematically $\exists \;\delta : \phi(\delta) < f(x^{(k)} + \delta p^{(k)}) < l(\delta)$. 

**Proof**

Because $f$ bounded below but $l$ decreases indefinitely as $\alpha \rightarrow \infty$. By $p$ being a descent direction, $f(x^{(k + 1)}) = f(x^{(k)} + \alpha' p^{(k)}) < f(x^{(k)})$, by continuity of $f$, it's possible to choose a smallest $\alpha'$ such that it imposes the exactly amount of decrease by the positive multiplier $c_1 > 0$. 

$$
\begin{aligned}
    f(x^{(k)} + \alpha' p^{(k)}) &= f(x^{(k)}) + 
    c_1\left\langle \alpha' \nabla f(x^{(k)}), p^{(k)} \right\rangle
    \\
    f(x^{(k)} + \alpha' p^{(k)}) - f(x^{(k)}) &= 
    c_1\alpha'
    \left\langle 
      \nabla f(x^{(k)}), p^{(k)} 
    \right\rangle, 
\end{aligned}
\tag{1}
$$

By mean value theorem, the assumption that $f$ being smooth and $0 < c_1 < 1$, there exists $\alpha'' \in (0, \alpha')$ such that: 

$$
  f(x^{(k)} + \alpha' p^{(k)}) - f(x^{(k)}) = 
  \alpha' \left\langle 
    \nabla f(x^{(k)} + \alpha'' p^{(k)}), p^{(k)}  
  \right\rangle, 
  \tag{2}
$$

Combining (1) and (2) we have: 

$$
\begin{aligned}
    \alpha' \nabla f(x^{(k)} + \alpha'' p^{(k)}) 
    &= 
    c_1 
    \left\langle \alpha' \nabla[f](x^{(k)}), p^{(k)}\right\rangle
    \\
    \underset{[1]}{\implies}
    \nabla f(x^{(k)} + \alpha'' p^{(k)}) 
    &= 
    \left\langle 
      c_1 \nabla f (x^{(k)}), p^{(k)} 
    \right\rangle
    > c_2 \left\langle 
      \nabla f (x^{(k)}), p^{(k)}
    \right\rangle
\end{aligned}
$$

\[1\]: This uses the fact that $c_2 > c_1$, therefor it will induce a larger amount of objective decrease compare to $c_1$ on the descend direction. Once the equality holds, it's not hard to choose a $\delta \in (0, \alpha'')$ to be the stepsize that satisfies the strong Wolfe conditions, with the smooth assumptions on the objective function $f$. 

**Remarks**

These are part 3.1 in Stephen J. Wright's textbook, Numerical Analysis. 


---
### **Basic Line Search Algorithm**

Armijo line search introduced in: [[Line Search Gradient Descend]] it's a simple implementations that eliminates over stepping and ensures sufficient objective decrease by terminating the forloop once sufficient decrease is satisfied. 


---
### **Sophisticated Line Search Algorithm**

Another approach will be more involved, it seeks to keep both wolfe conditions without too much evaluations of the gradient/value on the function. But it's actually not too hard. Let's take a look. The following take references from *algorithm 3.5, 3.6 in the Numerical Optimization textbook*. 

> Given a descent direction $p^(k)$ based on current iterates $x^{(k)}$, the algorithm tries to prob for a step size as long as possible, and then decide on an window before it starts searching. To start, we define the following scalar function that models the value of $f$ along the search direction: $\phi(t) = f(x^{(k)} + t p^{(k)})$

The function is achored at the previous guess of the solution and prob into the direction of $p^{(k)}$ with distance $t$. 

**Preconditions**

$\phi(0) \ge 0$, $\phi(t)$ is bouned blow. 

**Algorithm 1 | Forward Probing**

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

* `[1]`: If the current step size, $\alpha_i$ breaks the first wolfe condition by not creating enough decrease on the relaxed tagent line, OR, It's the first step and we over stepped leading to objective increase, then: 
  * Shrinks the search step by zooming in between the previous step size and the current step size.
* `[2]`: The first wolfe conditions is satisfied, and the magnitude of the gradient along the step size satisfied the second wolfe conditions, decreasing in magnitude. 
  * Strong Wolfe conditions satisfied, terminates. 
* `[3]`: Second and first wolfe conditions are not satisfied, and the gradient along the step size is increasing, we need to shrink the step size. 
  * zoom into $\alpha_i$ and previous stepsize $\alpha_{i - 1}$
* `[4]`: The objective direction doesn't satisfies any of the wolfe conditions, and the gradient is getting smaller along the direction, we can be greedy and push further. 
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