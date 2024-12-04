[[Subgradient Intro]]


---
### **Intro**

A subgradient is part of a normal cone at the epigraph for a function at some point. 

**Thm:**

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, consider a point where $f(x)$ is finite, then the equivalence hold.
> $$
>   v \in \hat\partial [f](x)\iff (v, -1)\in N_{\text{epi}(f)}((x, f(x)))
>$$

This theorem holds for both variational subgradient for nonconvex functions, it also holds for convex functions. 

---
### **For Convex Functions**




---
### **For Variational Subgradient**

We provide statement on the epigraphical normal cone interpretation of subgradient and we show that this is true for the variational subgradient. 

**Proof**

To show the $\implies$, we consider any $v \in \hat\partial [f](s)$, from the definition of the generalized gradient, we have: 

$$
\begin{aligned}
    & f(y) \ge f(x) + \langle v, y - x\rangle + o(\Vert y - x\Vert)
    \\
    & f(y) - f(x) \ge \langle v, y - x\rangle + o(\Vert y - x\Vert)
    \\
    & \forall \alpha \ge f(y): \alpha - f(x) \ge \langle  v, y - x\rangle + o(\Vert  y - x\Vert)
    \\
    \iff &
    \left\langle 
        \begin{bmatrix}
            v \\ - 1
        \end{bmatrix}
        ,
        \begin{bmatrix}
            y - x \\ \alpha - f(x)
        \end{bmatrix}
    \right\rangle
    \le 
    o(\Vert y - x\Vert) 
    \\
    & \text{let } (y, \alpha)\underset{\in \text{epi}(f)}{\longrightarrow} (x, f(x)), \text{ then }
    \\
    \implies &
    \begin{bmatrix}
        v\\-1
    \end{bmatrix}\in 
    T_{\text{epi}(f)}(x, f(x)).
\end{aligned}\tag{1}
$$

An element chose from the generalized gradient set will satisfies the tangent cone definition. To prove the $\impliedby$ direction, we consider any element in the form of $(v, - 1)$ that is taken from $N_{\text{epi}(f)}(x, f(x))$, and then we prove that it can serve as a subgradient. The problematic part is showing that, the little-o part of the argument can be transferred. From the definition of the normal cone we have: 

$$
\begin{aligned}
    r \ge f(x) + \langle v, y - x\rangle + o(\Vert (y, r) - (x, f(x))\Vert)
    \quad \forall r \ge f(y).
\end{aligned}\tag{2}
$$

We wish to show that $o(\Vert (y, r) - (x, f(x))\Vert)$ is indeed bounded as $(y, r)\rightarrow (x, f(x))$ inside of the set $\text{epi}(f)$. 

**Claim: Bounded Quotients**

> To argue that, we wish to first prove that the quantity $\frac{f(y) - f(x)}{\Vert y - x\Vert}$ is bounded and uniformly bounded. 

Starting with the definition of little-o: 


$$
\begin{aligned}
    \left|
        \frac{o(\Vert (y, r) - (x, f(x))\Vert)}{\Vert (y, r) - (x, f(x))\Vert} 
    \right|
    &\le \epsilon
    \\
    \implies 
    \left|
        \frac{o(\Vert (y, r) - (x, f(x))\Vert)}
        {\Vert y - x\Vert + |r - f(x)|}
    \right|
    & \le 
    \epsilon
    \\
    \text{ let }\epsilon &= 1/2
    \\
    o(\Vert (y, r) - (x, f(x))\Vert) & \ge 
    -\frac{1}{2}(
        \Vert y - x\Vert + |r - f(x)|
    ).
\end{aligned}\tag{3}
$$

substitute results obtained from (3) with results from (2), using the fact that $(y, r)\rightarrow (x, f(x))$ inside of the epigraph of $f$, when $r < f(x)$ at some point of the limit: 

$$
\begin{aligned}
    & 2r \ge 2f(x) - 2\langle v, y -x\rangle - \Vert y - x\Vert - f(x) + r
    \\
    & 
    r \ge 2f(x) + 2\langle v, y - x\rangle - \Vert y - x\Vert - f(x)
    \\
    & 
    r\ge f(x) + 2\langle v, y -x\rangle - \Vert y - x\Vert. 
\end{aligned}\tag{4}
$$

Considering the Cauchy Swartz: $\langle v, y - x\rangle \ge -\Vert v\Vert \Vert y - x\Vert$, giving us: 

$$
\begin{aligned}
    &
    r\ge f(x) + 2\langle v, y -x\rangle - \Vert y - x\Vert
    \\
    & 
    r \ge f(x) - (1 + 2 \Vert v\Vert)\Vert x - y\Vert
    \\
    \implies & 
    \underset{(y, r)\rightarrow (x, f(x))}{\lim\inf}\frac{r - f(x)}{\Vert x - y\Vert} \ge 
    \underset{(y, r)\rightarrow (x, f(x))}{\lim\inf}
    \frac{f(y) - f(x)}{\Vert x - y\Vert}
    > -\infty.
