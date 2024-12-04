- [Newton Method for Minimizations](Classics%20Algorithms/Newton%20Method%20for%20Minimizations.md)


---
### **Intro**

Newton's iterations in multiple dimensions has difficulty for computations. There has been much endeavors into quasi-newton methods. A quasi newton's method approximates the second derivative/Hessian instead of computing it, avoiding the complexity of computations. THe idea of the algorithm dates back, all the way back to 1950 by Davidson. 


**References**

In this file, we take references from Stephen's J. Wright's Numerical optimization textbook. 

Before we start, recall that if we apply the newton's method to minimize $f:\mathbb R \mapsto \mathbb R$, which is convex, then $x_{k + 1} = x_k - f'(x_k)/f''(x_k)$, one may estimate second derivative using previous iteration, giving $f''(x_k) \approx \frac{f'(x_{k}) - f'(x_{k - 1})}{x_k - x_{k - 1}}$, this would produce the secant line method, producing the iterates $x_{k + 1} = x_k - \frac{f'(x_k)(x_k - x_{k - 1})}{f'(x_k) - f'(x_{k - 1})}$. This formula, will make a come back in the multi-dimensional vector spaces. 


---
### **Introducing the Quasi-Newton Frameworks**



