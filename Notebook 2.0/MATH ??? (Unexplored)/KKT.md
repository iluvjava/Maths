[[MinMax MaxMin Lemma]]

---
### **Intro**

KKT: Karush–Kuhn–Tucker conditions
Wiki: [here](https://en.wikipedia.org/wiki/Karush%E2%80%93Kuhn%E2%80%93Tucker_conditions). 


Consider Optimization Problem that takes the following form: 

$$ 
\begin{cases}
    \min_x f(x)    &
    \\
    s.t: & g_i(x) \le 0 \quad\forall i \in [k]
    \\
    g_i (x) = 0 & \quad i = k + 1, \cdots,  m
\end{cases}
$$

This formulations is a generalization of the Fenchel-Rockafellar Duality. It's a minimization problem of objective functon $f(x)$, m constraints function $g_i(x)$, both equality and inequality constraints are presented here. We assume that $f:\mathbb{R}^n\mapsto \overline{\mathbb{R}}$ is proper and $g_i(x) \mathbb{R}^n\mapsto\mathbb{R}$. 



#TODO 