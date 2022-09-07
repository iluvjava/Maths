[2D Non-Linear System](2D%20Non-Linear%20System.md)

This is an example of a 2D non-linear system. 

We are going to use this example to introduce a lot of ideas. Via this example, we are going to learn about the following concepts: 
1. Fixed Points for non-linear system. 
2. Basin of Attraction 
3. Basin of Separatrix

---


### Intro
Consider a particular example of 2 species competing for a common resources: 

$$
x(3 - x - 2y) \quad y (2 - y - x)
$$

Where $x$ is the population of Sheep, and $y$ is the population of Rabbit. 

The system has fixed point: $(0, 0), (0, 2), (3, 0), (1,1)$. These fixed points all representing different long term outcome of the system. 

The Jacobian is like: 

$$
J(x, y) =
\begin{bmatrix}
 3 - 2x - 2y &  - 2x \\ - y  & 2 - 2y -x
\end{bmatrix}
$$

Now we investigate the LSA results. Fortunately, all of these results are NOT Hyperbolic Fixed Points, so then we can trust their stability, and classifications.

### Classifying the Fixed Points

Solving the non-linear system gives us the following fixed points:
$(0, 0), (0, 2), (3, 0), (1,1)$ , and we are going to put them into the Jacobian matrix and see what we could have: 

With $(0, 0)$
$$
\begin{bmatrix}
 3 & 0 \\ 0 & 2
\end{bmatrix}
$$ 
This is unstable node, it's a star, everything leaves it as time goes forward. 

With (0, 2)
$$
\begin{bmatrix}
 -1 & 0 \\ -2 & -2
\end{bmatrix}
$$

Which is giving us positive real eigenvalues, implies that this is an unstable node. 

With (3, 0)
$$
\begin{bmatrix}
-3 & -6 \\ 0 & -1
\end{bmatrix}
$$
And this one has only negative eigenvalues, giving us a stable fixed point.

With (1, 1)
$$
\begin{bmatrix}
    -1 & -2 \\ -1 & -1
\end{bmatrix}
$$
And this solves for complex eigenvalues are: $-1 \pm \sqrt{2}$, and this means that we have a saddle node here. 

![lotka-volterra-fixedpoints](../Assets%20By%20Hands/lotka-volterra-fixedpoints.png)


And observe the following from the graph. 

1. The stable manifold doesn't have to be a straight point, it really depends. 
2. The unstable manifold is coming from the unstable node (0,0), this is the case by considering backward simulations on the stable manifold, then all stability reverses and we can conclude that it must has travelled from the unstable node. 
3. The unstable manifold got attracted to the nearest attractor, this is the case by the definition of the attractors. (There is no other ways to go for the simulations)

**Notice**
One of the important assumption here is the Lipschitz Continuity of the function, and this means that u**niqueness theorem works** here, which will mean that, the Unstable Manifold painted above actually will **cut the plane, because no solution can cross that curve.** 


**Observe**: if we assume that continuity of the non linear function, then I believe there is some analogy we can use for reasoning with the configurations of the fixed points of the system. 



---
### Basin of Attraction: 

$$
\mathcal{S} = \left\lbrace 
x_0: \lim_{t\rightarrow \infty} x(t) \text{ with: }x_0 = x^*_i
\right\rbrace
$$

This is saying that, if I started with an initial conditions with a point side the **Basin of Attraction of one of the fixed points $x^*_i$**, then all the points in the set are going to get to that fixed point. 

---
### Basine of Separatirx

A curve that cut the plan in to separate region such that each region has different behavior (They converges to different fixed points of the system.), then that curve is called: **Separatrix**. 

