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
> Let $C \subseteq \mathbb R^n$ a closed set, let $\bar x \in C$, define Bouligran tagent cone of $C$ at $\bar x$ as 
> $$
> \begin{aligned}
>     T_C(\bar x) 
>     & = 
>     \underset{\tau \searrow 0}{\text{Limsup}}
>     \frac{C - \bar x}{\tau}
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

