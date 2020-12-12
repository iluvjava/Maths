prereq: [[Cauchy Riemann Conditions (Analyticity)]]

This file will give some examples of Analytic functions. 
* Polynomials, Exponential. 

---

### Analytic Functions We Care About

Let's take a look at some regular polynomials that are very easy to extend to the complex plane. 

> $$\sum_{i = 0}^{\infty} a_i z^{i}$$ where $a_i \in \mathbb{C}$, $z\in \mathbb{C}$.

Polynomials with complex coefficients are Analytic on the Entire Complex plane. 

> $$\frac{\sum_{i = 0}^{\infty} a_i z^{i}}
> {\sum_{i = 0}^{\infty} b_i z^{i}}
> $$
> where $$a\in \mathbb{C}, z\in \mathbb{C}$$ and a fractions of polynomials are conformal everywhere excepts the when the roots of the numerators equal to zero. 

---

### Complex Exponential (The Key)
Here we are going to use the idea of analyticity to extend the complex realm, and we are going to make basics assumptions, and construct it from the void (First Principles). 

#### Derivation

* $f'(z) = f(z)$ the derivative of the function is the function itself. (1)
* $f'(x)$ exists on the entire complex plane. (2)
* $\forall x \in \mathbb{R}: f(x) = e^x$, when the complex number is a real number, the function is the same as the exponential function in real realm. (3)

Assume that the format of the complex function is like: 

> $$w = v(x, y) + iv(x, y)$$

And then in this case, we will use (1) to get: 

$$
u_x = u \hspace{2em} v_x = u
$$

Then solving the system, we will have  the expression that: 

$$
u(x, y) = g(y)e^x \hspace{2em} v(x, y) = h(y)e^x 
$$

And remember the $e^x$ is just our regular, old, exponential function defined for the real numbers. 

Now, by the fact the function is entire analytic on the complex plane, we know the the Cauchy Riemann conditions can be applied, and it will mean that: 

$$
h' = g \hspace{2em} g' = -h
$$

And this is a linear system of ODEs, it's not hard to decompose it into a second order ODE, and then we will get the solution to the system as the following: 

$$
\begin{cases}
	h(y) =& c_1\cos(y) + c_2\sin(y)  \\
	g(y) =& -c_1\sin(y) + c_2\cos(y) 
\end{cases}
$$

So now, we will have an expression for the function, involving these constants: 

$$
w = e^x((c_1 +ic_2)\cos(y) + i(-c_1 + ic_2)\sin(y))
$$

And then it's not hard to solve for the constant by plugging in $x = 0, y = 0$ to get $c2 = 1, c_1 =0$, and then we will have the exponential function extended to the complex number real and it's gonna look like: 

> $$
> e^{x + iy} = e^{x} (\cos(y) + i\sin(y))
> $$

And this is a beautiful derivation of the exponential function for the complex number. 

Observe that the function here is $2\pi$ periodic on the, complex direction, meaning that $e^{x + iy} = e^{x + i(2n\pi + y)}$. And this is very interesting, pointing out the fact that, the function is going to repeat itself every on the imaginary direction. 

