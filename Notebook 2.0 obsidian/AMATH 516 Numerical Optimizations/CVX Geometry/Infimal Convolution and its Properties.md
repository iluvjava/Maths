- [[Convexity Preserving Operations for Functions]]
- [[../Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications]]

---
### **Intro**

We introduce the idea that, infimal convolutions can be interpreted as epigraph addition under certain conditions, and, it preserves smoothness of the functions, if one of the function is smooth. We also discuss the dual of the infimal convolutions. These results are non-trivial and play important roles. 

#### **Def-1 | Pair wise infimal Convolution**
> Let $h_1, h_2 : \mathbb E \mapsto \mathbb {\overline R}$ be 2 proper functions, then the infimal convolution is defined as 
> $$
>   (h_1\square h_2)(x) = \inf_{u \in \mathbb E}\{h_1(u) + h_2(x - u)\}.  
> $$

**Observations**

Equivalently 

$$
\begin{aligned}
    (h_1 \square h_2)(x) = \inf
    \left\lbrace
        h(z_1) + h(z_2) : z_1 + z_2 = x
    \right\rbrace.
\end{aligned}
$$

This particular interpretations allow for generalization of infimal convolution to a set of $n$ functions: $h_1, h_2, \cdot, h_n$: 

$$
\begin{aligned}
    (h_1\square h_2 \square \cdots \square h_n)(x) = 
    \inf\left\lbrace
        \sum_{i = 1}^{n}h(z_i) 
        \left|\; 
            \sum_{i = 1}^{n} z_i = x
        \right.
    \right\rbrace. 
\end{aligned}
$$

**Remarks**

Stated in 2.3.2 in Amir Beck's First Order method book, convexity is not assumed for either $h_1, h_2$. 

#### **Thm-1 | Epigraph of Infimal Convolutions is Epigraphical Additions**
> The epigraph of the infimal convolutions is equivalent to convolution the epigraph of the function. Let $f, g$ be convex mapping from $\mathbb E$ to $\mathbb{\bar R}$, and $(f\square g)(x) = \min_{y}(f(y) + g(x - y))$, then 
> $$
>     \text{epi}(f\square g) = \text{epi}(f) + \text{epi}(g) . 
> $$

**Proof**

Choose any $(x, r)\in \text{epi}(f\square g)\implies \min_{y}\{f(y) + g(x - y)\}\le r$, assume $\exists y^+\in \arg\min_y\{f(y) + g(x - y)\}$. 
Set $r = \delta + r_f + r_g$ where $\delta \ge 0$, consider: 
$$
\begin{aligned}
    & f(y^+) + g(x - y^+) \le r
    \\
    & f(y^+) \le r_f = f(y^+) \implies (y^+, r_f)\in \text{epi}(f)
    \\
    & g(x - y^+) \le r_g = g(x - y^+) \implies (x - y^+, r_g)\in \text{epi}(g)
\end{aligned}
$$

We can represent the point $(x, r)$ is represented  as the sum of 2 points from the epigraph of $f, g$ individually. 
To do that, because $r = \delta + r_f + r_g$ where $\delta \ge 0$, we may have: 

$$
\begin{aligned}
    & (x, r) = (y^+ + (x - y^+), 0.5\delta + r_f + 0.5\delta + r_g), 
    \\
    & \text{and: } (y^+, r_f + 0.5\delta)\in \text{epi}(f), (x - y^+, 0.5\delta + r_g)\in \text{epi}(g)
    \\
    \implies & (x, r)\in \text{epi}(f) + \text{epi}(g). 
\end{aligned}
$$

Therefore, we showed that $\text{epi}(f\square g)(x)\subseteq \text{epi}(f) + \text{epi}(g)$. 

For the other direction, we consider two points: $(x_1, r_f)\in \text{epi}(f), (x_2, r_g)\in \text{epi}(g)$. 
Let $x = x_1 + x_2$, so that $x_2 = x - x_1$, giving us $(x - x_1, r_f)\in \text{epi}(g)$ so that: 

