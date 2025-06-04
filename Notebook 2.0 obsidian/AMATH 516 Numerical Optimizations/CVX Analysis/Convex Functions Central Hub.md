- [Convex Sets Intro](../Background/Convex%20Sets%20Intro.md),
- [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md),
- [Subgradient Intro](../Non-Smooth%20Calculus/Subgradient%20Intro.md)

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

There are finer, more complicated extension of convexity for functions, some of the terms to google with are: 
* Strong convexity.
* Strict convexity.
* Weak convexity.
* Quasi Convexity.
* Pseudo Convexity, strictly stronger than Quasi convexity. 
* Invexity

Each of these topics deserves its own files. 


---
### **Continuity of Closed Convex Functions**

Convex function is almost, continuous everywhere in their domain. 

**Thm-1 | Local Lipschitz of Convex Function**
> Let $f: \mathbb E \mapsto \mathbb{\bar R}$ be convex. Let $x_0 \in \text{int}(\text{dom}(f))$, then there exists $\epsilon > 0$, and $L > 0$ such that $\mathbb B_{x_0}$ such that: 
> 
>  $$
>	|f(x) - f(x_0)| \le L \Vert x - x_0\Vert
> $$
> 
> the function is locally Lipschitz. 

**Source**: 

Theorem 2.21 from \<First Order Method in Optimizations\>, It's also one of the main results in Dimitri's notes, chapter 3 for his AMATH 516. 

**Remarks**: 

The definition of Lipchitz is in [Local, Global Lipschitz Continuity](AMATH%20516%20Numerical%20Optimizations/Background/Local,%20Global%20Lipschitz%20Continuity.md), and the proof and some detailed discussion will be in here: [Convex Function is Locally Lipschitz](../Non-Smooth%20Calculus/Convex%20Function%20is%20Locally%20Lipschitz%20). Convex Functions are continuous on its domain, but only along a line segment. 
Which is proved by [this](Convex%20Line%20Segment%20Continuity%20) file. 

---
### **Characterization for Differentiable Convex Functions**

For all convex function, some of them will have gradient. The gradient might not be Lipschitz, because there exists convex function whose gradient is Uniform Continuous but not Lipschitz Continuous. 

- For the smooth case, please refer to [Gradient, Hessian Characterization of Convex Functions](Gradient,%20Hessian%20Characterization%20of%20Convex%20Functions.md). 
- For epigraphical characterizations of convex functions and how their convexity is preserved constructively, visit: [Convexity Preserving Operations for Functions](../CVX%20Geometry/Convexity%20Preserving%20Operations%20for%20Functions%20). 

---
### **Minimizers of a Convex Function**

The property of convex function will not ensure the existence of a minimizer. Consider the example of $\exp(x)$, it has a minimum and it's convex but it doesn't have minimizers. We need conditions that is stronger to ensures the existence of a minimizers. 

**Thm-2 | Minimizers for l.s.c Convex Functions Over a Compact Subset**
> Let $f$ be closed convex and proper, let $Q\subset X$ be a compact set in the space of where the function is defined such that $x\cap \text{dom}(f) \neq \emptyset$, then the set of minimizers, denoted as $S = \arg\min_{x\in Q}f(x)$ for the function is non-empty, and it's a convex set. 

**Proof**:

Since $x\cap \text{dom}(f) \neq \emptyset$, we have $\mu = \inf_{x\in Q}f(x) < \infty$. By property of the infimum, we have a sequence $\{x_n\}_{n\in \N}$ in $Q$ such that $\lim_{n\rightarrow \infty}f(x_n) = \mu$. Since the set is now compact, and the function is closed, we can invoke the lemma in [Key Existence Theorem](../Background/Existence%20of%20a%20Minimizer%20), which means that there exist a minimizer $\bar x\in Q$ such that $f(\bar x) = \mu$. The set is a convex set because the level set $\text{lev}_{\mu}(f)$ is a convex set by the fact that $f$ is convex, the set is also closed by closure of $f$. Therefore, the set of minimizer has to be a convex set as well. 

**Remarks**: 

When a function closed and convex and is strictly convex, it will have a unique minimizer. We skip the proof, this is true just take it for granted for now. 

**Strong Convexity**

This is a very useful concept and it has its own file, see [here](../Properties%20of%20Functions/Strong%20Convexity.md), and some old notes from about the foundations of the 

