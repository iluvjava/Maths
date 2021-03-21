[[Proximal Gradient 2]]
FISTA is an algorithm that came out from the 2009. It's accelerated gradient descend but with the proximal operator. 

---

### Intro
This is a new algorithm, and it's going to be stated here for reference. 

This accelerated gradient algorithm is referenced from: 

[reference](http://www.princeton.edu/~yc5/ele522_optimization/lectures/accelerated_gradient.pdf)

The iteration will be started with: $x_0 = y_0$, $t_0 = 1$

$$
x_{k + 1} = \underset{1/\beta, h}{\text{prox}}\left(
    y_k - \frac{1}{\beta}\nabla f(y_k)
\right)
$$
$$
t_{k + 1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}
$$
$$
y_{k + 1} = x_{k + 1} + \frac{t_k - 1}{t_{k + 1}}(x_{k + 1} - x_k)
$$

Take notice that this is exactly the same when compare to the gradient descent without the proximal operator. 