The Frobenius Method is related to solving some vary complected second order ODEs. 

And it's used to look for the solution of the Bessel's equation, [[Bessel's Equation]]

But in the discussion of the Bessel's equation, there is a lack of clarification and formal treatment of the method, and this is what this file is about. We are going to give a more detailed view of the Frobenius method under a much general context for solving Second Order ODEs. 

---
### **Intro**

The forbenius method is a modified method for solving PDEs using Power series, it uses: 

$$
y(x) = x^s\sum_{n = 0}^{\infty}
    a_nx^n
$$

As the underlying assumption for the power series, and in this case, it can be used to solve PDEs whose singulraity is at: $x = 0$. 

Why do we want to make the series centered at the singularity?

Because, in the case where there are one singularity, we an just use the Frobenius method to solve and  then we won't need to worry about the convergence radius anymore, because it will converge on all the complex! 

Recall: The ODE 2nd order $y'' + P(x)y' + Q(x)y = 0$ is said to have a singularity at the point $x = x_0$ if $\lim_{x\rightarrow x_0} P(x) = \infty$ and $\lim_{x \rightarrow x_0} Q(x) = \infty$

**Take Cautions While Solving the ODE**: 

Because we are using it to solve the second order ODE, with 2 variables, we will inevitably runs into problem when there are 2 solutions for $s$. 

And when this happens, we will need to take caution when: 
1. $s$ has 2 integer solutions. 
2. $s$ is the repeated root of a solution. 

When we solve for second order ODEs, we want 2 solution associated 2 constants where 2 constatns are linear independent. And that will form the full solution for the ODEs. 

But when this scenario for $s$ happened, we can not because the solution we had or $y(x)$ will be linear dependent.



