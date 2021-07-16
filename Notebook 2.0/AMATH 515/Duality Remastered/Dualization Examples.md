[[Dualization Techniques]]
[[Convex Conjugate Examples]]

---
### **Intro**

Dualization transforms convex optimization, with constraints. 



---
### **Any Objective with Linear Equality and Inequality Constraints**

Consider optimization problems of the form: 

$$
\begin{aligned}
    &\min_x \left\lbrace
        g(x) + \delta_0(Cx - d) + \delta_+(b - Ax)
    \right\rbrace    
    \\
    &\min_x \left\lbrace
        g(x) \text{ s.t: } Cx = d \wedge Ax \le b
    \right\rbrace 
\end{aligned}
$$

**Note**: Dualization is possible with Linear constraint, with non linear constraints, we are in a bit of trouble, but the Lagragian is still possible to obtain. 

We are interested in the Lagrangian and the Dualization of this objective optimization. 

Take notice that dualization on $\delta_0(Cx - d)$ and $\delta_+(b - Ax)$ might be impossible (If they there are no intersection between these 2 polytopes), therefore we express it as one inequality constraints: 

$$
\begin{aligned}
    \begin{bmatrix}
        C \\ -C \\ A
    \end{bmatrix}
    x
    &\le 
    \begin{bmatrix}
        d \\ -d \\ b
    \end{bmatrix}    
    \\
    \tilde{A}x &\le 
    \tilde{b}
    \\
    \implies &\delta_+(\tilde{b}- Ax)
\end{aligned}
$$

**Primal Objective**: 

> $$
> \min_x \left\lbrace
>     g(x) + \delta_+(\tilde{b}- \tilde{A}x)
> \right\rbrace \quad A \in  \mathbb{R}^{m\times n}
> $$
> Usually $m\ge n$, if not, the region could be unbounded and it depends on $g(x)$ when that happens. 

Apply the Dualization process. 

$$
\begin{aligned}
    &\min_x \left\lbrace
    g(x) + \delta_+(\tilde{b}- \tilde{A}x)
    \right\rbrace
    \\
    =&
    \min_x\left\lbrace
        g(x) + \max_z \left\lbrace
            z^T(\tilde{b} - \tilde{A}x) - \delta_+^*(z)
        \right\rbrace
    \right\rbrace
    \\
    =& 
    \min_x\max_z \left\lbrace
        \underbrace{g(x) + z^T(\tilde{b} - \tilde{A}x) - \delta_-(z)}_{\mathcal{L}(x, z)}
    \right\rbrace
    \\
    \ge& 
    \max_z\min_x \left\lbrace
        g(x) + z^T(\tilde{b} - \tilde{A}x) - \delta_-(z)
    \right\rbrace
    \\
    =&
    \max_z\left\lbrace
        \min_x \left\lbrace
            g(x) - z^T\tilde{A}x
        \right\rbrace
        + z^T\tilde{b} - \delta_-(z)
    \right\rbrace
\end{aligned}
$$

Without given more information about $\tilde{A}$ and $g(x)$, we can't simplify the dual objective further. 

The Lagrangian however, remains relavent and can be solved **if** $g(x)$ is convex. 

---
### **Asym Linear Programming: Dual Interpreations and Lagrangian**

Linear programming is considering the objective $\min_x\{g(x) - z^T\tilde{A}x\}$ with $g(x) = c^Tx$, then it can be said that: 

$$
\min_x\left\lbrace
    c^T x - z^T\tilde{A}x
\right\rbrace
= - \max_x \left\lbrace
    z^T\tilde{A}x - c^Tx
\right\rbrace = \delta_0(z^T\tilde{A} - c^T)
$$

Then above dual objective function will become: 

$$
\begin{aligned}
    \max_z\left\lbrace
        z^T\tilde{b} - \delta_-(z) + \delta_0(z^T\tilde{A} - c^T)
    \right\rbrace
    &= \max_z \left\lbrace
        z^T\tilde{b}: z \le 0 \wedge z^T\tilde{A} = c^T
    \right\rbrace    
    \\
    & =
    -\min_z\left\lbrace
        -z^T\tilde{b}: z\le 0\wedge z^T\tilde{A} = c^T
    \right\rbrace
\end{aligned}
$$

$g(x)$ is convex, strong duality applies and hence the objective of the dual and primal equals to each other. 

