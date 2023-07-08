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

Lipschitz gradient characterize change of the objective value of the functions with the norm for the gradient, and smoothness of a function, which is important for the convergence behaviors of fixed gradient method. One of the major source for this file will be coming from the UCLA class lecture slides, linked [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/gradient.pdf#page14). The references of this slide will also be acknowledged and cited. There is another paper talking about the Lipchitz Gradient and it's relations to strong convexity: [here](https://arxiv.org/abs/1803.06573). The flavor of the proofs are taken from reference I used is Beck's \<First Order Methods in Optimizations\>, and \<Lectures in Convex Optimizations\>, where they have detailed proofs Finally, *Dimitri's AMATH 516* has Exercise 3.12 that covers the additional properties and equivalences for the Strong Smoothness Properties under the assumption of Euclidean norm, hence some of the proofs here are also completed by myself using the hints from Dimitry's textbook. For the equivalences under non-convexity, I assumed that the function is at least differentiable, and the proof idea is taken from [this paper](https://arxiv.org/pdf/2212.01504.pdf), lemma 2.5. 

**Def-0 | Globally Lipchitz gradient**: 

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, and it has a gradient that Lipschitz continuous with constant $L >0$  when
> $$
> [0]\rightarrow \Vert \nabla f(x) - \nabla f(y)\Vert_\star\le L \Vert y - x\Vert, \;\forall x, y\in \mathbb E. 
> $$
> $\mathbb E$ denotes the fact that we are in finite dimensional Euclidean space, when the norm is unclear, we use $L$, if it's specific to some norm $\Vert \cdot\Vert_p$, for the RHS, we use $L_p$ to denote a change of constants during our derivations. 

**Observations**

We give it as a fact that, the gradient of a function is from the dual Spaces, by Frechet derivative in Banach space. The statement is defined for any norm $\Vert \cdot\Vert$ in $\mathbb E$ and it is weaker than using just the Euclidean norm. Additionally, in Euclidean space, Lipschitz gradient is stronger than Frechet Differentiability. 

**All Conditions**

In this file we are interested in the following list of conditions: 

1. $|f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert y - x\Vert^2$, smoothness
   - the function can be squeezed between 2 tangential quadratic function. Observe trivially that when $f$ is convex, the absolute value can be removed. By the way the quantity inside the absolute value is the Bregmen Divergence.
2. $|\langle \nabla f(y) - \nabla f(x), y - x\rangle| \le L\Vert y - x\Vert^2$, upper bounded monotonicity. 
3. $x^+\in \arg\min_x{f(x)}\implies \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+) \le (L/2) \Vert x - x^+\Vert^2$. Co-coerciveness. 
   -  Take note that if $x^+$, a minimizer doesn't exists, we may still have the lower bound, and replace $f(x^+)$ with $\inf_{x\in \mathbb E}f(x)$. 
4. $0\le f(y) - f(x) - \langle \nabla f(x), y - x\rangle \le \frac{L}{2}\Vert y - x\Vert^2$, the one sided-smoothness condition. 
5. $\frac{1}{2L}\Vert \nabla f(x) - \nabla f(y)\Vert^2_\star \le f(y) -f(x) - \langle \nabla f(x), y - x\rangle$. Not sure what name this one has. 
6. $\langle \nabla f(x) - \nabla f(y), y - x\rangle \ge L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2$, Non-expansiveness. 
    - co-coersive property, which is as strong as Lipscthitz continuity of the gradient. Observe that this looks like [Firmly Nonexpansive Operators](Operators%20Theory/Firmly%20Nonexpansive%20Operators.md).
7. $0 \le \langle \nabla f(x) - \nabla f(y), x - y\rangle\le  L\Vert x - y\Vert^2$, bounded monotonicity. 
8. $\frac{L\Vert x\Vert^2}{2} - f(x)$ is a convex function. 


**Remarks**

An stronger statement for the Globally Lipschitz gradient is the fact that the spectral norm of Hessian is bounded globally as well, regardless of convexity of the function or not. 

#### **Proposition 1 | Lipschitz Gradient Implications**

