The Frobenius Method is related to solving some very complected second order ODEs, i.e: used to look for the solution of the Bessel's equation, [[Bessel's Equation]]. But in the discussion of the Bessel's equation, there is a lack of clarification and formal treatment of the method, and this is what this file is about. We are going to give a more detailed view of the Frobenius method under a much general context for solving Second Order ODEs.  Here is the reference material [here](https://www.youtube.com/watch?v=uLORiAWe63A) And here is another reference resource that I didn't include them into my notes yet:  [Frobenius Method from Calc Tech](http://www.its.caltech.edu/~esp/acm95b/frobenius.pdf), [Frobenius method from MCGill](https://www.math.mcgill.ca/gantumur/math315w14/downloads/frobenius.pdf). 

---
### **Intro**

This is #CRINGE Please fix it when you have time. 

The Frobenius method is a modified method for solving ODE BVPs using Power series, it assumes: 

$$
y(x) = x^s\sum_{n = 0}^{\infty}
    a_nx^n
$$

and it can be used to solve ODE whose singularity is at: $x = 0$. Why do we want to make the series centered at the singularity? Because, in the case where there are one singularity, the term $x^s$ can extract out the singularity by taking negative integers values. Recall the ODE of 2nd order $y'' + P(x)y' + Q(x)y = 0$ is said to have a singularity at the point $x = x_0$ if $\lim_{x\rightarrow x_0} P(x) = \infty$ and $\lim_{x \rightarrow x_0} Q(x) = \infty$. 

**Take Cautions**: 

Because we are using it to solve the second order ODE, we will get 2 solutions for $s$. When this happens, consider the type of solutions 

1. $s$ has 2 integer solutions. 
2. $s$ is the repeated root of an equation. 

*When we solve for second order ODEs, we want 2 solution associated 2 constants where 2 constants are linearly independent. And that will form the full solution for the ODEs.* 


#### **When $s_1 = s_2 = s$**: 

Fix one of the roots and find the solution of that by unrolling the recursion and solving for the coefficients on the original 2nd ODE, giving us: 


$$
y_1(x) = (x - x_0)^r
\sum_{n = 0}^{\infty}a_n(x - x_0)^n
$$

One solution takes $r = s_1$, and the second solution takes the form of: 

$$
y_2(x) = y_1\ln(x) + (x - x_0)^s \sum_{n = 0}^{\infty}
    A_n(x - x_0)^n
$$

Where, we will be solving for another set of coefficients equation of this format, and this time, solving for $A_n$ and time it will be linear independent to the previous solution $y_1(x)$. 

#### **When $s_1, s_2$ are Distinct but it's Differed by an Integer**

Let's assume that $s_1 > s_2$. 

$y_1(x)$ is going to be the same. I will write the down anyway: 

$$
y_1(x) = (x - x_0)^{s_1}\sum_{n = 0}^{\infty}
    a_n(x - x_0)^n
$$

And the solution for $y_2(x)$ will be: 

$$
y_2(x) = k y_1 \ln(x) 
+ (x - x_0)^{s_2} \sum_{n = 0}^{\infty}
    A_n(x - x_0)^n
$$

Where, take notice that, it has an extra coefficient with $y_1(x)$ where we are going to solve for, and the power on $x$ is $s_2$ in the multiplier for the series. 


#### **When $s_1 \ne s_2$ and Not Differed by an Integer**

This is the easier case, where the solution will take the form of: 

$$
y(x) = x^{s_1}\sum_{n = 0}^{\infty}
    a_{2n}x^{(2n)} + 
    x^{s_2}\sum_{n = 1}^{\infty}
    a_{2n - 1}x^{(2n - 1)}
$$

Remember, when unrolling the recursion for $a_n$, we will also need to consider the value of $s_1, s_2$, because that will sometimes also determine the solution for $a_{2n}, a_{2n + 1}$. 

