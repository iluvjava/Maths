1. [[Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications]]
2. [[Characterizing Functions for Optimizations]]
3. [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)

---
### **Intro**

We try to remake a previous passage [[Gradient Descend, Smoothness]] but go more in depth into the related ideas, because this smoothness conditions goes beyond what is employed in the proof for the smooth gradient, it's also used in envelope method, such as the forward backwards envelope for non-smooth added with smooth objectives. Gradient descent is $x^{(k + 1)} = x^{(k)} - \eta\nabla f(x^{(k)})$, where $\eta$ is a step size that can change. 

**Optimality, Assumptions, Results**: 

1. Minimizer exists, measure with  $\Vert x - x^+\Vert$
2. Minimum exists, measure with $f(x) - f(x^+)$ 
3. $\Vert \nabla f(x)\Vert$, when we have smooth function. 

The optimality conditions are listed in order of how strong they are. However, the last one might be dependent on other assumption about the algorithm to show that it converges to something, to make matter worse, the gradient alone cannot perfectly characterize optimality, indicating that algorithm that decreases (3.) must have edge cases where it fails. It's a bad measure of optimality globally.

---
### **The Smooth Descend Frameworks**

The main idea is to create an upper bounding function and then minimize the upper bounding function to attain the next point for the gradient descend method. Suppose that $f$ is smooth globally (both from above and below!) with a constant that is $L$, which is the smallest it can possibly be, then the smoothness characterizations provides

$$
\begin{aligned}
    & |f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert y - x\Vert^2
    \\
    \implies
    & f(y) \le f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2, \; \forall x, y \in \mathbb E,
    \\
    & m_x(y) := f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2. 
\end{aligned}
$$

The above conditions are all equivalent to gradient of $f$ being Lipschitz with a constant $L$. The function $m_x(y)$ is called the upper bounding function (or surrogate function). Now we try looking for the minimum of the upper bounding function: 

$$
\begin{aligned}
    & \exists!\; y^+ \in \arg\min_y m_x(y) : \nabla f(x) + L(y^+ - x)  
    = \mathbf 0 \quad 
    \textcolor{gray}{\triangleright \text{S-CVX of }m_x(y)}
    \\
    &
    y^+ = x - L^{-1}\nabla f(x)
    \\
    &
    m_x(y^+) = f(x) + \langle \nabla f(x), - 
    L^{-1}\nabla f(x)\rangle + 
    \frac{L}{2}\Vert  - L^{-1}\nabla f(x)\Vert^2, 
    \\
    & 
    m_x(y^+) = f(x) -L^{-1}\Vert \nabla f(x)\Vert^2 + \frac{1}{2L}\Vert \nabla f(x)\Vert^2, 
    \\
    & 
    m_x(y^+) = f(x) - \frac{1}{2L}\Vert \nabla f(x)\Vert^2
    \\
    \implies
    & 
    f(y^+) \le m_x(y^+) = f(x) - \frac{1}{2L}\Vert\nabla f(x) \Vert^2. 
\end{aligned}
$$

The reader should be surprised that $y^+ = x - L^{-1}\nabla f(x)$ is exactly the gradient descent. This is a results of our quadratic surrogate. Using different types of surrogates will yield different scheme. $y^+$ is the next guess that produces the maximum decrease in the objective value of the function. Let's suppose that updating scheme is simply: $x^{(t + 1)} = y^+ = x^{(t)} - L^{-1}\nabla f(x^{(t)})$, then we have: 

$$
\begin{aligned}
    & f(x^{(t + 1)}) - f(x^{(t)}) \le -2L^{-1}\Vert \nabla f(x^{(t)})\Vert^2
    \\
    \implies &
    f(x^{(t + 1)}) - f(x^{(0)}) \le 
    \sum_{j = 1}^{t} \Vert \nabla f(x^{(j)})\Vert^2
    \\
    \implies
    & 
    \min_{0 \le j \le k}\left\Vert \nabla f(x^{(j)})\right\Vert^2 \le 
    \frac{1}{k}\sum_{j = 1}^{k}\Vert \nabla f(x_j)\Vert^2
    \le k^{-1}2L(f(x^{(0)}) - f(x^{(k + 1)}))
    \\
    \implies & 
    \min_{0 \le j \le k}\left\Vert \nabla f(x^{(j)})\right\Vert \le
    k^{-1/2}\sqrt{2L(f(x^{0}) - f(x^{(k + 1)}))} \; .