> Globally Lipchitz Gradient $\nabla f$ implies condition 1, 2 are true. Mathematically, let \[0\] denote the statement that the gradient is globally lipscthiz continuous, let \[?\] denotes the item number for the above listed conditions, then I wish to say that
> * $[0]\implies [2]$,
> * $[0]\implies [1]$,
> * $[1]\implies [2]$.
> 
> So, \[0\] could be is stronger than \[1\], which could be stronger than condition \[2\].


#### **Proposition 2 | Convexity Equivalences Group 1**
> Under convexity assumption for $f$, we have 
> * $[4]\implies [3]$, this particular one is not using convexity assumption.
> * $[4]\wedge [3]\implies [5]$
> * $[5]\implies [6]$
> * $[6]\implies [0]$ 
>
> Directly observe that under convexity assumption, using the subgradient inequality, $[2]\implies [4]$, and by Proposition $[1]$, we have $[0]\implies [2]$, hence, cycle of $[0] \implies [2] \implies [4]\implies [3]\implies [5] \implies [6]\implies [0]$, hencce all these conditions are equivalent under convexity and smoothness assumption! 

#### **Proposition 3 | Convexity and Lipschitz Gradient Equivalence Group 2 (Euclidean Norm)**

> By assuming that $f$ is convex, and assuming that we are using Euclidean norm then
> * $[4]\implies [7]\implies [8]\implies [4]$, 
> 
> Hence, under convexity, another equivalence group $[4], [7], [8]$ is also fromed. Take note that, using Euclidean norm won't affect the derived results for finite dimensional spaces. 

#### **Proposition 4 | All Equivalent Under Convexity and Euclidean Norm**
> By assuming that $f$ is convex, with a $L$ Lipschitz gradient, the conditions $[0], [1], [2], [3],[4], [5], [6], [7], [8]$ are all equivalent conditions. This is directly concluded from previous 3 proposition. 


#### **Proposition 5 | Equivalences under only Euclidean Norm**
> Assuming that we are working with the Euclidean norm, then 
> * $[2]\implies [1]$, may differ by a constant. 
> * $[2]\implies [0]$, with the same constant. 
>
> By proposition-1, the conditions $[0], [1], [2]$ all becomes equivalent. In proving so, we can also get some interesting lemma as well. 


**Remarks**

Norms are all equivalent in the finite dimensional Euclidean spaces, and hence, knowledge applies to any norm applies to any other. We explicitly mention the use of norm to stress the fact about a different constants, they might depends on dimensions and it has tremendous practial concerns and absolutely doesn't generalize to abstract vector spaces, hence, equivalences and the relations stated above for these conditions break. 

---
### **Proof of Proposition 1**

#### **Showing \[0\]=> \[2\]**
We prove that Lipchitz gradient implies smoothness and conditions 2. Let $f$ be a function whose gradient is globally Lipschitz. Let's start it with Cauchy Schwartz and $x, y\in \mathbb E$: 

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

Which means that the Hessian has bounded variation.

#### **Showing \[0\] => \[1\]**

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
        &= 
        \int_{0}^{1} 
            t^{-1}
            \Vert  \nabla f(\phi(t)) - \nabla f(x) \Vert_2
            \Vert \phi(t) - x \Vert_2
        dt
        \\
        & \le 
        \int_{0}^{1} 
            \frac{L_2}{t}\Vert \phi(t) - x\Vert^2_2
        dt = \int_{0}^{1} 
            L_2t\Vert y - x\Vert^2_2
        dt = \frac{L_2}{2}\Vert y - x\Vert^2_{\textcolor{red}{2}} .
    \end{aligned}
\end{aligned}
$$


**Remarks**

The smoothness conditions holds, but it's not holding for the standard 2-norm, there is a change in the constants compare to the norm from the original Lipschitz gradient. If some generic norm is used, then it yields the results $L/2 \Vert y - x\Vert_\star \Vert y - x\Vert$ instead, for the same constant. 

#### **Showing \[1\] => \[2\]**
Swap the $x, y$ in $[1]$, then add them together to get \[2\]. 

**Remark**

The converse should also be true without additional that $\Vert \cdot\Vert$ is the Euclidean norm. Rearranging the inequality should arraive at $\pm f(x) + \frac{L}{2}\Vert x\Vert^2$ is a convex function, then using convex subgradient to prove this. 

---
### **Proof of Proposition 2**

