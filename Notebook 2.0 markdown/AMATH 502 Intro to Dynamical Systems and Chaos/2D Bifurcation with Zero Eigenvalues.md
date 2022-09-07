[Bifurcation 1D](Bifurcation%201D.md)
There are 2 cases when the 2D system bifurcate: 
1. Bifurcations involving fixed points. 
2. Bifurcations involving limit cycles. 

Here we will be focusing on the first case. 

---

### Intro

Fortunately, not much new theories are needed for the Bifurcation in 2D because when fixed points colliding/separating with other, they will be doing it on a curve. And locally, they are colliding on a line. 

So, we basically need to: 
1. Identify the region where the bifurcation happens. It happens when the fixed point is having eigenvalue. This is the case because the direction of the zero eigenvalue is the manifold for the eigenvalue of the Jacobian. 
2. Setup a Taylor Series description of the system at that point. 
3. Solve it, and then deal with it by describing what is happening on that line.
4. Check the stability of the fixed point with the approximation, and then identify the type of bifurcation on the manifold. 

This is best demonstrated with actual example, and  the first part of identifying the place where bifurcation happens is the hardest.

---
### Examples: Idealized Saddle Node

It's a saddle node because that it what it looks like on the manifold. 

It's an idealized version because we don't need local approximation at the point of bifurcation. 

Consider the system: 
$$
\begin{cases}
x' =& \mu - x^2 \\     
y' =& - y \\
\end{cases}
$$

**What are the fixed points of the system**? 

$$
y_* = 0 \quad x_* = \pm \sqrt{\mu}
$$

Let's say that: $P_1 = (\sqrt{\mu}, 0)$ and $P_2 = (-\sqrt{\mu}, 0)$. Take notice that, when $\mu > 0$ , there are 2 fixed points, and when $\mu = 0$, there are one, and when $\mu < 0$, there are no fixed points. Hence, it's not hard to identify the value of $\mu = 0$ to be the value for bifurcation. 

And this is the Jacobian at any points: 

$$
J(x, y) = \begin{bmatrix}
    -2x & 0 \\ 0 & -1
\end{bmatrix}
$$

It's not hard to see the the eigenvalue are $\lambda_1 = -2x$ and $\lambda_2 = -1$. 

Assuming $\lambda > 0$: 

1. For $P_1$, $\lambda_1 = - 2\sqrt{\mu}$; $\lambda_1, \lambda_2 \le 0$, it's a stable node. 
2. For $P_2$, $\lambda_1 = 2\sqrt{\mu}$; one if larger than zero while the other is not, this is a saddle node. 

**What is happening with LSA at the point of bifurcation**?

$\lambda_1 = 0$, we have one of the eigenvalue to be zero, while at the same time, we know that $\lambda_2 < 0$, and it failed, both the stability and the classification of the fixed point cannot be trusted. 

Visually, the stable node collided with the saddle node on the x-axis. 

**Where did bifurcation happened**? 

Notice that, the parameter is only with the $x'$, therefore, the manifold which the bifurcation happened is just the x-axis. 

**What is the type of Bifurcation**?

This is a saddle node bifurcation, because 2 fixed point classified with different stability collided on the x-axis and then they vanished. 

**How does it look like on the complex plane**?

If we look at the Jacobian of one of the fixed point, the eigen vector travels along the real axis, then it touches zero, and then the fixed point ceased to be a fixed point anymore. 

---
### Example 2: Pitchfork Bifurcation

In this example, we are looking at a worst case, where everything is not ideal. 

$$
\begin{cases}
    x' &= \mu x + y + \sin x
    \\
    y' &= x - y
\end{cases}
$$

**What are the fixed points**? 

Sorry, this system is not solvable, and it seems like there are infinitely many fixed points. 

But, one thing for sure, $(0, 0)$ is a fixed point, this one is not hard to see. 

And, we can also take the Jacobian on the system and get: 

$$
J(x, y; \mu) = 
\begin{bmatrix}
    \mu + \cos x & 1 \\ 
    1 & -1 
\end{bmatrix}
$$

At the fixed point, the Jacobian looks like: 

$$
J(x, y; \mu)
\begin{bmatrix}
    \mu + 1 & 1 \\ 1 & - 1
