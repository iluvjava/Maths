[[Banach Contraction in Metric Space]]

---
### **Intro**

We view over some fixed point iterations method that we probably learned at some point but wasn't able to make the connections for it. 

**Applications:Minimum of Strongly Convex Function**

> One immediate applications of the algorithm is to find minimum of a function that is strongly convex. Suppose that $f: \mathbb E\mapsto \R$ to be a strongly convex function. To perform the fixed point iterations, we solve the equation $\mathbf 0 = \nabla f(x)$ by transforming it to the fixed point form: $x = x - \beta \nabla f(x), \beta > 0$, then $(I - \beta \nabla f)^{-1}$ is now a contraction. A fixed point iterations performed on this operator is a proximal point method. 


---
### **Stationary Method for Linear/Nonlinear System**

Consider $(\R^n, \Vert \cdot\Vert_\infty)$ metric. And we eventually want to solve the equation $Ax + b = 0$ using fixed point iterations. We ask the question that, what if, $T=Ax + b$ converges with Banach Contraction? Of course, in this case would be solving the equation $x = Ax + b$. What conditions would have to be true for this to be a contraction? Here we will: 
- Establish the convergence conditions for the opeartor $Ax + b$, 
- Splitting the matrix for a linear system. 
- Derive that one of the sufficient condition is a linear system with diagonally dominant matrix. 
- Conclude that this is the Jacobi Method. 
- Extend the Jacobi method to non-linear system trivially. 

#UNFINISHED


