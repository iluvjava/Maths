### **Intro**

Sometimes, we need to understand the idea of functions over a Finite Euclidean space better for the analysis part of algorithms in Optimizations. We list some important properties of functions that are relevant to non-smooth and convex optimizations. This file is a successor for the file [Closed, Proper, Level Bounded, Strong Convex](../../AMATH%20515%20Optimization%20Fundamentals/Basic%20Convexity/Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md), which was written for Prof Sasha's class. 

**The Augmented Real Functions**

>  $$
> \begin{aligned}
>     f: \mathbb{R}^n\mapsto \overline{\mathbb{R}}
> \end{aligned}
> $$
> 
> The $\overline{\mathbb{R}}$, is $\mathbb{R}\cup \{\pm\infty\}$. Such a definition of functions allows for function that models the constrained optimization problems. More specifically, function such as the indicator function of a set $Q$.

Here is a list of topics that are helpful for understanding the basics: 

* [[Epigraph]], this describes the geometry of the function.
* [[Lower Semi-Continuous]], this put some lower bound on all limit point on the function. 
* [[Convex Sets Intro]], this helps describing convexity of functions. 

---
### **Proper Function**

This definition is introduced so we can get rid of some pathological function, making life easier for us. 

**Proper Function**

> $f$ is a **proper function** if $f(x) < \infty$ for at least one $x$ and $f(x)$ never equals $-\infty$ for any x. 

This means that, the function is going to be bounded on the direction we are minimizing and it's defined somewhere as a finite number. And all the function we work with in a minimization problem is **Proper Function**. 

**References**: 

Tyrell Rockafellar did this to us. Yep. 

---
### **Continuity and Traditional Smoothness**

For the most part of Convex Analysis, the study of functions focuses on $C^n$ function. Def: 

**Lower Semi-Continuity**
> The definition of lower semi-continuity should be listed as a link in the top. 

**Continuous Functions**
> A function is continuous if the limit of every points equal to the function evaluated at the point: $\lim_{x\rightarrow a}f(x) = f(x)$. 

**C0 smooth**
> A function $f$ is a C0 function that are continuous. ramp function is a class of C0 functions. 

**C1 Smooth**
> A function $f$ is a C1 function when it has a continuous derivative. It's quadratic-like, without any sharp turns on the graph. 

---
### **Closed Function**
> a function $f$ is a closed if and only if the [[Epigraph]] is a closed set. 

**Closeness Equivalence of Functions**

The following statements about function $f$ is equivalent: 

* The function $f$ is closed. 
* The function $f$ is lower semi-continuous .
* The function $f$ has closed level set for all $\alpha$, where the definition of level set is given as: 

**Definition: Level Set**

$$
\text{lev}(f, \alpha) := \{x\in \mathbb E: f(x) \le \alpha\}.
$$

Which is the pre-image where the function $f$ has a value that is bounded by $\alpha$.

**Proof of Equivalences**

Skipped for now. For a proof, see: \<First Order Method in Optimization\> by SIAM, page 16 Theorem 2.6. 

**Remarks**

A closed function is not enough for the function to be continuous, but a continuous function on a compact region is enough for it to be a closed function. 

---
### **Coercive Function**

This characteristic of function is key to existence of minimizers for function. It eliminate the case where minimizers of some function is only attained at infinity. 

**Coersive Defintion**
> Function $f:\mathbf{E}\mapsto \mathbb{\bar{R}}$ is coercive if for any sequence $x_i$ with $\Vert x\Vert_i\rightarrow \infty$ it must be that $f(x_i)\rightarrow + \infty$. 

**Remarks**

In Math 563, Heinz's class, there is the term *supercoercive*, which refers to function where $f(x)/\Vert x\Vert \rightarrow \infty$ as $\Vert x\Vert \rightarrow \infty$, a stronger version of coersiveness. 

This concept is also equivalent to level boundedness, which is quoted by Tyrell Rockafellar. 

**Gocha**

The function $f(x):= |x|\sin(x)$ is not Coersive, because there exists $(x_n) = 2 \pi n$ such that $f(x_n) = 0$ all the time. Rarely used besides for the theories of functions. Used in [[Existence of a Minimizer]]. 

**References**: 

Prof Heinz class, Theorem 1.9 In Tyrell Rockafellar's textbook for variational analysis. 




---
### **Special Functions for Analysis**

These functions are new special objects unique to nonsmooth analysis. 

**Def: The support Functions**

$$
\delta^\star_Q(v) = 
\sup_{x \in Q}\langle v, x\rangle
$$

The support function of a set $Q$, is the conjugate of the indicator function. It drives a vector pointing in the direction of $v$ in the set until it reaches the boundary of the set, creating a support line around the point of contact. 

**Remarks**