**Interpretations**

* Each dual variable, $z_i$ is multiplied with $\tilde{b}$, it's controling the amount of resources used for the primal problem. 
* Given any dual variable, $z$ and primal variable $x$, we have $z^T\tilde{A}x = c^Tx$. 
  * $z^T$ arrages row of matrix $\tilde{A}$, the resource constraints to matches the primal objective, $c^Tx$. 
  * $z^T$ arrages the of constraints so that primal objective is exactly ON the arranged constraints. 
* Dual objective is $z^Tb$, assuming $b_i > 0$, then we want to make $z_i$ close to 0, else we want to drive up $z_i$. 
* For positive resources $b_i > 0$, we want to use as little resources as possible, hence setting $z_i = 0$. 


**Dual is like:**
> How do I get rid as many redundant resources will still keeping the $c^Tx$ objective we need. 

**How are dual, primal variables related to the primal variable**? 

Assuming optimal $x, z$, By strong duality: 

$$
\begin{aligned}
    z^T\tilde{b} &= c^Tx
    \\
    z^T\tilde{b} - c^Tx &= 0
    \\
    z^T(\tilde{b} - \tilde{A}x) &= 0
    \\
    &\wedge
    \\
    z^T\tilde{A} &= c^T
\end{aligned}
$$

* If, the $i$ constraint is saturated, meaing that $(\tilde{b} - \tilde{A}x)_i = 0$, then $z_i$ is free, as long as it's $<0$, the numer of saturated constraints is at least $n$, by fundamentaly theorem of linear programming. 

  * In that case when $b_i$ is positive, $z_i$ is zero, if $b_0 \le 0$, then $z_i$ goes to negative infinity. Dual is unbounded. 
  * Else, to maximize $z_ib_i$ with that term specifically, we have the freedom to set it to zero. 

* Else if there is such $i$ makes $(\tilde{b} - \tilde{A}x)_i > 0$, but because $z_i \le 0$, to keep the sum of $z^T(\tilde{b} - \tilde{A}x) = 0$, it must be zero because.  


**Basically**

> If there is a slack variable, then dual variable will make use of it and trying to get rid of it as much as possible, setting $z_i$ to be zero. 
> 
> The objective $c$, equals to the negative cone of the tight constraints(rows of $\tilde{A}$). 


**What does the Lagragian say for the optimality in this case**? 

Let's look for the saddle point of the Lagragian, which will be giving us information about it. 

$$
\begin{aligned}
    \mathcal{L}(x, z) &= 
    c^Tx + z^T(\tilde{b} - \tilde{A}x) - \delta_-(z)
    \\
    \implies &
    \begin{cases}
        \nabla_x[\mathcal{L}(x, z)] 
        = c - \tilde{A}^Tz  &= \mathbf{0}
        \\
        \bar{\partial}_z[\mathcal{L}(x, z)]
        = \tilde{b} -\tilde{A}x -\bar{\partial}_z[\delta_-(z)] &\ni \mathbf{0}
    \end{cases}
    \\ \implies
    &
    \begin{cases}
        \nabla_x[\mathcal{L}(x, z)] 
        = c - \tilde{A}^Tz  &= \mathbf{0}
        \\
        \bar{\partial}_z[\mathcal{L}(x, z)]
        = \tilde{b} -\tilde{A}x  &\in \bar{\partial}_z[\delta_-(z)]
    \end{cases}
\end{aligned}\tag{1}
$$

Lagrangian is a scalar function, the optimality conditions are expressed in terms of vector quantities. The subgradient can be expressed as: 

$$
\begin{aligned}
    \bar{\partial}_z [\delta_-(z)] 
    &= 
    \begin{cases}
        (-\infty, 0] & z_i \ge 0
        \\
        0 & z_i < 0
    \end{cases}
\end{aligned}
\tag{2}
$$

**Interpretations from the Saddle point of the Lagrangian**: 

* If $z_i$ is not zero, then the constraints corresponding to it must be tight. 


**Note**: 

This looks unfarmilar because I mess up the primal objective, it's usually a profits maximization problem when covered in LP math classes. 

From Here, Complimentary Slackness Arises, let's say the slack variable is $s = \tilde{b} - \tilde{A}x$, then we have $s_i \ge 0$ in all cases, then the subgradient conditions can be reworked into: 

$$
s_iz_i = 0 \quad \forall i
$$
