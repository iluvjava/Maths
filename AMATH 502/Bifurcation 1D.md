Prereq: [[1D Stability]]

Different types of 1D bifurcation and their characteristics. 

---
### Bifurcation Types
1. S.N.B
2. Transcritical
3. Supercritical Pitchfork 
4. Subcritical Pitchfork

---
**Characteristic Time**: 
Sometimes this concept shows up in research, and it's a quantity that tells us how much decay, or escape is happening around a fixed point of a function: 

$$
\epsilon (t) = \epsilon(0) \exp(f'(x^*)t)
$$
And the escape time is given by: 
$$
\tau = \frac{1}{|f'(x^*)|}
$$
If it's unstable, then it will tells us how long it's going to take the function deviate from the fixed point. 

---
### Bifurcation
We are interested in how the stability of a system changes as one of the parameters for the system changes.

---
#### Saddle Node Bifurcation (S.N.B)
The name makes more sense in the context of the multi-variable system, and in this case, it happens when **2 fixed points collided** with each other as the parameter changes. 

Consider $y' = r + x^2$, and there will be 3 cases: 
* $r < 0$, there are 2 fixed points. 
* $r = 0$, there are one semi-stable fixed point. 
* $r > 0$, there are no fixed point. 

And the bifurcation plot of the graph is $f(x) = \pm \sqrt{r}$. 

#### Characteristic Categorization
For a saddle **node bifurcation**, the following conditions are necessary: 
$$
f(x_c, r_c) = 0 \wedge \frac{df}{dx}(x_c, r_c) = 0
$$
Where $(x_c, r_c)$ denotes the point of bifurcation and $r_c$ denotes the bifurcation parameter. 

Local behavior of the function and **Normal Form of SND (Saddle Node bifurcation)**

The Taylor Series is gonna be like: 
$$
f(x_c, r_c) + (x - x_c)\frac{\partial f(x_c, r_c)}{\partial x}
+ (r - r_c)\frac{\partial f(x_c, r_c)}{\partial r} + \frac{1}{2}
(x - x)(r - r_c)\frac{\partial^2 f}{\partial x\partial r}
+ \frac{1}{2}(x - x_c)^2\frac{\partial^2 f(x_c, r_c)}{\partial^2 x}
+
\frac{1}{2}(r - r_c)^2\frac{\partial^2 f(x_c, r_c)}{\partial^2 r} + \mathcal{O}(x^3r^3)
$$

Now, suppose that, we already know what the bifurcation point (Has  to be Saddle Node!) $(x_c, r_c)$ is gonna be, then we substitute and will get: 
$$
(r - r_c)\frac{\partial f(x_c, r_c)}{\partial r} + \frac{1}{2}
(x - x)(r - r_c)\frac{\partial^2 f}{\partial x\partial r}
+ \frac{1}{2}(x - x_c)^2\frac{\partial^2 f(x_c, r_c)}{\partial^2 x}
+
\frac{1}{2}(r - r_c)^2\frac{\partial^2 f(x_c, r_c)}{\partial^2 r} + \mathcal{O}(x^3r^3)
$$

And these 4 terms are going to determine that, it's a S.N.B point. 

### Saddle Node Example!!!
Here, let's take a look at the nontrivial example: 
$$
x' = r - x - \exp(-x)
$$
All the fixed point is the solution for the algebraic equation: 
$$
r - x = \exp(-x)
$$
Where $r - x$ is a line and $\exp(-x)$ is s curve. plotted with $x$ as the $x$ axis and $y$ being the $\exp(-x)$. 

**Observe with an example:**
There are only 2 points that the curve and line is crossing each other, therefore, if there is any kind of bifurcation, it's going to be a S.N.B, with this assumption, we an proceed and say that, since it's 2 node colliding with each other and merged into a **semi-stable** node, we will know that: $f'(x_c) =0$. 

Take not that $f'(x) = -1 + \exp(-x) = 0$. and the solution to the system will be:$x = 0$

Substituting $f(0)$, using fixed the fact that the bifurcation point is a semi-stable fixed point, we have: $r - \exp(-0) = 0\implies r = 1$

Therefore, for this system: $(x_c, r_c)$ is $(0, 1)$

**Locality and Normal Form of S.N.B**

The derived local behavior based on $f(x) = r - x - \exp(-x)$ and the point $x = 0, r = 1$ gives: 
* $\frac{\partial f}{\partial r} = 1$
* $\frac{\partial^2 f}{\partial x^2} = \frac{\partial f}{\partial x}(-1 + \exp(-x)) = -\exp(-x)$
* $\frac{\partial^2 f}{\partial r} = 0$
* $\frac{\partial^2 f}{\partial r^2} = 0$
* $\frac{\partial^2 f}{\partial x\partial r} = \frac{\partial }{\partial r} (-1 - \exp(-x)) = 0$

And hence the local behavior of the function is quadratic and it's looking like: 
$$
x' \approx (r - 1) - \frac{x^2}{2}
$$

And observe this fact, and we are going to make the hypothesis: 
* The function is quadratic wrt to the variable $x$, and it's linear wrt to the variable $r$ at the bifurcation point. 
**Hypothesis**: 
This is true at the point of bifurcation for all system that has a **semi-stable point** bifurcation point. 

---
### Transcritical Bifurcation 
One of the instance of a system that has T.B is : 
> $$
> x' = rx - x^2
> $$
And this is the **normal form** of the Bifurcation too. 

One of the thing to observe is that, the transcritical bifurcation experience: **Exchange of stability.** 

Consider the following cases for the parameters r: 
1. $r > 0$  
$x = 0$ is  an unstable fixed point and $x = r$ is a stable fixed point. 
3. $r = 0$
$x = 0$ is a semi-stable (unstable) fixed point. 
5. $r < 0$
$x = r$ is an unstable fixed point and $x = 0$ is a stable fixed point. 

**Observe**:
The fixed point $x = 0$ has goes from unstable to stable, after the bifurcation. This is feature of Transcritical Bifurcation. 


---
### Pitchfork Bifurcation
As its name suggested, this is happening when there are 3 fixed points involved. 

One of the canonical system that experience the Supercritical Pitchfork bifurcation is: 
> $$x' = x(r - x^2)$$

Observe the following: 
1. $r > 0$, there is one stable fixed point $x = 0$
2. $r = 0$, There is still one stable fixed point $x= 0$
3. $r < 0$, There are unstable fixed point $x = 0$, and  there are 2 stable fixed point: $\pm \sqrt{r}$

Take notice that, this describes the process when, one of the stable/unstable fixed point split into 2 unstable/stable fixed point. 

When 2 of the split fixed points are stable, it's called a: **Supercritical 
Pitchfork**
When 2 of the split fixed points are unstable, it's called a: **Subcritical Pitchfork**

---
#### Insights
It matches the normal form of bifurcation because it near the place where it happens, it's a parabolic curve sliding throw the line, and that is why the local approximation of the $f(r, x)$ function will yield the same format for the same type of bifurcation. 

---
### Bifurcation Normal Form
This is the idea where we introducing a way of classifying different type of bifurcations. 
#### Saddle Node
> $$x' = \pm r \mp x^2$$
The parabola goes up and up and them slide out x-axis as bifurcation happens.

#### Transcritical Bifurcation 
> $$x' = \pm rx \mp x^2$$

#### Pitchfork Bifurcation
1. Supercritical 
> $$x' = \pm xr \pm x^3$$
3. Subcritical
> $$x' = \pm rx \mp x^3$$

#### Extra Comments
Take note that, All of these type of 1D bifurcation has the feature that: 
$$
f_x(r_c, x_c) = 0
$$
The value when the bifurcation happens is when the function is having a critical point for the variable $x$. 

Things can be complicated, for example the system: 
$$
x' = r + rx - x^2
$$
looks like a transcritical and a Saddle Node, however it's actually a saddle node, if we analyze it's local behavior. 

This is the case, because the number of roots of the expression $r + rx - x^2$ wrt to $x$ can underwent all 3 cases as the value of $r$ changes, and this can only triggers Saddle Node bifurcation, at different values for $r$. 

But the general strategies here is the same: 
1. Search for the critical bifurcation point. 
2. Analyze the local behavior of the points. 

---



