[[Topological Basics for Optimizations]]


---
### **Intro**

The projection of a point onto a set $Q\subseteq\mathbb{R}^n$ is the closest point to the set $Q$, measured under 2 norm: 

$$
\text{proj}_Q(y) := 
\left\lbrace
    x\in \mathbb{R}^n: \Vert x - y\Vert_2 = \inf_{x\in Q}
    \Vert x - y\Vert_2
\right\rbrace
$$

And the dist to the set $Q$, which is useful as a similar concept to the set projection is defined as: 

$$
\text{dist}_Q(y):= 
    \inf_{x\in Q}\Vert x - y\Vert_2

$$


Reader please observe that, $\inf$ is implicityly taking the closure of the set $Q$ over the space. 