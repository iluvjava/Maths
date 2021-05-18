Here, we are going to solve some ODE which is relevant with solving the helmholtz equation in 3d under the spherical coordinate. 

 [[Helmholtz Equation in a Sphere]]

---
### **Intro**

The ODE we are solving is: 

$$
\partial_x[(1 - x^2)\partial_x[y]] + \eta y = 0 \tag{1}
$$

$$
- 2x\partial_x[y] + (1 - x^2)\partial_x^2[y] + \eta y = 0 \tag{2}
$$

This is also called the associated Legendre equation in spherical coordinates, but with the case where $m = 0$. This means that there is no affect by the longitude direction, meaning that $\Phi(\phi)$ is a constant. 

To solve, we are going to use the Power Series expansion centered at a point. Let's call that point $b$. 

---
### **Power Series**

To use the power series method we are first going to check for the singularity of the ODE, and this means checking: 

$$
\partial_x^2[y] + \frac{2x}{1 - x^2}\partial_x[y] + \eta y = 0
\tag{3}
$$

And notice that the singularities are $\pm x$. So, don't center the series at those points. 

We can still do that on the singularity, but that means we are going to use the [[Frobenius Method]], which could be a pain to deal with because of the extra multiplier at the front. 

Start Assuming that: 

$$
y(x) = \sum_{n = 0}^{\infty} a_n x^n
\tag{4}
$$

And taking the derivative we have: 

$$
y'(x) = \sum_{n =0}^{\infty}a_nnx^{n - 1} \quad y''(x) = \sum_{n = 0}^{\infty}
a_n(n - 1)nx^{n - 2}
\tag{5}
$$

Plugging it into the expression (2), we will have: 

$$ 
-2x\sum_{n =0}^{\infty}a_nnx^{n - 1} + 
(1 - x^2)\sum_{n = 0}^{\infty}a_n(n - 1)nx^{n - 2} +
\eta \sum_{n = 0}^{\infty} a_n x^n
$$

$$ 
\sum_{n =0}^{\infty}-2a_nnx^{n} + 
\sum_{n = 0}^{\infty}a_n(n - 1)nx^{n - 2} +
\sum_{n = 0}^{\infty}a_n(n - 1)nx^{n} + 
\eta \sum_{n = 0}^{\infty} a_n x^n
$$

$$
\sum_{n = 2}^{\infty}
    n(n - 1)a_nx^{n - 2} -
\sum_{n = 0}^{\infty}
    n(n + 1)a_n x^n + 
\eta \sum_{n = 0}^{\infty}a_n x^n = 0
$$

There we go, now we adjust the series power, and make them align, and the series will become: 

$$
\sum_{n = 0}^{\infty}
    (n + 2)(n +1)a_{n + 2}x^{n} -
\sum_{n = 0}^{\infty}
    n(n + 1)a_n x^n + 
\eta \sum_{n = 0}^{\infty}a_n x^n = 0

$$

$n$ can start summing at 2 and ignore the first 2 terms because they are just zeros. 

$$
\sum_{n = 2}^{\infty}
    (n + 2)(n +1)a_{n + 2}x^{n} -
\sum_{n = 0}^{\infty}
    n(n + 1)a_n x^n + 
\eta \sum_{n = 0}^{\infty}a_n x^n = 0
\tag{6}
$$

Put everything on one side we have: 

$$
\sum_{n = 0}^{\infty} 
\left[
    (n + 2)(n + 1)a_{n + 2} - n(n + 1)a_n + \eta a_m
\right] = 0
$$

$$
\implies 
(n + 2)(n + 1)a_{n + 2} - (n(n + 1) - \eta)a_n = 0
$$

And notice that this is a second order recurrence relation the depends on $\eta$. 

$$
a_{n + 2} = \frac{n(n + 1) - \eta}{(n + 2)(n + 1)}a_n
\tag{7}
$$

Ok, so we had a series that is going to converge, for $|x|\le 1$, using some basic complex analysis and singularity. 


### **Examine the Coefficients**

Referring back to (7), it's not hard to observe that odd and even orders are entangled together. 

Given any $a_0$, all even power terms will be tangled to this choice. 

Similarly, given any $a_1$, all odd power terms will be tangled to this choice as well. 

Now, it's not hard to see that the form of the general solution can be written like the following: 

$$
y(x) = \sum_{n = 0}^{\infty} a_{2n}x^{2n}
+ 
\sum_{n = 0}^{\infty} a_{2n + 1}x^{2n + 1}
$$

Which I am just splitting it by the odd and even terms in this case. 

**Boundary Conditions? Restrain the solution a bit?**

Consider the fact that, the Legendre equation is satisfying that: 

$$
\begin{cases}
    \partial_x [(1 - x^2)\partial_x[y]] + \eta y = 0
    \\
    y(x) \ne \infty \text{  at } x = \pm 1
\end{cases}
$$

We are saying that, the series are not blowing up when we approaches the singularity. This is saying that the series is going to converge at the point $x = \pm 1$, and, we are going to use the ratio test. 

$$
\lim_{x\rightarrow \infty}
\left|
\frac{a_{n + 1}x^{n + 1}}{a_n x^n}
\right| < 1
$$

