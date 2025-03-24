---
alias: Variational Directional Derivatives, Dini Hadamard Subderivatives

---
- [Subgradient Intro](Subgradient%20Intro.md), [Fechet Regular Subgradient](Fechet%20Regular%20Subgradient.md)
- [Epigraph, Level Sets](Epigraph,%20Level%20Sets.md), 
- [Support Function](Support%20Function.md), 

---
### **Intro**

Subderivative is a number, not a vector. It tells how the function changes given a specific direction and a point in the domain of the function. The idea of a subderivatives is complicated. Here, we present an overview from Dmitry, but still list the sources for its variants, generalizations for a complete treatment of the topic. 

* Dimitry's AMATH 516 Course Notes. 
  * Section 3.5.2, page 68. 
* \<Variational Analysis by Rockafellar\>
  * 8.A, Page: 299. 
* \<Modern Nonconvex Nondifferentiable Optimizations\> by Ying Cui
  * This book has a very detailed classifications of different types of subderivatives. 
  * 4.1, page 150. 
* \<First Order Methods in Optimizations\>
  * Section 3.3 starts talking about directional derivatives. pg: 44
* Professor Wang's Lectures at UBCO. 


---
### **Dini-Hadamard Variational Subderivative**

Dini-Hadmard variational sub-derivative tells us how a function behaves near a given ray. 
We denote $\mathbb B = \{x : \Vert x\Vert < 1\}$. 

#### **Def-1 | Dini-Hadamard Variational Subderivative**
> Consider any augmented real function $f$ at a point $x$ where $f(x)$ is finite, the direction derivative in the direction of $u$ is given as: 
> $$
> \begin{aligned}
>   df(x)(u) = \liminf_{\substack{\tau \searrow 0 \\ v\rightarrow u}}
>     \frac{f(x + \tau v) - f(x)}{\tau}
> \end{aligned}
> $$
 

**Obesrvations**

The limit is saying: 

$$
\begin{aligned}
	df(x)(u) := 
	\lim_{\substack{\tau \searrow 0 \\ \epsilon \searrow 0}}
	\inf_{w}
	\left\lbrace
		\left. \frac{f(x + \tau w) - f(x)}{\tau} \right|
		0 < \Vert w - u\Vert \le \epsilon
	\right\rbrace
\end{aligned}
$$

**Remarks**:

Immediately Observe the Equivalence to the tangent cone definitions [Tangent Cone](../Background/Tangent%20Cone.md) on the epigraph of the function: 

$$
\begin{aligned}
	\text{epi}(f'(x|\cdot)) = N_{\text{epi}(f)}((x ,f(x)))
\end{aligned}
$$


#### **Def-2 | Classic Directional Derivative Locally Lipschitz Functions**
> Consider any $f$ that is an augmented real function and it's Lipschitz continuous around the point $x$, then the directional derivative in the direction of $u$ is: 
> $$
> \begin{aligned}
>      f'(x, u) = \liminf_{\tau \searrow 0}\frac{f(x + \tau u) - f(x)}{\tau}
> \end{aligned}
> $$

We skip the proof. 
Function that is locally Lipschitz is true for all close, convex, l.s.c function at the $\text{ri}.\text{dom}(f)$. 
Hence, under this case, we have the subderivative equals to above. 
The classical directional derivative simplifies further to just $\lim$ when the function is convex. 
See [Convex Directional Derivatives](Convex%20Directional%20Derivatives.md) for more information. 

**Remarks**

The Dini-Hadamard definition of directional derivative is suitable for all kinds of real-valued functions.
Prof Dimitri pointed out that, the Dini-Hadamard definition of subderivative is more generalized. 
Observe that replacing $\liminf$ with $\lim$, then **this becomes directional Gâteaux Derivative**. 
Allow $\eta\rightarrow 0$ from both direction will yield Gâteaux derivative definition. 

Under the condition that $f$ is *Lipchitz Continuous* on a neighborhood of points (A characterization of convex functions as well), the above definition is equivalent to the usual calculus definition of a directional derivative introduced to second year undergraduate students. 

---
### **Recovering Fenchet Differentiability**

The definition of Dini-Hadmard variational subderivatives breaks the definition of other type of variational derivatives down to small components. 
To illustrate, we consider the following claims that proposed an equivalent characterization of the Fenchet Differentiability. 

#### **Claim | Sufficient for Fenchet Differentiability**
> Suppose $f:\R^n \rightarrow \R$ is continuous. 
> Then it is differentiable if and only if $\exists v \in \R^n$ such that: 
> $$
> \begin{aligned}
> 	\left(
> 		w \mapsto \lim_{w' \rightarrow w}\frac{f(\bar x + \tau w') - f(\bar x)}{\tau}
> 	\right)\underset{\substack{\tau \searrow 0 \\ \text{uniformly}}}{\longrightarrow}
> 	\left(
> 		w \mapsto \langle v, w\rangle
> 	\right)
> \end{aligned}
> $$
> on the compact set $\mathbb B(\mathbf 0)$. 

**Proof**

By the definition of uniform convergence it means: 