$$
\begin{aligned}
    & r_f + r_g \ge f(x_1) + g(x - x_1) \ge \inf_y\{f(y) + g(x - y)\} = (f\square g)(x)
    \\
    \implies & (x_1 + x_2, r_g + r_f) = (x, r_f + r_g)\in \text{epi}(f\square g).
\end{aligned}
$$

Therefore, for any 2 elements from the epigraph of each of $f, g$, their sum is one of the element from the epigraph of $f\square g$. 


**Remarks**

I made the proof myself, and there might be cooler and better way to prove it. This is from Dimitri's In person Lecture, and homework assignment. 
The only problem in the proof is the $\subseteq$ direction where the minimizer of the infimal convolution between $f, g$ is $y^+$ is assumed to exist, but it's unclear why such assumption can be made. 

I don't think the closure of epigraph is preserved after addition operations. 
A lot remains to be said. 
This theorem is not completely correct yet. 

#### **Thm | Infimal convolutions rules (Rockafellar's version)**
> Let $f_1, f_2, \cdots, f_m$ to be a list of proper, convex functions. 
> Then 
> $$
> \begin{aligned}
>     (f_1\square f_2\square \cdots \square f_m)^\star 
>     &= 
>     (f^\star_1 + f^\star_2 + \cdots + f_m^\star),
>     \\
>     (
>         \text{cl}\;f_1 \square \cdots \square 
>         \text{cl}\;f_m
>     )^\star
>     &= 
>     \text{cl}(f_1^\star \square \cdots \square f^\star_m). 
> \end{aligned}
> $$
> If the sets $\text{ri.dom}(f_i)$ for all $i = 1, \cdots, m$ have a point in common, the closure operation in the second equality can be removed and the infimum can be obtained so for any $x^*\in \text{dom}[f_1 + \cdots + f_m]^\star$ there exists $x$ and $x_1, \cdots, x_m = x$ such that: 
> $$
> \begin{aligned}
>     (f_1 + \cdots + f_m)^\star(x^*) &= 
>     \inf_{z_1^*, \cdots, z_m^*}\left\lbrace
>         f_1(z^*_1) + \cdots + f_m(z^*_m) |\;
>         z_1^* + \cdots + z_m^* = z^*
>     \right\rbrace
>     \\
>     &= f_1(x_1^*) + \cdots + f_m(x_m^*).
> \end{aligned}
> $$

**Proof**

The second equality is easier to prove and doesn't require the regularity conditions of the intersection of the relative interior on the domain of the list of functions. 

$$
\begin{aligned}
    
\end{aligned}
$$


**Remark**

Theorem taken as Theorem 16.4 in Rockafellar's convex analysis textbook. 
Recall that the closure of a convex function is just taking the closure of the epigraph of the convex funtion, and it's equivalent to lower semi-continuity. 


#### **Thm-2 | Preservation of Convexity Over Infimal Convolution**

> Let $h_1$ be a *convex proper augmented real function* and let $h_2$ be a *convex real-valued function*, then their infimal convolution is a convex function. 

**Proof**

See Corollaries for convexity preservations of partial minimization of 2 functions in [Convexity Preserving Operations for Functions](Convexity%20Preserving%20Operations%20for%20Functions.md), the proof is there. 

**Remarks**

This is theorem 2.19 in Amir Beck's First Opt book, 2.3.2. 
The closure of the epigraph is not assured. 
The resulting function may not be a Lower semi-continuous convex function. 

#### **Thm | Infimal convolution of the support function**


**Remarks**

See [Support Function](../CVX%20Analysis/Support%20Function.md) for more about support function in convex analysis. 

