* [Lipschitz Continuity](../Background/Lipschitz%20Continuity.md)
* [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md)
* [Subgradient and Subdifferential Definition](Subgradient%20and%20Subdifferential%20Definition.md)

---
### **Intro**

In this file we provide proof the theorem listed in: [](../CVX%20Analysis/Convex%20Functions%20Characteristics%20List.md#Continuity%20of%20Closed%20Convex%20Functions). To prove it, we need to use the lemma: [Bounded Subgradient Lemma](Bounded%20Subgradient%20Lemma.md), and recall the fact that in $\text{int}(\text{dom}(f))$, the subgradient from there is always nonempty and bounded. 

Recall that, not all convex function is Lipschitz Continuous on the closure of it's domain, but if the subgradient is bounded on all points and the function is convex, then it's Lipschitz, however the converse is not true, one of the canonical counter example is the function $-\sqrt{x}$ which is convex but it's not Lipschitz at $x = 0$. 


---
### **Lemma: Lipschitz on one Line Segment**

> Given a function $f: \mathbb R \mapsto \bar {\mathbb R}$ that is proper and proper, then the function is lipschitz continuous for every $[x_1, x_2] \subset \text{int}\circ\text{dom}(f)$. 

**Proof Summary**

We choose 3 points in the interior of the domain that a on the same line, and then we use the boundedness of the subgradient at those points, and subgradient inequality to bound the change of the function value wrt to the width of the line segment. 

**Proof 1:**

Choose any line segment $[x_1, x_2]\in \text{int}\circ\text{dom}(f)$, we then paramaterize one point $x_t$ to be on the line segment: $x_t = x_1 + t(x_2 - x_1)\;\forall t \in [0, 1]$. Consider 2 supporting hyperplane at these 2 points and any $t\in (0, 1), g_1\in \partial [f](x_1), g_2 \in \partial[f](x_2)$: 

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

The upper bound for $f(x_1), f(x_2)$ are attained via rearranging the secant line inequality at the point $x_1, x_2$, next we consider the lower bound for the quantities with any $g_t\in \partial [f](x_t)$: 

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

* The generality of the lemma is kept by treating the points and the gradient of functions at any 2 points using euclidean inner product. 

* Note, the upper boundedness depends on the point we choose, but nontheless it's bounded for points $x_1, x_2\in \text{int}\circ\text{dom}(f)$. In addition, one can choose the subgradient and $t$ to minimize the bound. 

* I feel like the subgradient in the middle $x_t$ dotted with vector $x_2 - x_1$ might always be between $x_1, x_2$ dotted with that same vector, because it's evident when you draw it out, the slope in the middle on the line segment should be in between the slow of the boundary point if the function is convex. 
	* In reply to this, it's indeed true and it's part of the monotone properties of convex subdifferential operator, see [Monotonicity of Subgradient on a Line](Monotonicity%20of%20Subgradient%20on%20a%20Line.md) for more information. To apply the theorem, we need to reconsider: $\langle g_1, t(x_1 - x_2)\rangle + \langle g_t, (1 - t)(x_1 - x_2)\rangle$ using the monotonicity of the subgradient over interior line interval: $[x_1, x_2]$. 

**Comments**

I made the proof myself I don't know how legit it is. But it's consistent with other results that I obtained. 

**Proof 2**:

Choose any line segment $[x_1, x_2]\in \text{int}\circ\text{dom}(f)$, then consider the subgradient $v_1\in \partial [f](x_1), v_2 \in \partial[f](x_2)$, we have: 

$$
\begin{aligned}
   & f(x_1) - f(x_2) \ge \langle v_2, x_1 - x_2\rangle 
   \\
   &f(x_2) - f(x_1) \ge \langle v_1. x_2 - x_2\rangle
   \\
   \implies & 
   \langle v_2, x_1 - x_2\rangle \le f(x_1) - f(x_2) \le \langle v_1, x_1 - x_2\rangle
\end{aligned}
$$
$$
\begin{aligned}
   \implies 
   \frac{|f(x_1) - f(x_2)|}{\Vert x_1 - x_2\Vert} &\le 
   \frac{\max(|\langle v_2, x_1 - x_2\rangle|, |\langle v_1, x_1 - x_2\rangle|)}{\Vert x_1 - x_2\Vert}
   \\
   & \le \max(\Vert v_1\Vert, \Vert v_2\Vert)
\end{aligned}
$$

Which gives a Lipschitz constant of: 

$$
\begin{aligned}
   L = \inf_{v_1\in \partial[f](x_1), v_2 \in \partial[f](x_2)}\max(\Vert v_1\Vert, \Vert v_2\Vert)
\end{aligned}
$$

**Remarks**

The second proof provides a bound that is tighter compare to the bound of the first one. Take note that, by choosing the $t\in [0, 1]$, I conjecture that the bound in the first proof will be the same as the bound in the second proof. 

**Comments**

This proof is better. 

---
### **Locally Lipschitz In Higher Dimensions**

Consider $f: \mathbb R^n\mapsto \mathbb{\bar{R}}$ that is convex proper, then the function is Lipschitz continuous over a compact set $C\subseteq \text{int}\circ \text{dom}(f)$. 

$$
\begin{aligned}
   \frac{|f(x_1) - f(x_2)|}{\Vert x_2 - x_1 \Vert}
   \le \sup_{\substack{x\in Q\\g\in \partial [f](x)}}\Vert g\Vert
\end{aligned}
$$

Convex function is locally Lipschitz inside of a compact subset of the interior of its domain. 

---
### **Corollary: Proper Convex function is Lipschitz in its Relative Interior**




**Source**:

Presented as Corollary 3.53 in Dimitry's Course notes AMATH 516, 2021 FALL, page: 74. 


