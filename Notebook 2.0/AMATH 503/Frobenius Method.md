The Frobenius Method is related to solving some vary complected second order ODEs. 

And it's used to look for the solution of the Bessel's equation, [[Bessel's Equation]]

But in the discussion of the Bessel's equation, there is a lack of clarification and formal treatment of the method, and this is what this file is about. We are going to give a more detailed view of the Frobenius method under a much general context for solving Second Order ODEs. 

Here is the reference material [here](https://www.youtube.com/watch?v=uLORiAWe63A)

And here is another reference resource that I didn't include them into my notes yet: 

[Frobenius Method from Calc Tech](http://www.its.caltech.edu/~esp/acm95b/frobenius.pdf)

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

When we solve for second order ODEs, we want 2 solution associated 2 constants where 2 constants are linear independent. And that will form the full solution for the ODEs. 

But when this scenario for $s$ happened, we can not because the solution we had or $y(x)$ will be linear dependent.


#### **When $s_1 = s_2 = s$**: 

Then, fix one of the roots and find the solution of that by unrolling the recursion and solving for the coefficients on the original 2nd ODE, giving us: 


$$
y_1(x) = (x - x_0)^r
\sum_{n = 0}^{\infty}a_n(x - x_0)^n
$$


And then after that, we are make another solution format which is based **THIS** solution with $s_1$: 

We are making the assumption that the solution for the other function takes the form of: 

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

