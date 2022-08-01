### **Intro**

Sometimes, we need to understand the idea of functions over a Finite Euclidean space better for the analysis part of algorithms in Optimizations. We list some important properties of functions that are relevant to non-smooth and convex optimizations. 

**The Augmented Real Functions**

>  $$
> \begin{aligned}
>     f: \mathbb{R}^n\mapsto \overline{\mathbb{R}}
> \end{aligned}
> $$
> 
> The $\overline{\mathbb{R}}$, is $\mathbb{R}\cup \{\pm\infty\}$. Such a definition of functions allows for function that models the constrained optimization problems. More specifically, function such as the indicator function of a set $Q$.

Here is a list of topics that are helpful for understanding the basics: 

* [[Epigraph]]
* [[Lower Semi-Continuous]]
* [[Convex Sets]]

---
### **Proper Function**

This definition is introduced so we can get rid of some pathological function, making life easier for us. 

**Proper Function**

> $f$ is a **proper function** if $f(x) < \infty$ for at least one $x$ and $f(x)$ never equals $-\infty$ for any x. 

This means that, the function is going to be bounded on the direction we are minimizing and it's defined somewhere as a finite number. And all the function we work with in a minimization problem is **Proper Function**. 

---
### **Continuity and Smoothness**

For the most part of Convex Analysis, the study of functions focuses on $C^n$ function. Def: 

**Lower Semi-Continuity**
> The definition of lower semi-continuity should be listed as a link in the top. 

**Continuous Functions**
> A function is continuous if the limit of every points equal to the function evaluated at the point: $\lim_{x\rightarrow a}f(x) = f(x)$. 

**C0 smooth**
> A function $f$ is a C0 function that are Uniformly Continuous. ramp function is a class of C0 functions. 

**C1 Smooth**
> A function $f$ is a C1 function when it has a continuous derivative. It's quadratic-like. 

---
### **Closed Function**
> a function $f$ is a closed if and only if the [[Epigraph]] is a closed set. 

**Closeness Equivalence of Functions**

The following statements about function $f$ is equivalent: 

* The function $f$ is closed. 
* The function $f$ is lower semi-continuous 
* The function $f$ has closed level set for all $\alpha$, where the definition of level set is given as: 

**Definition: Level Set**

$$
\text{lev}(f, \alpha) := \{x\in \mathbb E: f(x) \le \alpha\}
$$

Which is the domain where the function $f$ has a value that is bounded by $\alpha$.

**Proof**

Skipped for now. For a proof, see: \<First Order Method in Optimization\> by SIAM, page 16 Theorem 2.6. 

**Remarks**

A closed function is not enough for the function to be continuous, but a continuous function on a compact region is enough for it to be a closed function. 

---
### **Coercive Function**

Recall Definition: 
> Function $f:\mathbf{E}\mapsto \mathbb{\bar{R}}$ is coercive if for any sequence $x_i$ with $\Vert x\Vert_i\rightarrow \infty$ it must be that $f(x_i)\rightarrow + \infty$. 

---
### **Special Functions for Analysis**

**Def: The support Functions**

$$
\delta^\star_Q(v) = 
\sup_{x \in Q}\langle v, x\rangle
$$

The support function of a set $Q$, is the conjugate of the indicator function. It drives a vector pointing in the direction of $v$ in the set until it reaches the boundary of the set, creating a support line around the point of contact. 

**Remarks**

See [[Support Function]] for more detailed informations.

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
### **Convexity**

**Definition**

> A function $f$ is convex if $\text{epi}(f)$ is convex, we use the convexity of sets to determine whether a function can be convex. 

**Secant Inequality**

A direct consequence is the convexity inequality. Given a convex function $f: \mathbb E\mapsto \mathbb {\bar R}$, with affective domain $\text{dom}(f)$ being non-empty and $f$ is proper if and only if: 

$$
\begin{aligned}
    \forall x,y \in \text{dom}(f), \lambda \in [0, 1] : 
    f(\lambda x + (1 - \lambda)y) \le 
    \lambda f(x) + (1 - \lambda)f(y)
\end{aligned}
$$

**Remarks:**

And one can combine results and form a general statement using convex combinations of points. For more discussions regarding this important properties, view: [[Convex Functions Characteristics]], [[Convexity Preserving Operations of Functions]]. 


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

---
### **Beta-Smoothness**

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

MISSING

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

A big part of optimization is characterizing functions and understand how they these properties can be expoited for algorithm, and how they propagate through different types of operations. 

Some of the important properties that we need to keep track of about functions are basically: 
1. Closedness
2. Convexity
3. Continuity
4. Smoothness

However, for special type of functions, we might need to focus on more interesting properties and such. 
