[[Subgradient Intro]]
[[Tangent Cone]]

---
### **Intro**

> Let $f$ be a function, consider the subdifferential at any points $\bar x$ in the relative interior domain of the function and $f(\bar x)$ is not the minimum. Consider the level sets defined via the function value at the point, then: $\text{lev}(f|\bar x):= \{x\in \text{dom}(f): f(x) \le f(\bar x)\}$, then the subgradient $\partial [f](\bar x) \subseteq N_{\text{lev}(f|\bar x)}(\bar x)$, the subgradient equals to the normal cone at the point of differential of the level set.

**Proof**

Define the level bounded epigraph of the function given the point $\bar x$ to be: $\text{epi}'(f|\bar x) := \{(x, f(x)): f(x) \le f(\bar x)\}$. By the tangent cone theorem of subgradient we obtain from $[g\;-1]^T\in N_{\text{epi}(f)}([\bar x \; f(\bar x)]^T)$: 

$$
\begin{aligned}
    & \forall \begin{bmatrix}
        x \\ \alpha
    \end{bmatrix} \in \text{epi}(f), g\in \partial [f](\bar x): 
    \\
    & \left\langle
        \begin{bmatrix}
            g \\ -1
        \end{bmatrix}, 
        \begin{bmatrix}
            x - \bar x \\ \alpha - f(\bar x)
        \end{bmatrix}
    \right\rangle \le 
    o\left(
      \left\Vert
         \begin{bmatrix}
            x - \bar x\\
            \alpha - f(\bar x)
         \end{bmatrix}
      \right\Vert  
    \right)
\end{aligned}
$$

Observe the fact that $\text{epi'}(f|\bar x) \subseteq \text{epi}(f|\bar x)$, then we may consider any $[f(x) \quad l]^T\in \text{epi'}(f)$, giving and it would still $\in N_{\text{epi}(f)}([\bar x \; f(\bar x)]^T)$, which means the following inequality from the definition of tangent cones: 

$$
\begin{aligned}
    & \langle g, x - \bar x\rangle - \underbrace{(l - f(\bar x))}_{= 0\text{ when } l =f(\bar x)} \le o 
    \left(
        \left\Vert
            \begin{bmatrix}
                x - \bar x \\  l - f(\bar x)
            \end{bmatrix}
        \right\Vert
    \right)
    \\
    \implies & \langle g, x - \bar x\rangle \le
    o\left(
        \left\Vert
            \begin{bmatrix}
                x - \bar x \\  l - f(\bar x)
            \end{bmatrix}
        \right\Vert
    \right)
    \\
    \implies & 
    g \in N_{\text{lev}(f)}(\bar x)
\end{aligned}
$$

And therefore we have $\partial [f](\bar x)\subseteq N_{\text{lev}(f)}(\bar x)$.

**Remarks**: 

**The converse of the statement**
* The converse of the statement: $N_{\text{lev}(f)}(\bar x) \subseteq \partial [f](\bar x)$ is obviously not true. The idea is to exploit the case where $\partial [f](x) = \emptyset$. An example of such a function would be nonconvex: 
  * $$
    \begin{aligned}
        f(x)= \begin{cases}
            \Vert x\Vert & \Vert x\Vert \le 1
            \\
            1 & \text{else}
        \end{cases}
    \end{aligned}
    $$
    Where it's obvious to see that at any $\Vert x\Vert = 1$, we don't have any subgradient. 
* However, whether the equality is true whenever we have $\partial [f](\bar x)$ being nonconvex, I think it's plausible but I didn't have the time to prove that yet. 


**Source**: 
Course notes [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/subgradients.pdf), part 2.11. But they didn't prove it. This is also listed as exercise 4.9 in Dimitri's UW Course notes AMATH 516. 

