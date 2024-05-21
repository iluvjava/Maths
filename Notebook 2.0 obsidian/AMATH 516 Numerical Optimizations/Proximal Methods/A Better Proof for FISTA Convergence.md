- [[Proximal Gradient with Momentum Accelerations]]

---
### **Intro**

We do the prove for the better convergence rate for the FISTA algorithm under standard assumptions, and we make the proof better by getting rid of the assumptions for the momentum sequence and then try to deduce what type of properties the sequence should satisfies to let the acceleration works for proximal gradient. We accomplish the following by first listing the assumptions we made for the Accelerated Gradient: 

1. The objective function $f = g + h$, where $h$ is strongly smooth, proper convex, so that its gradient is Lipchitz continuous with a constant of $L_g$ globally.  


---
### **The Prox 2 Points Lemma**

The following lemma is taken from the previous proof: 

> **The Prox 2 Points**
> 
Let $y\in \mathbb R^{n}$ and $l > 0$, we define $\mathcal{P}_l^{g, h}(y) := \text{prox}_{h, l^{-1}}(y + l^{-1}\nabla g(y))$, and under certain context where there is no ambiguity we simply use $\mathcal{P}y$ instead, Here we let $l = L^{-1} \ge L_g$ where $L_g$ denotes the Lipschitz constant for the smooth function $g$. 
> 
> $$
> \begin{aligned}
>     f\circ \mathcal Py
>     &\le 
>     m_y(\mathcal{P}(y)|L)
>     \\
>     \implies f(x) - f\circ \mathcal Py
>     &\ge 
>     \frac{L}{2}\Vert \mathcal Py - y\Vert^2 + 
>     L \langle y - x, \mathcal Py - y\rangle \quad 
>     \forall x\in \mathbb R^n. 
> \end{aligned}
> $$

---
### **Template Methods for Proximal Gradient**
A generic method for updating the sequences for the proximal gradient method. 

$$
\begin{aligned}
    & x^{(k)} = \text{prox}_{h, l^{-1}}(y^{(k)} + l^{-1}\nabla g(y^{(k)})) =: \mathcal Py^{(k)}
    \\
    & y^{(k + 1)} = x^{(k)} + \theta_k(x^{(k)} - x^{(k - 1)})
\end{aligned}
$$

Where $k = 1, \cdots, N$, for some desirable big enough value of $N$. At current stage we don't make assumptions on $x^{-1}$ yet. 


---
### **Momentum Magics**

We introduce new notations with more interpretable meaning: 

* $v^{(k)} = x^{(k)} - x^{(k -1)}$ is the velocity term. 
* $\bar v^{(k)}= \theta_k v^{(k)}$ is the weighed velocity term. 
* $e^{(k)} := x^{(k)} - \bar x$, where $\bar x \in \arg\min_{x}(f(x))$, where $\bar x$ might not be unique. 
* $\Delta_k := f(x^{(k)}) - f(\bar x) \ge 0$ which represent the optimality gap at step $k$. 

Use the Prox 2 Points and substitute $x = x^{(k)}, y = y^{(k + 1)}$ gives: 

$$
\begin{aligned}
    f(x^{(k)}) - f\circ \mathcal Py^{(k + 1)}
    &\ge 
    \frac{L}{2}\Vert \mathcal Py^{(k + 1)} - y^{(k + 1)}\Vert^2 + 
    L \langle y^{(k + 1)} - x^{(k)}, \mathcal P y^{(k + 1)} - y^{(k + 1)}\rangle 
    \\
    [1]\implies
    2L^{-1} (\Delta_k - \Delta_{k + 1}) 
    &\ge 
    \Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2 + 
    2 \langle x^{(k + 1)} - y^{(k + 1)}, y^{(k + 1)} - x^{(k)}\rangle
    \\
    [2]\implies
    2L^{-1} (\Delta_k - \Delta_{k + 1})  
    & \ge 
    \Vert v^{(k + 1)} - \bar v^{(k)}\Vert^2 + 
    2\langle v^{(k + 1)} - \bar v^{(k)}, \bar v^{(k)}\rangle
\end{aligned}\tag{*}
$$

where we make use of the fact that $x^{(k + 1)} = \mathcal P y^{(k + 1)}$ at \[1\], and using $x^{(k + 1)} - y^{(k + 1)} = x^{(k + 1)} - x^{(k)} - \bar v^{(k)} = v^{(k + 1)} - \bar v^{(k)}$ at \[2\]. Similarly we can use the prox 2 points lemma and substitute $x = \bar x, y = y^{(k + 1)}$, giving us: 

