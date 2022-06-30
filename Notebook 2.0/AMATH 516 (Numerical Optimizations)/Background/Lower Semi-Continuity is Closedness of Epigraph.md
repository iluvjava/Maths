* [[Topological Basics for Optimizations]]

---
**Theorem: Closed Epigraph**

> The epigraph of a function is closed iff the function is lower-semi-continuous. 

See [[Lower Semi-Continuous]] for its definition. 

**Proof**:

$\impliedby$: Suppose that $f$ is lower semi-continuous then by definition, for any $x\in \text{dom}(f)$: 

$$
\begin{aligned}
    \forall x \in \text{dom}(f): \lim_{\epsilon \rightarrow 0}\left\lbrace
        \inf_{y\in \mathbb B_\epsilon(x)\setminus \{x\}} f(y)
    \right\rbrace \ge f(x)
\end{aligned}
$$

Firstly, under the case where $\text{dom}(f)$ is a singleton, then the statement is trivially true. Both way. Consider the case where $\text{dom}(f)$ is a both way directions, then consider any sequence $y_n$ converging to $x$: 

$$
\begin{aligned}
    & \forall \epsilon > 0\exists N_{\text{dom}}, N_\epsilon \forall m > \max(N_\text{dom}, N_\epsilon): y_m \in \text{dom}(f) \wedge y_m\in \mathbb B_\epsilon(x)
    \\
    \implies &
    \forall \alpha_m \ge y_m: 
    \begin{bmatrix}
        \alpha_m\\y_m
    \end{bmatrix} \in \text{epi}(f) 
\end{aligned}
$$

The frist line asserts a certain choice of $m$ such that it puts the sequence $y_n$ into the domain of $f$ and insdie of any epsilon ball around $x$. Revising the definition of lower semi-continuity, we have: 

$$
\begin{aligned}
    & \alpha_m \ge \inf_{n\ge m}\{\alpha_n\}
    \ge 
    \inf_{n\ge m}\{f(x_n)\} 
    \ge f(x)
    \\
    \implies & 
    \lim_{\epsilon \rightarrow \infty}
    \begin{bmatrix}
        \alpha_m \\ y_m
    \end{bmatrix} \in \text{epi}(f)
\end{aligned}
$$

For the proof direction $\implies$, we use contraposition, and it's not hard to modify the above statement to find a sequence of points whose limit is not in $\text{epi}(f)$, proving the set is not closed. 


---
### **Applications**
See [[Existence of a Minimizer]]. 