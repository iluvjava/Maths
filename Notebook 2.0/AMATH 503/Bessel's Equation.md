This is use for solving the cylindrical wave equation, which is [[Helmholtz Equation in a Cylinder]]

And we encounter the problem of solving for the basis functions along the $r$ direction. 

The objective is to look for the series repressentation of the solutions for the Bessel's equation. And we are using the Frobenius method because zero is a singularity of the ODE presented from the Bessel's Equation. 

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

Under the context of the Helmholtz equation in the cylinder, transforming the SOV equation for the $R(r)$ will produce the above bassel's equation, not necessarily the standardard form: 

---
### **The Frobenius Method**

Genrally Speaking, let's assume that the solution of the system can be written as a power series, and then we susbtitute the power series into the ODE, and then we solve for the recurrence of the coefficientos of the power series, and in that case, we have the solution! 

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

Therefore, we Introduce the FroBenius Method:

$$
y(x) = x^s\sum_{n = 0}^{\infty}a_nx^n
\tag{3}
$$

We raise the power for all the terms, by considering multiplying the whole series by $x^s$. And then we plug in the series to the ODEs, solve for $s$, before we solve for the coefficients of the power series. 

---
### **Frobenius Method: Plugging Things in**





