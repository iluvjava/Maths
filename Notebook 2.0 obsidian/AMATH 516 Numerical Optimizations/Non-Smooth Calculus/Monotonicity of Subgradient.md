The subgradient monotonicity is a natural extension to what we have in the smooth case. The following materials will be relevant: 
* [[Subgradient Intro]]
* [[Characterizing Functions for Optimizations]], the convexity parts. 
* [[../CVX Analysis/Gradient, Hessian Characterization of Convex Functions]], This one is older, but it discuss the case when the function is continuous. 

---
### **Intro**

> Let $f$ be an augmented real valued function that is convex. Suppose that there exists a line segment $[x_1, x_2]\subseteq \text{int}\circ \text{dom}(f)$, and let $x_t$ be a point in the middle parameterized by $t\in [0, 1]$, giving us: $x_t := x_1 + t(x_2 - x_1)$. Then the following statements are true: 
> $$
> \begin{aligned}
>     & \forall g_1\in \partial [f](x_1), g_2 \in \partial [f](x_2), g_t \in \partial [f](x_t)
>     \\
>     & 0 \le \langle g_1 - g_2, x_1 - x_2\rangle 
>     \\
>     & \langle g_1, x_1 - x_2\rangle \ge \langle g_t, x_1 - x_2\rangle \ge \langle g_2, x_1 - x_2\rangle
> \end{aligned}
> $$

**Remarks**:

* **Intuitive Interpretations**
  1. Intuitively, the first statement is saying that going along the direction of $x_1 - x_2$, will asserts that the gradient is also, growing in such a direction. 
  2. The second statement is saying that, the point when going along the direction of the line, it's component has a rate of change between the boundary points of the line. If in a traditional sense where the vector representing the line segment going from $x_1$ to $x_2$, then we have the inequality in reverse ordering, giving us an upper bound asserted by $\langle g_2, x_2 - x_1\rangle$, and an lower bound assert by $\langle g_1, x_2 - x_1\rangle$. 
  3. When things are smooth, this property is related to non0negativeness of the Hessian for the function. For this, see the top of the files for differential characterizations of convexity for smooth function. 

* **Interesting Consequences**: 
  1. Consider $x_1, x_2:= x_1 + \epsilon \mathbf e_i$, then the claim becomes: 
    * $\langle  \partial [f](x_1) - \partial [f](x_2), -\epsilon \mathbf e_i\rangle\ge 0$, Then it's consider: $-\epsilon (\partial[f](x_i) - \partial[f](x_2)) \ge 0$, which basically implies the monotone property: $(\partial [f](x_1))_i \le (\partial [f](x_2))_i$. Basically suggesting the upper bounding property of the ith component of the subgradient operator. 

* **Mis**
  * I think the converse of the statement is actually true. If the gradient is monotone, then the function has to be convex. 

**Proofs**: 

From the gradient inequality at the point $x_1, x_2$ we obtained lower bound for the change of objectives: 

$$
\begin{aligned}
    & f(x_1) - f(x_2) \ge \langle \partial [f](x_2), x_1 - x_2\rangle
    \\
    & f(x_2) - f(x_1) \ge \langle \partial [f](x_1), x_2 - x_1\rangle
    \\
    \implies & 
    0 \ge \langle \partial [f](x_2)  - \partial [f](x_1), x_1 - x_2\rangle
    \\
    & \langle \partial [f](x_1) - \partial [f](x_1), x_1 -x_2\rangle \ge 0
\end{aligned}
$$

Summing up 2 of the subgradient inequality, we obtain the third expression. In this case, both $\partial[f](x_1), \partial [f](x_2)$ are denoting all the possible subgradient at a given points, so it's a set. The is the Monotonicity of the Gradient Operator. To augment out proof to show the intermediate property of the subgradient, we apply the above theorem to $x_1, x_t$ and then $x_t, x_2$: 

$$
\begin{aligned}
    & \langle g_1, x_1-x_t\rangle \ge \langle g_t, x_1 - x_t\rangle \; \wedge \; 
    \langle g_t, x_t - x_2\rangle \ge \langle g_2, x_t - x_2\rangle
\end{aligned}
$$

Simply observe the fact that $(x_1 - x_t) = -t(x_2 - x_1), x_t - x_2 = (t - 1)(x_2 - x_1)$, we obtain the statement: 

$$
\begin{aligned}
    &
    \begin{cases}
        \langle g_1, -t(x_2 - x_1)\rangle \ge \langle g_t, -t(x_2 - x_1)\rangle
        \\
        \langle g_t, (t - 1)(x_2 - x_1)\rangle \ge \langle g_2, (t - 1)(x_2 - x_1)\rangle        
    \end{cases}
    \\
    [1]\implies& 
    \begin{cases}
        \langle g_1, x_1 - x_2\rangle \ge \langle g_t, x_1 - x_2\rangle
        \\
        \langle g_t, x_1 - x_2\rangle \ge \langle g_2, x_1 - x_2\rangle
    \end{cases}
    \\
    \implies&
    \langle g_1, x_1 - x_2\rangle \ge \langle g_t, x_1 - x_2\rangle \ge \langle g_2, x_1 - x_2\rangle
\end{aligned}
$$

\[1\]: We just divided by $-t, (t - 1)$ on both side of the inquality, flipping its sign and then flip it back by changing $x_2 - x_1$ into $x_1 - x_2$. 


**Source**:

It's obvious and I did it myself. For references, just take a look at the monotonicity at a course notes [UCLA Notes](http://www.seas.ucla.edu/~vandenbe/236C/lectures/subgradients.pdf) for more information. 


---
### **Heinz's Monotone Operator**
#HEINZ Proposition 9.8 in his course notes, the proof is direct, similar to what we have in [[../CVX Analysis/Gradient, Hessian Characterization of Convex Functions]]. 

