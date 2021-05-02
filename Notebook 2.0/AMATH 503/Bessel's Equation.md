This is use for solving the cylindrical wave equation, which is [[Helmholtz Equation in a Cylinder]]

And we encounter the problem of solving for the basis functions along the $r$ direction. 

The objective is to look for the series representation of the solutions for the Bessel's equation. And we are using the Frobenius method because zero is a singularity of the ODE presented from the Bessel's Equation. 

And because Bessel's equation is a topic on itself, it's in its file and [here](https://www.wikiwand.com/en/Bessel_function) is the Wiki!


---
### **Intro**

We need some way of getting around the Bessel's Equation to get solution for the Helmholtz Equation in the  cylinder. 

The Standard Form of the Bessel's Equation is: 

$$
x \partial_x[x\partial_x[y]] + (x^2 - p^2)y = 0 
$$

$$
x(x\partial_x^2[y] + \partial_x[y]) + (x^2 - p^2)y = 0 
$$

$$
x^2\partial_x^2[y] + x\partial_x[y] + (x^2 - p^2)y = 0
$$

$$
x^2 y'' + x y' + (x^2 - p^2)y = 0
\tag{1}
$$

Under the context of the Helmholtz equation in the cylinder, transforming the SOV equation for the $R(r)$ will produce the above bassel's equation, not necessarily the standard form: 

---
### **The Frobenius Method**

Generally speaking, let's assume that the solution of the system can be written as a power series, and then we substitute the power series into the ODE, and then we solve for the recurrence of the coefficients of the power series, and in that case, we have the solution! 

However,  the Bessel's equation has a singularity, recall that the ODE: 

$$
y'' + P(x)y' + Q(x)y = 0
$$

Has a singularity at $x = a$ if both $P(a)$, $Q(a)$ blows up at the point $x = a$. 

And in our case, from (1), we have: 

$$
y'' + \frac{y'}{x} + \frac{(x^2 - p^2)}{x^2}y = 0
\tag{2}
$$

And it's not hard to see that (2) has a singularity at point $x = 0$

Therefore, we Introduce the Frobenius Method:

$$
y(x) = x^s\sum_{n = 0}^{\infty}a_nx^n
\tag{3}
$$

We raise the power for all the terms, by considering multiplying the whole series by $x^s$. And then we plug in the series to the ODEs, solve for $s$, before we solve for the coefficients of the power series. 

---
### **Frobenius Method: Plugging Things in**

$$
y'(x) = \sum_{n = 0}^{\infty}(n + s)a_nx^{(n + s - 1)}
$$

$$
y''(x) = \sum_{n = 0}^{\infty}(n + s)(n + s - 1)a_nx^{(n + s - 2)}
$$

So then: 

$$
x^2y'' = \sum_{n = 0}^{\infty}(n + s)(n + s - 1)a_nx^{(n + s)}
$$

$$
xy' = \sum_{n = 0}^{\infty}(n + s)a_nx^{(n + s)}
$$

Substituting it into expression (1) should give: 

$$
\sum_{n = 0}^{\infty}(n + s)(n + s - 1)a_nx^{(n + s)}
+ 
\sum_{n = 0}^{\infty}(n + s)a_nx^{(n + s)}
+ 
(x^2 - p^2)\sum_{n = 0}^{\infty}
    a_nx^{n + s}
= 0
$$

$$
\sum_{n = 0}^{\infty}(n + s)(n + s - 1)a_nx^{(n + s)}
+ 
\sum_{n = 0}^{\infty}(n + s)a_nx^{(n + s)} 
- p^2\sum_{n = 0}^{\infty}
    a_nx^{n + s}
+ 
\underbrace{\sum_{n = 0}^{\infty}
    a_nx^{n + s + 2}}_{
        \sum_{n = 2}^{\infty}
            a_{n - 2}x^{n + s}
    }
= 0
$$

So now, all of the terms can match up with each other and we will be able to collect the terms, and after some amount of math, we will be able to get this expression: 

And hence the expression in the end is: 

$$
\sum_{n = 0}^{\infty}
    ((n + s^2) - p^2)a_nx^{n + s} 
+     
\sum_{n = 2}^{\infty}
    a_{n - 2}x^{n + s} 
= 0
\tag{4}
$$

And now, we are able to proceed with solving the system, and let's see what we get. 

We are especially interested in the solution for the $s$, and that is what we need to do things. 

Let's consider the case that $n = 0$, then we haev: $[s^2 - p^2]a_0 = 0$, assuming that $a_0 \ne 0$, which it will not (**more on that later**), then we haev $s = \pm p$, and in this case we obtained 2 solutions for $s$. 

And we are going to assume that $p> 0$ (**more on this later**), this is also a reasonable assumption, because the solution with $p < 0$ is blowing up. 




