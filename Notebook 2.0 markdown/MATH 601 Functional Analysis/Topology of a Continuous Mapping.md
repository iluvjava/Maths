[Banach Space Introduction](Functional%20Spaces/Banach%20Space%20Introduction.md), [Real Analysis Basics](../MATH%20000%20Math%20Essential/Analysis/Real%20Analysis%20Basics.md), 

---
### **Intro**

A continuous mapping is similar to a function that is continuous for the real number. Prior to the definition of continuity, a sense of distance will have to be created, and hence we use Banach space, a space that is equipped with some types of norm denoted as $\Vert \cdot\Vert$.

**Definition**: 
> similar to the definition of a continuous function, let $T$ be a continuous mapping from $X$ to $Y$ where both is a Banach space, then $T$ is continuous at $\bar x\in X$ if: 
> $$
> \forall \epsilon > 0\; \exists \; \delta: \Vert x - \bar x\Vert\le \delta \implies \Vert T(x) - T(\bar x)\Vert \le \epsilon
> $$

**Makes it Fancier**

Sometimes we consider representing the definition in a fancier way. We now consider function $f$ accepting a set of input and transform it into another set of output in the range of the function. Define $\mathbb B_r(x)$ to be the epsilon ball around a point $x$ that is $r$ distance way wrt the underlying metric space that we are looking at. Taking up this glasses, we have the following definition for a continuous mapping in a metric space: 

> The mapping $f:X\mapsto Y$ in metric space is continuous at the point $\bar x \in X$ if: 
> $$
> \begin{aligned}
>     \forall \epsilon > 0 \;\exists\; \delta_\epsilon: 
>     \mathbb B_{\delta_\epsilon}(\bar x|X) \subseteq \mathbb B_\epsilon (f(\bar x)|Y), 
> \end{aligned}
> $$
> where the $\mathbb B_{\delta_\epsilon}(\bar x|X)$ are the $\delta_\epsilon$ ball around input $\bar x$ in input space $X$, and $\mathbb B_{\epsilon}(f(\bar x)|Y)$ is the epsilon ball around the output of the function at point $\bar x$. 

which states that the epsilon ball around intput $\bar x$ is bounded by the paramaterized $\delta_\epsilon$ such that in the output range, it's within the output $\epsilon$ ball around $f(\bar x)$. 


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

---
### **Theorem: Pre-image Preserves Openness of Sets**

For background about topology, see [Topological Basics for Optimizations](../AMATH%20516%20Numerical%20Optimizations/Background/Topological%20Basics%20for%20Optimizations.md). This topological definition defines continuity for mapping between metric spaces.

> The mapping $T:X\mapsto T$ is continuous on $X$ if and only if $T^{-1}O\subseteq X$ is open whenever $O\subseteq Y$ is open. 

**Proof**

Suppose that $T$ is continuous, we show that $T^{-1}O$ is an open set for any $O\subseteq X$, we then show that the openness of the set is preserved. Take $y\in O$ then for all epsilon region $\mathbb B_\epsilon(y|Y)$ there exists delta region $\mathbb B_{\delta_{\epsilon}}f^{-1}(y)$ such that $f\mathbb B_{\delta_{\epsilon}}(f^{-1}(y))$ is within the epsilon ball. 

Next suppose that the set $f^{-1}O$ is an open set then for any $x\in f^{-1}O$, we have $\delta > 0$ delta region that exists: $\mathbb B_{\delta}(x|X)\in f^{-1}O$, which would mean that $f_\delta(x|X)\in O$ by definition of pre-image of the function. Therefore the set $O$ is an open set. 

**Examples and Stuff**

#UNFINISHED. 


---
### **Accumulation Point of a Set**

> $x$ is an accumulation point to the subset $A\subseteq X$ if, for every point in $A$, there exists some other point that the point $x$ itself. Mathematically phrased as: 
> $$
> \bar X \in X \subseteq M\ \text{ is accmul point when } \forall \epsilon > 0, (\mathbb B_\epsilon(\bar x)\setminus \{\bar x\})\cap A\neq\emptyset
> $$




