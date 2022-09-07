Content of Lecture 2

---

$$
Ax = b
$$

* **Under Determined System**: There are too little constraints to frame the solution and there are infinitely many solution for the problem. 
	* $m < n$ and the matrix is wide. 

* **Over Determined System** : There are too many unique constraints for the system that there is no solution. 
	* $m > n$ and the matrix is skinny. 

These type of problems are called "ill-posed problems" and we are interested in regularizing them. 

---
### **Regularization** 
Optimization + Solving the equations

Here is the optimization way of determine the unique solution for an underdetermined system. 
$$\min_x\{ ||x||: \; Ax = b\}$$


Here is the optimizaiton of determine the unique solution for an over determined system. 
$$
\min_x\{
	||Ax - b|| + \lambda||x||:\; \forall x
\}$$

Where the constant $\lambda$ is call the hyperparameter. This is a problem that is going to produce a unique solution for the over deteremined system. 

The norm is exchangable: [Norm](Matrix%20Theory/Norm.md) for more of it
There is more about regularization, see [Regression and Model Selection](Regression%20and%20Model%20Selection.md) for more.


---
### **Fredholm Alternative**

* This is deep and it's connected to multiple realms of mathematics, but here we will explain what it's doing for Linear Algebra
* Let's first, get to the idea of what people called: "Hermitian Adjoint"
* Fredholm Alternative is used to determine whether a system that is over determined can be solved. 
	* It's solvable when $b \in range(A)$,it's the same thing as $b\perp null(A^T)$, or conjugate transpose in the case of complex number. This is basically saying that $A^*y = 0$ and then $y\cdot d = 0$
	* Read more here: [Fredholm Alternative](Matrix%20Theory/Fredholm%20Alternative.md)
	