---
alias: Nonexpansive Operator in Hilbert Space

---
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
See [this](https://math.stackexchange.com/questions/739168/subspace-of-hilbert-space-is-closed-if-and-only-if-it-is-weakly-closed) stack exchange post for more information about the weak closure of convex subspaces. 

---
### **Some Weird Things Regarding Weak Convergence in Hilbert Space**

The limit of a weak converging sequence when put into a continuous mapping in the Hilbert space, may not be the same as putting the limit into the continuous mapping directly. 
Consider the following example. 

#### **Example | Continuity doesn't Preserve Weak Limits**
> Consider $C$ to be the closed unit norm ball in Hilbert space $\mathcal H$. 
> Consider the sequence $x_n = e_0 + e_n$. 
> We starts indexing at zero. Let $P_C$ be the projection onto the set $C$, then it would be a Lipschitz operator in Hilbert space hence continuous. 
> Then $x_n \rightharpoonup x$, but $P_Cx_n$ doesn't converges weakly to $P_C x$ the weak limit. 

**Demonstrations**

Observe that $\lim_{n\rightarrow \infty} \e_0 + \e_n$ has weak limit $\e_0$ because $\e_n$ has weak limit $\mathbf 0$.  
Then $P_Cx = P_C \e_0 = \e_0$. 
To consider the weak limit we consider the sequence $P_Cx_n - x_n$. 

$$
\begin{aligned}
    P_Cx_n &= P_C(\e_0 + \e_n)
    \\
    &= (\e_0 + \e_n)/\sqrt{2}. 
    \\
    \lim_{n\rightarrow \infty} \langle z, P_Cx_n\rangle &= 
    \lim_{n\rightarrow \infty} \langle z,(\e_0 + \e_n)/\sqrt{2}\rangle \quad \forall z \in X
    \\
    &= \e_0/\sqrt{2}. 
\end{aligned}
$$

Which is not the same as applying the projection to the limit of the sequence $\e_0$ in this case. 
This is very trippy. 

**Remarks**

The projection operator in this case, considers the norm of the vector as well. 
This could be the reason that it makes things complicated. 
Because the norm of the weak limit, is never the norm of the sequence. 


---
#### **Thm | Demi-Closure Principle**
> Let $T: C \mapsto X$ be non-expansive, and $C$ is $\neq \emptyset$, closed, convex. 
> Then $x_n \rightharpoonup x$, a weak convergence sequence that satisfies $x_n - Tx_n \rightarrow \mathbf 0$, a strongly convergence sequence, then it must be that $x - Tx = 0$. 


**Observations**

The strong convergence of $x_n - Tx_n$ can be equivalently written as $\Vert x_n - Tx_n\Vert \rightarrow 0$  and $x_n \rightharpoonup Tx_n$. 
Observe that if $x_n - Tx_n \rightarrow \mathbf 0$ is true, it doesn't mean the sequence converges to the fixed point set, but rather it gets closer and closer to the fixed point set. 
This theorem is assuring in the sense that, adding the conditions that $x \rightharpoonup x$ is sufficient to show that the limit $x$ is indeed in the fixed point set of the non-expansive operator. 


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
The term $\Vert Tx_n - Tx\Vert \le \Vert x_n - x\Vert < \infty$  by assumption that $T$ is non-expansive and weak convergence sequence is bounded. 
Finally, the cross term approches zero by the weak convergence of $x_n \rightharpoonup x$. 


**Remarks**

This theorem is useful to characterize the convergence of $x_n$ to the fixed point of the operator $T$. 
Assume that $x_n$ is a sequence with a weak limit, and in addition we showed that the sequence $x_n - Tx_n$ converges strongly to $\mathbf 0$. 
These 2 conditions together would be able to assert that the limit of the sequence $x_n$, which is $\bar x$ belows to the fixed point of $T$, which is that $\bar x - T\bar x =  \mathbf{0}$. 


#### **Thm | Existence of a Fixed Point Set**
> If $C\subseteq X$ is a closed bounded convex set, and $T: C \mapsto C$ is a non-expansive operator, then $\text{fix}(T)\neq \emptyset$. 

**Observations**

We emphasize that the domain is closed and bounded. 

**Proof**

In this proof we will make use of the Banach Contraction principle. See [Banach Contraction in Metric Space](Banach%20Contraction%20in%20Metric%20Space.md) for more information. 
Choose $x_0 \in C$ and $\lambda \in [0, 1)$, define operator $T_\lambda = (1 - \lambda)x_0 + \lambda Tx$. 
Observe that this operator would be a contraction since 
$$
\begin{aligned}
    \Vert T_\lambda x - T_\lambda y\Vert = 
    \lambda \Vert Tx - Ty\Vert \le \lambda \Vert x - y\Vert, 
\end{aligned}
$$
using the nonexpansive property of $T$. 
Since $T_\lambda$ is a contraction, for all $\lambda \in [0, 1)$ there exists $x_\lambda = T_\lambda x_\lambda$ and it's unique. 
Then 
$$
\begin{aligned}
    0 &\le \Vert x_\lambda - Tx_\lambda\Vert
    \\
    & = 
    \Vert T_\lambda x_\lambda - Tx_\lambda\Vert 
    \\
    & = \Vert (1 - \lambda)x_0 + \lambda Tx_\lambda - Tx_\lambda\Vert
    \\
    &= (1 - \lambda)\Vert x_0 - T x_\lambda\Vert. 
\end{aligned}
$$

From the above claim we have $\lambda\nearrow 1$ implies $\Vert x_0 - Tx_\lambda\Vert \rightarrow 0$. 
Since the set $C$ is bounded, then for all sequence of $x_{\lambda_n}$ with $\lambda \nearrow 1$, we will have a subsequence of it (Every bounded sequence in Hilbert space has a weakly convergence subsequence) say $x_{\lambda(n)} = z_n \in C$ such that it weakly converges to some number $z\in C$. 
Now we are in Hilbert space and we have a sequence $z_n \rightharpoonup z$, and $\Vert x_0 - T z_n\Vert \rightarrow 0$, using the demi-closure principle we know that $z$ is a fixed point of operator $T$.

