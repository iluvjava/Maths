---
alias: Smoothness and its Euivalences
alias: L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity
---
* [Dual Norm](Background/Dual%20Norm.md)
* [Gradient, Hessian Characterization of Convexity](CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convexity.md)
---
### **Intro**

We introduce $f:\mathbb E \mapsto \mathbb{\bar R}$, which has a Lipchitz continuous gradient, and we wish to see what is implied, and adding convexity shows a stronger equivalences between 3 different conditions. Please take note that, the inner product is not defining the norm, nor is the norm defined by the inner product. The norm is arbitrary in our context, and we use dual norm formulations instead. The inner product is the standard Euclidean space inner product, and we use Holder's inequality. 

**References:** 

Lipschitz gradient characterize change of the objective value of the functions with the norm for the gradient, and smoothness of a function, which is important for the convergence behaviors of fixed gradient method. One of the major source for this file will be coming from the UCLA class lecture slides, linked [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/gradient.pdf#page14). The references of this slide will also be acknowledged and cited. There is another paper talking about the Lipchitz Gradient and it's relations to strong convexity: [here](https://arxiv.org/abs/1803.06573). Finally, one of the ultimate reference we should use is Beck's \<First Order Methods in Optimizations\>, where it has detailed proofs and overview for characterizations of strong smoothness for functions. Finally, *Dimitri's AMATH 516* has Exercise 3.12 that covers the additional properties and equivalences for the Strong Smoothness Properties. 

**Def | Globally Lipchitz gradient**: 

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, and it has a gradient that Lipschitz continuous with constant $L >0$  when
> $$
> [0]\rightarrow \Vert \nabla f(x) - \nabla f(y)\Vert_\star\le L \Vert y - x\Vert, \;\forall x, y\in \mathbb E. 
> $$

**Observations**

We give it as a fact that, the gradient of a function is from the dual Spaces, by Frechet derivative from the Banach theorem. The statement is defined for any norm $\Vert \cdot\Vert$ in $\mathbb E$ and it is weaker than using just the Euclidean norm, and here is a list of conditions that are implied by it: 
1. $x^+\in \arg\min_x{f(x)}\implies \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+) \le (L/2) \Vert x - x^+\Vert^2$. 
   -  This gives a lower bound for the optimality gap using the gradient at the current point. 
2. $|f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert y - x\Vert^2$
   - the function can be squeezed between 2 tangential quadratic function. Observe trivially that when $f$ is convex, the absolute value can be removed. By the way the quantity inside the absolute value is the Bregmen Divergence.
3. $0\le f(y) - f(x) - \langle \nabla f(x), y - x\rangle \le \frac{L}{2}\Vert y - x\Vert^2$, 
    - the one sided smoothness conditions. 
4. $f(x) + \langle \nabla f(x), y - x\rangle + (2 L)^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert^2_\star \le f(y)$. 
5. $\langle \nabla f(x) - \nabla f(y), y - x\rangle \ge L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2$, 
    - co-coersive property, which is stronger than Lipscthitz continuity of the gradient. Observe that this looks like [Firmly Nonexpansive Operators](Operators%20Theory/Firmly%20Nonexpansive%20Operators.md).
6. $0 \le \langle \nabla f(x) - \nabla f(y), x - y\rangle\le  L\Vert x - y\Vert^2$, 
    - Monotone gradient and bounded, direct from condition (3) when convexity of $f$ is assumed.  
7. $\frac{L\Vert x\Vert^2}{2} - f(x)$ is a convex function. 
1.  $\nabla^2 f(x)\preceq LI$. 
    - This is direct from condition (6), just take the limit. 

**Remarks**

An stronger statement for the Globally Lipschitz gradient is the fact that the spectral norm of Hessian is bounded globally as well, regardless of convexity of the function or not. 

#### **Proposition 1 | Implications**

> Globally Lipchitz Gradient $\nabla f$ implies condition 1, 2 are true. Mathematically, let \[0\] denote the statement that the gradient is globally lipscthiz continuous, let \[?\] denotes the item number for the above listed conditions, then I wish to say that
> * $[0]\implies [2] \implies [1]$. 

#### **Proposition 2 | Equivalences Under Convexity**