$$
\begin{aligned}
    -2L^{-1}\Delta_{k + 1} 
    &\ge 
    \Vert x^{(k + 1)} - y^{(k + 1)}\Vert^2 + 2
    \langle y^{(k + 1)} - \bar x, x^{(k + 1)} - y^{(k + 1)}\rangle
    \\
    -2L^{-1}\Delta_{k + 1} 
    & \ge 
    \Vert v^{(k + 1)} - \bar v^{(k)}\Vert^2 + 
    2\langle e^{(k)} + \bar v^{(k)}, v^{(k + 1)} - \bar v^{(k)}\rangle.
\end{aligned}\tag{$\star$}
$$

we make use of the fact that $y^{(k + 1)} = x^{(k)} - \bar v^{(k)}$, then $y^{(k + 1)} - \bar x = x^{(k)} - \bar v^{(k)} - \bar x = e^{(k)} - \bar v^{(k)}$. Next we consider the following linear combinations of $(*), (\star)$ such that it leaves $v^{(k)} - \bar v^{(k)}$ inside of the cross term with a single multiplier, let's call it $t_k$ (Just a generic sequence that will contributes to the engineering of the algorithm), to do that we consider $(t_{k + 1}- 1)(*) + (\star)$ with $(t_k - 1)\ge 0$ for all $k$ giving us: 

$$
\begin{aligned}
    2L^{-1}((t_{k + 1} - 1)\Delta_k - t_{k + 1}\Delta_{k + 1})
    & \ge 
    t_{k + 1}\Vert v^{(k + 1)} - \bar v^{(k)}\Vert^2 + 
    2\langle t_{k + 1}(v^{(k + 1)} - \bar v^{(k)}), e^{(k)} + t_{k + 1} \bar v^{(k)}\rangle, 
\end{aligned}\tag{$*\star$}
$$

unfortunately, at current step we won't be able to trigger the monotone property and sum it up like in the case without any momentum, instead, we need to consider new approach. 

---
### **The Second Lemma | 2 Positive Sequences**

We consider sequence $a_k, b_k \ge 0$ for $k\in \mathbb N$ with $a_1 + b_1 \le c$, and inductively the 2 sequences satisfies: $a_{k} - a_{k + 1} \le b_{k + 1} - b_k$ , it describes the the  oscillations of $a_k$ is bounded by $b_k$. Consider the telescoping sum: 

$$
\begin{aligned}
    a_{k} - a_{k + 1} 
    &\ge b_{k + 1} - b_k \quad \forall k \in \mathbb N
    \\
    \implies
    -\sum_{k = 1}^{N}
    a_{k + 1} - a_k 
    &\ge 
    \sum_{k = 1}^{N} b_{k + 1} - b_k
    \\
    - (a_{N + 1} - a_1) 
    &\ge b_{N + 1} - b_1
    \\
    c\ge a_1 + b_1
    &\ge
    b_{N + 1} + a_{N +1}
    \\
    \implies c &\ge a_{N+1} \quad \textcolor{gray}{\triangleright \text{By }b_{n + 1} \ge 0.}
\end{aligned}
$$

**Remarks**

If we can match the form of the expression, then there is a way to restrain the value of $\Delta_k$, intuitive we are thinking of bounding the changes in the sequence. If the initial $a_1 + b_1$  is bounded by $c$, and the way $a_k$ changes is always bounded by the changes in $b_k$, given both $a_k, b_k$ are non-negative, the total amount of changes of $a_k$ will be bounded by the total amount of changes in the sequence $b_k$ as well.

The non-negativity of the 2 sequences has correspondence with knowing existence of minimizer $\bar x$. 

---
### **Making use of the Lemma**

We consider the expression $(*\star)$ from previously, and our goal is to match the coefficient of the term so that they can be matched with the form: $a_k - a_{k + 1}\le b_{k + 1} - b$, to accomplish, we further simplifies $(*\star)$ by multiplying both side by $t_{k + 1}$ (so that we can move the constant to the inside of the norm instead of letting it dangling outside) and we assume it to be a positive quantity larger than one: 