#### **Thm | The conjugate sum rule (Moducovich's version)**
> Let $f, g: \R^n\rightarrow \overline \R$ be convex, lsc, and proper. 
> Let any of the following conditions be satisfied: 
> 1. There exists $\bar x \in \text{dom}\; f \cap \text{dom}\; g$ such that $f$ is continuous at $\bar x$, or $g$ is continuous at $\bar x$. 
> 2. The relative interior of the domain intersects: $\text{ri.dom}\;f \cap \text{ro.dom}\; f \neq \emptyset$. 
> 
> Then we have the conjugate sum rule: 
> $$
> \begin{aligned}
>     (\forall x^* \in \R^n) \quad 
>     [f + g]^\star (x^*) = [f^\star \square g^\star](x^\star). 
> \end{aligned}
> $$
> Moreover, the infimum in $[f^\star \square g^\star]$ is attained. 
> So for any $x^*\in \text{dom}\;f^\star \cap \text{dom}\; g^\star$, there exists vector $x_1^*, x_2^*$ such that $x_1^* + x_2^* = x^*$ for which 
> $$
> \begin{aligned}
>     [f + g]^\star(x^*) = f^\star(x^*_1) + g^\star(x^*_2). 
> \end{aligned}
> $$

**Proof**

The proof is rather long. 
Showing $(f + g)^\star(x^*) \ge [f^\star + g^\star](x^*)$ for all $x^* \in \text{dom}\; ([f + g]^\star)$. 
Fix any $x_1^*, x_2^* \in \R^n$, let $x^* = x_1^* + x_2^*$. 
By definitions, it gives the chain of inequalities: 

$$
\begin{aligned}
    f^\star(x_1^*) + g^\star(x_2^*) &= 
    \sup_{z\in \R^n}
    \left\lbrace
        \langle z, x_1^*\rangle - f(z)
    \right\rbrace
    + 
    \sup_{z \in \R^n}
    \left\lbrace
        \langle z, x_2^*\rangle - g(z)
    \right\rbrace
    \\
    &\ge 
    \sup_{z \in \R^n}
    \left\lbrace
        \langle z, x_1^*\rangle + \langle z, x_2^*\rangle
        - [f + g](z)
    \right\rbrace 
    \\
    &= 
    \sup_{z \in \R^n}
    \left\lbrace
        \langle z, x_1^* + x_2^*\rangle
        - [f + g](z)
    \right\rbrace 
    \\
    &= [f + g]^\star(x_1^* + x_2^*). 
\end{aligned}
$$

Since this is true for any $x_*$, taking the infimum on both side gives: 

$$
\begin{aligned}
    \inf \left\lbrace
        f^\star(x_1^*) + g^\star (x_2^*) \left| 
            x_1^* + x_2^* = x^*
        \right.
    \right\rbrace &= 
    [f^\star \square g^\star](x^*) 
    \ge [f + g]^\star(x^*). 
\end{aligned}
$$

And hence the easier direction is now proved. 
The harder direction is to show that $[f^\star\square g^\star](x^*) \le [f + g]^*(x^*)$ for all $x^* \in \text{dom}([f + g]^\star)$. 
We start with the definition of taking the conjugate of $[f + g]$. 
Fix any $x \in \text{dom}[f + g]^\star$. 

$$
\begin{aligned}
    [f+ g]^\star(x^*) 
    &= 
    \sup_{z \in \R^n}\left\lbrace
        \langle z, x^*\rangle - 
        [f + g](z)
    \right\rbrace
    \\
    &=
    \sup_{z\in \R^n}
    \left\lbrace
        \langle z, x^*\rangle - f(z) - g(z)
    \right\rbrace
    \\
    &= 
    \sup_{}
    \left\lbrace
    \left.
        \left\langle \begin{bmatrix}
           z\\ -1 \\ -1
        \end{bmatrix}, 
        \begin{bmatrix}
            x^* \\ f(z) \\ g(z)
        \end{bmatrix}
        \right\rangle
    \right| z \in \text{dom}\; f \cap \text{dom}\; g
    \right\rbrace. 
\end{aligned}
$$


**Proof (Rockafellar's Approach)**





**Remarks**

1. Stated as proposition 21.1 in Heinz's Course notes for convex optimizations. 
2. Convex Analysis from Rockafellar, theorem 16.4. 
3. Theorem 4.27, Modocovich's Convex analysis and beyond. 

This theorem provides a way to go from the conjugate of the sum to the sum of the conjugates. 
This theorem is instrumental for formulating the sum of convex subgradient. 