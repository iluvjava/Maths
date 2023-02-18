[[../MATH 000 Math Essential/Analysis/Real Analysis Basics]]


---
### **Intro**

**Definition: Convex Direction Subderivatives**

> let f be proper on $\mathbb E$, suppose that $x\in \text{int}.\text{dom}f$, and let $d\in \mathbb E$. Then the directional derivative of $f$ at $x$ in the direction of $d$ is: 
> $$
> \begin{aligned}
>     f'(x|d) := 
>     \lim_{\alpha\searrow0} \frac{
>         f(x + \alpha d) - f(x)
>     }{\alpha}
> \end{aligned}
> $$
> if, the limit exists. 

**References**: Heinz Textbooks would be the best place because he didn't talk about modern variational analysis in his course notes. 

---
### **Convex Monotone Quotient**

> Let $f$ be convex and proper on $\mathbb E$, suppose that $x\in \text{int.dom}(f)$, let $d\in \mathbb E$, Then: 
> $$
> \begin{aligned}
>     \Phi_d(\alpha) := 
>     \frac{f(x + \alpha d) - f(x)}{\alpha}, 
> \end{aligned}
> $$
> is increasing $\mathbb R_{++}$; as a consequence, $f'(x|d)$ exists and: 
> 
> $$
> \begin{aligned}
>     f'(x|d) = \inf_{\alpha > 0} \Phi_d(\alpha) = 
>     \inf_{\alpha > 0} \frac{f(x + \alpha d) - f(x)}{\alpha}. 
> \end{aligned}
> $$
> Additionally, $-\infty < -f'(x|d) \le f'(x|d)\le \infty$, hence, function that is real-valued. 

**Proof**

**Remarks**

Please take note of the $\lim$ goes into the $\inf$ after the assumption of convexity. 

**References**: Heinz's MATH 563 at UBCO. 