\end{aligned}\tag{5}
$$

Because in the problem statement, we assumed that the function takes finite value at $x$. Since it's true for all $r$, replacing $r$ into $f(y)$ we obtain the quotient: $\frac{f(y) - f(x)}{\Vert x - y\Vert}> -\infty$. The quotient is also bounded above. Let's consider the role of little o by considering any sequence $(y_i, r_i)\rightarrow (x, f(x))$ as $i \rightarrow \infty$ approaching the tagent point (boundary point)  in the epigraph of the function, let's also make the substitution: $\zeta_i =(y_i, r_i) - (x, f(x))$, then from (2): 

$$
\begin{aligned}
    r_i 
    &\ge 
    f(x) + \langle v, y_i - x\rangle  + o(\Vert \zeta_i\Vert)
    \\
    r_i - o(\Vert \zeta_i\Vert) 
    &\ge f(x) + \langle v, y_i - x\rangle
    \\
    \implies f(y_i) &\le f(x) + \langle  v, y_i - x\rangle
\end{aligned}\tag{6}
$$

Therefore the quotient of is also bounded above (We skip some math here and we assume that $v$ is also bounded). This is true for all $(x, f(x))\in \text{epi}(f)$ where, it exists a vector of the form $(v, -1)$ in the normal cone at the point. Because the sequence is bounded below and above, and it's uniformally bounded by the existence of a finite $(v, -1)$ from the normal cone. Therefore we may conclude: 

$$
\begin{aligned}
    & \Vert \zeta_i\Vert^2 = \Vert y_i - x\Vert^2 + |f(y_i) - f(x)|^2
    \\
    & \frac{\Vert \zeta_i \Vert^2}{\Vert y_i - x\Vert^2 }
    =
    1 + \frac{|f(y_i) - f(x)|^2}{\Vert y_i - x\Vert^2}
    \\
    \implies & 
    \frac{o(\Vert \zeta_i\Vert)}{\Vert y_i - x\Vert} = 
    \frac{o(\Vert \zeta_i\Vert)}{\Vert \zeta_i\Vert}\frac{\Vert \zeta_i\Vert}{\Vert y_i - x\Vert}
    \\
    &= \frac{o(\Vert \zeta_i\Vert)}{\Vert y_i - x\Vert}\sqrt{
        1 + \frac{|f(y_i) - f(x)|^2}{\Vert y_i - x\Vert^2}
    }
    \\
    \implies & 
    \lim_{i \rightarrow \infty}
    \frac{o(\Vert \zeta_i\Vert)}{\Vert y_i - x\Vert}\sqrt{
        1 + \frac{|f(y_i) - f(x)|^2}{\Vert y_i - x\Vert^2}
    } = 0
\end{aligned}\tag{7}
$$

Then, one can easily rewrite the conditions in (2) into the same form as a generalized subgradient. $\blacksquare$. #LATER , <mark style="background: #FF5582A6;">the proof is still unclear, we need some clarifications and better phrasing for it. </mark>

**Remarks**: 

* The regular subgradient is a convex set ([[../CVX Analysis/Convex Subgradient is Convex]] Prop 9.7, (For convex subgradient only, maybe be extended to regular subgradient)). 

* The theorem highlighted the geometric interpretations of subgradient and the generalized subgradient, and the same definition can be generalized to just Subgradient of a convex function. 

* Take note that, for functions that are more pathological than usual, it's possible that there doesn't exists any vector of the form $(v, -1)$ in the normal cone of $\text{epi}(f)$ at the point $(x, f(x))$ and in that case, the generalized subgradient is $\emptyset$. Finally, a vector that fits the format of $(v, -1)$ guarantees it to be strictly facing downwards in $\mathbb E \times \mathbb R$. One of such example where subgradient doesn't exist even inside of the domain of the function would be the non convex function $-|x|$ at the point $x = 0$.

* More importantly, when doing subgradient algebra, just bear in mind that we are dealing with a cone, which is essentially one of the simple convex sets. For how to do computations with subgradient, from simple to hardcore, see [[Subdifferentials Subgradient Computations]] for more. 

**References:**
Theorem 3.35 in Dimitri's notes, AMATH 516 materials. The proof is the same as stated there but filled up with more details.


**Comments**

The part where we chose $\epsilon = 1/2$ feels very arbitrary and inexplicable, and yet somehow it manage to give (4) which is very useful for the proof of boundless of the subderivatives of the function at that point. 
