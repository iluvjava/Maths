[Limit Cycles](Limit%20Cycles.md)
There is another way to eliminate the existence of Limit Cycles for some domain of the function. 

This is what Bendixson's Dulac Theorem is for. 

However, even with gradient system, and this theorem, we are still using special cases to eliminate limit cycles. 

And, we can also prove the existence of the limit cycles for some region for some special cases. 

---
### Intro

If bendixson's Theorem applied to a region without holes in the domain, then there cannot be any limit cycles in that region. 

Notice that, of Multiple regions are applicable, it doesn't implies that the union of these regions that Bendixson's theorem can still be applied. 

---
### Theorem Statement: Bendixson-Dulac Theorem

Let out system to be represented by function: 

$$
F = \begin{bmatrix}
f(x, y) \\ g(x, y)
\end{bmatrix}
$$

> Let $D\in \mathbb{R}^2$ be a region without holes, If the conditions that $|\nabla \cdot F(v)| > 0$ applies for $D$, then there is no closed trajectories in $D$. 

#### Theorem Proof: With Contradiction

Let's assume that $|\nabla\cdot F| > 0$ and there is a closed loop in the system. 

Consider the chain rule as a differential equation involving functions describing the system: 

$$
\frac{dy}{dx} = \frac{dy}{dx}\frac{dt}{dx} = \frac{g(x, y)}{f(x, y)} \implies 
f(x,y)dy = g(x, y)dx
$$

And notice that, this can be written as: 

$$
\int f(x, y)  dy = \int g(x, y) dx \implies \oint f(x, y)dy - g(x, y)dx 
\underset{(1)}{=} 0
$$

(1): By the contradictory assumption that the loop is closed loop, **and** and it's solution to the differential system. The closed loop integral over field is zero, this is true because it must follows back to the original point. 

However, please also observe that using Green's Theorem, the integral is like: 
$$
\oint f(x, y)dy -g(x, y)dx = \iint_D \partial_x f(x, y) + \partial_y g(x, y) dxdy \not = 0
$$

Notice that this is not equal to zero because of the hypothesis that: $|\nabla F(x)| > 0$. 

---
#### Extended Theorem

The theorem is still applicable if $G\cdot F$ is used instead, where $G$ is a 2D function that is continuously differentiable. 

---

#### Caveats and Gotcha

* If Bendixson's Theorem is applicable to several regions in $R^2$, it doesn't not imply that it can be applicable to any combinations of these regions, it has to be check again before concluding. 
* The region cannot have holes, please remember that. 
* In addition to eliminating the limit cycles in the region, it also eliminates center. 

---
### Theorem Statement: Poincare-Bendixson's Theorem

Let the system be: 

$$
\begin{cases}
x' = f(x,y) \\ y' = g(x, y)
\end{cases}
$$

Where $f(x,y), g(x,y)$ are both continuously differentiable functions. 

**Hypothesis**: let's assume a region $D$ that is: 
1. Closed and Bounded. (If fact, close implies bounded)
2. There isn't any fixed point in D
3. There exists a trajectory such that, it's confined within the set $D$. 

**Then**:
There exists a limit cycles in the region. 

#### Intuition
Given any curves that is in the region, and it's not escaping it. 
1. By the fact it's closed, it means that it can't just approach the boundary of the set indefinitely. 
2. By the fact that there is no fixed point in the region, it curve must travel in the closed region unstopped. 
3. By the fact that the set is bounded, and the system for the function is continuously differentiable it has to be the case that, the curve is filling up the space $D$. 
4. These are all the conditions for $D$ and the curve, notice how, we either have a space filling curve, or we must have curve loop back to itself at some points. 

#### How to use it? 

We will make a trapping region to trap the solution curves of the system. 

1