$$
\begin{aligned}
	0 &= 
	\lim_{\tau \searrow 0}
	\sup_{w \in \mathbb B(\mathbf 0)}
	\left|
		\left(
			\lim_{w' \rightarrow w}\frac{f(\bar x + \tau w') - f(\bar x)}{\tau}
		\right)
		- \langle v, w\rangle
	\right| 
	\\
	&= 
	\lim_{\tau \searrow 0}
	\sup_{w \in \mathbb B(\mathbf 0)}
	\left|
		\lim_{w' \rightarrow w}
		\frac{
			f(\bar x + \tau w') - f(\bar x) - \langle v, \tau w\rangle
		}{\tau}
	\right| 
	\\
	&=
	\lim_{\tau \searrow 0}
	\sup_{w \in \mathbb B(\mathbf 0)}
	\left|
		\frac{
			f(\bar x + \tau w) - f(\bar x) - \langle v, \tau w\rangle
		}{\tau}
	\right| 
	& \text{Continuity}
	\\
	&= 
	\lim_{\tau \searrow 0}
	\sup_{x}
	\left\lbrace
		\left|
			\frac{
				f(x) - f(\bar x) - \langle v, x - \bar x\rangle
			}{\tau}
		\right|: 
		\Vert x - \bar x\Vert \le \tau
	\right\rbrace  
	\quad  
	& x = \bar x + \tau w
	\\
	&\ge
	\lim_{\tau \searrow 0}
	\sup_{x}
	\left\lbrace
		\left|
			\frac{
				f(x) - f(\bar x) - \langle v, x - \bar x\rangle
			}{\tau}
		\right|: 
		\Vert x - \bar x\Vert = \tau
	\right\rbrace 
	\\
	&=
	\lim_{\tau \searrow 0}
	\sup_{x}
	\left\lbrace
		\left|
			\frac{
				f(x) - f(\bar x) - \langle v, x - \bar x\rangle
			}{\Vert x - \bar x\Vert}
		\right|: 
		\Vert x - \bar x\Vert = \tau
	\right\rbrace
	\\
	&= \limsup_{x \rightarrow \bar x}
	\left|
		\frac{
			f(x) - f(\bar x) - \langle v, x - \bar x\rangle
		}{\Vert x - \bar x\Vert}
	\right|
	\\
	&\ge \lim_{x \rightarrow \bar x}
	\left | 
		\frac{
			f(x) - f(\bar x) - \langle v, x - \bar x\rangle
		}{\Vert x - \bar x\Vert}
	\right| \ge 0. 
\end{aligned}
$$

$\square$

---
### **Local Lipschitz Continuity**

Lipschitz continuous function simplifies the definition of the Dini-Hadamard subderivatives. 
It simplifies, so it only has one limit occurring, and it's sufficient to discover the derivative based on only the behaviors of the function along the direction of the ray. 

#### **Thm | Dini-Hadamard under Locally Lipschitz Conditions**
> The Dini Hamdamard Subderivative if exists, would be equivalent to 
> $$
>   df(\bar x)(w) = \lim_{\lambda \searrow 0} \frac{f(\bar x + \lambda w) - f(\bar x)}{\lambda}, 
> $$
> if $f$ is locally Lipschitz at $\bar x$. 

**Proof**

Let $f$ be locally Lipschitz at $\bar x$. 
Consider the definition of the directional derivative then 

$$
\begin{aligned}
    \liminf_{\substack{\lambda\searrow 0\\ w'\rightarrow w}} 
    \frac{f(\bar x + \lambda w') - f(\bar x)}{\lambda}
	&= 
	\liminf_{\substack{\lambda\searrow 0\\ w'\rightarrow w}} 
	\frac{f(\bar x + \lambda w') -f(\bar x + \lambda w)}{\lambda}
	+ 
	\frac{f(x + \lambda w) - f(\bar x)}{\lambda}
	\\
	& =
	\liminf_{\substack{\lambda\searrow 0\\ w'\rightarrow w}}
	\frac{f(\bar x + \lambda w') -f(\bar x + \lambda w)}{\lambda}
	+ 
	\liminf_{\substack{\lambda\searrow 0\\ w'\rightarrow w}}
	\frac{f(x + \lambda w) - f(\bar x)}{\lambda}
	\\
	&= 0 + 
	\liminf_{\substack{\lambda\searrow 0}}
	\frac{f(x + \lambda w) - f(\bar x)}{\lambda}
	\\
	&= 
	\lim_{\substack{\lambda\searrow 0}}
	\frac{f(x + \lambda w) - f(\bar x)}{\lambda} . 
	& \text{$f$ is continuous}
\end{aligned}
$$

We can split the limit on the second equality because the first term has a limit of zero. 
$f$ is $K(\bar x)$ Locally Lipschitz at $\bar x$, let $\lambda > 0$ be fixed, then: 


$$
\begin{aligned}
	0 \le \left|
		\liminf_{\substack{\lambda \searrow 0 \\ w' \rightarrow w}}
		\lambda^{-1}(f(\bar x + \lambda w') - f(\bar x + \lambda w))
	\right|
	&= 
	\lim_{\substack{\epsilon \searrow 0 \\ \lambda \searrow 0}}
	\inf_{w' \in w + \epsilon \mathbb B}
	\lambda^{-1}|f(\bar x + \lambda w') - f(\bar x + \lambda w)|
	\\
	&\le 
	\lim_{\substack{\epsilon \searrow 0 \\ \lambda \searrow 0}}
	\inf_{w' \in w + \epsilon \mathbb B}
	\lambda^{-1} K(\bar x) \Vert \lambda w' - \lambda w\Vert
	\\
	&= 
	\lim_{\substack{\epsilon \searrow 0 \\ \lambda \searrow 0}}
	\inf_{w' \in w + \epsilon \mathbb B}
	K(\bar x)\Vert w' - w\Vert = 0. 
\end{aligned}
$$



$\square$


---
### **Subgradient Dini-Hadarmard Subderivative**

The following theorem is introduced in Professor Wang's Lecture of MATH 564 at UBCO. 
This theorem is in fact an exercise in Rockafellar and Wett's textbook. 

#### **Thm | Regular Subgradient and Dini-Hadarmard Subderivative**
> If $\bar x \in \text{dom}(f)$ then $\hat \partial f(\bar x) = \{v\in \mathbb R^n | \langle v, w\rangle \le df(x | w) \forall w \in \mathbb R^n\}$. 

**Proof**

Consider substitution $x = \bar x + \tau w'$
$$
\begin{aligned}
	0 &\le 
	f(\bar x + \tau w') 
	- f(\bar x) 
	- \langle v, x - \bar x\rangle - o(\Vert x - \bar x\Vert). 
\end{aligned}
$$

Let $\tau w' = x - \bar x$ with $\tau > 0$ hence $w' = \frac{x - \bar x}{\tau}$ and $o(\Vert x - \bar x\Vert) = o(\tau \Vert w'\Vert)$ therefore: 

$$
\begin{aligned}
	\frac{f(\bar x + \tau w') - f(\bar x)}{\tau} 
	&\ge
	\langle  v, w'\rangle
	+ \frac{o(\Vert x - \bar x\Vert)}{\tau}
	\\
	&= \langle v, w'\rangle + \frac{o(\tau \Vert w'\Vert)}{\tau}
	\\
	&= \langle v, w'\rangle + \frac{o(\tau \Vert w'\Vert)}{\tau \Vert w'\Vert}
	\Vert w'\Vert. 
\end{aligned}
$$

Taking limit on both sides with $\tau \searrow 0$ and $w \rightarrow \mathbf 0$, we can eliminate the little-0 term. 




**Remarks**

Obviously, the set $\hat \partial f(\bar x)$ is an intersection of all the half spaces that satisfies the conditions where, it supports the Dini-hadamard subderivative. 
Therefore, the set $\hat \partial f (\bar x)$ will have to be a convex set. 



---
### **Lack of Closeness of Classical Directional Derivative**

Observe that the above definition involves the use of $\liminf$ instead of just $\lim$. 
This choice is intentional, and it's used to preserves the lower semi-continuity of a function in the Dini-Hadamard subderivative. 
Consider the indicator function of a closed unit disk in $\mathbb R^2$. 
Let $\delta(x)$ be the function, then we consider its directional derivative at the point $x = (1, 0)$ along the direction of $(0, 1)$. 
Let $\bar x$ be the point that we are taking the derivative and $u$ be the direction, then the limit: $\lim_{\tau \searrow 0}(f(\bar x + \tau u) - f(\bar x))/\tau = \infty$ because the ray: $\bar x + \mathbb R_+(u)$ just lay outside the disk which is always infinity. 
Therefore, we consider a different definition of a subderivative with $\liminf$, where, the ray itself is also converging to $u$ in addition to taking the infimum on the sequence of limit points. 
Then, the derivative of function would be lower semi-continuous at the point $(1, 0)$. 

**Why closeness is a concern here for the subderivative of Non-Lipschitz function in Dimitry's writing?**

He didn't say and I don't know. 

---
### **Theorem | Subderivative is Supporting the Subgradient Set**

> Let $f$ be any augmented real valued convex proper function, then for any $x\in \text{int}\circ \text{dom}(f)$, Then the direction derivative along the direction $u$ is the support function on the subgradient set $\partial[f](x)$: 
> 
> $$
> \begin{aligned}
>    f'(x|u) = \sup_{y\in \partial [f](x)}\langle y, u \rangle = \delta^\star_{\partial [f](x)}(u)
> \end{aligned}
> $$

**Proofs**:

#UNFINISHED 

**Remarks**:

Observe that the theorem is only limited to closed and convex function. For other types of functions this is not true, and we will need new theories for them. 

**Source**:
There are multiple sources talking about this thing under different names. Dimintry's AMATH 516 course note it's in: Theorem: 3.50, Page 72. In \<First Order Methods in Optimizations\> it's referred to as *The Max Formula* for theorem 3.26 at pg: 47. 