$$
\begin{aligned}
    & \quad 2L^{-1}((t_{k + 1}^2 - t_{k + 1})\Delta_k - t_{k + 1}^2\Delta_{k + 1})
    \\
    & \ge  
    t_{k + 1}^2\Vert v^{(k + 1)} - \bar v^{(k)}\Vert^2 + 
    2\langle t_{k + 1}(v^{(k + 1)} - \bar v^{(k)}), e^{(k)} + t_{k + 1} \bar v^{(k)}\rangle
    \\
    &=
    \Vert t_{k + 1} (v^{(k + 1)} - \bar v^{(k)}) \Vert^2 + 
    2\langle t_{k + 1}(v^{(k + 1)} - \bar v^{(k)}), e^{(k)} + t_{k + 1}\bar v^{(k)}\rangle
    \\
    &=
    \Vert t_{k+1} v^{(k + 1)} - t_{k + 1}\bar v^{(k)} + e^{(k)} + t_{k + 1}\bar v^{(k)}\Vert^2
    - 
    \Vert e^{(k)} - t_{k + 1} \bar v^{(k)}\Vert^2
    \\
    &=
    \Vert 
        t_{k+1} v^{(k + 1)} + e^{(k)}
    \Vert^2
    - 
    \Vert e^{(k)} - t_{k + 1} \bar v^{(k)}\Vert^2
    \\
    [1]\implies
    & = 
    \Vert t_{k + 1}v^{(k + 1)} + e^{(k)}\Vert^2
    - 
    \Vert v^{(k)} + e^{(k - 1)} + t_{k + 1}\bar v^{(k)} \Vert^2
    \\
    & = 
    \Vert t_{k + 1}v^{(k + 1)} + e^{(k)}\Vert^2
    - 
    \Vert e^{(k - 1)} + (t_{k + 1}\theta_k + 1) v^{(k)} \Vert^2, 
\end{aligned}
$$

where at \[1\] we use the fact that $e^{(k)}= x^{(k)} - \bar x = x^{(k)} - x^{(k - 1)}+ x^{(k - 1)} - \bar x = v^{(k)} + e^{(k-1)}$ and to match the form, we would need the sequence of $t_k, \theta_k$ to satisfies 

$$
\begin{aligned}    
    \begin{cases}
        t^2_{k + 1} - t_{k + 1} = t_k^2, &\text{For LHS, }
        \\
        t_k = t_{k + 1}\theta_k + 1, & \text{For RHS. }
    \end{cases}
\end{aligned}\tag{$\star \star$}
$$

One of the options is the sequence suggested in the FISTA paper, stated as: 

$$
\begin{aligned}
    t_k &= \frac{1 + \sqrt{1 + 4t_k^2}}{2}, 
    \\
    \theta_k &= \frac{t_k - 1}{t_{k + 1}}, 
\end{aligned}
$$

and with this sequences in mind, we can express $(*\star)$ in the form of: 

$$
\begin{aligned}
    \underbrace{2L^{-1}t_k^2\Delta_k}_{a_k} - \underbrace{2L^{-1}t_{k + 1}^2\Delta_{k + 1}}_{a_{k + 1}}
    \ge 
    \underbrace{\Vert t_{k + 1}v^{(k + 1)} + e^{(k)}\Vert^2}_{b_{k + 1}}
    - 
    \underbrace{\Vert e^{(k - 1)} + t_k  v^{(k)} \Vert^2}_{b_{k}}, 
\end{aligned}
$$

which has $a_k = 2L^{-1}\Delta_{k + 1}$finally, we observe that setting $k = 1$ on $(\star)$ gives: 

$$
\begin{aligned}
    -2L^{-1}  \Delta_1
    & \ge 
    \Vert v^{(1)} - \bar v^{(0)}\Vert^2 + 
    2\langle e^{(0)} - \bar v^{(0)}, v^{(1)} - \bar v^{(0)}\rangle
    \\
    &\ge
    \Vert 
        v^{(1)} - \bar v^{(0)}
        + 
        e^{(0)} - \bar v^{(0)}
    \Vert^2
    - 
    \Vert 
        e^{(0)} - \bar v^{(0)}
    \Vert^2
    \\
    \Vert e^{(0)} - v^{(0)}\Vert^2
    & \ge 
    \Vert v^{(1)} + e^{(0)}\Vert^2 + 2L^{-1}\Delta_1, 
\end{aligned}
$$

now we let $a_1 = 2L^{-1}\Delta_1$, which implies $t_1 = 1$, and hence we also have $b_1 = \Vert v^{(1)} + e^{(0)}\Vert^2$ with $c = \Vert e^{(0)} - v^{(0)}\Vert^2$, and this completes the base case for using the sequence lemma. Applying the lemma we obtain: 

$$
\begin{aligned}
    a_{N + 1} &\le c
    \\
    2L^{-1}t_{N + 1}^2\Delta_{N + 1} &\le \Vert e^{(0)} - v^{(0)}\Vert^2. 
\end{aligned}
$$

Which at this point, pertty much completes the proof because $t_k \ge (k + 1)/2$ in the case of the Nesterov Momentum. Take note that, there could be other sequences, however, this is the only squence the can performs the form match performed for the lemma. If we relax the conditions to obtain a residual for the telescoping sum, we can still get convergence, but the resulting sequence might not perform as well. My hypothesis is that the residual terms and the sequence's bound just happens to cancels out if we use the Nesterov momentum update. 


### **Finallly**

For properties about the sequence, visits [The Nesterov Momentum Sequence](../../MATH%20602%20Nesterov%20Acceleration/The%20Nesterov%20Momentum%20Sequence.md) for more information. 