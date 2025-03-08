### **Intro**

We need to understand the idea of functions over a Finite Euclidean space better for the analysis of optimization algorithms. 
This file has important properties of functions types relevant to non-smooth convex optimizations. 
It is a successor of [Closed, Proper, Level Bounded, Strong Convex](../../AMATH%20515%20Optimization%20Fundamentals/Basic%20Convexity/Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md), which was written when taking Prof Sasha's class (MATH 515) back in UW. 

To start, we introduce one important modifications to the traditional concept of functions to allow it takes the value of positive infinity. 
The concept of an *Augmented real function*.

**Def | The Augmented Real Functions**
> $f: \mathbb{R}^n\mapsto \overline{\mathbb{R}}$ is an augmented real function. 

**Commentary**

The $\overline{\mathbb{R}}$, is $\mathbb{R}\cup \{\pm\infty\}$. Such a definition of functions allows for function that models the constrained optimization problems. 
Functions that models feasibility such as the indicator function of a set $Q$.

Read [Augmented Reals](Augmented%20Reals.md) for arithmetic rules. Here is a list of topics that are helpful for understanding the basics geometry of these type of functions. 

* [Epigraph, Level Sets](Epigraph,%20Level%20Sets.md), this describes the geometry of the function.
* [Lower Semi-Continuous](Lower%20Semi-Continuous.md), this put some lower bound on all limit point on the function. 
* [Convex Sets Intro](Convex%20Sets%20Intro.md), this helps describing convexity of functions. 
* [Dom](Dom.md), The definition for the domain of a function that is on the augmented reals. 

---
### **Proper Function**

Defining proper function eliminates certain pathologies for the type of functions for optimizations purposes. 

#### **Def | Proper Function**

> Consider $f$ of augmented real function, $f$ is a **proper function** if $f(x) < \infty$ for at least one $x$ and $f(x)$ never equals $-\infty$ for any x. 

**Observations**

Proper if it has a domain, and bounded from below. 


**References**: 

Tyrell Rockafellar did this to us. Yep. 

**Note**

For the rest of the file, which are the sections that comes after, we will only consider proper functions. 

---
### **Continuity and Traditional Smoothness**

Traditional smoothness is used to refer to a smooth function we learned in calculus class. Not to be confused with Lipschitz smoothness in optimizations. 


**Def | C0 smooth**
> A function $f$ is a C0 function that is continuous, continuous function is C0. 

**Important Notes**

Ramp function is a class of C0 functions, the Heavy Side function won't be C0 smooth because it's not continuous. 
A continuous function has not much to do with differentiability of the function. 

**Def | C1 Smooth**
> A function $f$ is a C1 function when it has a continuous derivative. It's quadratic-like, without any sharp turns on the graph. 

**Important Notes**

The derivative of a C1 function is a C0 function. 
C1 function won't allow any kind of sharp corners. 
However, the derivative of the function is not necessarily Lipschitz continuous. 
This is different from the Lipschitz smoothness often appears in the optimization literatures. 


---
### **Closed Function**

Recall closure of a set in Euclidean space. 
For more about the discussion below visits [Epigraph, Level Sets](Epigraph,%20Level%20Sets.md). 

#### **Def | A Closed Function**
> a function $f$ is a closed if and only if the [Epigraph, Level Sets](Epigraph,%20Level%20Sets.md) is a closed set. 

**Example**

The function $x^2 + \chi_{\{1\}}(x)$ won't be a closed function, this function can be written as 

$$
\begin{aligned}
    f(x):= \begin{cases}
        x^2 & x \neq 0 , 
        \\
        1 & x = 0. 
    \end{cases}
\end{aligned}
$$

Observe that the sequence $(1/n, f(1/n))$ would converge to $(0, 0)$ as $n\rightarrow \infty$, but $(0, 0)\not \in \text{epi}(f)$. 


#### **Closeness Equivalence of Functions**

The following statements about function $f$ are equivalent: 

* The function $f$ is closed. 
* The function $f$ is lower semi-continuous .
* The function $f$ has closed level set for all $\alpha$, where the definition of level set is given as: 

#### **Definition | Level Set**
> $$
> \text{lev}(f, \alpha) := \{x\in \mathbb E: f(x) \le \alpha\}.
> $$

**Obesrvation**

A level set is the pre-image of $f$ on the set $[-\infty, α]$. 


**Proof of Equivalences**

Skipped for now. For a proof, see: \<First Order Method in Optimization\> by SIAM, page 16 Theorem 2.6. 

**Remarks**

A closed function is not enough for the function to be continuous, but a continuous function on a compact region is enough for it to be a closed function. If the region is not compact, limit will go out of the domain of the function and horizontal asymptopes of the function is not part of the epigraph. 

---
### **Coercive Function**

This characteristic of function is key to existence of minimizers for function. 
A coercive function cannot attain minimizers that are infinitely far away from the origin. 
For more information about the section visits [Coersivity of Functions](../Properties%20of%20Functions/Coersivity%20of%20Functions.md) for details. 