\end{aligned}
$$

Which is saying that, the objective decrease of the function value, depends on whether the gradient is converging to $\mathbf{0}$ or not. And the rate of convergence, assuming that the sequence of $f(x^{(t)})$ actually converges to a local minimum (*bold assumption here, but it suffice to assume that the function is lsc and bounded from below*), we have: 

**Smooth Descend Gradient Conditions**: 
> $$
> \min_{0 \le j \le k}
> \left\Vert 
>   \nabla f\left(x^{(j)}\right)
> \right\Vert 
> \le k^{-1/2}\sqrt{2\beta(f(x^{0}) - f_{\min})}, 
> $$

indicating that the minimum of the gradient converges to $\mathbf 0$ at a sub-linear rate of $\mathcal O(1/\sqrt{k})$. 

**Remarks**

Note, without much assumptions this formula only states that, the sequence of $f(x^{(t)})$ is non-increasing, however, it said nothing about its convergence, or whether we will have $x^{(t)}$ converging. 

> [!details]-
> When it converges:
>    1. $f(x^{(t)})$ could converge, however, if it converges, it doesn't mean $x^{(t)}$ is converging (unless compact level sets), neither it states that we can't have a limit cycle of some sort (might be eliminated by smoothness? not sure). 
>    2. $f(x^{(t)})$ could decrease but converge to a non-optimal value dual to gradient can be a false measure of optimality. 
> 
> When it diverges:
> 1. $f(x^{(t)})$ could diverge very fast, which is the case of the function is not bounded below and the initial $x^{(0)}$ is chosen in such a way that it starts sliding down a steep hill indefinitely. And under that case, the bound for the gradient failed completely. 
>    1. $f(x^{(t)})$ could diverge (but decreases) in just the right way that it cancels out with $1/\sqrt{k}$, making that bound a constant. 

Additionally, the gradient doesn't classify local optimality nor global optimality. It could be a false convergence to an inflection point of some sort. Due to these complications, it raise up the motivation to discuss [[Kurdyka Lojasiewicz Inequality]]. 

#### **Lemma | Acceptable Stepsizes for Gradient Descent via the Upper Surrogate**
> A range of value for the stepsize for the simple smooth gradient descent is possible. Focusing on strictly decreasing the objective value, valid step sizes would be $\eta \in (0, 2/L)$ for an $L$-smooth function. 

**Proof**

We don't have to look for the step sizes that decrease the value of the function as large as possible. To assert decreasing objective value we should't find other values of $y$ such that $m_x(y) < f(x)$, since there would be many solution and it won't yield the gradient descent routine. To ensure strict decrease of the objective value we want $y = x - \eta \nabla f(x)$. 

$$
\begin{aligned}
    f(x - \eta \nabla f(x)) 
    \le
    m_x(x - \eta \nabla f(x)) 
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
### **Smooth Descend with Convexity**

We strengthen the results and show that we have convergence for gradient descent under the additional assumption that the function is convex. 




#### **Theorem-1 | Convexity and Smoothness Implies Faster Sub-linear Rate**

> When convexity, lsc, proper and $x^+$ is a minimizer, then the convergence rate of a function $f$ that is $L$-smooth has its objective value converging sub-linearly with $\mathcal O(t^{-1})$ for the gradient descent routine

**Proof:**

We derive directly by starting with the Lipschitz gradient descent lemma and anchoring on the points $x^{(t)}, x^{(t + 1)}$ for $(x, y)$: 

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

which is a telescoping series if I sum it up, because for the rhs, the second term for $t$ will cancel out with the first term of $k - 1$, as we sum it up, we will only be left with the second term for $t = t + 1$, and the first term for $t = 0$, giving us: 

$$
\begin{aligned}
    k\sum_{j = 1}^k f\left(x^{(j)}\right) - f(x^+) 
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
    \le \frac{1}{2k\eta}\Vert x^{(0)} - x^+\Vert^2
    \\
    f\left(x^{(k + 1)}\right) - f(x^+) 
    &\le 
    \frac{1}{2k\eta}\left\Vert x^{(0)} - x^+\right\Vert^2, 
