[2D Linear System](2D%20Linear%20System.md)


---

### Introduction 
General Form: 

> $$
> \begin{bmatrix}
>     x'(t)
>     \\
>     y'(t)
> \end{bmatrix}
> =
> \begin{bmatrix}
>     f_1(x, y) \\ f_2(x, y)
> \end{bmatrix}
> $$

Where the function $f_1(x,y)$ and $f_2(x,y)$ don't have to be linear function. 

In this case, because we only have a way to analyze linear system, therefore we would want to see what happens near the vicinity around the fixed points. The fixeds points has the conditions that: 

$$
f_1(x,y) = 0 \wedge f_2(x,y) = 0
$$

### Jacobian Near the Fixed Points
We are interested in the behaviors of the system $x' = f(x)$ around a fixed points, where $f(x)$ is a $\mathbb{R}^2$ to $\mathbb{R}^2$ function. 

Let the solution around a fixed point be described by parametric perturbations. 

$$
x(t) = x^* + \epsilon(t)
$$

Then taking the derivative of the above equation wrt to time we haver
$$
x'(t) = f(x_1^* + \epsilon_1, x_2^* + \epsilon_2)
$$
Using Taylor Series we have: 

$$
f(x_1^* + \epsilon_1, x_2^* + \epsilon_2) = 
\begin{bmatrix}
    \partial_x f_1(x^*, y^*) & \partial_y f_1(x^*, y^*)
    \\
    \partial_x f_2(x^*, y^*)& \partial_y f_2(x^*, y^*)
\end{bmatrix}
\begin{bmatrix}
 \epsilon_x \\ \epsilon_y
\end{bmatrix} + \mathcal{O}(\epsilon^2)
$$

Now, notice that the stability of the linear system expressed in terms of Perturbations around the fixed point will determine the stability of that fixed point for the non-linear system. 

---
### Stability Analysis (A failed Example)

Let's look at an example: 

$$
x' = - y + ax(x^2 + y^2)
$$
$$
y' = x + ay(x^2 + y^2)
$$

And this is the system, and the Jacobian of the system is like: 

$$
J =
\begin{bmatrix}
 3ax^2 + ay^2 & -1 + 2axy \\
 1 + 2axy & ax^2 + 3ay^2
\end{bmatrix}
$$
Consider: 
$$
J(0, 0) = \begin{bmatrix}
 0 & -1 \\ 1 & 0
\end{bmatrix}
$$


Which is an rotation matrix, with imaginary eigenvalues, and this means that, it's a center. 

However, when we actually plot this, this is an unstable node in the center, everything will move away from the origin, so the stability analysis failed. 

---
#### Polar Coordinates (Change the representation of the system)
Let's assume that the form of the solution takes this: 
$$
x(t) = r(t)\cos(\theta(t)) \quad y(t) = r(t)\sin(\theta(t))
$$

So then we can have: 

$$
x^2 + y^2 = r^2 \quad \forall t
$$
Differentiating both side of the equation, we will have: 

$$
2xx' + 2yy' = 2rr' \implies x(-y + ax(x^2 + y^2)) + y(x + ay(x^2 + y^2)) = rr'
$$

So then we have the system: 

$$
-xy + ax^2r^2 + xy + ay^2r^2 = rr'
$$

$$
ar^2(x^2 + y^2) = rr'
$$

$$
ar^3 = r'
$$

$$
r' = ar^3
$$

Notice that, the equation $r' = ar^3$ is a 1D system. When: 
1. $a \ge 0$, one unstable fixed point when $r = 0$. (Spiral Outwards)
2. $a = 0$, $r$ is just a constant, it's Neutrally stable. (Circling)
3. $a \le 0$, $r$ is going to be decreasing, and $r = 0$ will be a stable point. (Spiral Inwards)

So that is how the radius will be changing, now for the angle, we have: 

$$
y/x = \tan(\theta(t))
$$

(...) The Analytical solution for the angle is not important for the analysis of the stability for this particular example, we only need the radius, which tells us how far we are from the origin. 

