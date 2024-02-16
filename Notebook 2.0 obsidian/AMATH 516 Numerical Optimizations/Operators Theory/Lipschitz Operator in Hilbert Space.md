- [Lipschitz Operator in Euclidean Space](Lipschitz%20Operator%20in%20Euclidean%20Space.md)
- [Strong and Weak Convergences Introduction](Strong%20and%20Weak%20Convergences%20Introduction.md)

---
### **Intro**

This file mirrors [Lipschitz Operator in Euclidean Space](Lipschitz%20Operator%20in%20Euclidean%20Space.md). 
The complications of Lipschitz operator in the Hilbert space is due to the weak convergences of sequences in Hilbert space. 
What is already stated in the Euclidean space Non-expansive operators are applicable to Hilbert space as well. 
Properties of non-expansive operators that has complications with the weak convergences are stated here separately. 
By the equivalent of weak convergence and strong convergence in Euclidean space, the theorem stated here are also applicable to non-expansive operator in Euclidean space. 
In here $X$ is a Hilbert space. 
Before we state the theorem below, we state the following facts: 

#### **Fact**
> Let $C\subseteq X$ be a closed convex nonempty set. Then the set is weakly sequentially closed. 


**Observations**

We emphasize that the set $C$ is already a closed set. 

**Remark**

The proof is not quite trivial, and it needs some technically knowledge that we don't possess yet. 
See [this](https://math.stackexchange.com/questions/739168/subspace-of-hilbert-space-is-closed-if-and-only-if-it-is-weakly-closed) stack exchange post for more information about the weak closure of conve subspaces. 



#### **Thm | Demi-Closure Principle**
> Let $T: C \mapsto X$, and $C$ is $\neq \emptyset$, closed, convex. 
> Then $x_n \rightharpoonup x$, a weak convergence sequence that satisfies $x_n - Tx_n \rightarrow \mathbf 0$, a strongly convergence sequence, then it must be that $x - Tx = 0$. 


**Observations**

The strong convergence of $x_n - Tx_n$ can be equivalently written as $\Vert x_n - Tx_n\Vert \rightarrow 0$  and $x_n \rightharpoonup Tx_n$. 

**Proof**

$$
\begin{aligned}
    0 &\le \Vert x - Tx\Vert
    \\
    &= \Vert x_n - Tx\Vert^2 - \Vert x_n - x\Vert^2 
    -2 \langle  x - Tx, x_n - x\rangle
    \\
    &= \Vert x_n - Tx_n + (Tx_n - Tx)\Vert^2 
    - 
    \Vert x_n - x\Vert^2 - 2\langle  x - Tx, x_n - x\rangle
    \\
    &= 
    \Vert x_n - T x_n\Vert^2 + 
    \Vert Tx_n - Tx\Vert^2 + 2\langle x_n - Tx_n, Tx_n - Tx\rangle
    \\
    & \quad 
    - \Vert x_n - x\Vert^2 - 2\langle x - Tx, x_n - x\rangle
    \\
    \text{non-expansive }\implies &\le 
    \Vert x_n - Tx_n\Vert + 2\langle x_n - Tx_n, Tx_n - Tx\rangle 
    - 2\langle x - Tx, x_n - x\rangle 
    \\
    \text{Cauchy inequaity}
    \implies 
    & \le 
    \Vert x_n - Tx_n\Vert + 
    \Vert x_n - Tx_n\Vert\Vert Tx_n - Tx\Vert 
    -2 \langle x - Tx, x_n - x\rangle
\end{aligned}
$$

Observe that, the term $\Vert x_n - Tx_n\Vert\rightarrow 0$ by strong convergence hypothesis. 
The term $\Vert Tx_n - Tx\Vert \le \Vert x_n - x\Vert < \infty$  by assumption that $T$ is non-expansive ans weak convergence sequence is bounded. 
Finally, the cross term approches zero by the weak convergence of $x_n \rightharpoonup x$. 


**Remarks**

If the sequence $x_n$ converges strongly, then there is no need for this theorem. 
