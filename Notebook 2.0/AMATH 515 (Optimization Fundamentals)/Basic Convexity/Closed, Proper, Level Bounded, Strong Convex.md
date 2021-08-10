Prereq: 
[[AMATH 515/Basic Convexity/Convexity]], [[Differential Characterization of Convexity]]

We are introducing some idea that can get rid some of the pathological problem for a minimization problem. 

There is very little we can assume about  the function when doing minimization on the function, and therefore, we need to setup some good restriction for the objective function. 

And we set up a new frameworks for analyzing the algorithms and stuff like that.

---
### Intro
**Definition 1**
Let 
$$\bar{\mathbb{R}} = \mathbb{R}\cup \{\infty, -\infty\}$$

**Definition 2**
For Function $f:\mathbb{R}^n\mapsto\bar{\mathbb{R}}$ we call $\text{dom}(f) = \{x: \mathbb{R}^n: f(x) < \infty\}$, which is called the **Effective Domain**. 

For example $\delta_{[0, 1]}(x)$ (The convex indicator function over a domain) has an Effective Domain of $[0, 1]$

Then: 
$$\inf(f) = \inf_{x\in\mathbb{R}^n}(f(x))= \inf_{x \in\text{dom}(f)} (f(x))$$

**Definition 3**

$$
\text{argmin}(f) = \{x: f(x) = \inf(f)\}
$$

This is the $x$ value that actually achieve the inf of the function. 

#### Example 
$f(x) = \exp(x)$ then $\text{dom}(f) = \mathbb{R}$ and $\inf(f) = 0$ and $\text{argmin}(f) = \emptyset$. 

And therefore , $\text{argmin}$ is a set of minimizer. 

---
### Proper Function for Minimization
This definition is introduced so we can get rid of some pathological function, making life easier for us. 

**Def**
$f$ is a **proper function** if $f(x) < \infty$ for at least one $x$ and $f(x)$ never equals $-\infty$ for any x. 

This means that, the function is going to be bounded on the direction we are minimizing and it's defined somewhere as a finite number. 

And all the function we work with in a minimization problem is **Proper Function**. 

---
### Level Set (And Closed Function)
**Def Level Set**: 
$$
\text{lev}_\alpha(f) = \{
x: f(x)\le \alpha
\}
$$
If I draw a line on the range of the function, say $\alpha$, then the level graph of the function is going be the subset of the **epigraph** of the function that gives a value less than the threshold. 

We are requiring **Epigraph** of f to be closed(in a classic analysis sense). 

Notice that, the set could be an empty set. 

**Def: Function Is Closed**

$f$ is a **closed function** if Epigraph (all Level of f) are a closed set. 

Notice that, for any function $f(x)$, the function $\delta_{(0,1)} + f(x)$ is not closed because, if we approach the boundary at the domain, then we are getting out of the function and the limit is infinite, and that is **NOT** in the epigraph of the function, it's not fitting the definition of the epigraph of a function. 

---
### Level Bounded 
A function $f:\mathbb{R}^n\mapsto \mathbb{\bar{R}}$, is level bounded if all $\text{lev}_\alpha(f)$  are bounded and possibly empty. 

This is saying that,** regardless of the kind of threshold we choose, the domain that map to the level bound is going to be a closed set, and it's not going to be infinity. ** For example $||x||$

However, the function $e^x$ is not, because, if we choose any level that is positive, then on the left, we can go to negative infinity and the value of the function will still be bounded by the level bound, and in that case, this is not a level bound function. 

$e^x$ is **Closed**, but it's not **level bounded**. 

---
### Theorem 1.9 (Rockafellar Roger Wets, Variational Analysis)

Suppose a function $f:\mathbb{R}^n \mapsto \mathbb{\bar{R}}$ is **closed**, **proper**, and **level bounded**, then $\inf(f)$ is finite, and the set of** minimizers is non-empty**, and **compacted**. 

#### Upshot: 
The more assumption we make, the nicer the behavior for the functions we get. 

**For example**:
consider Closed, Proper, Level bounded Functions, then they have a minimizer, and if we add $C^1$ as a necessary condition and it's convex, then a function that gives zero gradient will give us a global minimizer that is unique. 

---
### Strong Convexity

A convex function that is bounded below by quadratic. 

**Def Alpha Strongly Convex** : 
A multivariable scalar function that is $C^1$ smooth, is call **Alpha Strongly Convex** if: 
$$
f(y) \ge f(x) + \nabla F(x)^T (y - x) + \frac{\alpha}{2} ||y - x||^2
$$
The function not only lies above a linear approximation, but it also lies about some quadratic function with a constant $\alpha \le 0$. Notice that, it's equality (in some direction) when function is actually a quadratic. 

**Exercises:**
1. 
$$f(x) = \frac{1}{2}||x||^2$$
Is Strongly Convex if $g(x)$ is convex. 
2. 
If $g(x)$ is convex, then 
$$
g(x) + \frac{\alpha}{2}||x||^2
$$
is Alpha Strongly Convex.
3. 
Show that if $f$ is $C^1$ smooth and Alpha Strongly Convex, if and only if $f(x) - \frac{\alpha}{2}||x||^2$ is convex.

Note: Discussed in: [[Excercises (Strong Convexity)]]

Note: Note to confused with Strictly Convexity, which is totally different. 

---
### Theorem 2.23 (Characterization of Strong Convexity)
For a $C^1$ function $f$, the following are equivalent: 
1. $f$ is Alpha Strong Convex 
2. $(\nabla f(y) - \nabla f(x))^T(y - x)\ge \alpha ||y - x||^2$ 
3. If f is twice continuous differentiable, then $\nabla^2 f \succcurlyeq \alpha I$ (More positive definite than alpha identity, meaning that all eigenvalues of the Hessian is larger than $\alpha$)

**Observation**
Please observe that, this is very similar to 3 of the characteristics listed in [[Differential Characterization of Convexity]], where we discusses under the context of regular convexity. 
* The second statement is just a tighter lower bound for the monoticity of the gradient. 
* The third statement is an augmentation of the positive definiteness of the Hessian Matrix on regular convex case.

**Exercises:**
1. Show that every Alpha Strongly Convex function is level bounded. 
If Alpha strongly convex, then the minimizer has to exist. 
3. Show that an Alpha Strongly Convex function must have a **unique Minimizer**. 

**Extra**: 
* If all we know about the function is $C^1$, then all we need to look at is $||\nabla f(x^*)||$


* In addition, if $f$ is convex and level bounded, minimizer exist, and $f^* = \inf(f)$ is finite. And in that case, $f(x^k) - f^*$ will tell use how well we are doing. 

* Finally, if the function is Alpha Strongly Convex, then a unique minimizer exists, call it $x^*$ and directly look at $||x^k - x^*||$. 

Three Measures: 
1. $||\nabla f(x^k)||$
2. $f(x^k) - f^*$
3. $||x^k - x^*||$

Depending on how much we assume about the function, the measurement will get more and more precise. 

Any of these measures will give us some sequence index by $k$: 

$$
x^{(k + 1)} = x^{(k)} - r \nabla f(x^k)
$$
And, the measurement of optimality should get closer, and the question we are interested is, how fast are we getting closer to it? 

#### Proofs and Exercises: 
[[Excericises, Proofs (Char of Strong Convexity)]]