This time we are going to learn about the Gradient system 

[Limit Cycles](Limit%20Cycles.md)
This is introduced as an class of system that can never have any kind of limit cycles in it. And we will see how that is happening for us here. 

---

### Intro 

Much like that hamiltonian system, The gradient system also have a potential function, (Which is very different from the potential function for the Hamiltonian System)

And this is a class of system that cannot have limit cycles. 

--- 
### **Def: Gradient System**

$$
x' = -\nabla V(x)
$$

Where $V(x)$ is a vector, scalar function. 

**Remarks**

This looks like the dynamics for the gradient descend algorithm. 

#### **Theorem**

Closed loop trajectories are impossible for a gradient system. Let a close loop be $x(t)$, and it loops for $t = T$ then $x(0) = x(T)$ consider: 

$$
V(x(T)) - V(x(0)) = \int_{0}^T \nabla V(x(t))x'(t) dt = \int_{0}^{T} - (\nabla V(x(t)))^2 dt \le 0. 
$$

Notice that, when it's equal to zero, the system is all zero, and it has to be negative for this integral because the squares of real numbers are always positive. There are no closed loop for a gradient system that is non-zero. A closed loop is impossible in a gradient system. 

---

### **How to identify Gradient System?**
By assuming that the second derivative of the vector field exists, then we consider the curl on the given dynamics and if it's a gradient system, then it must satisfies: 

$$
\nabla \times (-\nabla V(x)) = \mathbf 0. 
$$

For any vector-> Scalar function, the curl is zero, be cause of $\partial xy V = \partial yx V$, notice that: 

$$
V(y) = - \int_{x_0}^{y} f(x) dx
$$
Has to be a well defined quantities, meaning that, regardless of what path I choose to walk from $x_0$  to $y$, this integral should give the same result. This implies that all closed loop is going to be zero, which means that: 

$$
\oint \nabla V(x)dx = \iint_A \nabla\times (-\nabla V(x))dx = 0
$$

---
### **How to Find the Potential Function**

Integrate $x'$ wrt to $x$, get a the constant as a function of $y$, say $c(y)$, take the partial derivative to get $c'(y)$, equates with $y'$ to solve for $c(y)$.

Same token for 3d, just assume that it's a function of $c(x, y)$ and be careful about the constant. When integrating wrt to $x$, switch cases if dividing by $y$ happened, because $y$ could be zero.