**Notice**: 
The linear stability analysis yields the results that, it's going to be Neutrally stable, regardless of what $a$ is. 

**Moral of the story**: 
If the Linear Stability Analysis said that the point is a center, and it's neutrally stable, then it fails. It's actually an undetermined case.

**Intuitive Understanding (Equality is Structurally Unstable)**: 

During the Taylor Expansion of the function, we are missing $\mathcal{O}(\epsilon^2)$. 

When we use String Inequality, $<, >$, these are safe. However, under the equality, (Neutrally Stable), we cannot trust the analysis. 

For Analogy, in 1D, under the case of Semi-stable case, small changes can result in either zero, or 2 fixed points configurations. 

When we use equality, we are not sure it's going to be exactly equation because of the Taylor Approximations. 

Equality Analogy: Neutrally Stable Fixed points of the system. Ok, what does this mean exactly? 

$$\lambda = -b/(2a) + \frac{\sqrt{b^2 - 4ac}}{2a}$$

And the equality is that we are trusting that: $b^2 - 4ac = 0$, the real part of the lambda is going to be exactly zero. However, please notice that, there could be some compensation coming from the quadratic terms of the function.

**Question**: Should we trust the Saddle Point? 
Yes we can, the prof stated it, and an explanation will come later. 

**Conclusion**:

If LSA, concludes that a F.P is a star or a degenerate node, the **we can trust the stability conclusion**, but not the **classification** (The type of the fixed point might not be what the linear Analysis is telling us, because of the structural instability of the equal sign.).

If LSA concludes that the fixed point is classified as a **Center**, then the **stability analysis** is not going to be trusted. 

### Definition: 

> Fixed points that don't have any eigenvalues on the imaginary axis, they are called **Hyperbolic Fixed Points**


---
### Corollary (When Linear Stability Analysis Fails): 

Hyperbolic Fixed Points: "No eigenvalue on imaginary axis"

Equality is dangerous, because it lives no room for perturbations. 

LSA correctly predicts the stability of **Hyperbolic Fixed Points**, simply put: 

LSA concludes $\Re(\lambda) = 0$ --> LSA stability conclusion can be trusted. 

LSA classifies Fixed point to be: Degenerate, Star --> Stability of the Non-linear system can be trusted, but the fixed point is not actually a Degenerate or Star. (Degenerate and Star are subset of **Hyperbolic Fixed Point**)

How is are the eigenvalues perturbed by the second order approximation of the system? 

* If eigenvalues are non-imaginary, then they travels around the real axis. 
* If the eigenvalues are imaginary, then their angles got rotated a bit. 

Therefore, we can start by considering when eigenvalues are stuck **right around the boundary** so that, a tiny perturbations will make then cross the boundary. 

When will perturbations change the configurations of the fixed points (Different config gives different classifications)

1. $\lambda_1 = 0 \vee \lambda_2 = 0$, line of FP. 
   1. $\lambda_1 < \lambda_2 = 0$, stability not trusted, classification not trusted. 
   2. $0 = \lambda_1 < \lambda_2$, stability trusted, classification not trusted.
2. $\Re(\lambda_1) = 0$
   1. Stability not trusted. 
   2. Classifications not trusted. (Spirals or centers)
3. $\lambda_1 = \lambda_2$
   1. classification not trusted. Stability trusted. 
4. There is only one $\lambda$
   1. Stability trusted. Classifications not trusted. 


```python
if Re(Eigen) is 0: 
    Linear Stability Analysis: Failed
    Classification: Failed
	FP: Center
elif Im(Eigen) is 0: 
    if FixedPoint is Star or FixedPoint is Degenerate:  
        Stability Analysis: Success 
        Classification: Failed
    else: 
        Stability Analysis: Success
        Classification: Success
else: # Both Im(Eigen) and Re(Eigen) is not zero
    Stability Analysis: Success
    Classification: Success
```

---
### Extra Comments: 

Unstable Attractive fixed exists in 2D system, and there will be a Homoclinic orbit for the system.

Attractive: There are orbits coming to the fixed point. 
Unstable: There are orbits coming out of the fixed point. 