\end{bmatrix}
$$

**What happens to the only fixed point that we know**? 

$$
\lambda = \frac{\mu \pm \sqrt{(\mu + 2)^2 + 4}}{2}
$$

Notice that, what is inside the root is always going to be larger than zero. 

Let's explore the case for the negative sign: 

$$
2\lambda_2 = \mu - \sqrt{(\mu + 2)^2 + 4}
$$
$$
2\lambda_2 =\mu^2 - (\mu + 2)^2 - 4
$$
$$
2\lambda_2 = -4\mu - 4 - 4
$$
$$
2\lambda_2 = -4\mu - 8
$$

When $\mu < -2$, this is positive, when $\mu > -2$, this is negative. 

This is saying that: 

1. When $\mu < -2$, $\lambda_1, \lambda_2 > 0$, this is an unstable node. 
2. When $\mu > -2$, $\lambda_2 < 0$, $\lambda_1 > 0$, and this is a saddle node. 

However, notice that, the positive eigenvalue can decay to zero, if $\mu =- 2$. Basically: 

$$
\lambda = \frac{\mu + \sqrt{(-2 + 2)^2 + 4}}{2} = 0
$$

And this, means failure of the LSA, and it means that there is bifurcation happening when $\lambda = 0$. This is what we learned from the first case. However, this the fixed point is never destroyed or created. This means that 

**What is happening with this fixed point**?

There are 2 other fixed point near colliding with this fixed point, and changing it into a saddle node. 

Here, we will be interested in looking at the system when $\mu$ is very closed to $-2$, and we will also be looking at the system when it's very closed to the point $(0, 0)$, this is useful because, we can actually solve for other fixed points using Taylor Series. 

At the point $(0, 0)$ we will have the system to be approximated by the system: 

$$
\begin{cases}
    x ' &= \mu x + y + x  - \frac{x^3}{3!}\\
    y'  &=x - y
\end{cases}
$$

Notice that, setting the system to be zero, we have: $x = y$, and this is the line where all the fixed point should occur at. 

This always means a substitution will make the system into a 1D system, and it means that: 

$$
x' = \mu x + 2x - \frac{x^3}{6} = x\left((\mu + 2) - \frac{x^2}{6}\right)
$$

And it's not hard to see the $x_*$ for the 2 other fixed points are $\pm \sqrt{6(\mu + 2)}$, and since $x = y$. we have the fixed point: 

$$
p = \left(\pm\sqrt{6(\mu + 2)}, \pm\sqrt{6(\mu + 2)}\right)
$$

**What happen to the other 2 fixed point as the parameter changes**?

1. $\mu < -2$, then it's imaginary, the other 2 foxed points don't exist. 
2. $\mu = -2$, It's still the same fixed point. 
3. $\mu > -2$, there are 3 fixed points in total. 


And it's not hard to see that, locally on one the line $y = x$ we are having a pitchfork bifurcation. 

**What are the stability of the fixed points and what is the type of Bifurcation**? 

Let's take a look at the Jacobian for the approximated system. This is easier to deal with. This also makes sense because we solved the system using the Approximated system. 

And this will be like (After some math which I skipped): 

$$
J(p; \mu) := \begin{bmatrix}
    -2\mu - 5 & 1 \\ 1 & -1
\end{bmatrix}
$$

And the expression for Eigenvalues are given as: 

$$
\lambda = \frac{
    (-2\mu + 6) \pm \sqrt{(2\mu + 6)^2 - 4(2\mu + 4)}
}{
    2
}
$$

let's assume that, $\mu > -2$, so that we have 3 fixed points in total, we are interested in the stability of the 2 fixed points here: 

And it's not hard to see that as long as $\mu > -2$, both the eigenvalues will be less than zero and this is a good news. 

So then we can classify the bifurcation on the manifold $y = x$ to be a super-critical pitchfork bifurcation. 


---
### Summary: 

We discussed the case where, fixed points having real eigenvalues are sliding across the imaginary axis, and that is the case when the 2D fixed point bifurcation happens. That is why we are calling it "Zero Eigenvalue Bifurcation."

And that is pretty much it. 