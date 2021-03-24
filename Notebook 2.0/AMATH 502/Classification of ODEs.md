The second lecture

---
### **Classifications of ODEs**

- **Autonomous**: The right hand side of the equation doesn't explicitly depends on variable $t$, the temporal variable independent of the state variables. 
- **Linear**: An ODE is linear if the RHS depends on x linearly. 
	- Let's say that: $x' = f(x, t)$ 
	- $f(ax_1 + bx_2, t) = af(x_1, t) + bf(x_2, t)$
	- The function on the RHS is a linear function wrt to $x$, take note that, Affine linear functions are also consider linear, according to the lecture. 

Linear autonomous functions are easy to solve compare to other. 

However, do note that, there **could be some transformations**(There is a theorem for doing this but it's omitted here) that change a Non-Autonomous ODEs to an Autonomous one, but this is gonna mess with our interpretations. Analytically, Non-Autonomous will make things harder. 

What we want to study: "First Order, Autonomous System", because a lot of systems can be reduced to system of such a form. 

To demonstrate, take the example of $x' = x^2 + t^2$. 

For the system let: $x_1 = x, x_2 = t$, then $x_1' = x' = , x_2' = 1$ (Taking derivative wrt to $t$), which means that: 

$$
x_1 = x_1^2 + x_2^2 \quad x_2 = 1
$$
And this is an first order, autonomous system. 

### 1D Autonomous
[[1D Autonomous]]
Talks about some of the basic features of the Autonomous system in 1D. 