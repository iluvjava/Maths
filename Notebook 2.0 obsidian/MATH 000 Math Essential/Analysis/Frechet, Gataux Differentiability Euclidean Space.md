- [Real Analysis Basics](Real%20Analysis%20Basics.md)

----
### **Intro**

We introduce the concepts of Frechet and Gataux differentiability for $\mathbb R^m\mapsto \mathbb R$ functions. 
The concept itself is more generalized and it can present it self in variational calculus. 
See [Frechet Derivative](Frechet%20Derivative.md) for the same concept but in a much more generalized context. 

#### **Def | Frechet Derivative**
> Let $f: \mathbb R^n\mapsto \mathbb {\bar R}$ be differentiable at $\bar x \in \mathbb R^n$ if there exists $v \in \mathbb R^n$ such that 
> $$
> \begin{aligned}
>     f(x) = f(\bar x) + \langle v, x - \bar x\rangle + o(\Vert x - \bar x\Vert). 
> \end{aligned}
> $$
> Where the little-o notation has the property $\lim_{x\rightarrow \bar x}\frac{o(\Vert x - \bar x\Vert)}{\Vert x = \bar x\Vert} = 0$. 

**Observations**

The definition can be interpreted that, the error of a affine approximations located at $f(\bar x)$ is good enough that the remaining error always decreases faster than a linear rate as $x \rightarrow \bar x$. 
Equivalently the above definition would suggest that $\exists v \in \mathbb R^n$ such that following differential quotient has a limit of zero: 

$$
\begin{aligned}
    \lim_{x\rightarrow \bar x} 
    \frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert} = 0. 
\end{aligned}
$$

**Remarks**

When $f$ is Frechet differentiable, the Frechet derivative $v = \nabla f(\bar x)$. 
However, if $\nabla f(\bar x)$ exists as a vector, it doesn't mean the function is Frechet differentiable. 
The converse doesn't work. 
Observe that the Frechet derivative has one single vector $v\in \mathbb R$, the implications of approaching the function along the ray of a vector say $w$ would be implied via 

$$
\begin{aligned}
    \lim_{\tau \rightarrow 0}
    &= 
    \frac{f(\bar x + \tau w) - f(\bar x)}{\tau} &= \langle v, w\rangle. 
\end{aligned}
$$

It can be achieved via substituting $x = \bar x + \tau w$. 
That weaker condition is called Gataux derivative. 


#### **Def | Gataux Differentiable**
> A function $f: \mathbb R^n \mapsto \mathbb{\bar R}$ is Gataux differentiable when there exists $v \in \mathbb R$ such that 
> $$
> \begin{aligned}
>     \lim_{\tau \rightarrow 0}
>     &= 
>     \frac{f(\bar x + \tau w) - f(\bar x)}{\tau} = \langle v, w\rangle. 
> \end{aligned}
> $$

---
### **Sufficient Characterization of Frechet Derivative via Gataux Derivatives**

We can describe the Frechet derivative fully via the use of direcitonal derivatives.
The following theorem does that.  
Direction derivative is capable of describing the linear locality of a function by quatifying all the ways a limit approaches the point $\bar x$. 


#### **Thm | Frechet Differentiable Equivalence**
$$
\begin{aligned}

\end{aligned}
$$