\end{aligned}
$$

which indicates that the convergence rate is sub-linear, in $\mathcal O(k^{-1})$. 

**Remarks**

I am not sure what happens when we still have the convexity but without the minimizer for the function. However, please observe that the fact that $x^+$ is a minimizer of the function is never used to make the gradient $\nabla f(x^+) = \mathbf 0$, for the first part of the proof. The fact that $x^+$ is a minimizer is only used for the second part of the proof. 

#### **Corollary | Convergence of the Iterates and Gradient Norm**
> The squared norm of the gradient would converges at the same rate as the optimality gap for the function, the iterates would also converges. 


**Proof**

The function value can bound the norm of the gradient by the Co-Coersivity described in [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) of the Lipschitz gradient, more specifically $1/2L \Vert \nabla f(x^{(j)})\Vert^2 \le f(x) - f(x^+)$, hence bounding the squared norm of the gradient as well. To show the convergence of the iterates, one would need to consider the fixed point iterations convergence of an averaged operator, see [Averaged Mapping](Operators%20Theory/Averaged%20Mapping.md) for more information. Without convexity, I don't have the proof to assert the convergence of the iterates from the gradient descent algorithm. 

---
### **Gradient Descent with Strong Convexity**

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


#### **Claim | Convergence of the Function Value under Strong Convexity**

**Proof**


---
### **PL Inequality and Linear Convergence**

PL means Polyak Inequalities, it's a relation between the norm of the gradient and the difference in the function's objective value. It's a Generalization of the KL inequality with some specific parameters. See [[Kurdyka Lojasiewicz Inequality]] for more details. The inequality allows us to derive linear rate convergence without assumptions about uniqueness of the minimizer and the convexity of the objective function. This is one of the characterizations for function satisfying the PL inequality. 

#### **Definition | Polyak Inequality**

> A function $f$ has a minimizer $f^+$ and it's differentiable. Then it satisfies PL inequality with a PL constant of $u > 0$ if 
> 
> $$
> u(f(x) - f^+) \le \frac{1}{2}\Vert \nabla f(x)\Vert^2, \forall x. 
> $$

**Proof**



---
### **Polyak Stepsize**

Suppose that $f^*$, the optimal objective value for the optimization problem is known, then the sequence $\gamma_k = (f(x^{(k)}) - f^*)/\Vert \nabla f(x^{(k)})\Vert^2$ will converge on a convex function with rate $\mathcal O(k^{-1})$. For more about this visit [[Proximal Methods/Polyak Subgradient Method]]



---
### **Lyaponouv Arguments for Gradient Descent type Algorithm**

Another way the are more fashionable is to use the Lyapnov argument to reveal the convergence of gradient descent algorithm. Lyaponov arguments are not limited to just gradient descent. To prove, we use $X(t), x^{(t)}$ to represent continuous, discrete dynamics generated by continuous gradient descent and discrete gradient descent. A continuous gradient descent is the dynamical system 

$$
\begin{aligned}
    \partial_t X(t) = \underset{v}{\text{argmin}}
    \left\lbrace
        \langle \nabla f(X(t)), v\rangle + \frac{\Vert v\Vert^2}{2}
    \right\rbrace
    =-\nabla f(X(t)), 
\end{aligned}
$$

for some objective function $f$. Lyaponove function $E_t$ is an expression involving some quantities parameterized by time such that it's monotonically decreasing. Use $\Upsilon_t$ to represent the Lyaponove function for continuous gradient dynamics. 


#### **Claim | Lyapunov Function for Smooth Gradient Descent**
> Assume $f$ is L-Lipschitz smooth and bounded below, then continuous Lyapunov function for smooth gradient is $\Upsilon_t = f(X(t)) - f_*$, and the descrete dynamical system is $E_t = f(x^{(t)}) - f_*$. 

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


#### **Claim | Lyapunov Function for Smooth Gradient Descent with Convexity**

> The Lyapunov function for the smooth gradient descent can be strengthen under the convexity of $f$, which manifested as an extra term. Let $\bar x$ be a minimizer of $f$, the continuous and discrete dynamics are $\Upsilon_t = 1/2\Vert x - \bar x\Vert^2 + t(f(x^{(t)}) - f_*)$, 