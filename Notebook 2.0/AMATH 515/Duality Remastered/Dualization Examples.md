[[Dualization Techniques]]
[[Convex Conjugate Examples]]

---
### **Intro**

Dualization transforms convex optimization, with constraints. 



---
### **Any Objective with Linear Equality and Inequality Constraints**

Consider optimization problems of the form: 

$$
\begin{aligned}
    &\min_x \left\lbrace
        g(x) + \delta_0(Cx - d) + \delta_+(b - Ax)
    \right\rbrace    
    \\
    &\min_x \left\lbrace
        g(x) \text{ s.t: } Cx = d \wedge Ax \le b
    \right\rbrace 
\end{aligned}
$$

**Note**: Dualization is possible with Linear constraint, with non linear constraints, we are in a bit of trouble, but the Lagragian is still possible to obtain. 

We are interested in the Lagrangian and the Dualization of this objective optimization. 


