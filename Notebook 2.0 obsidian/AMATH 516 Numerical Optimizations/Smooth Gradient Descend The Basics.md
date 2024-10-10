1. [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md)
2. [Characterizing Functions for Optimizations](Characterizing%20Functions%20for%20Optimizations.md)
3. [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)

---
### **Tof for VS-code**
- [**Tof for VS-code**](#tof-for-vs-code)
- [**Intro**](#intro)
- [**The smooth descend frameworks**](#the-smooth-descend-frameworks)
  - [**Lemma | Acceptable stepsizes along the gradient for descent**](#lemma--acceptable-stepsizes-along-the-gradient-for-descent)
- [**Smooth descend with convexity**](#smooth-descend-with-convexity)
  - [**Theorem-1 | Convexity and Smoothness Implies Faster Sub-linear Rate**](#theorem-1--convexity-and-smoothness-implies-faster-sub-linear-rate)
  - [**Corollary | Convergence of the iterates and gradient norm**](#corollary--convergence-of-the-iterates-and-gradient-norm)
- [**Gradient descent with strong convexity**](#gradient-descent-with-strong-convexity)
  - [**Claim | Linear Convergence of the Iterates**](#claim--linear-convergence-of-the-iterates)
- [**PL inequality and linear convergence**](#pl-inequality-and-linear-convergence)
  - [**Definition | Polyak Inequality**](#definition--polyak-inequality)
  - [**Thm | Linear Convergence Rate by PL Conditions**](#thm--linear-convergence-rate-by-pl-conditions)
- [**Polyak Stepsize**](#polyak-stepsize)
- [**Lyapunouv arguments for gradient descent type algorithms**](#lyapunouv-arguments-for-gradient-descent-type-algorithms)
  - [**Claim | Lyapunov function for smooth gradient descent**](#claim--lyapunov-function-for-smooth-gradient-descent)
- [**Lypapunov anlaysis for smooth gradient descent**](#lypapunov-anlaysis-for-smooth-gradient-descent)
  - [**Claim | Convergence rate of gradient descent**](#claim--convergence-rate-of-gradient-descent)


---
### **Intro**

We try to remake a previous passage [Gradient Descend, Smoothness](Gradient%20Descend,%20Smoothness.md) but go more in depth into the related ideas, because this smoothness conditions goes beyond what is employed in the proof for the smooth gradient, it's also used in envelope method, such as the forward backwards envelope for non-smooth added with smooth objectives. Gradient descent is $x^{(k + 1)} = x^{(k)} - \eta\nabla f(x^{(k)})$, where $\eta$ is a step size that can change. 

**Standing assumptions**

1. $f$ is a differentiable function and it's $L$-Lipschitz smooth. 

**A measure of optimality metric**: 

Order from the strongest metric to the weakest metric for optimality of a function, we have for some $x$: 

1. Minimizer exists, measure with  $\Vert x - x^+\Vert$. This is called "error". If the minimizer is a set $X_*$, then it's measured by $\inf_{y \in x_*} \Vert x - y\Vert$.
2. Minimum exists, measure with $f(x) - \inf_x  f(x)$. Further assume that the minimizers $x^+$ exist, then it's $f(x) - f(x^+)$. This is called the "Optimality Gap. "
3. $\Vert \nabla f(x)\Vert$, the size of the gradient. It measure how stationary the current point $x$. 

Item (1.) assume the existence of a set $X_*\neq \emptyset$ such that $x^+ \in X_*$. 
It directly measures the distance of current iterate $x$ to $X_*$. 
Item (2.) assumes that the function is bounded below and there exists minimizer $x^+$. 
It measures how close the function value is to the minimum value of the function at the minimizers. 
Item (3.) 3 measures how close $x$ is a staiondary point. 

Assume optimal metrics, (1.) implies (2), the existence of a minimizers implies the existence of the minimum value of the function. 
The converse is false. 
Assume optimal metric (1.) implies (3.), if a minimizer exists then the gradientat the minimizer can be is zero, reaching the optimality. 
The converse is false. 


---
### **The smooth descend frameworks**

The main idea is to create an upper bounding function and then minimize the upper bounding function to attain the next point for the gradient descend method. 
Suppose that $f$ is smooth globally (both from above and below!) with a constant that is $L$, which is the smallest it can possibly be, then the smoothness characterizations provides

$$
\begin{aligned}
    & |f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert y - x\Vert^2
    \\
    \implies
    & f(y) \le f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2, \; \forall x, y \in \mathbb E,
    \\
    & \mathcal M_L(y; x) := f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2. 
\end{aligned}
$$

The above conditions are all consequence of the gradient of $f$ being Lipschitz with a constant $L$. 
The function $\mathcal M_L(\cdot; x)$ is a Surrogate function modeled at $x$. 
Constructed via the smoothness condition of $f$, the surrogates exhibits $f(y) \le \mathcal M_L(y; x)$ for all $x, y \in \R^n$. 
In this case it's a quadratic function hence strongly convex too. 
Therefore, the minimizer of the surrogate function has characterization: 

$$
\begin{aligned}
    & \textcolor{gray}{\text{By S-CVX of } \mathcal M_L(\cdot; x)}
    \\
    & \exists!\; y^+ \in \arg\min_y \mathcal M_L(y; x) : \nabla f(x) + L(y^+ - x)  
    = \mathbf 0 \quad 
    \\
    \iff & y^+ = x - L^{-1}\nabla f(x)
\end{aligned}
$$

The minimum of the surrogate function at $x$ has representation 

$$
\begin{aligned}
    \mathcal M_L(y^+; x) 
    &= f(x) + \langle \nabla f(x), - 
    L^{-1}\nabla f(x)\rangle + \frac{L}{2}\Vert  - L^{-1}\nabla f(x)\Vert^2, 
    \\ 
    
    &= 
    f(x) -L^{-1}\Vert \nabla f(x)\Vert^2 + \frac{1}{2L}\Vert \nabla f(x)\Vert^2, 
    \\
    & = f(x) - \frac{1}{2L}\Vert \nabla f(x)\Vert^2
    \\
    \implies
    & 
    f(y^+) \le \mathcal M_L(y^+; x) = f(x) - \frac{1}{2L}\Vert\nabla f(x) \Vert^2. 
\end{aligned}
$$


Unsurprsingly $y^+ = x - L^{-1}\nabla f(x)$ yields gradient descent update. 
Using different types of surrogates will yield different scheme. 
In this case, $y^+$ is the next guess that produces the maximum decrease in the objective value of the function. 
Since $L$ is the minimum Lipschitz smoothness constaint of $f$, the descent step and the surrodate function remains valids for all $\beta \ge L$. 
Surrogates $\mathcal M_\beta(x; y)$ where $\beta \ge L$ derives gradient descent with a smaller stepsizes: $y^+ = x - \beta^{-1}\nabla f(x)$. 

Suppose that for all $t\in \N$: $x^{(t + 1)} = y^+ = x^{(t)} - L^{-1}\nabla f(x^{(t)})$, then we have: 

$$
\begin{aligned}
    & f(x^{(t + 1)}) - f(x^{(t)}) \le -2L^{-1}\Vert \nabla f(x^{(t)})\Vert^2
    \\
    \implies &
    f(x^{(t + 1)}) - f(x^{(0)}) \le 
    \sum_{j = 1}^{t} -2L^{-1}\Vert \nabla f(x^{(j)})\Vert^2
    \\
    \implies
    & 
    \min_{0 \le j \le k}\left\Vert \nabla f(x^{(j)})\right\Vert^2 \le 
    \frac{1}{k}\sum_{j = 1}^{k}\Vert \nabla f(x_j)\Vert^2
    \le k^{-1}(L/2)(f(x^{(0)}) - f(x^{(k + 1)}))
    \\
    \implies & 
    \min_{0 \le j \le k}\left\Vert \nabla f(x^{(j)})\right\Vert \le
    k^{-1/2}\sqrt{(L/2)(f(x^{0}) - f(x^{(k + 1)}))} \; .
\end{aligned}
$$

The inequality yields a relation between the improvements of the optimality graph between $x^{0}$ and $x^{k + 1}$ and the minimum norm value of the gradient. 
It also specifies the convergence rate of the minimum of $\Vert \nabla f(x^{j})\Vert$ wrt to the optimality improvements between the iterates. 
Monotonicity of the norm acannot be established but the monotonicity of the function value is clear from the descent and the surrogate function. 


**Smooth descent and stationarity**: 
> $$
> \min_{0 \le j \le k}
> \left\Vert 
>   \nabla f\left(x^{(j)}\right)
> \right\Vert 
> \le k^{-1/2}\sqrt{2\beta(f(x^{0}) - f_{\min})}, 
> $$

indicating that the minimum of the gradient converges to $\mathbf 0$ at a sub-linear rate of $\mathcal O(1/\sqrt{k})$. 

**Remarks**

Investiations above only asserts $f(x^{(t)})$ to be non-increasing. 
It has nothing to say about the convergence in error and the optimality gap. 
More assumptions for $f$ is required to state stronger claim about the iterative scheme. 

> [!details]-
> Here are the possibility for the optimality gap: 
>    1. If $f$ is bounded below, by monotone convergence theorem, $f(x^{(t)})$ will converge as $t\rightarrow \infty$. But it doesn't mean $x^{(t)}$ converges. To asserts convergence, it requires that iterates $x^{(j)}$ sequence exists on a compact set. Then there exits a convergent subsequence $x^{(j_k)} \rightarrow \bar x$. It further requires to verify that $\lim_t \Vert x^{(t + 1)} - x^{(t)}\Vert = 0$. A lot more still requires to show the convergence of the sequence. It's possible that there is still a "limit cycle" type of behaviors for the iterates. 
>    2. If $f$ is not bounded below, the iterates can converge to a local minimum, or it can go on forever and the function value keep decreasing indefinitely. 

These possiblities are still true even if $\liminf_{t\in \N} \Vert \nabla f(x^{(t)})\Vert = 0$. 

The gradient doesn't classify local optimality nor global optimality. 
It could be a false convergence to an inflection point of some sort (that would be lucky for the gradient). 
Due to these complications, it raise up the motivation to discuss [Kurdyka Lojasiewicz Inequality](Proximal%20Methods/Kurdyka%20Lojasiewicz%20Inequality.md) for analysis of the convergence of the algorithm under for smooth gradient descent. 
These ideas readily extends to subgradient descent and proximal gradient descent method. 

#### **Lemma | Acceptable stepsizes along the gradient for descent**
> A range of value for the stepsize for the simple smooth gradient descent is possible. 
> Focusing on strictly decreasing the objective value, valid step sizes would be $\eta \in (0, 2/L)$ for an $L$-smooth function. 
> This relaxes the conditions for $\eta \in (0, L^{-1})$ from minimizing upper surrogates $\mathcal M_\beta(\cdot; x), \forall \beta \ge L$ to determine the next iterates. 

**Proof**

To assert decreasing objective sub optimal solutions for $\mathcal M_L(\cdot; x)$ suffices. 
However there would be many solution and it won't yield the gradient descent routine. 
All elements from the set $\{y : \mathcal M_L(y; x) \le f(x)\}$ are valid. 
We add the additional assumptions that the iterates exists on the linear subspace span by the gradient at current point $x$, therefore we want $y = x - \eta \nabla f(x)$ where $\eta > 0$. 

$$
\begin{aligned}
    f(x - \eta \nabla f(x)) 
    \le
    \mathcal M_L(x - \eta \nabla f(x); x) 
    &< f(x)
    \\
    f(y) 
    \le 
    f(x) + \langle \nabla f(x), - \eta \nabla f(x)\rangle 
    + 
    \frac{L}{2}\Vert  - \eta \nabla f(x)\Vert^2
    &< f(x)
    \\
    f(y) - f(x)
    \le 
    - \eta \Vert \nabla f(x)\Vert^2
    + 
    \frac{L \eta^2}{2}\Vert \nabla f(x)\Vert^2
    &< 0
    \\
    f(y) - f(x) \le 
    \left(
        \frac{L\eta^2}{2} - \eta
    \right)\Vert \nabla f(x)\Vert^2 
    &< 0, 
\end{aligned}
$$
there for solving for the value of $\eta$ we would have 

$$
\begin{aligned}
    \frac{L\eta^2}{2} - \eta 
    &< 0
    \\
    \frac{L \eta }{2} - 1 &< 0, \; \eta > 0
    \\
    \eta &< 2/L, 
\end{aligned}
$$

it yield the result of $\eta \in (0, 2/L)$. 


---
### **Smooth descend with convexity**

Convergence results strengthen if $f$ is convex. 


#### **Theorem-1 | Convexity and Smoothness Implies Faster Sub-linear Rate**

> If $f$ is convex, lsc, proper and $x^+$ is a minimizer of $f$, then the convergence rate of a function $f$ that is $L$-smooth has its objective value converging sub-linearly with $\mathcal O(t^{-1})$ for the gradient descent routine

**Proof:**

Using Lipschitz gradient and convexity successive iterates $x^{(t)}, x^{(t + 1)}$ has: 

$$
\begin{aligned}
    f\left(x^{(t + 1)}\right) 
    & \le 
    f\left(x^{(t)}\right) + 
    \left\langle\nabla f\left(x^{(t)}\right), x^{(t + 1)} - x^{(t)} \right\rangle 
    + \frac{L}{2}
    \left\Vert x^{(t + 1)} - x^{(t)}\right\Vert^2
    \\
    &= 
    \underbrace{
        f\left(x^{(t)}\right) 
        + \left\langle\nabla f\left(x^{(t)}\right), x^{+} - x^{(t)} \right\rangle
        }
    _{\le f(x^+)}
    + 
    \left\langle \nabla f\left(x^{(t)}\right), x^{(t + 1)} - x^+ \right\rangle
    + \frac{L}{2}
    \left\Vert x^{(t + 1)} - x^{(t)}\right\Vert^2
    \\
    & \le 
    f(x^+) 
    + 
    \frac{L}{2}\left\Vert x^{(t + 1)} - x^{(t)}\right\Vert^2 + 
    \left\langle \nabla f(x^{(t)}), x^{(t + 1)} - x^+ \right\rangle
    \\
    & = 
    f(x^+) + \frac{L}{2}\left\Vert x^{(t + 1)} - x^{(t)}\right\Vert^2 +
    \left\langle \frac{1}{\eta}(x^{(t)} - x^{(t + 1)}), x^{(t + 1)} - x^+ \right\rangle
    \\
    & \textcolor{gray}{
        \eta\in (0, 2/L) \implies 1/\eta \in (L/2, \infty) \implies  1/\eta > L/2 > L
    }
    \\
    &< 
    f(x^+) + 
    \frac{1}{2\eta}\left\Vert x^{(t + 1)} - x^{(t)}\right\Vert^2 + 
    \left\langle \frac{1}{\eta}(x^{(t)} - x^{(t + 1)}), x^{(t + 1)} - x^+ \right\rangle
    \\
    &= 
    f(x^+)+ \frac{1}{2\eta}\left(
        \left\Vert x^{(t + 1)} - x^{(t)}\right\Vert^2 +
        2\left\langle x^{(t)} - x^{(t + 1)}, x^{(t + 1)} - x^+ \right\rangle
    \right)
    \\
    &= f(x^+) + 
    \frac{1}{2\eta}
    \left(
        \left\Vert 
            x^{(t)} - x^{(t + 1)} + x^{(t + 1)} - x^+\right
        \Vert^2 - 
        \left\Vert x^{(t + 1)} - x^+
        \right\Vert^2
    \right)
    \\
    & = f(x^+) + \frac{1}{2\eta}
    \left(
        \left\Vert x^{(t)} - x^+\right\Vert^2  - \left\Vert x^{(t + 1)} - x^+\right\Vert^2
    \right), 
\end{aligned}
$$

Telescoping for $t = 1, \cdots, k$, using monotone descent property of the function value: 

$$
\begin{aligned}
    \sum_{j = 1}^k f\left(x^{(j)}\right) - f(x^+) 
    &< 
    \frac{1}{2\eta}\left(
        \left\Vert x^{(0)} - x^+\right\Vert^2 - \left\Vert x^{(k + 1)} - x^+\right\Vert^2
    \right) \le \
    \frac{1}{2\eta}\left\Vert x^{(0)} - x^+\right\Vert^2
    \\
    & \textcolor{gray}{\triangleright f(x^{(j)}) \text{ monotone decreasing}}
    \\
    \implies
    f\left(x^{(k + 1)}\right) - f(x^+) 
    &\le 
    \frac{1}{k}\left(
        \sum_{j = 1}^{k}
        f\left(x^{(j)}\right) - f(x^+)
    \right) 
    \le \frac{1}{2k\eta}\left
        \Vert x^{(0)} - x^+\right\Vert
    ^2
    \\
    f\left(x^{(k + 1)}\right) - f(x^+) 
    &\le 
    \frac{1}{2k\eta}\left\Vert x^{(0)} - x^+\right\Vert^2, 
\end{aligned}
$$

which indicates that the convergence rate is sub-linear, in $\mathcal O(k^{-1})$ by constraints of the stepsizes that allows for descent. 

**Remarks**

I am not sure what happens when we still have the convexity but without the minimizer for the function. 
However, please observe that the fact that $x^+$ is a minimizer of the function is never used to make the gradient $\nabla f(x^+) = \mathbf 0$, for the first part of the proof. The fact that $x^+$ is a minimizer is only used for the second part of the proof. 
I am sure that $f(x^{(t)})$ will converge to the minimum is just that the iterates $x^{(t)}$ doesn't converge. 


#### **Corollary | Convergence of the iterates and gradient norm**
> Assume $f$ is convex, and there exists a fixed point for $\nabla f(x)$, then gradeint descent has convergence of the norm of the gradient and the iterates. 

**Proof**

The function value is bounded by the norm of the gradient and Co-Coersivity described in [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) of the Lipschitz gradient, more specifically $1/2L \Vert \nabla f(x^{(j)})\Vert^2 \le f(x) - f(x^+)$, hence bounding the squared norm of the gradient as well. 
To show the convergence of the iterates, consult fixed point iterations and convergence of an averaged operator, see [Averaged Mapping](Operators%20Theory/Averaged%20Mapping.md) for more information. 

**Remarks**

Without convexity, I don't have the proof to assert the convergence of the iterates from the gradient descent algorithm. 

---
### **Gradient descent with strong convexity**

We present results on smooth gradient descent when the objective function is $\beta$-strongly convex. For a definition and the consequences of a function $f$ being strongly convex, see [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md) for more information. 

When a function has Lipschitz smooth gradient and strong convexity, the gradient operator $I - \eta \nabla f$  is a contraction for values of $\eta \in (0, 2/L)$. Read [Appearances of Contraction Operators in Optimizations Method](Operators%20Theory/Appearances%20of%20Contraction%20Operators%20in%20Optimizations%20Method.md) for a more detailed proof. That results presented there will show that $\Vert x^{(k)} - x^+\Vert$ contracts linearly with a ratio $\min(|1 - \eta L|, |1 - \eta \beta|)$. 

#### **Claim | Linear Convergence of the Iterates**
> Gradient descent on $f$, a function that has $L$-Lipschitz smooth gradient and $\beta$ strong convexity with step size $\eta \in (0, 2/L)$ will converge linearly with rate $\min(|1 - \eta L|, |1 - \eta \beta|)$. 

**Proof**

Linear convergence of the iterates and strong convexity are conditions sufficient for the linear convergence of the objective value of the function. We had $\Vert T x -  Ty\Vert \le \min(|1 - \eta L|, |1 - \eta \beta|) \Vert x - y\Vert$ directly from the gradient $T = I - \eta \nabla f(x)$ descent operator and the proof for contraction. Setting $x = x^{(0)}, y = \bar x$ with $x^{(k)}$ being the sequence generated by fixed point iterations of $T$, and $\bar x$ is an unique minimizer for $f$ which exists as a consequence of stron convexity, then unrolling the recursion of the inequality yield linaer convergence rate of the iterates wrt to the initial error to the minimizer. 

**Remarks**

$L$=smoothness of $f$ yield that for every point $x, y \in \mathbb R^n$ we have $f(x) - f(\bar x) \le L /2 \Vert x - \bar x\Vert^2$, therefore, the linear rate under strong convexity would translate to the objective value as well. Additionally, the convergence rate for a smooth function is not necessarily with strong convexity would still apply, and therefore yielding the final convergence rate of 

$$
\begin{aligned}
    f\left(x^{(k)}\right) - f(\bar x) 
    &\le 
    \min \left(
        \frac{L}{2} \max(|1 - \eta L|, |1 - \eta \beta|)^k,
        \frac{1}{2k\eta}
    \right)\left\Vert
        x^{(0)} - \bar x
    \right\Vert^2, 
\end{aligned}
$$

for all $\eta \in (0, 2/L)$.


---
### **PL inequality and linear convergence**

PL means Polyak Inequalities, it's a relation between the norm of the gradient and the difference in the function's objective value. It's a Generalization of the KL inequality with some specific parameters. See [Kurdyka Lojasiewicz Inequality](Proximal%20Methods/Kurdyka%20Lojasiewicz%20Inequality.md) for more details. The inequality allows us to derive linear rate convergence without assumptions about uniqueness of the minimizer and the convexity of the objective function. This is one of the characterizations for function satisfying the PL inequality. 

#### **Definition | Polyak Inequality**

> A function $f$ has a minimizer $f^+$ and it's differentiable. Then it satisfies PL inequality with a PL constant of $u > 0$ if 
> 
> $$
> u(f(x) - f^+) \le \frac{1}{2}\Vert \nabla f(x)\Vert^2, \forall x. 
> $$

**Observations**

A strongly convex function would satisfy PL conditions. 
See [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md) for more information. 
PL doesn't imply convexity. 


**Remarks**


#### **Thm | Linear Convergence Rate by PL Conditions**

[See here](Linear%20Convergence%20From%20PL%20Condition) for more coverage of this topic. 



---
### **Polyak Stepsize**

Suppose that $f^*$, the optimal objective value for the optimization problem is known, then the sequence $\gamma_k = (f(x^{(k)}) - f^*)/\Vert \nabla f(x^{(k)})\Vert^2$ will converge on a convex function with rate $\mathcal O(k^{-1})$. For more about this visit [Polyak Subgradient Method](Proximal%20Methods/Polyak%20Subgradient%20Method.md)



---
### **Lyapunouv arguments for gradient descent type algorithms**

Another way the are more fashionable is to use the Lyapunov argument to reveal the convergence of gradient descent algorithm. Lyaponov arguments are not limited to just gradient descent. To prove, we use $X(t), x^{(t)}$ to represent continuous, discrete dynamics generated by continuous gradient descent and discrete gradient descent. A continuous gradient descent is the dynamical system 

$$
\begin{aligned}
    \partial_t X(t) = \underset{v}{\text{argmin}}
    \left\lbrace
        \langle \nabla f(X(t)), v\rangle + \frac{\Vert v\Vert^2}{2}
    \right\rbrace
    =-\nabla f(X(t)), 
\end{aligned}
$$

for some objective function $f$. Lyapunov function $E_t$ is an expression involving some quantities parameterized by time such that it's monotonically decreasing. Use $\Upsilon_t$ to represent the Lyapunove function for continuous gradient dynamics. 


#### **Claim | Lyapunov function for smooth gradient descent**
> Assume $f$ is L-Lipschitz smooth and bounded below, then continuous Lyapunov function for smooth gradient is $\Upsilon_t = f(X(t)) - f_*$, and the discrete dynamical system is $E_t = f(x^{(t)}) - f_*$. 

**Proof**

Taking the derivative over $\Upsilon_t$ yields 
$$
\begin{aligned}
\partial_t \Upsilon_t = 
    \left\langle \nabla f(X(t)), \partial_t X(t)\rangle = - \langle \nabla f(X(t)), \nabla f(X(t))\right\rangle 
    \le 0, 
\end{aligned}
$$

for discrete dynamics we have $E_t = f(x^{(t)}) - f_*$, assuming $x^{(t + 1)} = x^{(t)} - \eta_t \nabla f(x^{(t)})$, with a time step sizes of $t = 1$ we have 

$$
\begin{aligned}
    E_{t + 1} - E_t &= f(x^{(k + 1)}) - f(x^{(k)})
    \\
    &= -\eta \left(
        1 - \frac{\eta L}{2}
    \right)
    \left\Vert \nabla f\left(x^{(t)}\right)\right\Vert^2
    \\
    & \triangleright \; \text{telescoping summation makes}
    \\
    E_k - E_0 &\le 
    \sum_{t = 1}^{k}
    - \eta_t\left(
        1 - \frac{\eta_t L}{2}
    \right)\left\Vert 
        \nabla f\left(x^{(t)}\right)
    \right\Vert^2
    \\
    E_0 - E_k &\ge \sum_{t = 1}^{k} 
        \eta_t \left(
            1 - \frac{\eta_t L}{2}
        \right)\left\Vert
            \nabla f\left(x^{(t)}\right)
        \right\Vert^2
    \\
    & \triangleright ([1])
    \\
    &\ge 
    \min_{t = 1, \cdots, k} 
    \left\Vert
        \nabla f\left(x^{(t)}\right)
    \right\Vert^2
    \sum_{t = 1}^{k} 
        \eta_t \left(
            1 - \frac{\eta_t L}{2}
        \right)
    \\ 
    \implies 
    \frac{E_0 - E_k}{
       \sum_{t = 1}^{k} 
        -\eta_t \left(
            1 - \frac{\eta_t L}{2}
        \right) 
    } &\ge 
    \min_{t = 1, \cdots, k} \left\Vert
        \nabla f\left(x^{(t)}\right)
    \right\Vert^2, 
\end{aligned}
$$

At (\[1\]), we used the descent lemma to assert the terms in the summation are all positive.  We showed best case of a constant stepsize, we showed that $\mathcal O(1/\sqrt{k})$ convergence rate for $\Vert \nabla f(x^{(k)})\Vert$. 


**Remark**

Continuous time dynamics won't work with discrete time dynamics like what we usually have for optimization algorithms. 
To check the vadility of the claim, we need to consider $\eta_t(E_{t +1} - E_t)$ so that we have $(1 - \eta L /2) \le 0$ to allow for the value of the Lyaponouv function to decrease. 




---
### **Lypapunov anlaysis for smooth gradient descent**

In this section we refine the arguments from the previous section. 
We highlight new techniques for the analysis and ideas that simplifies the process for the convergence rate. 
The difficult part of the analysis relates to stepszies in the range $(L^{-1}, 2L^{-1})$, and varying stepszie sequence. 


#### **Claim | Convergence rate of gradient descent**
> Let $f$ be $L$-Lipschitz smooth convex lsc. 
> For any $x_0 \in \R^n$, there exists $x_* \in \argmin{x} f(x)$, the minimizer for the function. 
> Let the sequence $(x_t)_{t \in \N}$ be generated by $x_{t + 1} = x_t - \eta_t \nabla f(x_t)$, where $\eta_t \in (0, 2L^{-1})$. 
> Let sequence $(\sigma_t)_{t \in \N}$ satisfies the condition $\sigma_{t + 1} - \sigma_t \le L \eta_t$, with the choice 
> $$
> \begin{aligned}
>     \eta_t \le \frac{2}{L} - \frac{\eta_t}{L\eta_t + \sigma_t}, 
> \end{aligned}
> $$
> The quantity $\Delta_t := f(x_t) + (1/2)\Vert x - x_*\Vert^2$ converges at a rate of $\mathcal O(\sigma_t^{-1})$. 

**Proof**

To start, we list the following quantities: 

$$
\begin{aligned}
    e_t &:= x_t - x_* \quad (\forall t \in \N \cup \{0\})
    \\
    \Delta_t &:= f(x_t) - f(x_*) \quad (\forall t \in \N \cup \{0\})
    \\
    \sigma_0 &:= L\eta_0
\end{aligned}
$$

Assume the following statements which we will prove at the end. 
For all $t \in \N \cup \{0\}$, it has 

$$
\begin{aligned}
    {[(1)]}: \quad &
    \frac{1}{2}
    (
        \Vert e_{t + 1}\Vert^2 - \Vert e_{t}\Vert^2
    ) 
    = 
    \eta_t \langle \nabla f(x_t), x_* - x_t\rangle + 
    \frac{\eta_t^2}{2}\Vert \nabla f(x_t)\Vert^2
    \\
    [(2)]: \quad & 
    \Delta_{t + 1 } - \Delta_t 
    - \left(
        \frac{L\eta_t^2}{2} - \eta_t
    \right)\Vert \nabla f(x_t)\Vert^2 
    \le 0 \quad \forall \eta_t \in (0, 2L^{-1})
    \\
    [(3)] :\quad & 
    \Delta_t + 
    \langle \nabla f(x_t), x_* - x_t\rangle
    \le 0 
    \\
    [(4)] :\quad & 
    0 < \sigma_{t + 1} - \sigma_t \le L \eta_t. 
\end{aligned}
$$


These equations allows us to show the convergence of the algorithm quickly. 
Using the `[(4)]` equation, it can be said that 

$$
\begin{aligned}
    \sigma_{t + 1}\Delta_{t + 1} - 
    \sigma_t \Delta_t &= 
    \sigma_{t + 1} \Delta_{t + 1} + 
    (\sigma_{t + 1} - \sigma_t)\Delta_t - \sigma_{t + 1} \Delta_t
    \\
    &= 
    \sigma_{t + 1}(\Delta_{t + 1} - \Delta_t) + 
    (\sigma_{t + 1} - \sigma_t)\Delta_t
    \\
    &\textcolor{gray}{\text{ by [(4)]: }}
    \\
    &\le \sigma_{t + 1}(\Delta_{t + 1} - \Delta_t) + L\eta_t \Delta_t
\end{aligned}
$$

Directly observe that a non-negative linear combinations of inequalities $\sigma_{t + 1} ([2]) + L\eta_t[(3)]$ produces: 

$$
\begin{aligned}
    \sigma_{t + 1}
    \left(
        \Delta_{t +1} - \Delta_t - 
        \left(
            \frac{L\eta_t^2}{2} - \eta_t
        \right)\Vert \nabla f(x_t)\Vert^2
    \right)
    + 
    L\eta_t
    \left(
        \Delta_t 
        + 
        \left\langle
            \nabla f(x_t), x_* - x_t
        \right\rangle
    \right) 
    &\le 
    0. 
\end{aligned}
$$

Rearranging `[(1)]`: 

$$
\begin{aligned}
    \frac{1}{2}
    (
        \Vert e_{t + 1}\Vert^2 - \Vert e_{t}\Vert^2
    ) 
    -\frac{\eta_t^2}{2}\Vert \nabla f(x_t)\Vert^2
    &= 
    \eta_t \langle \nabla f(x_t), x_* - x_t\rangle 
    \\
    \frac{L}{2}
    (
        \Vert e_{t + 1}\Vert^2 - \Vert e_{t}\Vert^2
    ) 
    -\frac{L\eta_t^2}{2}\Vert \nabla f(x_t)\Vert^2
    &= 
    L\eta_t \langle \nabla f(x_t), x_* - x_t\rangle, 
\end{aligned}
$$

substituting back into the inequality yield: 

$$
\begin{aligned}
    \sigma_{t + 1}
    \left(
        \Delta_{t +1} - \Delta_t
    \right)
    - \sigma_{t + 1}\left(
            \frac{L\eta_t^2}{2} - \eta_t
        \right)\Vert \nabla f(x_t)\Vert^2
    + 
    L\eta_t
    \Delta_t 
    + 
    \frac{L}{2}
    (
        \Vert e_{t + 1}\Vert^2 - \Vert e_{t}\Vert^2
    ) 
    -\frac{L\eta_t^2}{2}\Vert \nabla f(x_t)\Vert^2
    &\le 
    0
    \\
    \underset{[(4)]}{\implies}
    \sigma_{t + 1}\Delta_{t + 1} - \sigma_t\Delta_t
    - \left(
        \sigma_{t + 1}\left(
            \frac{L\eta_t^2}{2} - \eta_t
        \right) + 
        \frac{L\eta_t^2}{2}
    \right)
    \Vert \nabla f(x_t)\Vert^2
    + 
     \frac{L}{2}
    (
        \Vert e_{t + 1}\Vert^2 - \Vert e_{t}\Vert^2
    ) 
    &\le 0
    \\
    \sigma_{t + 1}
    \left(\Delta_{t + 1} + \frac{L}{2}\Vert e_{t + 1}\Vert^2\right)
    - \sigma_{t}
        \left(\Delta_{t} + \frac{L}{2}\Vert e_{t}\Vert^2\right)
    - \eta_{t + 1}\left(
        \sigma_{t + 1}\left(
            \frac{L\eta_t}{2} - 1
        \right) + 
        \frac{L\eta_t}{2}
    \right)
    \Vert \nabla f(x_t)\Vert^2
    &\le 0. 
\end{aligned}
$$

Define $\Phi_t = \Delta_t + \frac{L}{2}\Vert e_t\Vert^2$ for all $t \in \N \cup \{0\}$ and assume that 

$$
\begin{aligned}
    \sigma_{t + 1}\left(
        \frac{L\eta_t}{2} - 1
    \right) + 
    \frac{L\eta_t}{2}
    &\le 0. 
\end{aligned}\tag{$\star$}
$$
We will identify a sequencer for $(\star)$ at the end of the proof, for now observe that the inequality evalutes to 

$$
\begin{aligned}
    \sigma_{t + 1}\Phi_{t + 1} - \sigma_t \Phi_t
    &\le 0
    \\
    \implies 
    \sum_{i = 0}^{t - 1} \sigma_{t + 1}\Phi_{t + 1} - \sigma_t \Phi_t 
    = 
    \sigma_t \Phi_t - \sigma_0 \Phi_0
    &\le 0
    \\
    \sigma_t \Phi_t \le \sigma_0 \Phi_0. 
\end{aligned}
$$

This yields the convergence rate of the algorithm. 

To show `[(1)]` we have 

$$
\begin{aligned}
    \frac{1}{2}\left(
        \Vert e_{t + 1}\Vert^2 - 
        \Vert e_t\Vert^2
    \right)
    &= 
    \frac{1}{2}
    \left(
        \Vert x_{t + 1} - x_*\Vert^2 - 
        \Vert x_t - x_*\Vert^2
    \right)
    \\
    &= 
    \frac{1}{2}
    \left(
        \Vert x_t - \eta_t \nabla f(x_t) - x_*\Vert^2 - 
        \Vert x_t - x_*\Vert^2
    \right)
    \\
    &= 
    \frac{1}{2}
    \left(
        \Vert \eta_t\nabla f(x_t)\Vert^2 
        -2 
        \langle \eta_t\nabla f(x_t), x_t - x_*\rangle
    \right)
    \\
    &= \frac{\eta_t^2}{2}\Vert \nabla f(x_t)\Vert^2 
    + 
    \eta_t \langle \nabla f(x_t), x_* - x_t\rangle. 
\end{aligned}
$$

To show `[(2)], [(3)]`; by $L$-Lipschitz smoothness and convexity of $f$, we have 

$$
\begin{aligned}
    (\forall z): \quad 
    \frac{L}{2}\Vert z - x\Vert^2 
    &\ge 
    f(z) - f(x) - \langle \nabla f(x), z - x\rangle \ge 0. 
\end{aligned}
$$

Set $z = x_{t + 1}, x = x_t$, it's 

$$
\begin{aligned}
    \frac{L}{2}\Vert x_{t + 1} - x_t \Vert^2 
    &\ge f(x_{t + 1}) - f(x_t) - \langle  \nabla f(x_t), - \eta_t \nabla f(x_t)\rangle
    \ge 0
    \\
    \frac{L\eta_t^2}{2}\Vert \nabla f(x_t)\Vert^2 
    &\ge 
    \Delta_{t + 1} - \Delta_{t} 
    + \eta_t \Vert \nabla f(x_t)\Vert^2 \ge 0
    \\
    0 &\ge 
    \Delta_{t + 1} - \Delta_{t} 
    - \left(
        \frac{L\eta_t^2 }{2} - \eta_t 
    \right)\Vert \nabla f(x_t)\Vert^2. 
\end{aligned}
$$

observed that for all $\eta_t \in (0, 2L^{-1})$, the coefficient $L\eta_t^2/2 - \eta_t \le 0$. 
Next, set $z = x_*, x = x)t$, then 

$$
\begin{aligned}
    f(x_*) - f(x_t) - \langle \nabla f(x_t), x_* - x_t\rangle 
    &\ge 0
    \\
    - \Delta_t - \langle \nabla f(x_t), x_* - x_t\rangle &\ge 0
    \\
    \Delta_t + \langle \nabla f(x_t), x_* - x_t\rangle &\le 0. 
\end{aligned}
$$


Finally, to find a sequence $\eta_t \in (0, 2L^{-1}), \sigma_t$ such that the it produce the Lyapunov argument, it must satisfy condition listed: $(\star)$. 
One way to do it is to conside $\eta_t = 2L^{-1} - \sigma_t$, by $\eta_t \in (0,2L^{-1})$ so obviously $\epsilon_t \ge 0$. 
Now it gives $L\eta_t/2 - 1 = - \epsilon_tL/2$, and that makes $(\star)$: 

$$
\begin{aligned}
    \sigma_{t + 1}\left(
        \frac{- \epsilon_tL}{2}
    \right) + \frac{L\eta_t}{2} 
    &\le 0, 
\end{aligned}
$$

one such solution would set: 

$$
\begin{aligned}
    \epsilon_t &= \eta_t \sigma_{t + 1}^{-1} \ge \frac{\eta_t}{L\eta_t + \sigma_t}, 
    \quad \textcolor{gray}{ \text{ by: }\sigma_{t + 1} - \sigma_t \le L \eta_t }. 
\end{aligned}
$$

So, we have 

$$
\begin{aligned}
    \eta_t = 2L^{-1} - \epsilon_t 
    & \le 
    \frac{2}{L} - \frac{\eta_t}{L\eta_t + \sigma_t}. 
\end{aligned}
$$

Observe that by the recusrive relation for $\sigma_t$, obviously it's non-negative and it has $L^{-1}\sigma_{t + 1} = \sum_{i = 0}^{t}\eta_i > 0$, hence one lower bound for the sequence $\eta_t$ would be 

$$
\begin{aligned}
    \eta_t \le \frac{2}{L} - \frac{\eta_t}{L\eta_t} &= L^{-1}. 
\end{aligned}
$$

This recovers the ordinary gradient descent with constant stepsizes. 
However, this analysis reveals that slowly longer stepsizes would still retain the same convergence rate. 

