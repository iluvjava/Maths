[Proximal Gradient via Forward Backwards Envelope](Proximal%20Gradient%20via%20Forward%20Backwards%20Envelope.md), read this to understand some basic properties about the envelope and such. 

---
### **Intro**

We still assume that the function $g(x)$ has a gradient and it's strongly smooth constant $L$ and we also would assume that $f$ is convex not not necessarily smooth, recall from the previous file of the following facts: 


1. $G_\beta - \nabla g(x) \in \partial h(x^+)$ with $x^+ \in \text{prox}_{h, \beta^{-1}}(x - \beta^{-1}\nabla g(x))$, and this general condition is true for all values of $x$. We refers $G_\beta(x)$ as the residual of the proximal gradient algorithm. Finally, $G_\beta(x) = \beta(x - x^+)$. This is the fixed point error of the proximal gradient operator, and it's also the velocity of the trajectory made by the proximal gradient algorithm. 
2. By choosing the stepsizes $\beta^{-1} \le L^{-1}$, we assert strict decrease of the value of the objective function, $f(x^+) \le f(x)$. 

**References**: [here](https://people.eecs.berkeley.edu/~elghaoui/Teaching/EE227A/lecture18.pdf). A coursenotes used for UC Berkley. 


---
### **A Classical Proof of the Convergence Rate**

From the strong smoothness of the function $g(x)$, we have the condition that: 

$$
\begin{aligned}
    g(x^+) 
    & \le g(x) + \langle \nabla g(x), x^+ - x\rangle + \frac{L}{2}\Vert x - x^+\Vert^2
    \\
    & \le 
    g(x) - \beta^{-1}\langle \nabla g(x), G_\beta(x)\rangle + \underbrace{\frac{L}{2\beta^2}\Vert G_\beta(x)\Vert^2}_
    {
        \le \frac{1}{2\beta}\Vert G_\beta(x)\Vert^2
    }, 
\end{aligned}\tag{1}
$$

which is direct from the strong smoothness of the function $g$ and the step sized chosen. Next, we consider the convexity assumption on function $f, h$ giving us: 

$$
\begin{aligned}
    & g(x) \le g(z) - \langle \nabla g(x), x - z\rangle
    \\
    & h(x^+)\le h(z) + \langle \partial h(x^+), x^+ - z\rangle, 
\end{aligned}
$$

which is true for any $x$ and $z$ in the context. Defining the objective function $f(x) = g(x) + h(x)$, by adding the term $h(x^+)$ on both side of (1), we obtain

$$
\begin{aligned}
    g(x^+) + h(x^+) 
    & \le 
    g(x) + \beta^{-1}\langle \nabla g(x), G_\beta(x)\rangle + \frac{1}{2\beta}\Vert G_\beta(x)\Vert^2 + h(x^+)
    \\
    & \le 
    g(z) + 
    \underbrace{\langle \nabla g(x), x - z\rangle }_{[1]}
    - 
    \underbrace{\beta^{-1}\langle \nabla g(x), G_\beta(x)\rangle}_{[2]}
    \\& \quad \quad 
    + 
    \frac{1}{2\beta}\Vert G_\beta(x)\Vert^2 + h(z) + 
    \underbrace{\langle \partial h(x^+), x^+ - z\rangle}_{[4]}, 
\end{aligned}
$$

and we consider the summation term by term, keep in mind that $G_\beta (x) - \nabla f(x)\in \partial h(x^+)$, giving us: 

$$
\begin{aligned}
    {[3]}:= [1] + [2]
    \\
    [3] &= \langle \nabla g(x), x - z - x + x^+\rangle = \langle \nabla g(x), x^+ - z\rangle
    \\
    [3] + [4] &= 
    \langle \nabla g(x), x^+ - z\rangle + \langle G_\beta(x) - \nabla g(x), x^+ - z\rangle
    \\
    &= \langle G_\beta(x), x^+ - z\rangle 
    \\
    &= \langle G_\beta(x), x - z - (x - x^+)\rangle
    \\
    &= \langle G_\beta, x - z\rangle - \langle G_\beta, \underbrace{x - x^+}_{ = \beta^{-1}G_\beta(x)}\rangle
    \\
    &= \langle G_\beta(x), x - z\rangle - \beta^{-1}\Vert G_\beta(x)\Vert^2, 
\end{aligned}
$$

which results in 

$$
\begin{aligned}
    \underbrace{g(x^+) + h(x^+)}_{f(x^+)}
    & \le 
    \underbrace{g(z) + h(z)}_{f(x)} - \frac{1}{2\beta}\Vert G_\beta(x)\Vert^2 + \langle G_\beta, x - z\rangle
    \\
    f(x^+) - f(z) 
    &\le 
    \langle G_\beta(x), x - z\rangle - \frac{1}{2\beta}\Vert G_\beta(x)\Vert^2. 
\end{aligned}\tag{2}
$$


After obtaining this relation, the process for proving convergence is analogous to proving the convergence of smooth gradient descent and other. Define $\bar x\in \arg\min_xf(x)$ to be one of the solution, then we considering changing the value of $z$ into $x$, resulting in: 

$$
\begin{aligned}
    f(x^+) - f(\bar x) 
    &\le 
    \frac{-1}{2\beta}\Vert G_\beta(x)\Vert^2
    + 
    \langle G_\beta, x - \bar x\rangle
    \\
    &= 
    -\frac{\beta}{2}(
        \Vert x - x^+\Vert^2 - 2\langle x - x^+, x - \bar x\rangle
    )
    \\
    [5]
    \implies &= 
    \frac{-\beta}{2}(
        \Vert x^+ - \bar x\Vert^2
        - 
        \Vert x - \bar x\Vert^2
    )
    \\
    &= 
    \frac{\beta}{2}(\Vert x - \bar x\Vert^2 - \Vert x^+ - \bar x\Vert^2), 
\end{aligned}
$$

and here we are simplifying using the trick that $\Vert x - x^+ - (x - \bar x)\Vert^2 = \Vert x^+ - \bar x\Vert^2 = \Vert x - x^+\Vert^2 - \Vert x - \bar x\Vert^2 - 2\langle x - x^+, x - \bar x\rangle$ to get rid of the cross term. Next, we consider the proximal gradient update, giving us $x^+ = x^{(t + 1)}, x = x^{(t)}$, then we can apply some more tricks: 

$$
\begin{aligned}
    f(x^{(k + 1)}) - \bar f 
    &\le
    \frac{\beta}{2}(\Vert x^{(k)} - \bar x\Vert^2 - \Vert x^{(k + 1)} - \bar x\Vert^2)
    \\
    \implies
    \left(
        \sum_{i = 0}^{N} f(x^{(i + 1)})
        - \bar f
    \right)
    &\le
    \frac{\beta}{2}
    (\Vert x^{(0)} - \bar x\Vert^2 - \Vert x^{(N + 1)} - \bar x\Vert^2), 
\end{aligned}
$$

Using the fact that the choice of stepsize make sequence of value $f(x^{(i + 1)})$ non-decreasing, we can derive the the relation that: 

$$
\begin{aligned}
    f(x^{(N + 1)}) - \bar f & = 
    \min_{i = 0, \cdots, N}\left\lbrace
        f(x^{(i + 1)}) - \bar f
    \right\rbrace \le 
    \left(
        \frac{1}{N + 1}\sum_{i = 0}^{N}f(x^{(i + 1)})
    \right) - \bar f
    \\
    \implies
    f(x^{(N + 1)}) - \bar f
    &\le  
    \frac{\beta(\Vert x^{(0)} - \bar x\Vert^2 - \Vert x^{(N + 1)} - \bar x\Vert^2)}{2(N + 1)}
    \\
    &\le 
    \frac{\beta(\Vert x^{(0)} - \bar x\Vert^2)}{2(N + 1)}, 
\end{aligned}
$$

and we obtained a pessimistic converence bound for the proximal gradient method. How tight such a bound is remains as an open question. 


**Remarks**

Please realized the parallel between the role played by the residual $G_\beta$ and the gradient in the proof for the smooth gradient descend. They play the same type of role. 

---
### **An Important Lemma We should Extract From This**

The Lemma that we can extract from here is the results (2). 

**Theorem: Proxstep 2 Points**

> Let $h$ be convex, closed and proper, let $g$ be strongly smooth with a constant of $L$, let $y\in \mathbb E$, defining $y^+ = \text{prox}_{h, L^{-1}}(y)$, then for any $x\in \mathbb E$, we have: 
> 
> $$
> \begin{aligned}
>     f(x) - f(y^+) \ge \frac{L}{2}\Vert y^+ - y\Vert^2 + 
>     L \langle y - x, y^+ - y\rangle. 
> \end{aligned}
> $$

Please compare the term with (2). Observe and keep in mind that $G_\beta = \beta(x - x^+)$, where $x^+$ is the prox step, therefore: 

$$
\begin{aligned}
    f(x^+) - f(z)
	&\le
	\langle G_\beta(x), x - z\rangle - \frac{1}{2\beta}\Vert G_\beta(x)\Vert^2.
	\\
	f(x^+) - f(z) & \le
	\beta\langle x - x^+, x - z\rangle - \frac{1}{2\beta}\Vert \beta (x - x^+)\Vert^2
	\\
	f(z) - f(x^+) & \ge
	\frac{\beta}{2}\Vert x - x^+\Vert^2
	+
	\beta\langle x^+ - x, x - z\rangle,
\end{aligned}
$$

and by substituting $x :=y$ and $z := x$ in the context of the lemma then, we complete the proof for the lemma. This particular lemma is also crucial to the proof of [Proximal Gradient with Momentum Accelerations](Proximal%20Gradient%20with%20Momentum%20Accelerations.md). 


---
### **In Relations to Fixed Point Iterations**

#UNFINISHED : Another way to prove it is through the idea of operator. Unfortunately, the operator for the Forward and Backward method is not an Averaged Operator, hence it doesn't adhere to the fixed point convergence as stated and proved in [Introduction to Operators for Optimizations](../Operators%20Theory/Introduction%20to%20Operators%20for%20Optimizations.md). 