See [[Support Function]] for more detailed information.

**Def: Gauge Functions**

$$
\gamma_Q(x) = \inf \left\lbrace
    \lambda \ge 0: x\in Q
\right\rbrace
$$

A gauge function scales the set $Q$ as little as possible so that the set contains the input parameters $x$. 

**Def: Indicator Functions**

$$
\delta_Q := 
\begin{cases}
    0 & x \in Q
    \\
    \infty   & \text{else}
\end{cases}
$$

The function is only defined inside of the set $Q$, out of the set it's not giving infinity. This function has the usage of denoting constraints for optimization problems. 

---
### **Convexity of Functions**

This is one of the most important characterizations for a class of functions. The theories developed for optimizing convex function and its variants are profound. Convex function has 2 equivalent definitions. 

**Definition: Convex Epigraph**

> A function $f$ is convex if $\text{epi}(f)$ is convex, we use the convexity of sets to determine whether a function can be convex. 

For a definition for epigraph, visits: [Epigraph](Epigraph.md) for more information. 

**Definition: Secant Inequality**

> Given a convex function $f: \mathbb E\mapsto \mathbb {\bar R}$, with affective domain $\text{dom}(f)$ being non-empty and $f$ is convex if and only if: 
> $$
> \begin{aligned}
>     \forall x,y \in \text{dom}(f), \lambda \in [0, 1] : 
>     f(\lambda x + (1 - \lambda)y) \le 
>     \lambda f(x) + (1 - \lambda)f(y)
> \end{aligned}
> $$

**Remarks:**

And one can combine results and form a general statement using convex combinations of points. For more discussions regarding this important properties, view: [Convex Functions CENTRAL HUB](../CVX%20Analysis/Convex%20Functions%20CENTRAL%20HUB.md).

**Thm: Convex Level Graph**
> A convex function has convex level graph. 

#UNFINISHED 


---
### **Strict Convexity**

> A function $f$ is strictly convex then it satisfies the secant line inequality: 

$$
\begin{aligned}
    \forall x, y\in \text{dom}(f),\lambda \in [0, 1]: 
    f(\lambda x + (1 - \lambda)y) < 
    \lambda f(x) + (1 - \lambda)f(y)
\end{aligned}
$$

**Remarks**: 

For example, the function $\exp(x)$ is a strictly convex function. 

---
### **Strong Convexity**

> Let $f$ be a augmented real function, then the function $f$ is strongly convex if there exists a $\alpha\ge 0$ such that: 
> 
> $$
> f(y) \ge f(x) + \langle \partial[f](x), y - x\rangle + \frac{\alpha}{2}\Vert y - x\Vert^2
> $$

**Remarks**: 

* Any strongly convex function is going to be a coercive function, but the converse is definitely not true. 
* The function $\exp(x)$ is alpha strongly convex but the function is not strictly convex because it's not coercive. We cannot long lower "hug" the function using any type of quadratic function. 
* For more about it see [[Strong Convexity, Equivalences and Implications]]

---
### **Convexity and Lipschitz Functions**

Functions that are convex and Lipschitz smooth, they are a strict subsets of all the convex functions. For a convex function, Local Lipschitz continuity will fail on the boundary of its domain. 


---
### **Beta-Smoothness | Strong Smoothness**

> If $f$ is $\beta$ smooth, then there exists positive $\beta$ such that: 
> 
> $$
> |f(x + h) - f(x) + \nabla f(x)^Th| \le \beta \frac{\Vert h\Vert^2}{2}
> $$

**Remarks**

The absolute signs make it possible to model the smoothness for both convex and concave function. 


**Theorem: Lipschitz Gradient means Beta Smooth**
> The same beta the provides a bound between the linear approximation and the function it self is the Lipschitz constant for the function over the domain. 
> $$
> \Vert\nabla f(y) - \nabla f(x) \Vert \le \beta \Vert x - y\Vert
> $$

**Proofs**

A proof can be found in [[../Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications]]

**Remarks**: 
Intuitively beta-smoothness refers to the ability to place a quadratic function that can always be an upper bound for the function at any point. 


---
### **Positive Homogeneity**

**Definition** 
> A function is positive Homogenous when: $f(\alpha y) = \alpha f(y)\;\forall y$, where $\alpha \ge 0$. 

---
### **Sub-additive**

**Definition**
> A function $f$ is sub-additive when $f(x + y)\le f(x) + f(y)$. 

---
### **Discussions**

A big part of optimization is characterizing functions and understand how they these properties can be exploited for algorithm, and how they propagate through different types of operations. 

Some of the important properties that we need to keep track of about functions are basically: 
1. Closedness
2. Convexity
3. Continuity
4. Smoothness

However, for special type of functions, we might need to focus on more interesting properties. 

---

