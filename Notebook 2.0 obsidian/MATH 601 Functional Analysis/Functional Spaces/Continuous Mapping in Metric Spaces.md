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

**Definition: Continous Mapping Between Metric Space**
> Let $(X, d_X), (Y, d_Y)$ be 2 metric space. The mapping $T: X\mapsto Y$ is continous at $\bar x \in X$, if, for all $\epsilon > 0$ there exists $\delta > 0$ such that whenever $d_X(x, \bar x)\le \delta$, we have $d_Y(T\bar x, Tx) \le \epsilon$. Topologically, it can be expressed as:
> $$
> \forall \epsilon > 0 \exists \delta: T \mathbb B_\delta(\bar x|X) \subseteq \mathbb B_\epsilon(T\bar x|Y). 
> $$


**Definition: Accumulation Point**
> See [[Topology of Metric Space]] for the definition there. 


---
### **Theorem: Metric Ball Characterization of Continuity**

> Let $T$ be a mapping between the metric space $(X,d_X)$ and $(Y, d_Y)$, then it's a continous mapping if and ony if for all open set $O\in Y$, we have the pre-image $T^{-1}O$ is open in $X$. 

