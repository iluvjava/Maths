This is use for solving the cylindrical wave equation, which is [[Helmholtz Equation in a Cylinder]], And because we introduce the method of [[Frobenius Method]] along the way as we go, here I listed some relevant discussion for frobenius method too. 

And we encounter the problem of solving for the basis functions along the $r$ direction. 

The objective is to look for the series representation of the solutions for the Bessel's equation. And we are using the Frobenius method because zero is a singularity of the ODE presented from the Bessel's Equation. 

And because Bessel's equation is a topic on itself, it's in its file and [here](https://www.wikiwand.com/en/Bessel_function) is the Wiki!

**Note**: This is also discussed in details in the chapter 11 of the textbook. 

Summary: 
1. We need to solve the standard form of the Bessel's equation. 
2. We are going to use Frobenius method 
3. There are multiple solution, we are going to make some assumption and solve for one of the solution. 
4. We solve it to get a recurrence relations for the series, and then we unroll the recursion. 
5. And then we discuss in detail on what the assumption mean and what the bessel's function of the second kind is. 
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

Under the context of the Helmholtz equation in the cylinder, transforming the SOV equation for the $R(r)$ will produce the above bassel's equation, not necessarily the standard form. 

The solution for the ODE consists of 2 parts, depending on what value of $p$ is, they will take different forms. But regardless of what the value of $p$ is, there will be 2 solutions, linearly independent solution to the ODE. 

When $p$ is not integer, the solution is: 

$$
y(x) = AJ_{p}(x) + BJ_{-p}(x) \quad J_{p}(x) = 
\sum_{n = 0}^{\infty}
    \frac{(-1)^n\left(
        \frac{x}{2}
    \right)^{2n + p}}{
        n!\Gamma(n + p + 1)
    }
$$

Which is equation (5) later in the file. 

And then this is the solution, parameterized by the constant $p$, but when $p$ is integer, the solution will be a bit more complicated, and I will listed for ease of reference: 

$$
y(x) = AJ_{p}(x) + 
\underbrace{B\left(
    \frac{J_{p}(x)\cos(p\pi) - J_{-p}(x)}{\sin(p\pi)}
\right)}_{y_p(x)}
\tag{6}
$$


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

#### **Consider $n = 1$**:  

$$n = 1$$

$$
((1 + s)^2 - p^2)a_1 = 0
$$

And $s^2 = p^2$ then: 

$$
((1 + p)^2 - p^2)a_1 = 0 \implies (1 + 2p)a_1 = 0
$$

By the assumption that $p > 0$, we can see that: $a_1 = 0$. This is the only way that, we can keep the right hand side to be zero. 

#### **Consider $n > 1$ and the Recursion of the Coefficients**: 

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

Take note that, the sing swap depends on $m$, all the other parameters are even, hence it's $2m$. 

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
y_1(x) = \sum_{n = 0}^{\infty}n
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

**Asymptoptic Behaviors**

If we are looking at small value of $x$, the Bessel's First kind behaves like the first term of the sum, because all the other terms are going to zero. 

When the value $x\rightarrow \pm \infty$, they actually behaves like a $\cos$ function. 

**Fun Fact**

In our case of the Helmholtz equation, $p = 1$, and in that case, the Gamma will be come $(n + m)!$.

---
### **Why $a_0 \ne 0$**

If that is zero, then we have the trivial solution: $y \equiv 0$ for the ODE.

---
### **The Assumption on Positive P**

During the first few steps of the Frobenius Method, we get the value of $s$, and we see that it's $s = \pm p$, but we only solved for $p > 0$, and now, we are going to take a look at the case where $p < 0$. 

Now we still assume that $p > 0$, but we let $s = -p$ to be one of the solution for the Frobenius Method. 

However, if we are going to solve, the whole process will have to be went through again, however, notice that the only difference is that $p = -p$. Therefore, we can take the shortcut of looking for $y_2(x)$ explicitly, replacing by $p$ with $-p$, then, we have this expression: 

$$
y_w(x) = J_{-p}(x)= \sum_{n = 0}^{\infty}
    \frac{(-1)^n\left(
            \frac{x}{2}
            \right)^{(2n - p)}}{
            n!\Gamma (n - p + 1)
        } 
$$


Let's assume that, we are including both the solutions for the General solution for solving [[Helmholtz Equation in a Cylinder]]. 

Recall, in ODE, general solutions only work if the individual solutions are **Linear Independent**.[^1]

Is $J_{p}(x)$ and $J_{-p}(x)$ Linear independent? 

**Spoiler Alert**: There  are some values of $p$ such that, the first kind and second kind of the Bessel's equation is: Linearly Dependent. 

In addition: $J_{p}(x)$ is bounded at $x = 0$, but for $J_{-p}(x)$, it will blows up as $x \rightarrow 0$. 

If we want the solution to be bounded at $x = 0$, then we will have to leave the $J_{-P}(x)$ for the PDEs. 

---
### **Frobenius Method and Linear Independence of the General solution of the Bessel's Equation.** 

For a more general context of what is discussed here, see [[Frobenius Method]]. 

When multiple solution presented for $s$, say $s_1, s_2$, and $s_1 - s_2 = 2p$ and it's an integer, then, $J_p(x)$ and $J_{-p}(x)$ are not linear independent. 

To by pass this, meaning getting a linear independent solution wrt to $s = p$: 

To get another solution for that $-p$ such that it's linear independent, we need to let: 

$$
y_2(x) = \ln(x)y_1(x) + x^{-p}\sum_{n = 0}^{\infty}
    a_nx^n
$$

**Proposition**

when $p = m$ where $m$ is an integer, then $J_{p}(x)$ and $J_{-p}(x)$, are linear dependent, i.e: $J_{-p}(x) = CJ_{p}(x)$. 

**Proof**:

Identities taken for granted. 

1. $\partial_x[x^{p}J_{p}(x)] = x^pJ_{p - 1}(x)$
2. $\partial_{x}[x^{-p}J_{p}(x)] = -x^{-p}J_{p + 1}(x)$
3. $2\partial_{x}[J_p(x)] = J_{p - 1}(x) - J_{p + 1}(x)$

Where Identity 3 is gotten from the previous 2 identities. 

We want to show that for $p = m$ where $m$ is an integer, 

$$
J_{-m}(x) = (-1)^m J_m(x)
$$

Which shows that the function $J_{m}(x)$ and $J_{-m}(x)$ are **not linear independent functions**. 

$$
J_{-m}(x) = \sum_{n = 0}^{\infty}
    \frac{(-1)^n\left(
        \frac{x}{2}
    \right)^{2n - m}
    }{
        n!\Gamma(n - m + 1)
    }
$$

1. If $n > m$, then $\Gamma(n - m + 1) = (n - m)!$
2. if $n < m$, then $\Gamma(n - m+ 1) = \infty$, which means that $\frac{1}{\Gamma(n - m + 1)} = 0$

Therefore: 

$$
J_{-m}(x) = \sum_{n = m}^{\infty}
    \frac{(-1)^n s
        \left(
            \frac{x}{2}
        \right)^{2n - m}
    }{n!\Gamma (n - m + 1)}
= 
\sum_{n = m}^{\infty}
    \frac{(-1)^n 
        \left(
            \frac{x}{2}
        \right)^{2n - m}
    }{n!(n -m)!}
$$

Now, we are going to re-index this thing, which is letting $k = n - m$, then: 

$$
J_{-m} = \sum_{k = 0}^{\infty}
    \frac{(-1)^{k + m}
    \left(
        \frac{x}{2}
    \right)^{2k + m}
    }
    {(k + m)!k!}
    =
    \sum_{n = 0}^{\infty}
    \frac{(-1)^{n + m}
    \left(
        \frac{x}{2}
    \right)^{2n + m}
    }
    {(n + m)!n!}
$$

Interesting.

$$
\implies J_{-m} = (-1)^{m}\underbrace{\sum_{n = 0}^{\infty}
    \frac{(-1)^{n}
    \left(
        \frac{x}{2}
    \right)^{2n + m}
    }
    {(n + m)!n!}}_{J_{m}(x)}
$$

---
### **General Solution Regardless of that $P$ is**

Regardless of what $P$ is the general solution for the Bessel's equation is like: 

$$
y(x) = AJ_{p}(x) + 
\underbrace{B\left(
    \frac{J_{p}(x)\cos(p\pi) - J_{-p}(x)}{\sin(p\pi)}
\right)}_{y_p(x)}
\tag{6}
$$

And under the case when $p$ turns out to be an integer, we will need to take the limit of the second part of the solution. 

---
### **Bessel's Solution Behavior**

For small value of x, here are the list of behavior for the solution of the first kind, and solution of the second kind: 



For large value of $x$ the solution will look like this: 

Here are some graph for it. The **first kind** is: 
![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Bessel_Functions_%281st_Kind%2C_n%3D0%2C1%2C2%29.svg/640px-Bessel_Functions_%281st_Kind%2C_n%3D0%2C1%2C2%29.svg.png?1620680341436)

And the **second kind** is like: 
![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Bessel_Functions_%282nd_Kind%2C_n%3D0%2C1%2C2%29.svg/600px-Bessel_Functions_%282nd_Kind%2C_n%3D0%2C1%2C2%29.svg.png)

These images are linked from wikipedia. 

There are lot of zeros, where $J_m(x)$ crosses the x-axis, these are sometimes very important. Check out 146 page of chapter 11 for some of the zeros.

The zeros of the [[Helmholtz Equation in a Cylinder]]. Where we used the notation that $z_{m,n}$ denotes $n$ th zeros of $J_m(x)$. 


---
### **Bessel's Identity**

This part is given as a proof for the identity we used: 


1. $\partial_x[x^{p}J_{p}(x)] = x^pJ_{p - 1}(x)$
2. $\partial_{x}[x^{-p}J_{p}(x)] = -x^{-p}J_{p + 1}(x)$
3. $2\partial_{x}[J_p(x)] = J_{p - 1}(x) - J_{p + 1}(x)$



[^1]: Under graduate linear analysis intensifies. 