And, in our case, we have 2 series. And if both of them are converging at the point $x = \pm 1$, then we are in luck. 

And, that just means we are skipping the terms when we do the ratio test. The next term will be $n + 2$ instead of just $n$. 

Using the recurrence relation, we are looking at the limit: 

$$
\lim_{x\rightarrow \infty}
\left|
    \frac{m(m + 1)-\eta}{(m + 2)(m + 2)}x^2 
\right| = |x|^2
$$


And notice that the series is going to converge in the range of $|x|< 1$, (Which aligns with the singularity argument for complex series, like I said before.)

**Prof:**

> It turns out that, the convergence and divergence issues depends on what the value for $\eta$ is, for general values of $\eta$, $y(x)$ is going to blow up at $x = \pm 1$, but for special values of $\eta$, $y(x)$ is going to be bounded at $x =\pm 1$

So, how are we going to find these special values? 

We are going to pick $\eta$ such that at some point: 

$$
n(n + 1) - \eta = 0 \tag{8}
$$

**Note**: Her, the $n$ is just  the index and it has nothing to do with the index in the summation term. 

So this means that: $\eta_n = n(n + 1)$. 

If $\eta$ is produced in this way, then we know that the solution series is going to be convergence. 

**Prof:**

> For such values of $\eta_n$, wher $n(n + 1)$ makes the series terminates, so it's actually a polynomials.[^1]


---
### **The Special $\eta$**

**Consider the case where $\eta_0$**, then it means that $\eta = 0$, so then the whole numerator of expression (7) is going to be zero, so that will mean: $a_2 = 0$, so them $a_4 = 0$, so tham $a_{2n}$ are going to be zero. So the only none zero term here is $a_0$. And: 

$$
a_3 = \frac{2}{3\times 2}a_1
$$

And take notice that, this is just setting all the odd terms in relation to the first odd term: $a_1$. 

So in this case, The solution will look like: 

$$
y(x) = a_0 + \sum_{n = 0}^{\infty} a_{2n + 1}x^{2n + 1} = p_0(x)
$$

Now, we are going to normalize the soltuion, by making $y(1) = 1$, which implies that $a_0 = 1$. 

**Consider the case $\eta_1 = 2$**. Using the recurrence relations, and let's focus on the odd terms, by choosing arbitrary $a_1$, then: 

$$
a_3 = \frac{1\times 2 - 2}{3\times 2} a_1 = 0 \implies a_n = 0 \quad \forall n = 1, 2, 3\cdots
$$

And, the even parts are still going to be here, and the only parts that left is the $a_1$. Let's see...

$$
y(x) = \sum_{n = 0}^{\infty} a_{2}x^{2n} + a_1x
$$

Ok, we don't want the infinite sum, beacuse it's not gong to be convergence. Remember that we have the free choice on $a_0$, let $a_0 = 0$[^2], then: 

$$
y(x) = a_1 x = p_1(x) 
$$

Normalizing it with $p(1) = 1$, we have $a_1 = 1$, so them $p_1(x) = x$. 

**Consider the case that $\eta_2  = 2\times 3  =6$, then:** 

$$
a_2 = \frac{0-6}{2\times 1}a_0 = -3a_0
$$

$$
a_4 = \frac{2\times 3 - 6}{4\times 5} a_2 = 0\implies a_{n} = 0\quad \forall n = 2, 4, 8, \cdots
$$

So then, we have the solution in this form: 

$$
y  = a_0 + a_2x^2 + \sum_{n = 0}^{\infty}a_{2n + 1}x^{2n + 1}
$$

and, let $a_1 = 0$, we get rid of all the odd terms of the series. In that case, we can say that: $y(x) = a_0 - 3a_0x^2$, and normalizing it with $y(1) = 1$ we have the expression: 

$$
y(x) = -\frac{1}{2} + \frac{3}{2}x^2 = p_2(x)
$$

Ok, that were a lot, but we are going to spoil the next term: 

$$
p_3(x) = \frac{-3}{2}x + \frac{5}{2}x^3
$$

And the general pattern in this case is: 

$$
\sum_{k = 0}^{\lceil n/2\rceil}
\frac{(-1)^k(2n - 2k)!}{2^nk!(n - k)!(n - 2k)!}
$$

And this is called the **Legendre Polynomials** 

And this is a plot for the first few, normalized Legendre Polynomials. 

![](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Legendrepolynomials6.svg/640px-Legendrepolynomials6.svg.png?1621115296867)

**Fun Fact**: 

**Legendre Polynomials are ORTHOGONAL.** and this is an amazing quality to have when we are using it as the basis functions fo something. 

---
### **Peroperty**

For any "reasonable" functions, it can be expressed as a linear combinations of the Legendre Polynomials. And the Proof of Orthogonality in chapter 10 of the textbook. 


[^1]: Mathematician usually wants the eigen functions normalized. And in our case, the eigenfunctions is $p_n(x)$, and we want to adjust the function such that $p(1) = 1$. 
[^2]: Consider the original problem of the Helmholtz Equation in the sphere, we are only interested in solution that is not blowing up, so, we make choice on the parameter $x_0, x_1$ to make sure that we have the right solutions that we are interested in. 