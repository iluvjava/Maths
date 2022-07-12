* [[Normal Cone]]
* [[Characterizing Functions for Optimizations]]
* [[Convex Sets]]

---

### **Intro**

Previous coverage of the same thing but for beginner: [[Subgradient]]. Materials take with reference from Chapter 3 of \<First Order Method for Optimizations\> by SIAM. 


**Defintion: Subgradient**

> Let $f$  be convex proper function mapping from $\mathbb E$ to $\mathbb {\bar R}$, a vector $g$ is referred to as sub-differential to the point $x\in \text{dom}(f)$ when: 
> 
> $$
>     f(y) \ge f(x) + \langle g, y - x\rangle \quad \forall y\in \mathbb E
> $$
> 
> Define the set of all Sub-gradient at $x$ to be: $\partial[f]_{x}$And when $x\not\in \text{dom}(f)$ we defined $\partial [f]_x = \emptyset$. 

**Proof**

The proof follows directly from the fact that a convex function has a convex epigraph, and using [[Strict Separations Theorem]] for convex set, one is able to separate anything in the epigraph with anything that is outside of the epigraph using elements from the subgradient $g$. $\text{epi}(f)$ is cvx and closed, if $\text{epi}(f)$ is a singleton, then $\partial[f](x) = \{(g, -1): g\in \mathbb E\}$. Otherwise, $\text{epi}(f)$ is not singleton. Since the set is convex, by strict separation we have: 

$$
\begin{aligned}
    & \forall (y, \beta) \not\in \text{epi}(f)\; 
    \exists (x, f(x)) \in \text{bd}\circ \text{epi}(f), g\in \partial [f](y):
    \\
    &
    \langle (y, \beta), (g, -1)\rangle \le \delta \le \langle (g, -1), (x, f(x))\rangle
    \\
    & 
    \langle y, g\rangle - \beta \le \langle g, x\rangle - f(x)
    \\
    & 
    \langle g, y - x\rangle - \beta \le -f(x)
    \\
    & 
    f(x) \ge \beta + \langle g, x - y\rangle
    \\
    &
    (y, \beta)\not \in \text{epi}(f) \implies \beta \le f(y)
    \\
    \implies & 
    f(x) \ge f(y) + \langle g, x - y\rangle
\end{aligned}
$$

Which demonstrates the geometric interpretations for the subgradient of a convex function. 



**Remarks**

The definition in this case is not consistent with the definition of gradient of smooth function when $f$ nonconvex. To mitigate this, below is another definition of subgradient and **subdifferential** that generalize the idea to nonconvex, non-smooth functions. 

Geometrically, it's looking for a point that is on the boundary of $\text{epi}(f)$ and then separate the graph using a line defined via $g$. And if such a line is perpendicular, then there is no subgradient for the function for that point. And for all seriousness, it can happen convex function at the exterior of their domain. 

For convenience of notation, one has the choice of writing the definition of subgradient directly with: 

$$
\begin{aligned}
    f(y) \ge f(x) + \langle \partial[f]_x,y - x\rangle
\end{aligned}
$$

And that is enough to understand what people are saying. 

**Definition: Generalized Gradient**

> Let $f$ be $\mathbb E \mapsto \mathbb{\bar R}$, let $g$ be part of the sub-gradient, and let $x\in \text{dom}(f)$, then: 
> 
> $$
> \begin{aligned}
>     f(y) \ge f(x) + \langle g, y - x\rangle + o(\Vert y - x \Vert) \quad \forall y \in \mathbb E
> \end{aligned}
> $$
> 
> And if $x\not\in \text{dom}(f)$, then there is no gradient, and we define the set of generalized **subdifferential** to be the set of all sub-gradient, noted as: $\bar\partial[f]_x$. 

Where the little $o$ notation is a limit in disguise, in this case it has the property: $\lim_{x \rightarrow \infty}\frac{o(\Vert y - x\Vert)}{\Vert y - x\Vert} = 0$. 

**Remarks:**

The supporting tagent line is now only a limiting behaviors for the given function, and now it's consistent with the gradient definition for ordinary smooth function. In fact, I will state my opinions here without proof: 

$$
\partial [f](x)\subseteq\bar{\partial}[f](x) 
$$

Is true for the above definition. Whenever it's not mentioned whether $f$ is convex or not, please stick with the second definition regardless whether there is a bar or not. 

Regardless of the fact that it's called the generalized gradient, the function $-|x|$ doesn't have generalized gradient at the point $x = 0$. 


---
### **Notations**

A good notations should be clear about several things when taking the derivative of a function: 
* What variables are we raking the derivtive with? 
* What varlues are we putting into the derivative functions? 

For example: $\partial [f(Ax + b, u)](u = x^+), \partial [f(Ax + b, u)]_{u = x^+}$: Taking the derivative of $f$ wrt to $u$ at the point $x^+$. This notation is adopted by me because it's much clearer compare to some of the textbooks out there. 


---
### **Optimality on Sub-Gradient for Convex Functions**

On almost trivial results from the above definition is that if $x^+$ is a minimizer for the convex function $f(x)$, then $\mathbf 0 \in \partial [f]_{x^+}$ because: 

$$
f(y) \ge f(x^+) \quad \forall y\in \mathbb E
$$

And it can be viewed that $g = \mathbf 0$, directly interpreted from the definition of the subgradient. 

---
### **Normal Cone and Generalized Subgradient**

**Theorem Statement:**

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, consider a point where $f(x)$ is finite, then the equivalence hold.
> $$
>   v \in \overline\partial [f](x)\iff (v, -1)\in N_{\text{epi}(f)}(x, f(x))
>$$

