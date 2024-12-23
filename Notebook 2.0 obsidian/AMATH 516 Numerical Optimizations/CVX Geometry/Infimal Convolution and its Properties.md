- [[Convexity Preserving Operations for Functions]]
- [[../Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications]]

---
### **Intro**

We introduce the idea that, infimal convolutions can be interpreted as epigraph addition under certain conditions, and, it preserves smoothness of the functions, if one of the function is smooth. We also discuss the dual of the infimal convolutions. These results are non-trivial and play important roles. 

#### **Def-1 | Pair wise infimal Convoltuion**
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

This particular interpretations allows for generalization of infimal convolution to a set of $n$ functions: $h_1, h_2, \cdot, h_n$: 

$$
\begin{aligned}
    (h_1\square h_2 \square \cdots \square h_n)(x) = 
    \inf\left\lbrace
        \sum_{i = 1}^{n}h(z_i) \left|
            \sum_{i = 1}^{n} z_i = x
        \right.
    \right\rbrace. 
\end{aligned}
$$

**Remarks**

Stated in 2.3.2 in Amir Beck's First Order method book, convexity is not assumed for either $h_1, h_2$. 

#### **Thm-1 | Epigraph of Infimal Convolutions is Epigraphical Additions**
> The epigraph of the infimal convolutions is equivalent to convoluting the epigraph of the function. Let $f, g$ be convex mapping from $\mathbb E$ to $\mathbb{\bar R}$, and $(f\square g)(x) = \min_{y}(f(y) + g(x - y))$, then 
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

Therefore we showed that $\text{epi}(f\square g)(x)\subseteq \text{epi}(f) + \text{epi}(g)$. 

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
The only problem in the proof is the $\subseteq$ direction where the minimizer of the infimal convoltuion between $f, g$ is $y^+$ is assumed to exist, but it's unclear why such assumption can be made. 

I don't think the closure of epigraph is preserved after addition operations. 
A lot remains to be said. 
This theorem is not completely correct yet. 

#### **Thm-2 | Preservation of Convexity Over Infimal Convolution**

> Let $h_1$ be a *convex proper augmented real function* and let $h_2$ be a *convex real-valued function*, then their infimal convolution is a convex function. 

**Proof**

See Corollaries for convexity preservations of partial minimizations of 2 functions in [Convexity Preserving Operations for Functions](Convexity%20Preserving%20Operations%20for%20Functions.md), the proof is there. 

**Remarks**

This is theorem 2.19 in Amir Beck's First Opt book, 2.3.2. 
The closure of the epigraph is not assured. 
The resulting function may not be a Lower semi-continuous convex function. 


#### **Thm | Conjugate of Infimum Convolution**
> 


**Remarks**

Stated as proposition 21.1 in Heinz's Course notes for convex optimizations. 
Or just read Convex Analysis from Rockafellar, theorem 16.4. 