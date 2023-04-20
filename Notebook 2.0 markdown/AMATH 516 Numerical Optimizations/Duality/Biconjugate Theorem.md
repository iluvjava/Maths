[Convex Conjugation Introduction](Convex%20Conjugation%20Introduction.md)

---
# **Intro**

Convex conjugate represents the epigraph of a function via affine minorants, or basically half spaces. We use the epigraphical interpretation to prove the theorem. 

### **Theorem Statement**

> For any proper function we have the convex closure of the epigraph of a function is the same as the epigraph of the biconjugation of that function: 
> $$
> \text{epi}(f^{\star\star}) = \text{cl}\circ \text{cvxh}\circ \text{epi}(f)
> $$


---
# **Proof**

Recall the fact that the epigraph of $f^\star$ consists of all the affine functions that are below the epigraph of $f$. Giving us the following description of the epigraph of $f$: 

$$
\begin{aligned}
    \text{epi(f)} \subseteq
    \bigcap_{(y, \alpha)\in \text{epi}(f^\star)}\{(x, \beta): \beta \ge \langle y, x\rangle - \alpha\}
\end{aligned}
$$

To show $\supseteq$, we consider choosing an element from the RHS and show a contradiction by claiming it to be $\not\in \text{epi}(f)$. For contradiction, there exists $(y, \beta) \in \text{epi}(f), (x, \alpha) \in \text{epi}(f)$ such that we have: 

$$
\begin{aligned}
    & \alpha < \langle y, x\rangle - \beta
    \\
    & \alpha \ge f^\star(y), \beta \ge f(x)
    \\
    \implies & 
    f^\star(y) \le \langle y, x\rangle -\beta < \langle y, x\rangle + f(x)
\end{aligned}
$$

Which is a contradiction to the definition of conjugate function because conjugate function $f^\star(y) = \sup_{x}\{\langle y, x\rangle - f(y)\}$. $\blacksquare$.


#INCORRECT, #UNFINISHED, the proof is not finished for the theorem yet. 

**Remarks**

Leverage the geometric interpretations that the epigraph of the convex conjugate encodes information about the normals and the offsets of all the supporting halfspaces for the epigraph of the original functions. 