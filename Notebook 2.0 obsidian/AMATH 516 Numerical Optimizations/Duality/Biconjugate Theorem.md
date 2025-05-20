[[Convex Conjugation Introduction]]

---
### **Intro**

Convex conjugate represents the epigraph of a function via affine minorants, or basically half spaces. We use the epigraphical interpretation to prove the theorem. 

### **The Biconjugate theorem**

#### **Theorem statement**
> For any proper function we have the convex closure of the epigraph of a function is the same as the epigraph of the biconjugation of that function: 
> $$
> \text{epi}(f^{\star\star}) = \text{cl}\circ \text{cvxh}\circ \text{epi}(f)
> $$

**Proof**

The proof is direct from the results of Proposition 1, 2 from the previous file. 
Label 
* (a): Proposition 1 item (2) but with $f$ being $f^\star$ instead. 
* (b): Proposition 2. 

They give: 

$$
\begin{aligned}
    \text{epi}\; f^{\star\star} 
    &\underset{\text{(a)}}{=} 
    \bigcap_{(z, \alpha)\in \text{epi}\; f^\star} \{(x, \beta) : \beta \ge \langle z, x\rangle - \alpha\}
    \\
    &\underset{\text{(b)}}{=} \text{cl.cnvxh.epi}\; f. 
\end{aligned}
$$

The proof is now done. 