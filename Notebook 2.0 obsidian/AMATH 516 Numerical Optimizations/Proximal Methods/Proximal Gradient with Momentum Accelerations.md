[[Proximal Gradient Convergence Rate]]

---
### **Intro**

A thorough understanding of the Proximal Gradient without momentum is needed to understand this. This part of the text will make heavy references to Amir's Beck's book, and the paper [[FISTA_ A Fast Iterative Shrinka - Amir Beck.pdf]], and then the Presentation from L. Vanderberghe [here](https://www.seas.ucla.edu/~vandenbe/236C/lectures/fgrad.pdf) on Nesterov momentum method. In this excerp, we will state the algorithm for the FISTA, and then we will attempt to prove the convergence rate while knowing the algorithm. And at the end we will try to discuss some of the magics behind sequence of numbers for the algorithm. 

**The FISTA Algorithm**

> let $L$ be the lipschitz constant for the gradient of smooth function $g$, and then let the step size to be constant with $\beta^{-1}$, where $\beta \ge L$. 
> 
> $$
> \begin{aligned}
>     x^{(k)} &= \text{prox}_{h, \beta^{-1}} (y^{(k)} + \beta^{-1}\nabla f(y^{(k)}))
>     \\
>     t_{k + 1} &= 
>     \frac{1 + \sqrt{1 + 4t_k^2}}{2}
>     \\
>     x^{(k + 1)} 
>     &=  x^{(k)} + \left(
>         \frac{t_k - 1}{t_{k + 1}}
>     \right)(x_k - x_{k - 1})
> \end{aligned}
> $$

A line search algorithm will find the largest possible step size $\beta^{-1}$ such that $f(x^{(k + 1)})\le m_{x}(y|\beta)$. Where, we defined the upper bounding function modeled at point $x$ of $f$ and evaluated at point $y$ to be $m_x(y|L)$, where $L$ is the smoothness constant on the quadratic term of the function. 


The proof is non-trivial, and we take steps to build it up. We denotes $f = g + h$, where g is the $L$ strongly smooth function and $h$ is the convex function that is not necessarily smooth. 

**Remarks**

People don't think this is good enough and in Amir's textbook, and paper such as [this one](https://arxiv.org/abs/1811.01430), people augmented and improve the behavior of the original algorithm, so that it works better, faster, and greedier. 

---
### **First Lemma For the Proof**

**Lemma 1**

Let $y\in \mathbb R^{n}$ and $l > 0$, we define $\mathcal{P}_l^{g, h}(y) := \text{prox}_{h, l^{-1}}(y + l^{-1}\nabla g(y))$, and under certain context where there is no ambiguity we simply use $\mathcal{P}y$ instead. 

$$
\begin{aligned}
    f(\mathcal P(y)) 
    &\le 
    m_y(\mathcal{P}(y)|l)
    \\
    \implies f(x) - f(\mathcal P(y)) 
    &\ge 
    \frac{L}{2}\Vert \mathcal P(y) - y\Vert^2 + 
    L \langle y - x, \mathcal P (y) - y\rangle \quad 
    \forall x\in \mathbb R^n. 
\end{aligned}
$$

The proof was listed in the proof for the convergence rate for Proximal Gradient in the un-accelerated case. Here, we just simplified the notations. This statement is listed as **Lemma 2.3** in \[Amir Beck and Marc Teboulle\]'s FISTA paper. 

---
### **The Second Lemma for the Proof**

> The fixed stepsize FISTA algorithm with a step size of  assert the following relations: 
> 
> $$
> \begin{aligned}
>     & 
>     \frac{2}{L}t^2_k \Delta_k - \frac{2}{L}t^2_{k + 1} \Delta_{k + 1} 
>     \ge 
>     \Vert u^{(k + 1)}\Vert^2 - \Vert u^{(k)}\Vert^2
>     \\
>     & \Delta_k := f(x^{(k)}) - f(\bar x)
>     \\
>     & u^{(k)} := t_k x^{(k)} - (t_k - 1)x^{(k - 1)} - \bar x,
> \end{aligned}
> $$
> and here, $\bar x$ denotes one of the minimizer for the function $f$. 

**Proof**

We invoke the first lemma with $x = x^{(k)}, y = y^{(k +1)}$ to give: 

$$
\begin{aligned}
    f(x^{(k)}) - f\circ \mathcal P y^{(k + 1)}
    & \ge 
    \frac{L}{2}\Vert \mathcal Py^{(k + 1)} - y^{(k + 1)}\Vert^2 + 
    L \langle y^{(k + 1)} - x^{(k)}, 
        \mathcal Py^{(k + 1)} - y^{(k + 1)}
    \rangle
    \\
    f(x^{(k)}) - f(x^{(k + 1)}) 
    & \ge 
    \frac{L}{2}\Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2 + 
    L 
    \langle 
        y^{(k + 1)} - x^{(k)}, 
        x^{(k + 1)} - y^{(k + 1)}
    \rangle, 
    \\
    \implies
    2L^{-1} (\Delta_k - \Delta_{k + 1}) 
    & \ge 
    \Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2 + 
    2\langle x^{(k + 1)} - y^{(k + 1)}, y^{(k + 1)} - \bar x\rangle. 
\end{aligned}\tag{1}
$$

Observe that from the first line to the second line we invoke the definition for the updates for $x^{(k)}$ in the FISTA algorithm. We then invoke the lemma again with $x:= \bar x, y = y^{(k + 1)}$, and it gives us: 

$$
\begin{aligned}
    f(\bar x) - f\circ \mathcal P y^{(k + 1)}
    & \ge 
    \frac{L}{2}\Vert \mathcal P y^{(k + 1)} - y^{(k + 1)}\Vert^2 
    + L 
    \langle y^{(k + 1)} - \bar x, x^{(k + 1)} - y^{(k + 1)}\rangle
    \\
    f(\bar x) - f(x^{(k + 1)}) 
    &\ge 
    \frac{L}{2}\Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    + 
    L \langle y^{(k + 1)} - \bar x, x^{(k + 1)} - y^{(k + 1)}\rangle
    \\
    -2L^{-1}\Delta_{k + 1}
    & \ge
    \Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    + 
    2\langle y^{(k + 1)} - \bar x, x^{(k + 1)} - y^{(k + 1)}\rangle. 
\end{aligned}\tag{2}
$$

Consider the expression $(t_k - 1)(1) + (2)$, we obtain the LHS quantity: 

$$
\begin{aligned}
    &(t_{k + 1} - 1)L^{-1} (\Delta_k - \Delta_{k + 1}) 
    -
    2L^{-1}\Delta_{k + 1}
    \\
    = \; &
    2L^{-1}
    ((t_{k + 1} + 1)\Delta_k - (t_{k + 1} - 1)\Delta_{k + 1} - \Delta_{k + 1})
    \\
    = \; &
    2L^{-1}((t_{k + 1} - 1)\Delta_k - t_{k + 1}\Delta_{k + 1}), 
\end{aligned}\tag{3.LHS}
$$

and the RHS is: 

$$
\begin{aligned}
    & (t_{k + 1} - 1)\Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    + 
    2(t_{k + 1} - 1)\langle y^{(k + 1)} - \bar x, x^{(k + 1)} - y^{(k + 1)}\rangle 
    \\
    & \quad 
    + \Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    + 
    2\langle y^{(k + 1)} - \bar x, x^{(k + 1)} - y^{(k + 1)}\rangle
    \\
    = \; &
    t_{k + 1}\Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    + 
    \langle 
        x^{(k + 1)} - y^{(k + 1)}, 
        \underbrace{2(t_{k + 1} - 1)(y^{(k + 1)} - x^{(k)}) + 2(y^{(k + 1)} - \bar x) }_
        {
            = 2(t_{k + 1}y^{(k + 1)} + (1 - t_{k + 1})x^{(k)} - \bar x)
        }
    \rangle
    \\
    = \; & 
    t_{k + 1}\Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    + 
    2\langle 
        x^{(k + 1)} - y^{(k + 1)}, 
        t_{k + 1}y^{(k + 1)} + (1 - t_{k + 1})x^{(k)} - \bar x
    \rangle. 
\end{aligned}\tag{3.RHS}
$$

The entirely of expression (3) is given by: 

$$
\begin{aligned}
    & 2L^{-1}((t_{k + 1} - 1)\Delta_k - t_{k + 1}\Delta_{k + 1})
    \ge 
    t_{k + 1}\Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2
    \\
    & \quad 
    + 
    2\langle 
        x^{(k + 1)} - y^{(k + 1)}, 
        t_{k + 1}y^{(k + 1)} + (1 - t_{k + 1})x^{(k)} - \bar x
    \rangle. 
\end{aligned}\tag{3}
$$

The next part of the proof shows some of the magics involves in changing the LHS,RHS of (3) to be the same as the theorem statement. It's accomplished by the relations for the sequence $t_k$, more specifically *it's hinged on the relations* $t_k^2 = t^2_{k + 1} - t_{k + 1}$ which is asserted by the FISTA algorithm. Using this fact we proceed by multiplying $t_{k + 1}$ on both sides of (3) and obtain: 

$$
\begin{aligned}
    & 2L^{-1}(\Delta_k t_k^2 - \Delta_{k + 1}t_{k + t}^2)
    \\
    & \le 
    \Vert t_{k + 1}(x^{(k + 1)} - y^{(k + 1)})\Vert^2 - 
    2\langle 
        t_{k + 1}(x^{(k + 1)} - y^{(k + 1)}), 
        t_{k + 1}y^{(k + 1)} - 
        (t_{k + 1} - 1)x^{(k)} - \bar x
    \rangle
    \\
    & 2L^{-1}(\Delta_k t_k^2 - \Delta_{k + 1}t_{k + t}^2)
    \\ 
    & \le 
    \Vert 
        \underbrace{t_{k + 1}x^{(k + 1)}}_{
            =:a
        } - \underbrace{t_{k + 1}y^{(k + 1)}}_{
            =:b
        }
    \Vert^2 
    - 
    2\langle 
       \underbrace{ t_{k + 1}x^{(k + 1)}}_{=:a} - t_{k + 1}y^{(k + 1)}, 
        \underbrace{t_{k + 1}y^{(k + 1)}}_{=:b} - 
        \underbrace{((t_{k + 1} - 1)x^{(k)} + \bar x)}_{=:c}
    \rangle
    \\
    & \le 
    \Vert a - b\Vert^2 + 2\langle a - b, b -c\rangle
    \\
    & = 
    \Vert a - b\Vert^2 + \Vert b - c\Vert^2 + 
    2\langle a-b, b -c\rangle - \Vert b - c\Vert^2
    \\
    &= 
    \Vert a - c\Vert^2 - \Vert b - c\Vert^2
    \\
    &\le 
    \Vert 
        t_{k+ 1}x^{(k + 1)} - 
        (t_{k + 1} - 1)x_k - \bar x 
    \Vert^2 - 
    \Vert 
        (t_{k + 1} - 1)x^{(k)} - t_{k + 1}y^{(k + 1)}
        - \bar x
    \Vert^2, 
\end{aligned}
$$

to prove the lemma, we need to match the form in the above 2 norm of the vector, we accomplish this by considering FISTA algorithm: 

$$
\begin{aligned}
    t_{k + 1}y^{(k + 1)} &= t_{k + 1}x^{(k)} + (t_k - 1)(x^{(k)} - x^{(k - 1)})
    \\
    t_{k + 1}y^{(k + 1)} - (t_{k + 1}- 1)x^{(k)}
    &= t_{k + 1}x^{(k)} - (t_{k + 1}- 1)x^{(k)} + (t_k - 1)(x^{(k)} - x^{(k - 1)})
    \\
    &= 
    x^{(k)} + (t_k - 1)x^{(k)} - (t_k - 1)x^{(k - 1)}
    \\
    &= t_kx^{(k)} - (t_k - 1)x^{(k - 1)}, 
\end{aligned}
$$

cf from previously we have: 

$$
\begin{aligned}
    & 2L^{-1}(\Delta_k t_k^2 - \Delta_{k + 1}t_{k + t}^2)
    \\
    &\le 
    \Vert 
        t_{k + 1}x^{(k + 1)}
        + 
        (1 - t_{k + 1}) x^{(k)} - \bar x
    \Vert^2
    - 
    \Vert t_kx^{(k)} 0 (t_k - 1)x^{(k -1)} - \bar x\Vert^2
    \\
    & \le \Vert u^{(k + 1)}\Vert^2 - \Vert u^{(k)}\Vert^2. 
\end{aligned}
$$

And that completes the proof of the Second Lemma. 

---
### **Completing the Proof**



