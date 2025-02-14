prereq: [[Regularization]]
The idea of regularization is put into a more general context for in the discussion here. 

---
### **Regression and Model Selection**

$$Ax = b$$

Let's say this is what we want to solve for our sake. 

* **Over-determined**
let's suppose that the problem is over-determined, meaning that there are not many solutions for the system, then we solve the unconstrained optimization problem instead: 
$$\text{argmin}_x(||Ax - b||_2 + \lambda g(x))$$
Because there are no way to completely solve the problem, we are just going to do as many as we can while using the $\lambda g(x)$ as the regularization term to shape the solution we want for the problem. 

* **Under-determined**
When the problem is under-determined, meaning that there are too many solutions for the problem. 
$$\text{argmin}_x\{g(x): ||Ax - b||_2 \leq \epsilon\}$$
And in this example, we try to get the best solution with the constraint subject to a certain function. 

* **Non-Linear Cases**: 

$$\text{argmin}_x \{f(A, x, b) + \lambda g(x)\}$$ 

where the function here is a non-linear function involving $A, x$ and $b$, and we try to regularize the results. $$\text{argmin}_x \{ g(x):f(A, x, b)\leq \epsilon\}$$ where we want to keep a good solution with the constraints while subjected to an objective function. 

---
### **Over-fitting**

Over-fitting is the just a model where it's doing pretty well on the training set but not the real world data set. 

---
### Reading the Textbook
### Matlab Code

These command can be use for the regression on a set of given data. 
* `pinv` Psuedo inverse 
* `\` Back Slash 
* `lasso` You can tweak regularization term. 
* `robustfit` ???
* `ridge` ??? 


