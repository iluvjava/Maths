[[../AMATH 581 Scientific Computing/Computer Bad at Maths]]


---
### **Intro**

We classify the function that describes the errors. When it comes to error analysis we are interested in 2 types of error: 
- A priori Errors. 
- Posterior Errors. 

To illustrate, suppose that we were given solution $u$, which is the solution to a PDE for example, we then denote $\tilde u_h$ to be the approximated solution of $u$ by some kind of numerical method, parameterized by $h$, for example, the size of the mesh grid. Let $E(h)$ denotes an function that bounds the error then: 
- A priori error has $E(h)$ containing the exact solution $u$, and the parameter $h$, meaning that $E(h, u)$ is the model for the error function. 
- A posteri error has $E(h)$ paramaterized by the problem parameters and the approximated solution $\tilde u$, meaning that $E(h, \tilde u)$ is the right function to model the error. 

**Types of Error**

There are 2 types of errors when analyzing things in the real world. 
- Analytical error that arises from the mathematical modeling 
- Round-off error that comes from using the IEEE floating point arithmetic standards on computers. 


