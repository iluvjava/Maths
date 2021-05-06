This is use for solving the cylindrical wave equation, which is [[Helmholtz Equation in a Cylinder]]

And we encounter the problem of solving for the basis functions along the $r$ direction. 

The objective is to look for the series representation of the solutions for the Bessel's equation. And we are using the Frobenius method because zero is a singularity of the ODE presented from the Bessel's Equation. 

And because Bessel's equation is a topic on itself, it's in its file and [here](https://www.wikiwand.com/en/Bessel_function) is the Wiki!

**Note**: This is also discussed in details in the chapter 10 of the textbook. 

Summary: 
1. We need to solve the standard form of the Bessels equation. 
2. We are going to use Frobenius method 
3. There are multiple solution, we are going to make some assumption and solve for one of the solution. 
4. We solve it to get a recurrence relations for the series, and then we unroll the recursion. 

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
    ((n + s)^2 - p^2)a_nx^{n + s} 
+     
\sum_{n = 2}^{\infty}
    a_{n - 2}x^{n + s} 
= 0
\tag{4}
$$

And now, we are able to proceed with solving the system, and let's see what we get. 

We are especially interested in the solution for the $s$, and that is what we need to do things. 

Let's consider the case that $n = 0$, then we haev: $[s^2 - p^2]a_0 = 0$, **assuming** that $a_0 \ne 0$, which it will not (**more on that later**), then we haev $s = \pm p$, and in this case we obtained 2 solutions for $s$. 

And we are going to **assume** that $p> 0$ (**more on this later**), this is also a reasonable assumption, because the solution with $p < 0$ is blowing up. 

---
### **Solving For the Recurrence on the Power Series**

Here, we are going to look for $a_n$ for the power series. 

We can consider this for each integral value of $n$. 

We already dealt with the case that $n = 0$, which helped us getting the expression for $s$, now we are going to try all the natural number. 

#### **Consider**:  

$$n = 1$$

$$
((1 + s)^2 - p^2)a_1 = 0
$$

And $s^2 = p^2$ then: 

$$
((1 + p)^2 - p^2)a_1 = 0 \implies (1 + 2p)a_1 = 0
$$

By the assumption that $p > 0$, we can see that: $a_1 = 0$. 

#### **Consider**: 

$$
n = 2, 3, 4, 5\cdots
$$


For this, we can get the recurrence relation that: 

$$
((n + s)^2 - p)a_n + a_{n - 2} = 0
$$

And using the recurrence, that will be: 

$$
a_n = \frac{-a_{n - 2}}{(n + p)^2 - p} = \frac{-a_{n - 2}}{
    n(2p + n)
}
$$

With the assumption that $a_0\ne 0$, and we know that $a_1 = 0$, and hence, it's not hard to see that the recurrence will set all $a_{2n + 1}$ to be zero. if $a_1$ is zero, then so is $a_{3}, a_{5},\cdots$. 

---
### **Unrolling Recursion**

Unroll the recursion base on $n = 0$, with $a_0$, we have that: 

$$
a_2 = \frac{-a_0}{
    2(2p + 2)
}
= 
\frac{-a_0}{2^2(p + 1)}
$$

And so then: 

$$
A_4 = \frac{-a_2}{4(2p + 4)} = \frac{-a_2}{2^3(p + 2)} = \frac{a_0}{2^4\times 2(p+ 2)(p + 1)}
$$

Boom, there is a pattern emerging, so I will take the guess that: 

$$
a_6 = \frac{a_4}{
    6(2p + 6)
}
=
\frac{a_0}{
    2^6\times 3!(p+ 1)(p+2)(p + 3)
}
$$

Interesting, so then there is a general pattern is obvious, and the solution will be like: 

$$
y = x^pa_0 \sum_{m = 0}^{\infty}
    \frac{(-1)^mx^{2m}}{
        2^{2m}m!(p + 1)(p + 2)\cdots (p + m)
    }
$$

Take note that, the sing swap depens on $m$, all the other parameters are even, hence it's $2m$. 

**Take note**: $p$ is not necessarily an integer here. 

---
### **Gamma Function**

$$
\Gamma(z + 1) = z\Gamma(z)
$$

Let: 

$$a_0 = \frac{1}{2^p\Gamma(p + 1)}$$

Then: 

$$
y = x^p \frac{1}{2^p\Gamma(p + 1)} \sum_{n = 0}^{\infty}
    \frac{(-1)^nx^{2n}}{
        2^{2n}n!(p + 1)(p + 2)\cdots (p + n)
    }
$$
 
Then it can be said that: 

$$
y_1(x) = \sum_{n = 0}^{\infty}
    \frac{(-1)^n\left(
        \frac{x}{2}
    \right)^{2n + p}}{
        n!\Gamma(n + p + 1)
    } = J_p(x)
\tag{5}
$$

What we did: 

1. Use the recurrence and this specific value of $a_0$ and the Gamma function to simplify the denominator. 
2. Move the $2^{2n}$ to the numerator and merge into $x/2$. 
3. Move the multiplier $x^p$ into the sum. 

Up to this point, we had a good looking solution to the **Bessel's Function of the first kind**. 

This is the fist type bessel's function. 

This is the solution that won't blow up to infinite on us. 

This is actually the solution to the Bessel's equation as well. 

If we are looking at small value of $x$, the Bessel's First kind behaves like the first term of the sum, because all the other terms are going to zero. 

When the value $x\rightarrow \pm \infty$, they actually behaves like a $\cos$ function. 

**Fun Fact**

In our case of the Helmholtz equation, $p = 1$, and in that case, the Gamma will be come $(n + m)!$. 


---
### **Why $a_0 \ne 0$**

If that is zero, then we have the trivial solution: $y \equiv 0$ for the ODE.

During the first few steps of the Frobenius Method, we get the value of $s$, and we see that it's $s = \pm p$, but we only solved for $p > 0$, and now, we are going to take a look at the case where $p < 0$. 

---
### **The Assumption on Positibe p**