> By assuming that $f$ is convex, and it has Lipchitz gradient, we have 
> * $[1]\implies [4]$
> * $[1]\implies [3]$
> * $[3]\implies [6]$
> * $[4]\implies [5]$
> * $[5]\implies [0]$
> 
> By prposition 1, $[0]\implies [1]$, the longest directed walk in the graph relation graph yields the biggest group of equivalences, which is $[0], [1], [4], [5]$. 

#### **Proposition 3 | More Equivalances Under Convexity**
> By assuming that $f$ is convex, with a $L$ Lipschitz gradient, we have
> * $[6]\implies [7] \implies [3]$ 
> 
> 
**Open Question | Equivalence of 1, 2 Requires Extra Ingredient**

> I am not sure when (1), (2) are equivalent if convexity is not used. However, for a function that has a well defined Hessian via second derivatives, it's equivalent. This means that counter examples if exist, might not have a continuous Hessian, and it shouldn't be convex. 


---
### **Proof of Proposition 1**

We prove that Lipchitz gradient implies smoothness (condition 1) and conditions 2. Let $f$ be a function whose gradient is globally Lipschitz. Let's start it with Cauchy Schwartz and $x, y\in \mathbb E$: 

$$
\begin{aligned}
    & \left|
        \frac{\langle \nabla f(y) - \nabla f(x), y - x\rangle}{\Vert y - x\Vert}
    \right|
    \le 
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star \le L \Vert y - x\Vert
    \\
    \implies & 
    |\langle \nabla f(y) - \nabla f(x), y - x\rangle |\le L \Vert y - x\Vert^2. 
\end{aligned}
$$

Which means that the Hessian has bounded variation. Sorry for the digression. 

#### **Showing \[0\] => \[2\]**

Let $\phi(t) = x - t(y - x)$ for $t \in [0, 1]$, then we consider the fundamental theorem of calculus: 
$$
\begin{aligned}
    & f(\phi(1)) - f(\phi(0)) = f(y) - f(x) = \int_{0}^{1} 
    \langle \nabla f(\phi(t)), y -x\rangle
    dt
    \\
    \implies & 
    f(y) = f(x) + \int_{0}^1\langle \nabla f(\phi(t)), y - x\rangle dt
    \\
    \implies & 
    \\[-2.2em]
    & \begin{aligned}
            \left|
        f(y) - f(x) - \langle \nabla f(x), y -x\rangle
        \right| &= 
        \left|
            \int_{0}^{1}\langle \nabla f(\phi(t)) - \nabla f(x), y - x\rangle dt
        \right|
        \\
        & = \left|
            \int_{0}^{1} 
                t^{-1}\langle \nabla f(\phi(t)) - \nabla f(x), \phi(t) - x \rangle
            dt
        \right|
        \\
        & \le 
        \int_{0}^{1} 
            \frac{L}{t}\Vert \phi(t) - x\Vert^2
        dt = \int_{0}^{1} 
            Lt\Vert y - x\Vert^2
        dt = \frac{L}{2}\Vert y - x\Vert^2 .
    \end{aligned}
\end{aligned}
$$

#### **Showing \[2\] => \[1\]**

From the third line to the 5th line, we have the inequality for the smoothness condition (Condition (2)). There are 2 parts of the inequality for condition (1), we start with the lower bound $\frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+)$ by taking the infimum on strong smoothness (condition (2))
$$
\begin{aligned}
    f(y) &\le f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2
    \\
    \implies \inf_y\{f(y)\} &\le f(x) + \inf_y 
    \left\lbrace
        \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y -x \Vert^2
    \right\rbrace
    \\
    & = \inf_{\Vert v\Vert = 1, t}\left\lbrace
        t\langle \nabla f(x), v\rangle + \frac{t^2L}{2}
    \right\rbrace
    \\
    & = 
    \inf_{\Vert v\Vert = 1}\left\lbrace
        \frac{-1}{L}(\langle \nabla f(x), v\rangle)^2 + 
        \frac{1}{2L}(\langle \nabla f(x), v\rangle)^2
    \right\rbrace
    \\
    &= 
    f(x) + \inf_{\Vert v\Vert = 1} \left\lbrace
        -\frac{1}{2L}\langle \nabla f(x), v\rangle^2
    \right\rbrace = f(x) - \frac{1}{2L} \Vert \nabla f(x)\Vert^2_\star, 
