- [Tangent Cone](Tangent%20Cone.md)
- [Normal Cone](Normal%20Cone.md)


---
### **Intro**

We introduce the Variational tangent cone, and some of the theorem. 
The tangent cone and normal cone a tightly connected via the tangent normal polarity theorem. 


---
### **Definitions and Characterizations**

We introduce some definitions and basic properties for the tangent cone along with some observations. 

#### **Def | The BouliGand Tangent Cone**
> Let $C \subseteq \mathbb R^n$ a closed set, let $\bar x \in C$, define Bouligran tangent cone of $C$ at $\bar x$ as 
> $$
> \begin{aligned}
>     T_C(\bar x) 
>     & = 
>     \underset{\tau \searrow 0}{\text{Limsup}}
>     \frac{C - \bar x}{\tau} 
>       = \bigcap_{k = 1}^\infty\text{cl}
>       \left(
>           \bigcup_{0 < \gamma < 1/k} \frac{C - \{\bar x\}}{\tau}
>       \right)
>     \\
>     &= 
>     \left\lbrace
>         d \in \mathbb R^n 
>         \left | \; 
>             d = \lim_{m \rightarrow \infty} \frac{x^{(m)} - \bar x}{\tau_m}, 
>             \exists\; x^{(m)} \in C, 
>             x^{(m)}\rightarrow \bar x, 
>             \tau_m \searrow 0
>         \right.
>     \right\rbrace
> \end{aligned}
> $$

**Observations**

Comparing the definition of the tangent cone, we can see that it's lacking a little-o term descriptions. 
The limits inside creates a closure of the set. 
Without loss of generality one may consider $\mathbf 0 \in C$, which transform the definition. 
Let $d \in T_C(\bar x)$. 
If we "zoom in" into the point $\mathbf 0$ with a sequence of vector $x^{(n)} \in C$, then it converges to the vector $d$. 

#### **Prop | Some Basics Properties of the Tangent Cone**

> $T_C(\bar x)$ is a closed cone and therefore $\mathbf 0 \in T_C(\bar x)$. 

**Proof** 

This is true by the st limit $\underset{\tau \searrow 0}{\text{Limsup}}$, which take
the closure of a union of sets as $\gamma \searrow 0$. 
Intersection of closed set is always a closed set. 

#### **Prop | Distance Function and Normal Cone**

> Let $C \subseteq \mathbb R^n$, be a closed set and $x \in C$, then $v \in T_C(x)$ is equivalent to the condition that the direcitonal derivative on the function $d_C(x)$ in the direction of $v$ equals to zero. 
> Mathematically we have the representation that 
> $$
> T_C(\bar x) = \left\lbrace
>      v \in \mathbb R^n 
>     \left| \; 
>         \liminf_{\lambda \searrow 0} 
>         \frac{d_C(x + v \lambda)}{\lambda} = 0
>     \right.
> \right\rbrace. 
> $$

**Proof**

Not sure it's something for the reader then. 


**Remarks**

The distance function is incensitity to $x \in \text{cl}(C)$. 