#### **Showing \[4\] => \[3\]**

From the third line to the 5th line, we have the inequality for the 2-side smoothness. There are 2 parts of the inequalities, we only need the upper inequality, we start with the lower bound $\frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+)$ by taking the infimum on strong smoothness: 
$$
\begin{aligned}
    f(y) &\le f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2
    \\
    \implies \inf_y\{f(y)\} &\le f(x) + \inf_{y\in \mathbb E}
    \left\lbrace
        \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y -x \Vert^2
    \right\rbrace
    \\
    & = \inf_{\Vert v\Vert = 1, t}\left\lbrace
        t\langle \nabla f(x), v\rangle + \frac{t^2L}{2}
    \right\rbrace, \; \text{by } v = y - x
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
By assumption, $x^+$ is a minimizer of convex function $f$ and it exists so that, we have $f(x^+)=\inf_y f(y)$ therefore the above simplifies to: 
$$
\begin{aligned}
    & f(x^+) \le f(x) - \frac{1}{2L} \Vert \nabla f(x)\Vert_\star^2
    \\
    \implies & f(x) - f(x^+) \ge \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2. 
\end{aligned}
$$

To prove the upper bound, we simply substitute $x^+$ to the smoothness condition (condition (2)), which will set $\nabla f(x^+)$ to $\mathbf 0$ because it's a minimizer for the function $f$, therefore at end end, we have the 2 sided-coersiveness for the function: 

$$
\begin{aligned}
    \frac{1}{2L} \Vert \nabla f(x)\Vert_\star^2 \le 
    f(x) - f(x^+) \le \frac{L}{2}\Vert x - x^+\Vert^2. 
\end{aligned}
$$

$\blacksquare$

**Remarks**

Next, observe that the assumption can be weaken. For a convex function $f$, it can be the case that the minimizer doesn't exists, but the minimum exists, meaning that $f_+ = \inf_{x\in \mathbb E} f(x)$ is possible, then $f(x) - f_+ \ge \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2$ is a possible claim. If the minimum of the function also doesn't exist, then there is no claim to be made here. Additionally, I don't think convexity is used to connected these 2 statement together, this co-coersiveness condition could be relatively weak. 


#### **Showing \[4\] AND \[3\] => \[5\]**

**Claim | About Bregman Divergences**
> Define $D_f(y | x) = f(y) - f(x) - \langle \nabla f(x), y -x\rangle$, then define $h(z) = D_f(z|x)$, then the function $h$ is convex, and it's also L-smooth, satisfying condition $[4]$. 

**Proof of the claim**

It's not hard to see that the function $D_f(y | x)$ is convex wrt variable $y$, because in $y$ the function is the sum between convex function $f(y)$ and affine function $\langle \nabla f(x), y - x\rangle$, hence it's convex. Additionally, observe that $\nabla h(z) = \nabla f(z) - \nabla f(x)$, setting the condition to be zero, it has a minimizer $x$, the solution is unique, hence the minimizer is unique. To see that $h(z)$ smooth with the same constant $L$ as $f$, consider any $x', y' \in \mathbb E$

