- [Banach Space Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Banach%20Space%20Introduction.md)
- [Linear Functionals and Dual Spaces](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Linear%20Functionals%20and%20Dual%20Spaces.md)
- [Hilbert Space Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Hilbert%20Space%20Introduction.md)


---
### **Intro**

We introduce the idea of Frechet differentiability under the context of Frechet Derivative. 

#### **Def | Banach Frechet Derivatives**
> Let $U, V$ be Banach spaces with their norm. Let $f: W \mapsto V$ where $W$ is an open subset of $U$ then the Frechet Derivative of the function at point $\bar x$ is a linear mapping $A$ such that 
> $$
> \begin{aligned}
>     \lim_{x\rightarrow \bar x}
>     \frac{\Vert f(x) - f(\bar x) - A(x - \bar x)\Vert_U}{\Vert x - \bar x\Vert_V} = 0. 
> \end{aligned}
> $$
> The linear function $A$ maps from $W$ to $V$. 


**Remarks**

It requires some thoughts to show that it's unique. 
It requires more thoughts to say that $A$ is a bounded linear mapping between the Banach Spaces. 
