- [Convex Sets Intro](Background/Convex%20Sets%20Intro.md)
- [Gradient, Hessian Characterization of Convex Functions](CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convex%20Functions.md)

---
### **Intro**

Bregman generalizes the Euclidean distance that appeared in Rockafellar's proximal point method, for the [Proximal Gradient, Forward Backwards Envelope](Proximal%20Methods/Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md). In this article, we will faithfully follow Amir Beck's First order method[^1] chapter 9, and augment it with classics Rockafellar and other relevant publications.  

#### **Definition (9.2) | Bregman Divergence**
> Let $\omega$ be a proper closed convex function that is differentiable over $\text{dom}(\partial \omega)$. The Bregman distance associated with $\omega$ is the function $D_\omega: \text{dom}(\omega) \times \text{dom}(\partial \omega)\mapsto \mathbb R$, given by 
>
> $$
> \begin{aligned}
>   D_{\omega}(x,y) &= \omega(x) - \omega(y) - \langle \nabla \omega(y), x - y\rangle. 
> \end{aligned}
> $$

**Observations**

$D_\omega(x, x_0)$ is, $\omega(x) - (\omega(x_0) + \langle \nabla\omega (x_0), x - x_0\rangle)$, it's the difference between the function $\omega(x)$ and the linearization of $\omega$ at $x_0$. It contains the second order information for the differentiable function. Because $\omega$ is closed and convex, we immediately know that $D_\omega(x, y) \ge 0$, by convexity. 

**Remarks**

The definition is taken from Amir Beck [^1]. 


#### **Definition | Legendre Function**





[^1]: A. Beck, _First-Order Methods in Optimization | SIAM Publications Library_. in MOS-SIAM Series in Optimization. SIAM. Accessed: Oct. 19, 2023. [Online]. Available: [https://epubs.siam.org/doi/book/10.1137/1.9781611974997](https://epubs.siam.org/doi/book/10.1137/1.9781611974997)

[^2]: R. T. Rockafellar, Convex analysis, 10. print. and 1. paperb. print. in Princeton Landmarks in mathematics and physics. Princeton, NJ: Princeton Univ. Press, 1997.

