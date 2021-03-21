This is one of the famous equation that we are going to study with in this class. 

[[Fractal]], [[The Cantor Set]], [[Box Counting Dimension]]

---
### **Intro**

This is what all the fractal discussions are leading to, the very first idea of chaos is coming from the study of the Lorenz equation. 

This is the lorenz equation: 

$$
f(x):= 
\begin{cases}
x' = \sigma(y - x) \\ y' = rx - y - xz \\ z' = xy - bz    
\end{cases}
$$

Where $\sigma, r, b > 0$. 

This is a non-linear equation, and this is complex enough to get chaos. 

**History**: 

Lorenz was trying to solve this equation. And then, he tweaked the initial conditions by rounding, when doing the computations on a different computer. This is SDIC. 

We are not going to do much analysis. The matlab script will be on canvas. 


---
### **The Fact**

The wings of the Lorenz attractor only lies in a 2D plane. Which is looking like a fractal.

We are going to analyze the Lorenz Attractor. 

It's an **attractor because**, all initial conditions will get into the **lorenz attractor**, and once it enters it, it will always be on the attractive set. 

Lorenz attractor is not a fixed point or a limit cycle, it's a set, and it's also a fractal, and on the attractor, we have chaos dynamics. 


---
### **The Math: Volume Contraction** !!!

This is expected for the final exam. The Lorenz Equation is **dissipative**, meaning that for a given volume of initial conditions, the volume of it will contract indefinitely. 

$$
x' = f(x)
$$

Assume initial conditions as a blob and it has some volumn and surface area. Define the blob to be $V(0)$, with surface area $S(0)$. 

Consider: $S(t + dt), V(t + dt)$. 

$x'$ is going to tell use how the points are going to change. We are interested in, how the volumn ar changing in the normal direction on the surface. 

$$
f\cdot \widehat{n} dt
$$

Where $f\cdot \widehat{n}$ is the velocity, and $dt$ is some small change in time. 

The area of all the little box perpendicular to the surface will be: 

$$
(f \cdot \widehat{n})dt dA
$$

Then: 

$$
v(t + dt) - V(t) = \int_{S}^{} (f\cdot \widehat{n})dt dA
$$

$$
\frac{v(t + dt) - V(t)}{dt} = \int_{S}^{} (f\cdot \widehat{n})dA
$$

$$
V'(t) = \int_{S}^{} (f\cdot \widehat{n})dA = \int_{V}^{} (\nabla \cdot f)dV \tag{1}
$$

And this basically tells us how the volumn will evolve over time under this particular dynamics. 

For the Lorenz Equation, the divergence of the field is given as: 

$$
\nabla\cdot f(x) = -(\sigma + 1 + b) < 0
$$

Notice that, if I were to consider the change of the volumne wrt to time, from expression, then we will be facing with the integral: 

$$
\int_{V}^{} (-(\sigma + 1 + b)) dV  \le 0
$$

The volumn of any blob of initial conditions are decreasing. This reflects the fact that, for the Lorenz equation, any initial conditions that lie within a volumn is going to get smaller and smaller (Collapsing to the Lorenz attractor). 


