* [[Lipschitz Continuity]]
* [[Characterizing Functions for Optimizations]]
* [[Subgradient and Subdifferential Definition]]

---
### **Intro**

In this file we provide proof the theorem listed in: [[Convex Functions Characteristics#Continuity of Closed Convex Functions]]. To prove it, we need to introduce a lemma first. 



---
### **Lemma: Boundedness of Subgradient In the Interier of the Domain**

> Let $f$ be $\mathbb R^n$ to $\mathbb{\bar{R}}$, then for all $x\in \text{int}\circ \text{dom}(f)$ implies that $g \in \partial [f](x)$ is bounded for all any $g$. 
> 
> Or briefly as: $\text{dom}(\partial [f]) \subseteq \text{int}\circ\text{dom}(f)$. 

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

The proof can be modified for some points $x\in \text{relint}\circ \text{dom}(f)$ by changing the basis for $v$, then subgradient is at least bounded inside of some basis in the relative interior of the domain. The boundedness argument can also be applied by choosing some $v$ maxiizing $\langle v, g\rangle$ for any choice of $g$ obtaining a bound under the dual norm. 

**Source**

I made it myself I am not sure how good the proof actually is. 



---
### **Lemma:Lipschitz on one Line Segment**

> Given a function $f: \mathbb R \mapsto \bar {\mathbb R}$ that is proper and proper, then the function is lipschitz continuuous for every $[x_1, x_2] \subset \text{int}\circ\text{dom}(f)$. 

**Proof Summary**

We choose 3 points in the interior of the domain that a on the same line, and then we use the boundedness of the subgradient at those points, and subgradient inequality to bound the change of the function value wrt to the width of the line segment. 


**Proof**

Choose any line segment $[x_1, x_2]\in \text{int}\circ\text{dom}(f)$, we then paramaterize one point $x_t$ to be on the line segment: $x_t = x_1 + t(x_2 - x_1)\;\forall t \in [0, 1]$. Consider 2 supporting hyperplane at these 2 points and any $t\in (0, 1)$: 

$$
\begin{aligned}
    & f(x_t) \ge f(x_1) + \langle g_1, x_t - x_1\rangle
    \\
    \implies 
    & f(x_1) \le f(x_t) - \langle  g_1, x_t - x_1\rangle
    \\
    \implies 
    & f(x_2)\le f(x_t)- \langle g_2, x_t - x_2\rangle
\end{aligned}
$$

The upper bound for $f(x_1), f(x_2)$ are attained via rearranging the secant line inequality at the point $x_1, x_2$, next we consider the lower bound for the quantities: 

$$
\begin{aligned}
    f(x_1) &\ge f(x_t) + \langle  g_t, x_1 - x_t\rangle
    \\
    f(x_2) &\ge f(x_t) + \langle  g_t, x_2 - x_t\rangle
\end{aligned}
$$

Which uses the fact that the tagent line at $x = x_t$ can support both points $f(x_1), f(x_2)$ from below. Therefore the absolute value of $f(x_1) - f(x_2)$ can be upper bounded by the difference between the upper bound and lower bound for $f(x_1), f(x_2)$ whichever is larger: 

$$
\begin{aligned}
    |f(x_1) - f(x_2)| & \le 
    \max \left(
        \begin{aligned}
            \begin{bmatrix}
                    f(x_t) - \langle g_1, x_t - x_1\rangle - f(x_t) - \langle g_t, x_2 - x_t\rangle
                \\
                f(x_t) - \langle g_2, x_t - x_2\rangle - (f(x_t) + \langle g_t, x_1 - x_t\rangle)
            \end{bmatrix}
        \end{aligned}    
    \right)
\end{aligned}
$$

Individually we consider: 

$$
\begin{aligned}
    & f(x_t) - \langle g_1, x_t - x_1\rangle - f(x_t) - \langle g_t, x_2 - x_t\rangle
    \\
    = & 
    - \langle g_1, t(x_2 - x_1)\rangle - \langle g_t, (1 - t)(x_2 - x_1)\rangle
    \\
    = & 
    \langle g_1, t(x_1 - x_2)\rangle + \langle g_t, (1 - t)(x_1 - x_2)\rangle
    \\
    = &
    \langle(x_1 - x_2), tg_1 + (1 -t)g_t\rangle
    \\
    \le& \Vert x_1 - x_2\Vert \Vert tg_1 + (1 - t)g_t\Vert
\end{aligned}
$$

$$
\begin{aligned}
    & f(x_t)- \langle g_2, x_t - x_2\rangle - (f(x_t) - \langle g_t, x_1 - x_t\rangle)
    \\
    = &
    \langle g_2, x_t - x_2\rangle - \langle g_t, x_1 - x_t\rangle
    \\
    = &
    \langle (1 - t)g_2, x_2 - x_1\rangle + \langle tg_t, x_2 - x_1\rangle
    \\
    = & 
    \langle (1 - t)g_2 + tg_t, x_2 - x_1\rangle
    \\
    \le & 
    \Vert (1 - t)g_2 + tg_t\Vert \Vert x_2 - x_1\Vert
\end{aligned}
$$

Therefore, the difference between the function value is bounded like: 

$$
\begin{aligned}
    & |f(x_1) - f(x_2)| \le 
    \Vert x_2 - x_1\Vert\max
    (\Vert tg_1 + (1 - t)g_t\Vert, \Vert (1 - t)g_2 + tg_t\Vert)
    \\
    \implies & 
    \frac{|f(x_1) - f(x_2)|}{\Vert x_2 - x_1\Vert}\le 
    \underbrace{\inf_{t\in (0, 1)}\left\lbrace
        \max
        (\Vert tg_1 + (1 - t)g_t\Vert, \Vert (1 - t)g_2 + tg_t\Vert)
    \right\rbrace}_{L(x_1, x_2)}
\end{aligned}
$$

Which is the definition of Lipschitz Continuity for the function along the line segment $[x_1, x_2]$. Finally, we make use of the fact that because $x_1, x_1$ are from the interior of the domain of the function, it's subgradient is always bounded, hence, the Lipschitz constant is also bounded. 

**Remarks**

The generality of the lemma is kept by treating the points and the gradient of functions at points using euclidean inner product. 

Note, the upper bounded depends on the point we choose, but nontheless it's bounded for points $x_1, x_2\in \text{int}\circ\text{dom}(f)$. In addition, one can chooes the subgradient and $t$ to minimize the bound. 

I feel like the subgradient in the middle $x_t$ dotted with vector $x_2 - x_1$ might always between $x_1, x_2$ dotted with that same vector, because it's evident when you draw it out, the slope in the middle on the line segment should be in between the slow of the boundary point if the function is convex. 

**Comments**

I made the proof myself I don't know how legit it is. 

---
### **Locally Lipschitz In Higher Dimenions**

Consider $f: \mathbb R^n\mapsto \mathbb{\bar{R}}$ that is convex proper, then the function is Lipschitz continuous over a compact set $C\subseteq \text{int}\circ \text{dom}(f)$. 

$$
\begin{aligned}
   \frac{|f(x_1) - f(x_2)|}{\Vert x_2 - x_1 \Vert}
   \le \sup_{x_1, x_2\in C}L(x_1, x_2)
\end{aligned}
$$

Convex function is locally Lipschitz. 