$$
\begin{aligned}
    D_h(x' | y') &= 
    h(x') - h(y') - \langle \nabla h(x'), y' - x'\rangle 
    \\
    &= h(x') - h(y') - \langle \nabla f(x') - \nabla f(x), y' - x'\rangle
    \\
    &= 
    f(x') - f(y') - \langle \nabla f(x), x' - x\rangle + \langle \nabla f(x), y' - x\rangle - 
    \langle \nabla f(x') - \nabla f(x), y' - x'\rangle
    \\
    &= f(x') - f(y') + \langle \nabla f(x), y' - x'\rangle - 
    \langle \nabla f(x') - \nabla f(x), y' - x'\rangle
    \\
    &= f(x') - f(y') - \langle \nabla f(x'), y' - x'\rangle \le \frac{L}{2} \Vert x' - y'\Vert^2_2, 
\end{aligned}
$$

and therefore, if $f$ is a smooth function, then $h(z)$ is also a smooth function and convex. To show $[4]\wedge [3]\implies [5]$, we use the fact that it's also having a minimier: $x$, we use condition $[3]$ and then for any $z\in \mathbb E$ we have: 

$$
\begin{aligned}
    \frac{1}{2L} \Vert \nabla h(z)\Vert_\star^2 &\le 
    h(z) - h(x)
    \\
    \iff 
    \frac{1}{2L}\Vert \nabla f(z) - \nabla f(x)\Vert_\star^2 
    & \le f(z) - f(x)  - \langle \nabla f(x), z - x\rangle, 
\end{aligned}
$$

which is equivalent to condition by the arbitrary choice of $z$, setting $z = y$, then we recovered condition $[5]$ exactly. 

#### **Showing \[5\] => \[6\]**

To show, we just swap the value of $x, y$ in condition $[5]$, and then add them together to get condition $6$. 

#### **Showing \[6\] => \[0\]**
Directly by considering: 

$$
\begin{aligned}
    \frac{1}{L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 
    &\le 
    \langle \nabla f(y) - \nabla f(x), y -x \rangle \le \Vert \nabla f(y) - \nabla f(x)\Vert_\star\Vert y - x\Vert
    \\
    \implies 
    \Vert f(x) - f(y)\Vert_\star 
    &\le L\Vert y - x\Vert. 
\end{aligned}
$$

---
### **Proof of Proposition 3**

#### **Showing \[4\] => \[7\]**

Observe that $[4]\implies [7]$ is trivial, just swapp $x, y$ in condition $[4]$, and then adding them together will yield $[7]$. 

#### **Showing \[7\] => \[8\]**
To show that $[7]$ implies $[8]$, we consider that 

$$
\begin{aligned}
    \langle \nabla f(y) - \nabla f(x), y - x\rangle
    &\le \frac{L}{2}\Vert x - y\Vert^2_2
    \\
    \langle \nabla f(y) - \nabla f(x), y -x\rangle 
    &\le \frac{L}{2}\langle x - y, x - y\rangle
    \\
    0 &\le 
    \frac{L}{2}\langle x - y, x - y\rangle - \langle \nabla f(y) - \nabla f(x), y-x\rangle
    \\
    0 &\le 
    \left\langle \frac{L}{2}(y - x) - \nabla f(y) + \nabla f(x),y-x \right\rangle
    \\
    0 &\le 
    \left\langle 
        \nabla f(x) - \frac{L}{2}x - 
        \left(
            \nabla f(y) - \frac{L}{2}y 
        \right), y-x
    \right\rangle, 
\end{aligned}
$$

Now recall from [Gradient, Hessian Characterization of Convexity](CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convexity.md), the above condition is the monotonicity of the gradient of the function $\frac{L\Vert x\Vert^2_2}{2} - f(x)$, hence the function is a convex function, and this is condition $[y]$. 

#### **Showing \[8\] => \[4\]**

By convexity of $\frac{L\Vert x\Vert^2_2}{2} - f(x)$, for any $x, y$, the convex subgradient inequality yields: 

$$
\begin{aligned}
    \frac{L}{2}\Vert y\Vert^2_2 - f(y) - \frac{L}{2}\Vert x\Vert^2_2 + f(x) - \langle x, y - x\rangle
    + 
    \langle \nabla f(x), y -x\rangle &\ge 0
    \\
    -f(y) + f(x) + \frac{L}{2}
    \left(
        \Vert y\Vert^2_2 - \Vert x\Vert^2_2 - 2 \Vert x\Vert^2_2 - \langle x, y\rangle
    \right) + \langle \nabla f(x), y - x\rangle &
    \ge 0
    \\
    f(x) - f(y) + \frac{L}{2}\Vert x - y\Vert^2_2 + \langle \nabla f(x), y - x\rangle 
    &\ge 0
    \\
    \frac{L}{2}\Vert y - x\Vert^2_2
    &\ge 
    f(y) - f(x) - \langle \nabla f(x), y -x\rangle. 
\end{aligned}
$$

Which is done. And has the lower bound of $\ge 0$ by convexity of $f$. 

----
### **Proof of Proposition 5**

#### **Showing $[2]\implies [1]$**

Assuming that we are dealing with Euclidean norm, then consider 

$$
\begin{aligned}
    -L \Vert x - y\Vert_2^2 
    &\le 
    \langle \pm (\nabla f(y) - \nabla f(x)) , y - x\rangle \le L\Vert x - y\Vert_2^2
    \\
    0 
    &\le 
    \langle \pm (\nabla f(y) - \nabla f(x)) + L(y - x) , y - x\rangle \le 2L\Vert x - y\Vert_2^2
    \\
    \iff&
    \pm f(x) + \Vert x\Vert_2^2/2\text{ is cvx and smooth}, 
\end{aligned}
$$

and we only need that for both function, it's convex, and we manipulate both functions at the same time, this yields: 

$$
\begin{aligned}
    \pm f(y) + L/2\Vert y\Vert_2^2 \mp f(x) - L/2\Vert x\Vert_2^2 - 
    \langle \pm\nabla f(x), y - x \rangle 
    &\ge 0
    \\
    \pm (f(y) - f(x)) + L/2(\Vert y\Vert_2^2 - \Vert x\Vert_2^2) - 
    \langle \pm \nabla f(x), y - x\rangle - L\langle  x, y - x\rangle 
    & \ge 0
    \\
    \pm (f(y) - f(x)) + \frac{L}{2}(\Vert y\Vert_2^2 - \Vert x\Vert_2^2 + 2\Vert x \Vert_2^2
        -2\langle y, x \rangle
    ) - \langle \pm \nabla f(x), y -x\rangle 
    & \ge 0
    \\
    \frac{L}{2}\Vert  y -x\Vert_2^2 \ge \pm (f(y) - f(x) - \langle \nabla f(x), y - x\rangle), 
\end{aligned}
$$


which is equivalent to condition $[1]$. 


#### **Showing $[2]\implies [0]$**

Start with one of the claim from the previous proof, observe that $\pm f(x) + L\Vert x\Vert_2^2/2$ is cvx and smooth, then we can apply existing conditions for smooth and convex function. Let $\varphi = \pm f + L/2 \Vert \cdot\Vert_2^2$, then 

$$
\begin{aligned}
    \frac{1}{2L}\Vert \nabla \varphi (y) - \nabla \varphi (x)\Vert_2^2 
    & \le 
    \langle \nabla \varphi(y) - \nabla \varphi(x), y - x\rangle
    \le 
    2L \Vert y - x\Vert_2^2, 
\end{aligned}
$$

starting with the LHS we have

$$
\begin{aligned}
    \frac{1}{2L}\Vert \nabla \varphi (y) - \nabla \varphi (x)\Vert_2^2 
    &= 
    \frac{1}{2L}
    \Vert 
        \pm (\nabla f(y) - \nabla f(x)) + L(y - x)
    \Vert_2^2
    \\
    &=\frac{1}{2L}
    \left(
        \Vert \nabla f(y) - \nabla f(x)\Vert_2^2
        + 
        L^2 \Vert y - x\Vert_2^2 \pm 
        2L \langle \nabla f(y) - \nabla f(x), y -x\rangle
    \right)
    \\
    &=
    \frac{1}{2L}\Vert \nabla f(y) - \nabla f(x)\Vert_2^2
    + 
    \frac{L}{2} \Vert y - x\Vert_2^2 
    \pm \langle \nabla f(y) - \nabla f(x), y -x\rangle, 
\end{aligned}
$$

Moving some extra terms from the LHS to the upper bound of RHS, which is $2L\Vert y - x\Vert_2^2$, we have

$$
\begin{aligned}
    \frac{1}{2L}\Vert \nabla f(y) - \nabla f(x)\Vert_2^2 
    & \le 
    2L \Vert y - x\Vert_2^2 - \frac{L}{2}\Vert y - x\Vert_2^2 
    \underbrace{\pm \langle \nabla f(y) - \nabla f(x), y - x\rangle}_{\le L\Vert y - x\Vert_2^2}
    \\
    &\le 
    L(1 - 1/2 - 1) \Vert y - x\Vert_2^2 = L/2\Vert y-x\Vert_2^2, 
\end{aligned}
$$

moving the $L$ around and then take the square root yield the desired results. And hence, 2 sided smoothenss and differentiability is equivalent to gloable Lipscthiz gradient for function $f$ with constant $L$. 

----
### **Examples**

We give examples for functions that is strongly smooth. 

**References**: Chapter 23 of Prof Heinz's Course notes. 