\end{aligned}
$$
since $x^+$ is a minimizer of $f$, we have $f(x^+)=\inf_y f(y)$ therefore the above simplifies to: 
$$
\begin{aligned}
    & f(x^+) \le f(x) - \frac{1}{2L} \Vert \nabla f(x)\Vert_\star^2
    \\
    \implies & f(x) - f(x^+) \ge \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2. 
\end{aligned}
$$

To prove the upper bound, we simply substitute $x^+$ to the smoothness condition (condition (2)), which will set $\nabla f(x^+)$ to $\mathbf 0$ because it's a minimizer for the function $f$. We skip it for simplicity. $\blacksquare$

---
### **Proof of Proposition 2**

Firstly, we want to show $[1]\implies [3] \wedge [4]$. Assume that $f$ is a convex function, consider defining 2 functions of the form
$$
\begin{aligned}
    & f_x(z) := f(z) - \langle \nabla f(x), z\rangle
    \\
    \implies  &
    \nabla_z f_x(z) = \nabla f(z) - \nabla f(x)
    \\
    \implies 
    & \arg\inf_z f_x(z) = \{x\}
    \\
    & f_y(z):= f(z) - \langle \nabla f(y), z\rangle
    \\
    \implies 
    & \nabla_zf_y(z) = \nabla f(z) - \nabla f(y)
    \\
    \implies 
    & \arg\inf_z f_y(z) = \{y\}.
\end{aligned}
$$

The function $f_x, f_y$ has a unique minimizer, which can be solved by setting the gradient to zero. $f$ is convex, and the affine function is convex too, sum of 2 convex functions are convex. The gradient of $f_x, f_y$ is globally Lipschitz too because $f$ has globally Lipschitz gradient. $x, y$ are minimizers for $f_x, f_y$, we use condition (1) obtaining 

$$
\begin{aligned}
    \frac{1}{2L}\Vert\nabla f_x(y) \Vert_\star^2 
    \le & f_x(y) - f_x(x) \le \frac{L}{2}\Vert x - y\Vert^2
    \\
    \frac{1}{2L}\Vert \nabla f(y) - \nabla f(x)\Vert_\star^2 
    \le &
    f(y) - f(x) - \langle \nabla f(x), y\rangle + \langle \nabla f(x), x\rangle
    \le
    \frac{L}{2}\Vert x - y\Vert^2
    \\
    \frac{1}{2L}\Vert\nabla f_x(y) \Vert_\star^2 
    \le & f(y) - f(x) - \langle \nabla f(x), y - x\rangle
    \le \frac{L}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$
By a similar token but in the case of $f_y$, we obtain condition (4) (So we showed $[1]\implies [3]\wedge [4]$), 
$$
\begin{aligned}
    \frac{1}{2L}\Vert \nabla f_y(x)\Vert_\star^2
    \le& f_y(x) - f_y(y) 
    \le 
    \frac{L}{2}\Vert x - y\Vert^2
    \\
    \frac{1}{2L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 
    \le& f(x) - f(y) - \langle \nabla f(y), x- y\rangle
    \le 
    \frac{L}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$
Summing the 2 inequalities we obtain the co-coercive property of the gradient (condition (5)) (So we showed $[3]\implies [6], [4]\implies [5]$): 

$$
\begin{aligned}
    \frac{1}{L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 \le 
    \langle \nabla f(y) - \nabla f(x), y -x\rangle 
    \le \frac{L}{2}\Vert x - y\Vert^2.
\end{aligned}
$$
For the above equation, using Cauchy inequality (Or Holder's Inequality in this case due to the use of the Dual norm) yields Globally Lipschitz gradient. Condition (5) alone is enough to show Lipschitz gradient conditions (condition (0)).

$$
\begin{aligned}
    \frac{1}{L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 
    &\le 
    \langle \nabla f(y) - \nabla f(x), y -x \rangle \le \Vert \nabla f(y) - \nabla f(x)\Vert_\star\Vert y - x\Vert
    \\
    \implies 
    \Vert f(x) - f(y)\Vert_\star 
    &\le L\Vert y - x\Vert
\end{aligned}
$$

so we had showed $[5]\implies [0]$. 

---
### **Proof of Proposition 3**
Next, WTS $[0]\implies [3]\implies [6]\implies [7]\implies [3]$. 


----
### **Examples**

We give examples for functions that is strongly smooth. 

**References**: Chapter 23 of Prof Heinz's Course notes. 

