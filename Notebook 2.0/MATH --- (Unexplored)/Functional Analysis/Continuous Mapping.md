[[Banach Space]]


---
### **Intro**

A continuous mapping is similar to a function that is continuous for the real number. Prior to the definition of continuity, a sense of distance will have to be created, and hence we use Banach space, a space that is equipped with some types of norm denoted as $\Vert \cdot\Vert$.

**Definition**: 
> similar to the definition of a continuous function, let $T$ be a continuous mapping from $X$ to $Y$ where both is a Banach space, then $T$ is continuous at $\bar x\in X$ if: 
> $$
> \forall \epsilon > 0\; \exists \; \delta: \Vert x - \bar x\Vert\le \delta \implies \Vert T(x) - T(\bar x)\Vert \le \epsilon
> $$


---
### **Examples 1** 

> The transformation $T: f \mapsto \int_{0}^1\sqrt{1 + (f')^2}dx$ (The arc length formula) in functional space $C^1[0, 1]$ equipped with the norm $\Vert \cdot\Vert_\infty$ is not continuous. One of the conter example one can use is this sequence of functions: 
> $$
>   \begin{aligned}
>       f_n(x) = \frac{\cos(2n\pi x)}{\sqrt{n}}
>   \end{aligned}
> $$

**Proof Priors** 
Before the proof, we establish the fact that $\sin(2n\pi x) \ge \frac{1}{\sqrt{2}}$ for all $x\in [\frac{1}{8n}, \frac{3}{8n}]$ and the fact that $f_n$ has a period of $1/n$. 

**Source**:

This is exercise 2.3 in \<A friendly approach to functional analysis\>. 