**Proof**

To show the $\implies$, we consider any $v \in \overline\partial [f](x)$, from the definition of the generalized gradient, we have: 

$$
\begin{aligned}
    & f(y) \ge f(x) + \langle v, y - x\rangle + o(\Vert y - x\Vert)
    \\
    & f(y) - f(x) \ge \langle v, y - x\rangle + o(\Vert y - x\Vert)
    \\
    & \forall \alpha \ge f(y):
    \\
    & \alpha - f(x) \ge \langle  v, y - x\rangle + o(\Vert  y - x\Vert)
    \\
    \implies &
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
    \implies &
    \begin{bmatrix}
        v\\-1
    \end{bmatrix}\in 
    T_{\text{epi}(f)}(x, f(x))
\end{aligned}\tag{1}
$$

AN element chose from the generalized gradient set will satisfies the tengent cone defintion. To prove the $\impliedby$ direction ,we consider any element in the form of $(v, - 1)$ that is taken from $N_{\text{epi}(f)}(x, f(x))$, and then we prove that it can serve as a subgradient. The problematic part is showing that, the small o part of the argument can be transferred. From the definition of the normal cone we have: 

$$
\begin{aligned}
    r \ge f(x) + \langle v, y - x\rangle + o(\Vert (y, r) - (x, f(x))\Vert)
    \quad \forall r \ge f(y)
\end{aligned}\tag{2}
$$

We wish to show that $o(\Vert (y, r) - (x, f(x))\Vert)$ is indeed bounded as $(y, r)\rightarrow (x, f(x))$ inside of the set $\text{epi}(f)$. To argue that, we wish to first prove that the quantity $\frac{f(y) - f(x)}{\Vert y - x\Vert}$ is bounded and uniformally bounded. Starting with the defintion of boundedness: 

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
    )
\end{aligned}\tag{3}
$$

Continuing with results obtained from (3) with results from (2) we have: 

$$
\begin{aligned}
    & 2r \ge f(x) - 2\langle v, y -x\rangle - \Vert y - x\Vert - f(x) + r
    \\
    & 
    r \ge 2f(x) + 2\langle v, y - x\rangle - \Vert y - x\Vert - f(x)
    \\
    & 
    r\ge f(x) + 2\langle v, y -x\rangle - \Vert y - x\Vert
\end{aligned}\tag{4}
$$

Considerin the Cauchy Swartz: $\langle v, y - x\rangle \le \Vert v\Vert \Vert y - x\Vert$, giving us the results $2\langle v, y - x\rangle\le 2 \Vert v\Vert \Vert y-x\Vert$, giving us: 

$$
\begin{aligned}
    &
    r\ge f(x) + 2\langle v, y -x\rangle - \Vert y - x\Vert
    \\
    & 
    r \ge f(x) - (1 + 2 \Vert v\Vert)\Vert x - y\Vert
    \\
    \implies & 
    \lim  \frac{r - f(x)}{\Vert x - y\Vert} > -\infty
\end{aligned}\tag{5}
$$

Since it's true for all $r$, replacing $r$ into $f(y)$ we obtain the quotient: $\frac{f(y) - f(x)}{\Vert x - y\Vert}> -\infty$. The quotient is also bounded above. Let's consider the role of little o by considering any sequence $(y_i, r_i)\rightarrow (x, f(x))$ as $i \rightarrow \infty$ approaching the tagent point (boundary point)  in the epigraph of the function, let's also make the substitution: $\zeta_i =(y_i, r_i) - (x, f(x))$, then from (2): 

$$
\begin{aligned}
    & r_i \ge f(x) + \langle v, y_i - x\rangle  + o(\Vert \zeta_i\Vert)
    \\
    & r_i - o(\Vert \zeta_i\Vert) \ge f(x) + \langle v, y_i - x\rangle
    \\
    \implies & f(y_i) \le f(x) + \langle  v, y_i - x\rangle
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

Then, one can easily rewrite the conditions in (2) into the same form as a generalized subgradient. $\blacksquare$



**Source**
Theorem 3.35 in Dimitry's notes, AMATH 516 materials. 

**Remarks**: 

The theorem highlighted the geometric interpretations of subgradient and the generalized subgradient. Take note that, for functions that are more patheological than usual, it's possible that there doesn't exists any vector of the form $(v, -1)$ in the normal cone of $\text{epi}(f)$ at the point $(x, f(x))$ and in that case, the generalized subgradient is $\emptyset$. Finally, a vector that fits the format of $(v, -1)$ garantees it to be strictly facing downwards in $\mathbb E \times \mathbb R$. 

More importantly, when doing subgradient algebra, just bear in mind that we are dealing with a cone, which is essentially one of the simple convex sets. For how to do computations with sugradient, from simple to hardcore, see [[Computations of Subdifferentials]] for more. 

**Comments**

The part where we chose $\epsilon = 1/2$ feels very arbitrary and inexplicable, and yet somehow it manage to give (4) which is very useful for the proof of boundless of the subderivatives of the function at that point. 


---
### **Corollary: Genrealized Subgradient to Subgradient Inequality for Convex Functions**

> If $f$ is convex, then the general subgradient definiton degraded to the ordinary subgradient definiton. 
> $$
>   f(y) \ge f(x) + \langle g, y - x\rangle \; \forall g \in \bar\partial [f](x)
> $$

**Proof**




**Source**: Exercise 3.36 in Dimistry's Textbook, back in Fall 2021 UW, for AMATH 516. 