#### **Def | Coersive Definition**
> Function $f:\mathbf{E}\mapsto \mathbb{\bar{R}}$ is coercive if for any sequence $x_i$ with $\Vert x\Vert_i\rightarrow \infty$ it must be that $f(x_i)\rightarrow + \infty$. 

**Remarks**

In Math 563, Heinz's class, there is the term *supercoercive*, which refers to function where $f(x)/\Vert x\Vert \rightarrow \infty$ as $\Vert x\Vert \rightarrow \infty$, a stronger version of coersiveness. 

This concept is also equivalent to level boundedness, which is quoted by Tyrell Rockafellar. 

**Gocha**

The function $f(x):= |x|\sin(x)$ is not Coersive, because there exists $(x_n) = 2 \pi n$ such that $f(x_n) = 0$ all the time. Rarely used besides for the theories of functions. Used in [Existence of a Minimizer](Existence%20of%20a%20Minimizer.md). 

**References**: 

Prof Heinz class, Theorem 1.9 In Tyrell Rockafellar's textbook for Variational analysis. 


---
### **Special Functions for Analysis**

These functions are new special objects unique to non-smooth analysis. 

#### **Def | The support Functions**

> $$
> \delta^\star_Q(v) = 
> \sup_{x \in Q}\langle v, x\rangle
> $$

The support function of a set $Q$, is the conjugate of the indicator function. It drives a vector pointing in the direction of $v$ in the set until it reaches the boundary of the set, creating a support line around the point of contact. 

**Remarks**

See [Support Function](../CVX%20Analysis/Support%20Function.md) for more detailed information.

#### **Def | Gauge Functions**

> $$
> \gamma_Q(x) = \inf \left\lbrace
>     \lambda \ge 0: x\in Q
> \right\rbrace
> $$

A gauge function scales the set $Q$ as little as possible so that the set contains the input parameters $x$. 

#### **Def | Indicator Functions**

> $$
> \delta_Q := 
> \begin{cases}
>     0 & x \in Q
>     \\
>     \infty   & \text{else}
> \end{cases}
> $$

The function is only defined inside of the set $Q$, out of the set it's not giving infinity. This function has the usage of denoting constraints for optimization problems. 

---
### **Convex Functions**

This is one of the most important characterizations for a class of functions. 
The theories developed for optimizing convex function and its variants are profound. 
Convex function has 2 equivalent definitions. 

#### **Definition | Convex Epigraph**

> A function $f$ is convex if $\text{epi}(f)$ is convex, we use the convexity of sets to determine whether a function can be convex. 

**Remarks**

For a definition for epigraph, visits: [Epigraph, Level Sets](Epigraph,%20Level%20Sets.md) for more information. See [Convex Sets Intro](Convex%20Sets%20Intro.md) for more information about convex set. 

#### **Definition | Secant Inequality**

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

**Thm | Convex Level Graph**
> A convex function has convex level graph. 

**Proof**: 

Direct because a level set is a subset of the epigraph, and since epigraph is convex for convex function by definition, the level graph is also convex. 


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
* For more about it see [Strong Convexity](../Properties%20of%20Functions/Strong%20Convexity.md)


---
### **Beta-Smoothness, Strong Smoothness, Lipschitz Smoothness**

For more information about this characterization, [Convex Function with Global Lipschitz Gradient](../Properties%20of%20Functions/Convex%20Function%20with%20Global%20Lipschitz%20Gradient.md). 
This characterization of convex function is absolutely essential for gradient based method in optimizations, it developed important claims about the convergence rate of the algorithm. 


#### **Def | Lipschitz Smoothness**
> If $f$ is $\beta$ smooth, then there exists positive $\beta$ such that: 
> 
> $$
> |f(x + h) - f(x) + \nabla f(x)^Th| \le \beta \frac{\Vert h\Vert^2}{2}
> $$

**Remarks**

The absolute signs make it possible to model the smoothness for both convex and concave function. 


#### **Theorem | Lipschitz Gradient means Beta Smooth**
> A function is $\beta$ smooth if and only if and only if its gradient is $\beta$ Lipschitz continuous. 
> $$
> \Vert\nabla f(y) - \nabla f(x) \Vert \le \beta \Vert x - y\Vert
> $$


**Remarks**: 

Intuitively beta-smoothness refers to the ability to place a quadratic function that can always be an upper bound for the function at any point. 


---
### **Positive Homogeneity**

#### **Definition | Positively Homogeneous** 
> A function is positive Homogenous when: $f(\alpha y) = \alpha f(y)\;\forall y$, where $\alpha \ge 0$. 


---
### **Sub-additive**

**Definition | Sub Additivity**
> A function $f$ is sub-additive when $f(x + y)\le f(x) + f(y)$. 

**Examples**

$x^2$ would be a sub-additive function for $x, y \ge 0$. In fact, this is true for all $f: \mathbb R_+ \mapsto \mathbb R$ in $\mathbb R$ that has a monotonically increase derivative. 

---
### **Nonconvex Functions**

#### **KL Functions**
- [Kurdyka Lojasiewicz Inequality](Kurdyka%20Lojasiewicz%20Inequality.md). 



---
### **Discussions**

There are a lot more properties, but the above properties are usually introduced to the students at the first few classes in convex analysis, or optimization. 
