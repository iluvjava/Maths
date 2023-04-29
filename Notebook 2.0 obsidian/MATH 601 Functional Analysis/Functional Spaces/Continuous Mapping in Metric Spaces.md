[[Topology of Metric Space]], [[Convergence, Completeness in Metric Space]]

---
### **Intro**

We introduce some definitions and characterizes continuous mapping in abstract metric space. We do it from the ground up. When we talk about the distance ball, for a metric space $(X, d)$, we define: 
$$
\begin{aligned}
    \mathbb B_r(\bar x|X) &= \{x\in X| d(x, \bar x) \le r\}
    \\
    \overline{\mathbb B}_r(\bar x|X) &= \text{cl}(\mathbb B_r(\bar x|X)), 
\end{aligned}
$$

**Definition | Continuous Mapping Between Metric Space**
> Let $(X, d_X), (Y, d_Y)$ be 2 metric spaces. The mapping $T: X\mapsto Y$ is continuous at $\bar x \in X$, if, for all $\epsilon > 0$ there exists $\delta > 0$ such that whenever $d_X(x, \bar x)\le \delta$, we have $d_Y(T\bar x, Tx) \le \epsilon$. Topologically, it can be expressed as:
> $$
> \forall \epsilon > 0 \exists \delta: T \mathbb B_\delta(\bar x|X) \subseteq \mathbb B_\epsilon(T\bar x|Y). 
> $$


**Definition: Accumulation Point**
> See [[Topology of Metric Space]] for the definition there. 


---
### **Theorem | Open Sets Characterizations of Continuity**

> Let $T$ be a mapping between the metric space $(X,d_X)$ and $(Y, d_Y)$, then it's a continuous mapping if and only if for all open set $O\in Y$, we have the pre-image $T^{-1}O$ is open in $X$. 

**Proof**: 

In $\implies$, we assume that the mapping $T$ is continuous and we show that if $A\subseteq Y$ is open set then $T^{-1}A$ is an open set as well. Let $\bar x \in T^{-1}A$, by the property of open we have: 

$$
\begin{aligned}
    & \exists \epsilon >0: \mathbb B_{\epsilon}(T\bar x|Y) \subseteq A \quad \text{ By } A \text{ open}
    \\
    & \exists \delta > 0: T \mathbb B_{\delta}(\bar x|X) \subseteq \mathbb B_\epsilon(T\bar x| Y) \subseteq A \quad \text{ By continuity of } T
    \\
    \iff &
    \mathbb B_\delta(\bar x |X) \subseteq T^{-1}A, 
\end{aligned}
$$

which is the definition of $T^{-1}A$ is an open set. Otherwise for $\impliedby$ we consider a mapping whose pre-image always preserve openness of the set. To start, $\forall \epsilon > 0$, an open ball $\mathbb B_\epsilon(T\bar x|Y)$ is an open set. Let $y = T\bar x$ then we have: 
$$
\begin{aligned}
    & y\in \mathbb B_{\epsilon}(T\bar x|Y)
    \\
    \implies 
    & x\in T^{-1}y \subseteq T^{-1}B_{\epsilon}(T\bar x|Y)
    \\
    \implies 
    & x\in T^{-1}B_{\epsilon}(T\bar x|Y)
    \\
    & 
    \exists \delta > 0: 
    \mathbb B_{\delta}(\bar x| X) \subseteq T^{-1}B_{\epsilon}(T\bar x|Y), 
\end{aligned}
$$

where on the last line, we use the fact that $T^{-1}B_{\epsilon}(T\bar x|Y)$ is the pre-image of an open subset in $Y$, therefore, it's open. Combining everything together, we have recover the definition of a continuous mapping in metric space.


---
### **Examples 1 | Arc Length Linear Functional** 

We consider a linear functional applied to functions of $C^1[0, 1]$, and we show that an functional that returns the arc length, is not a continuous mapping. 

> The transformation $T: f \mapsto \int_{0}^1\sqrt{1 + (f')^2}dx$ (The arc length formula) in functional space $C^1[0, 1]$ equipped with the norm $\Vert \cdot\Vert_\infty$ is not continuous. One of the counter example one can use is this sequence of functions: 
> $$
>   \begin{aligned}
>       f_n(x) = \frac{\cos(2n\pi x)}{\sqrt{n}}
>   \end{aligned}
> $$

**Proof Priors** 
Before the proof, we establish the fact that $\sin(2n\pi x) \ge \frac{1}{\sqrt{2}}$ for all $x\in [\frac{1}{8n}, \frac{3}{8n}]$ and the fact that $f_n$ has a period of $1/n$. 



**Source**:

This is exercise 2.3 in \<A friendly approach to functional analysis\>. 


