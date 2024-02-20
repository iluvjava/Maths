---
alias: Variational Directional Derivatives, Dini Hadamard Subderivatives

---
- [[Subgradient Intro]], [Variational Subgradient](Variational%20Subgradient.md)
- [[Epigraph, Level Sets]], 
- [[Support Function]], 

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

#### **Def-1 | Dini-Hadamard Variational Subderivative**
> Consider any augmented real function $f$ at a point $x$ where $f(x)$ is finite, the direction derivative in the direction of $u$ is given as: 
> $$
> \begin{aligned}
>   d[f](x|u) = \lim\inf_{\substack{\tau \searrow 0 \\ v\rightarrow u}}
>     \frac{f(x + \tau v) - f(x)}{\tau}
> \end{aligned}
> $$

**Notations**

For more complex expression such as $f(Ax + b)$ in the direction of $u$, we use the notation $[f(Ax + b)]'(x|u)$. 

**Obesrvations**

When $u = \mathbf 0$, we would have $df(x | \mathbf 0 ) = 0$ for all $f$, for all $x$. 
This is by the definiton. 

**Remarks**:

Immediately Observe the Equivalence to the tangent cone definitions [[../Background/Tangent Cone]] on the epigraph of the function: 

$$
\begin{aligned}
	\text{epi}(f'(x|\cdot)) = N_{\text{epi}(f)}((x ,f(x)))
\end{aligned}
$$


#### **Def-2 | Classic Directional Derivative Locally Lipschitz Functions**


> Consider any $f$ that is an augmented real function and it's Lipschitz continuous around the point $x$, then the directional derivative in the direction of $u$ is: 
> $$
> \begin{aligned}
>      f'(x|u) = \liminf_{\tau \searrow 0}\frac{f(x + \tau u) - f(x)}{\tau}
> \end{aligned}
> $$

We skip the proof. 
Function that is locally Lipschitz is true for all close, convex, lsc function at the $\text{ri}.\text{dom}(f)$. 
Hence, under this case, we have the subderivative equals to above. 
The classical directional derivative simplifies further to just $\lim$ when the function is convex. 
See [[Convex Directional Derivatives]] for more information. 

**Remarks**

The Dini-Hadamard definition of directional derivative is suitable for all kinds of real-valued functions.
Prof Dimitri pointed out that, the Dini-Hadamard definition of subderivative is more generalized. 
Observe that replacing $\liminf$ with $\lim$, then this becomes directional Gataux Derivative. 
Allow $\eta\rightarrow 0$ from both direction will yield Gataux derivative definition. 

Under the condition that $f$ is *Lipchitz Continuous* on a neighborhood of points (A characterization of convex functions as well), the above definition is equivalent to the usual definition of a directional derivative. 

---
### **Recovering Fenchet Differentiability**

The definition of Dini-Hadmard variational subderivatives breaks the definition of other type of variational derivatives down to small components. 
To illustrate, we consider the following claims that proposed an equivalent characterizations of the Fenchet Differentiability. 

#### **Claim | Sufficient for Fenchet Differentiability**
> $F$ is differentiable if and only if 
> $$
>   \forall w \in \mathbb R^n\quad  h(w)= 
>   \lim_{\substack{\lambda\searrow 0 \\ w' \rightarrow \bar w}}
>   \frac{f(\bar x - \lambda w') - f(\bar x)}{\Vert x - \bar x \Vert}. 
> $$
> And $h(w)$ is a linear function. 

**Proof**

If $f$ is Frenchet differentiable, then the above conditions are true since it's just much stronger by the definition. 
Let $f$ bt non-differentiable, then the definition of Fenchet derivative is false. 
For contradiction let's assume that we have $h(x) = \langle v, w\rangle$ for all $w \in \mathbb R^n$ and we have: 

$$
\begin{aligned}
    \forall w \in \mathbb R^n : 
    \lim_{\substack{\tau\searrow 0 \\ w' \rightarrow \bar w}}
    \frac{f(\bar x + \tau) - f(\bar x)}{\tau}
    &= \langle v, w\rangle. 
\end{aligned}
$$

Assuming the $f$ is not Fenchet differentiable, there exists sequence $(x^{(\gamma)})_{\gamma\in \mathbb N}$ such that 

$$
\begin{aligned}
  \frac{f(x^{(\gamma)}) - f(\bar x) - \langle v, x^{(\gamma)} - \bar x\rangle}{
    \Vert x^{(\gamma)} - \bar x\Vert
  } \rightarrow 
  \beta &\neq 0, 
\end{aligned}
$$

By the fact that $f$ is not differentiable at $\bar x$. 
Set $\tau_\gamma = \Vert x^{(\gamma)} - \bar x\Vert$, then $w^{(\gamma)} = (x^{(\gamma)} - \bar x) / \tau_{\gamma}$, and therefore the limit simplifies to 

$$
\begin{aligned}
    \frac{f(\bar x + \tau_\gamma w^{(\gamma)}) - f(\bar x)}{
        \tau_\gamma
    } - \langle v, w^{(\gamma)}\rangle \rightarrow \beta. 
\end{aligned}
$$
By definition, we have $\Vert w^{(\gamma)}\Vert = 1$, since we are in $\mathbb R^n$, there exists some subsequential limit say $w^{(\rho)}$ such that it converges. 
Therefore, the above claim won't be equal to zero. 
This contradiction the assumption we made, therefore the converse is proven and the limit is sufficient for Frenchet differentiability. 



---
### **Local Lipschitz Continuity**

Lipschitz continuous function simplifies the definition of the Dini-Hadamard subderivatives. 
It simplifies so it only has one limit occurring and it's sufficient to discover the derivative based on only the behaviors of the function along the direction of the ray. 

#### **Thm | Dini Hadamard under Locally Lipschitz Conditions**
> The dini Hamdamard Subderivative would is equivalent to 
> $$
>   \liminf_{\lambda \searrow 0} \frac{f(\bar x + \lambda w) - f(\bar x)}{\lambda}, 
> $$
> if $f$ is locally Lipschitz at $\bar x$. 

**Proof**

Let $f$ be locally Lipschitz at $\bar x$. 
Consider the definition of the directional dervative then 

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
	\frac{f(x + \lambda w) - f(\bar x)}{\lambda}. 
\end{aligned}
$$

On the last line, we can do this because the term on the left has a limit. 
It has a limit because $f$ is Locally Lipschitz at $\bar x$ therefore 

$$
\begin{aligned}
	\left|
		\frac{f(\bar x + \lambda w') -f(\bar x + \lambda w)}{\lambda}
	\right| 
	&\le K_{\bar x} \Vert w' - w\Vert
	\\
	\implies  \lim_{w'\rightarrow w} \left|
		\frac{f(\bar x + \lambda w') -f(\bar x + \lambda w)}{\lambda}
	\right|  &= 0. 
\end{aligned}
$$

Since the limit exists, then $\liminf$ would be the same as the limt and therefore, the first term in the sum is zero. 
Additioanlly, the second term in the sum only has $w$ which is not dependent on the variable $w'$ therefore the claim is proven. 


---
### **Subgradient Dini-Hadarmard Subderivative**

The following theorem is introduced in Professor's wang Lecture of MATH 564 at UBCO. 
This theorem is in fact an exercise in Rockafellar and Wett's textbook. 

#### **Thm | Regular Subgradient and Dini-Hadarmard Subderivative**
> If $\bar x \in \text{dom}(f)$ then $\hat \partial f(\bar x) = \{v\in \mathbb R^n | \langle v, w\rangle \le df(x | w) \forall w \in \mathbb R^n\}$. 

**Proof**

Start with $v \in \hat \partial f(\bar x)$. 
$$
\begin{aligned}
	\liminf_{\substack{x\rightarrow \bar x \\ x \neq \bar x}}
	\frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert}
	&\ge 0
	\\
	\text{let } x = \bar x + \tau w', & \text{ assuming } w \neq \mathbf 0
	\\
	\liminf_{\substack{x\rightarrow \bar x \\ x \neq \bar x}}
	\frac{f(\bar x + \tau w') - f(\bar x) - \langle v, \tau w'\rangle}{\Vert \tau w'\Vert}
	&\ge 0
	\\
	\tau \ge 0 \implies 
	\liminf_{\substack{x\rightarrow \bar x \\ x \neq \bar x}} 
	\frac{
			f(\bar x + \tau w') - f(\bar x) - \langle v, \tau w'\rangle
		}
	{\tau}
	&\ge 0
	\\
	\liminf_{\substack{x\rightarrow \bar x \\ x \neq \bar x}}  \frac{
			f(\bar x + \tau w') - f(\bar x) - \langle v, \tau w'\rangle
		}
	{\tau}
	- \langle v, w'\rangle &\ge 0
	\\
	df(x | w) &\ge \langle  v, w'\rangle. 
\end{aligned}
$$

We made the assumption that $w' \neq 0$, this evade the division by zero problem. 
We can split the parts inside of the limit because the second term has a well defined limit to it. 
However, the convergence $x \rightarrow \bar x$ may not be limited to the mode of convergence under just $\bar x + \lambda w$ with $\lambda \searrow 0$ and $w \neq 0$. 
Let's consider the case where $w = \mathbf 0$. 
From definition we always have $df(\bar x | \mathbf 0) = 0$ if $v \in \hat \partial f(\bar x)$. 
Assuming $v \in \hat \partial f(\bar x)$
Consider substitution $x = \bar x + \tau w'$
$$
\begin{aligned}
	f(\bar x + \tau w') &\ge 
	f(\bar x) + \langle v, x - \bar x\rangle + o(\Vert x - \bar x\Vert)
	\\
	\frac{f(\bar x + \tau w') - f(\bar x)}{\tau} &\ge 
	\langle  v, w'\rangle + \frac{o(\Vert x - \bar x\Vert)}{\tau}
	\\
	\frac{f(\bar x + \tau w') - f(\bar x)}{\tau} &\ge 
	\langle  v, w'\rangle + 
	\frac{o(\Vert x - \bar x\Vert)}{\tau}.
\end{aligned}
$$

Also consider $\tau w' = x - \bar x$ so $w' = \frac{x - \bar x}{\tau}$ so $o(\Vert x - \bar x\Vert) = o(\tau \Vert w'\Vert)$ and therefore continuing we have 

$$
\begin{aligned}
	\frac{f(\bar x + \tau w') - f(\bar x)}{\tau} &\ge 
	\langle  v, w'\rangle + 
	\frac{o(\Vert x - \bar x\Vert)}{\tau}
	\\
	&= \langle v, w'\rangle + \frac{o(\tau \Vert w'\Vert)}{\tau}
	\\
	&= \langle v, w'\rangle + \frac{o(\tau \Vert w'\Vert)}{\tau \Vert w'\Vert}
	\Vert w'\Vert, 
\end{aligned}
$$

now takingthe liminf on both sides with $\tau \searrow 0$ and $w \rightarrow \mathbf 0$, we have the limit of RHS equals to zero. 
The LHS is $d(\bar x | w) \ge 0$. 
Therefore we have $df(\bar x | \mathbf 0 ) \le 0$. 

**Remarks**

Obviously, the set $\hat \partial f(\bar x)$ is an intersection of all the halfe spaces that satisfies the conditions where, it supports the dini-hadamard subderivative. 
Therefore, the set $\hat \partial f (\bar x)$ will have to be a convex set. 



---
### **Lack of Closedness of Classical Directional Derivative**

Observe that the above definition involves the use of $\liminf$ instead of just $\lim$. 
This choice is intentional and it's used to preserves the lower semi-continuity of a function in the Dini-Hadamard subderivative. 
Consider the indicator function of a closed unit disk in $\mathbb R^2$. 
Let $\delta(x)$ be the function, then we consider its directional derivative at the point $x = (1, 0)$ along the direction of $(0, 1)$. 
Let $\bar x$ be the point that we are taking the derivative and $u$ be the direction, then the limit: $\lim_{\tau \searrow 0}(f(\bar x + \tau u) - f(\bar x))/\tau = \infty$ because the ray: $\bar x + \mathbb R_+(u)$ just lay outside of the disk which is always infinity. 
Therefore, we consider a different definition of a subderivative with $\liminf$, where, the ray itself is also converging to $u$ in addition to taking the infimum on the sequence of limit points. 
Then, the derivative of function would be lower semi-continuous at a the point $(1, 0)$. 

**Why closedness is a concern here for the subderivative of Non-Lipschitz function in Dimitry's writing?**

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

Observe that the theorem is only limited to closed and convex function. For other types of functions this is not true and we will need new theories for them. 

**Source**:
There are multiple sources talking about this thing under different names. Dimintry's AMATH 516 course note it's in: Theorem: 3.50, Page 72. In \<First Order Methods in Optimizations\> it's referred to as *The Max Formula* for theorem 3.26 at pg: 47. 

