[L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](../AMATH%20516%20Numerical%20Optimizations/Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md)


---
### **Intro**

Ernest Ryu has a incredibly simple and powerful proof for the convergence of accelerated gradient of an $L$-Lipschitz smooth functions, for the Nesterov's Accelerated Gradient (Nes AG) method. 
The step sizes are also more general then the famous Nesterov sequence. (As discussed here [The Nesterov Momentum Sequence](The%20Nesterov%20Momentum%20Sequence.md)). 

We do the proof here and fill in the details. 
It's made for future references if we need it. 


#### **Assumptions and inequalities**
Suppose that $f$ is $L$-Lipschitz smooth and convex. 
Then it implies the following inequalities between the function value, and inner product that involves the gradient at some point. 

$$
\begin{aligned}
    (\forall x)\; f(x) - f(x - L^{-1}\nabla f(x)) \ge \frac{1}{2L}\Vert \nabla f(x)\Vert^2
    \\
    
\end{aligned}
$$


