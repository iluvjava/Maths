- [[Proximal Gradient, Forward Backwards Envelope]]

---
### **Intro**

We still assume that
1. $f = g+ h$. 
2. $g(x)$ has a gradient and it's strongly smooth constant $L$. 
3. $h$ is convex not not necessarily smooth. 
4. $\beta$ is the smoothness upper bound parameter, with $\beta \ge L$.

To simplify notation, Let $T = \text{prox}_{\beta^{-1}h}\circ [I - \beta^{-1}\nabla g]$ be an operator denoting the proximal gradient operations. 

**The Fixed Point Error**

We introduce $G_\beta(x) = \beta(x - Tx)$ to be the fixed point error (This is referred to as the gradient mapping in Nesterov's textbook), with the $\beta$ stepsize multiplier. We claim that $G_\beta(x) \in \partial h \circ Tx + \nabla g(x)$, here is the justification: 

$$
\begin{aligned}
    x^+ &= [I + \beta^{-1}\partial h]^{-1}\circ [I - \beta^{-1}\nabla g](x)
    \\
    [I + \beta^{-1}\partial h](x^+) &\ni [I - \beta^{-1}\nabla g](x)
    \\
    x^+ + \beta^{-1}\partial h(x^+) &\ni x - \beta^{-1}\nabla g(x)
    \\
    x^+ - x + \beta^{-1}\partial h(x^+) &\ni \beta^{-1}\nabla g(x)
    \\
    \beta(x^+ - x) + \partial h(x^+) &\ni - \nabla g(x)
    \\
    \beta(x - x^+) &\in \nabla g(x) + \partial h(x^+), 
\end{aligned}
$$
and this is the quantity we aim to minimize via the fixed point iteration, and that expression above is one of its representation. By choosing the stepsizes $\beta^{-1} \le L^{-1}$, we assert strict decrease of the value of the objective function, $f(x^+) \le f(x)$, this is established by previous discussion when we derived the method via the Envelope. 


**References**: [here](https://people.eecs.berkeley.edu/~elghaoui/Teaching/EE227A/lecture18.pdf). A course notes used for UC Berkley. I changed it now the algorithm details are coming from the Heinz's Lectures.  


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
    {[3]} &:= [1] + [2]
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

#### **Theorem | Fundamental Theorem of Proximal Gradient Lemma**

> With $f = g + h$, where $h$ is convex, closed and proper, with $g$ be $L$-Lipschitz smooth with a constant of $L$, let $y\in \mathbb E$, defining $y^+ = T(y)$ being the proximal gradient step, then for any $x\in \mathbb E$, we have: 
> $$
> \begin{aligned}
>   f(x) - f(y^+) \ge \frac{L}{2}\Vert x - y^+\Vert^2 - \frac{L}{2}\Vert x - y\Vert^2 + D_g(x, y),
> \end{aligned}
> $$
> Where $D_g(x, y):= g(x) - g(y) - \langle \nabla g(y), x -y\rangle$ is the Bregman Divergence for the smooth part of the sum: $g$. 

**Observations**

starting with the RHS of the lemma stated above, using the convexity of $g$, Bregman Divergence $D_g(x, y)\ge 0$, with this in mind we have

$$
\begin{aligned}
    \frac{L}{2}\Vert x - y^+\Vert^2 - \frac{L}{2}\Vert x - y\Vert^2 + D_g(x, y)
    &\ge
    \frac{L}{2}\left(
        \Vert x - y^+\Vert^2 - \Vert x - y\Vert^2
    \right) 
    \\
    &= \frac{L}{2}\left(
        \Vert x - y + y - y^+\Vert^2 - \Vert x - y\Vert^2
    \right)
    \\
    &= \frac{L}{2}\left(
        \Vert x - y\Vert^2 + \Vert y - y^+\Vert^2 + 
        2\langle x - y, y - y^+\rangle - \Vert x - y\Vert^2
    \right)
    \\
    &= \frac{L}{2}\left(
        \Vert y - y^+\Vert^2 + 
        2\langle x - y, y - y^+\rangle
    \right). 
\end{aligned}
$$

Please compare the above results to (2) from the above derivation of convergence of the proximal gradient method. This particular lemma is also crucial to the proof of [The FISTA Algorithm](../Proximal%20Methods/The%20FISTA%20Algorithm.md). 

**Proof**

Recall that $m_x(y)$ denotes the upper non-smooth envelope modeled at $x$ and evaluated at $y$. By strong convexity of the upper envelope we have 

$$
\begin{aligned}
    m_y(x) - m_y(Ty) &\ge 
    \frac{L}{2}\Vert x - Ty\Vert^2 \quad \textcolor{gray}{\triangleright \text{Polyak Inequality by S-CVX of upper surrogate minimized}}
    \\
    \frac{L}{2}\Vert x - Ty\Vert^2 &\le 
    m_y(x) - m_y(Ty) \quad \triangleright \; \text{quadratic growth of strongly convex. }
    \\
    &= 
    g(y) + \langle \nabla g(y), x - y\rangle + \frac{L}{2} \Vert x - y\Vert^2 + h(x) - m_y(Ty)
    \\
    & \le 
    g(y) + \langle \nabla g(y), x - y\rangle + \frac{L}{2} \Vert x - y\Vert^2 + h(x) - f(Ty) \quad \textcolor{gray}{\triangleright \text{[1]}}
    \\
    &=
    g(y) - g(x) + \langle \nabla g(y), x - y\rangle + \frac{L}{2} \Vert x - y\Vert^2 + g(x) + h(x) - f(Ty)
    \\
    &= -(g(x) - g(y) - \langle \nabla g(y), x - y\rangle) + \frac{L}{2} \Vert x - y\Vert^2 + g(x) + h(x) - f(Ty)
    \\
    &= -D_g(x, y) + \frac{L}{2} \Vert x - y\Vert^2 + g(x) + h(x) - f(Ty)
    \\
    \implies f(Ty) - f(x) &\le -D_g(x, y) + \frac{L}{2} \Vert x - y\Vert^2 - \frac{L}{2}\Vert x - Ty\Vert^2, 
\end{aligned}
$$

\[1\]: By the fact that the envelope is always smaller than the value of the function at the same point. It's now done. 



**Remarks**

This is also stated as Theorem 10.16, In Amir Beck's first order optimization method, and it's also stated in Heinz's convex optimization class. 
This lemma is central to the evaluation of proximal gradient related method and all the variance of the same method. 
For a more detailed discussion of this specific lemma, visit [Proximal Gradient Inequality Part I](../Proximal%20Methods/Proximal%20Gradient%20Inequality%20Part%20I.md) for more information. 

#### **Corollary-1 | Smooth Gradient Descent**
> The same lemma, Fundamental Proximal Gradient Lemma is applicable for $T = I - \nabla g(x)$. This can be done by setting $h$ being the zero function then $T = [I - \beta^{-1}\nabla g]$ would just be the gradient operator. 

#### **Corollary-2 | Fundamental Proximal Gradient Lemma with Smooth and Strongly Convex Assumption**
> The Bregman divergence of smooth part $g$ can be lowered bounded by $\beta/2\Vert x - y\Vert^2$ when $g$ is $\alpha$-strong convex. This will yield the Fundamental Proximal Gradient Lemma with strong convexity to it. 
>

#### **Corollary 3 | Alternative Representation using Gradient Mapping**



---
### **In Relations to Fixed Point Iterations**

#UNFINISHED : Another way to prove it is through the idea of operator. Unfortunately, the operator for the Forward and Backward method is not an Averaged Operator, hence it doesn't adhere to the fixed point convergence as stated and proved in [[Operators for Optimizations CENTRAL HUB]]. 

