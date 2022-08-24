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

