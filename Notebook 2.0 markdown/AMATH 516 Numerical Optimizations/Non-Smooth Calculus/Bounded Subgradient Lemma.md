* [Subgradient Introduction](Subgradient%20Introduction.md)
* [Epigraph](../Background/Epigraph.md)
* [Strict Separations Theorem](../CVX%20Geometry/Strict%20Separations%20Theorem.md)
* [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md)

---
### **Intro**

This lemma serves for [Convex Function is Locally Lipschitz](Convex%20Function%20is%20Locally%20Lipschitz.md). The lemma stated that for a convex functions $f$, it's subgradient is: 

* Nonempty bounded in all direction inside of $\text{int}\circ\text{dom}(f)$
* Nonempty, bounded in some directions when inside of $\text{relint}\circ\text{dom}(f)$



---
### **Lemma: Boundedness of Subgradient In the Interior of the Domain**

> Let $f$ be $\mathbb R^n$ to $\mathbb{\bar{R}}$ be convex and proper, then for all $x\in \text{int}\circ \text{dom}(f)$ we have $g \in \partial [f](x)$ is bounded for all any $g$. Or briefly as: $\text{dom}(\partial [f]) \subseteq \text{int}\circ\text{dom}(f)$. 

**Proof**

Choose any $x\in \text{int}\circ \text{dom}(f)$ then choose any $x + v \in \mathbb{B}_\epsilon(x)$ where $v$ is small enough. $\text{epi}(f)\subseteq \mathbb E\times \mathbb R$, and its construction prevents any separating hyperplane vector $[g, \alpha]$ with $\alpha > 0$. Suppose that hyperplane located at $(x, f(x)) \in \text{bd}\circ\text{epi}(f), (x + v, f(x + v))\in \text{epi}(f)$ then it's possible to attain separating hyperplane that separates these 2 points: 

$$
\begin{aligned}
    & \exists \begin{bmatrix}
            g, \alpha
    \end{bmatrix}: 
    \left\langle 
        \begin{bmatrix}
            g \\ \alpha
        \end{bmatrix}, 
        \begin{bmatrix}
            x, f(x)
        \end{bmatrix}
    \right\rangle \ge 
    \left\langle 
        \begin{bmatrix}
            x+v \\ f(x + v)
        \end{bmatrix}
        ,
        \begin{bmatrix}
            g \\\alpha
        \end{bmatrix}
    \right\rangle
    \\
    \implies & 
    \langle g, x\rangle + \alpha f(x) \ge 
    \langle x + v, g\rangle + f(x + v) \alpha
    \\
    & \alpha f(x) \ge \langle v, g\rangle + f(x + v)\alpha
    \\
    \text{let: } & y = x + v
    \\
    & \alpha f(x) + \langle x - y, g\rangle \ge f(y) \alpha
\end{aligned}
$$
Using the fact that $f(x)$ is convex, we obtain that $\alpha = -1$, and that gives us the sugradient inequality, meaning that $g\in \partial [f](x)$. We say that $\Vert g\Vert_1$  is bounded by considering the choice of $x = \pm \epsilon \mathbf e_1$, a scaled basis vecto, then: 

$$
\begin{aligned}
   & f(x \pm\epsilon \mathbf e_i) - f(x) \ge \pm g_i
   \\
   \implies & |g_i| \le \max(f(x - \epsilon \mathbf e_i) - f(x), f(x + \epsilon \mathbf e_i) - f(x))
\end{aligned}
$$

Which is bounded because $x, x \pm \epsilon \mathbf e_i$ are in the epsilon ball which can be placed inside the interior of the domain of the function. Therefore $g$ is bounded. 

**Remarks**

The proof can be modified for some points $x\in \text{relint}\circ \text{dom}(f)$ by changing the basis for $v$, then subgradient is at least bounded inside of some basis in the relative interior of the domain. The boundedness argument can also be applied by choosing some $v$ maximizing $\langle v, g\rangle$ for any choice of $g$ obtaining a bound under the dual norm. 

**Source**

I made it myself I am not sure how good the proof actually is. 


---
### **Lemma: Unboundedness of Subgradient in The Relative Interior of The Domain**



**Source**:Theorem 3.20 in \<First Order Methods in Optimizations\>. 