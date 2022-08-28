[[Multivalued Functions (Set-valued Mappings)]]

---
### **Intro**

A Moreau Envelope $\text{env}_{\alpha, f}(x)$, $\text{prox}_{\alpha, f}$ the proximal operator are defined for some function $f$: 

$$
\begin{aligned}
    & \text{env}_{\alpha, f}(x) := \min_{y}\left\lbrace
        f(y) + \frac{1}{2 \alpha }\Vert y - x\Vert^2
    \right\rbrace
    \\
    & \text{prox}_{\alpha,f}(x) := 
    \arg\min_{y}\left\lbrace
        f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2
    \right\rbrace
\end{aligned}
$$

The proximal operator is a singleton when the function $f$ is convex, proper and closed. Reader observe that $\text{env}_{\alpha, f}(x) = (f\square \frac{1}{2\alpha}\Vert \cdot \Vert^2)(x)$, which by (**#REFERENCE_NEEDED**) the epigraph of the envelope is the set addition between the epigraph of those 2 functions.  

**Remarks**

It's from Demitry's Textbook, definition 3.59, pg 77. 

If we consider the fact that the infimal convolution is the epigraphical addition of 2 functions, then a Moreau Envelop smooths the function using the parameter $\alpha$, for example the Moreau Envelope of the absolute value is given as: 

$$
\begin{aligned}
   \text{env}_{\alpha, f}(x) = \begin{cases}
        \frac{1}{2 \alpha}|x|^2 & \text{if } |x|\le \alpha, 
        \\
        |x| - \frac{1}{2}\alpha & \text{otherwise}.
   \end{cases}
\end{aligned}
$$

Which is the Huber function in statistics. 

Dimitry's Comments: The prox operator is a generalization of the set projection operations. see [[Set Projections and Dist]] for more. in fact their share similarities when the function $f$ is convex, closed and proper. 

---
### **As a Operators**

> When the function $f$ is convex closed and proper, the $\text{prox}_{\alpha, f}$ can be viewed the following operator $(I + \alpha \partial f)^{-1}$, which is also, a single valued operator that sometimes has nice closed form solution to it.  

**Proof**: 
The prox has a unique solution when the function $f$ is convex with $\alpha > 0$, suppose that $y^+$ is such an optimal then using subgradient: 

$$
\begin{aligned}
    0 &\in \partial\left[
        \left.
            f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2 
        \right| y
    \right](y^+)
    \\
    0 &\in \partial f(y^+) + \frac{1}{\alpha}(y^+ - x)
    \\
    \frac{x}{\alpha} &\in 
    (\partial f + \alpha^{-1}I)(y^+)
    \\
    x &\in 
    (\alpha \partial f + I)(y^+)
    \\
    y &\in (\alpha\partial f+ I)^{-1}(x).
\end{aligned}
$$

Therefore, the proximal operator on a function that is convex proper and closed can be viewed as a weighted resolvant of the subgradient operator. 


**Remarks**

Right from the start, we should not assume that it's invertible, and even if it is invertible, we need to know if the inverse operator is still a multi-value mapping, or a single value mapping. In this particular case, because we know how subgradient work, and $f$ being closed convex and proper, it's singled value. But, to characterize such properties in the general case, we need to read more. Check out: The end of chapter 3 comments on Dimitry's work. 

Here, I want to highlight one important observation we should make here, and that is the special case where $f(x) = \delta_C(x)$, under that case, the proximal operator becomes the set projection operator onto the set. 



---
### **Prox is L1-Lipschitz**



---
### **Moreau Decomposition**


---
### **Gradient of Prox**