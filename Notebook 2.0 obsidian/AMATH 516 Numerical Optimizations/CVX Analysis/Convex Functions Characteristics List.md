[[Convex Sets Intro]],
[[Characterizing Functions for Optimizations]],
[[../Non-Smooth Calculus/Subgradient Definition]]

---
### **Intro**

There are too many, this single file is just going to be a link to various other files. And we will list some of the basics here, and then we will introduce some properties of the convex functions that are more theoretical.

**Equivalence Characterizations of Convex Functions**
Suppose that $f$ is a convex function, and we use the definition that $f$ is convex when $\text{epi}(f)$ is a convex set. 
* $\forall \lambda \in [0, 1]: f(\alpha x + (1 - \alpha)y) \le \alpha f(x) - (1 - \alpha)f(y)$. The under cutting properties. 
* $\exists v: f(y) - f(x) \ge \langle v, y - x\rangle$. The subgradient hyperplane inequality. 

In addition, the sub-gradient/gradient of convex functions can also be used to characterize convexity. 
* $\langle \partial f[y] - \partial f[y], y - x \rangle\ge 0$ iff $f$ is convex. The monotonicity property. 
* Assuming $f$ is C2 smooth and convex, then $H$, the hessian exists where $H\succeq \mathbf 0$, or equivalently $H$ is positive semi-definite. 

**Remarks**

There are finer, more complicated extension of convexity for functions, some of them are: 
* Strong convexity.
* Strict convexity.
* Weak convexity.
* Quasi Convexity.
* Psuedo Convexity 
* Invexity

Each of these topics deserves it's own files. 


---
### **Lower Semi-Continuous Convex function is Closed**

> A convex function $f$ is closed if an only if it's lower semi-continuous. 

**Proof**: 

The directions where, if a function is lower semi-continuous and it's convex, then its epigraph is closed. This is direct and proved in [[Lower Semi-Continuity is Closedness of Epigraph]]. The other direction is also obvious because if a function is closed, regardless of it being convex or not, it's l.s.c. 



---
### **Continuity of Closed Convex Functions**

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$ be convex. Let $x_0 \in \text{int}(\text{dom}(f))$, then there exists $\epsilon > 0$, and $L > 0$ such that $\mathbb B_{x_0}$ such that: 
> 
>  $$
>	|f(x) - f(x_0)| \le L \Vert x - x_0\Vert
> $$
> 
> Where the function is locally Lipschitz. 

**Source**: Theorem 2.21 from \<First Order Method in Optimizations\>, It's also one of the main results in Dimitry's notes, chapter 3 for his AMATH 516. 


**Remarks**: 

The definition of Lipchitz is in [[Lipschitz Continuity]], and the proof and detailed discussion will be in here: [[Convex Function is Locally Lipschitz]]. 

---
### **Proper Convex Functions are Lipschitz Continuous**

For more details about it see [[Convex Function is Locally Lipschitz]] for more expositions. 

---
### **Convex Functions with Gradients**

For all convex function, some of them will have gradient. The gradient might not be Lipschitz, because there exists convex function whose gradient is Uniform Continuous but not Lipschitz Continuous. For the smooth case, please refer to [[Gradient, Hessian Characterization of Convexity]], where we present most of the important properties for convex function that has gradient to them. 

