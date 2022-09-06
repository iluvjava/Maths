[[Finite Difference]], [[Taylor Series]]

---
### **Finite Diff With Errors Derived**

We figure out the basic error term for the difference scheme, other compositive method such as using non-uniform grid points, or richardson's extrapolation will build on the remainders from the Taylor's Theorem. We would also need to take notes one some facts about symmetric finite difference with 3 points stencils, which tends to cancel out all the odd terms in the taylor series. 

For example, consider the Second Order Finite Difference Scheme, define finite diff operator: 

$$
D_{\pm h}^2[u(x)]_{x = x_0} = \frac{
    u(x_0 + h) -2 u(x_0) + u(x_0 - h)
}{h^2}
$$

And we are interested in $D_{\pm h}^2[u(x)]_{x = x} - u''(x)$. Let's represent the offset $u(x + h)$ with: 

$$
\begin{aligned}
    u(x + h) &= u(x) + hu(x) + \frac{h^2}{2}u(x) + \sum_{n = 3}^{\infty}
        \frac{h^nu^{n}(x)}{n!}
    \\
    u(x - h) &= u(x) - hu(x) + \frac{h^2}{2}u(x) + \sum_{n = 3}^{\infty}
        \frac{(-1)^nh^nu^{n}(x)}{n!}
    \\
    \implies 
    \frac{u(x + h) - 2 u(x) + u(x - h)}{2}
    &= 
    u''(x) + \sum_{n=3}^{\infty}
        \frac{(1 - (-1)^n)h^{n - 2}u^{(n)(x)}}{n!}
\end{aligned}
$$

And the error term can be simplified to be: 

$$
\begin{aligned}
    D_{\pm h}^2[u(x)]_x - u''(x) &= \sum_{n = 4}^{\infty} \frac{(1 - (-1)^n)h^{n - 2}u^{(n)}(x)}{n!}
    \\
    &= \sum_{n = 2}^{\infty}
    \frac{2h^{2(n - 1)}u^{(2n)}(x)}{(2n)!}\in \mathcal{O}(h^2)
\end{aligned}
$$

**Warning**

> Don't put the $\mathcal{O}(h^2)$ into infinite sum, or integral, simplify the $\mathcal{O}$ function only at the end of the evaluations of some kind. The loose bound nature will hide catastrphe people do not expect. 


