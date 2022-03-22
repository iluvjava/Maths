### **Intro**

Sometimes, we need to understand the idea of functions over a Finite Euclidean space better for the analysis part of algorithms in Optimizations. 

A Function on the Augmented real. 

$$
\begin{aligned}
    f: \mathbb{R}^n\mapsto \overline{\mathbb{R}}
\end{aligned}
$$

The $\overline{\mathbb{R}}$, is $\mathbb{R}\cup \{\pm\infty\}$. Such a definitio of functions allows for function that models the constrained optimization problems. More specifically, function such as the indicator function of a set $Q$

Here is a list of topics related to the Analysis and characterizations of Functions: 

[[Epi Graph]]
[[Lower Semi-Continuous]]


---
### **Proper Function**

This definition is introduced so we can get rid of some pathological function, making life easier for us. 

**Proper Function**

> $f$ is a **proper function** if $f(x) < \infty$ for at least one $x$ and $f(x)$ never equals $-\infty$ for any x. 

This means that, the function is going to be bounded on the direction we are minimizing and it's defined somewhere as a finite number. And all the function we work with in a minimization problem is **Proper Function**. 

---
### **Continuity**


For the most part of Convex Analysis, the study of functions focuses on $C^n$ function. Def: 

> A function $f$ is a C0 function that are Uniformly Continuous. ramp function is a class of C0 functions. 
> A function $f$ is a C1 function when it has a continuous derivative. 

---
### **Special Functions for Analysis**

**Def: The support Functions**

$$
\delta^\star_Q(v) = 
\sup_{x \in Q}\langle v, x\rangle
$$

The support function of a set $Q$, is the conjugate of the indicator function. It drives a vector pointing in the direction of $v$ in the set until it reaches the boundary of the set, creating a support line around the point of contact. 


**Def: Gauge Functions**

$$
\gamma_Q(x) = \inf \left\lbrace
    \lambda \ge 0: x\in Q
\right\rbrace
$$

A gauge function scales the set $Q$ as little as possible so that the set contains the input parameters $x$. 

**Def: Indicator Functions**

$$
\delta_Q = 
\begin{cases}
    0 & x \in Q
    \\
    \infty   & \text{else}
\end{cases}
$$

The function is only defined inside of the set $Q$, out of the set it's not giving infinity. This function has the usage of denoting constraints for optimization problems. 