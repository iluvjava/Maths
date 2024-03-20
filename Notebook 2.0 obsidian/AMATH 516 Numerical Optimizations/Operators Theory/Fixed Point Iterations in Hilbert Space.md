- [Fixed Point Iterations 1D](Fixed%20Point%20Iterations%201D.md)
- [Nonexpansive Operator](Lipschitz%20Operator%20in%20Hilbert%20Space.md)

---
### **Intro**

We are in Hilbert space. 
We discuss fixed point iterations of a non-expansive operator when: 
1. It has a fixed point set. 
2. It doesn't have a fixed point set. 

When it has a fixed point set, the iteration may not converge to the fixed point set. 
A basic counter example would be the minus identity operator. 
Therefore, use [Krasnoselskii Mann Iteration](Krasnoselskii%20Mann%20Iteration.md) to look for the fixed point set of the Non-expansive operator. 
The difficulty part is that even if the fixed point set of the Non-expansive operator is empty, there is still convergence for the operator. 

Before we start, we set up our goal to be proving the following master theorem regarding he fixed point iterations of a non-expansive opeartor: 

#### **Thm | Trichotomy of Non-Expansive Fixed Point Iterations**
> Let $T : C \mapsto C$ be non-expansive, $C$ is non-empty, closed and convex subset of $X$, then exactly one of the following is true about the fixed point iteration of the operator: 
> 1. $\mathbf 0 \in \text{rng }(I - T)$, then $(T^nx)_{n \in \mathbb N}$ is bounded. 
for all $x \in C$, or for some $x \in C$. 
> 2. $\mathbf 0 \in \text{cl.}\text{rng }(I - T)$, $(1/n) T^nx \rightarrow \mathbf 0$ for some/all $x \in C$ and $\limsup_{n\rightarrow \infty} (1/n)\Vert T^nx\Vert \; \forall x \in C$. 
> 3. $\mathbf 0 \not \in \text{cl.rng }(I - T)$ and $0 \le \lim_{n\rightarrow \infty} \frac{1}{n}\Vert T^n x\Vert$ for all $x\in C$. 


---
### **In Preparations for the Master Theorem**


#### **Thm | Averaged Sequenced Converges for Convergent Sequence**
> Let $(\alpha_n)_{n \in \mathbb N}$ be $\alpha_n \rightarrow \alpha$, then $(1/n)\sum_{i = 1}^{n}\alpha_i \rightarrow \alpha$. 

**Proof**

see [Stolz Casero Theorem](Stolz%20Casero%20Theorem.md) and use that. 


#### **Lemma 1 | Convergence in Norm and Projecting on to Zero**
> Suppose $C \subseteq X$ is a non-empty, closed and convex subset, consider $v  = \Pi_C(\mathbf 0)$ to be the projection of $\mathbf 0$ onto the set $C$. 
> Further suppose that there exists a sequence $c_n$ in $C$ such that $\Vert c_n\Vert\rightarrow \Vert v\Vert$, then
> $\Vert c_n - v\Vert \le \Vert c_n\Vert^2 - \Vert v\Vert^2 \rightarrow 0$, therefore it must be $c_n \rightarrow v$. 

**Observations**

Visually, any sequence inside of the set $C$ such that it converge in norm to the norm of the special projection $v$, it must mean that the sequence itself also converges to vector $v$ strongly in Hilbert space. 
This allows use to say stuff about the converges of a sequence in a convex set with only information about the projection vector $v$. 

**Proof**

Directly consider hat 

$$
\begin{aligned}
    \Vert c_n\Vert^2 &= \Vert c_n - \mathbf 0 \Vert^2
    \\
    \implies &\ge 
    \Vert \Pi_C c_n - \Pi_C \mathbf 0\Vert^2 + 
    \Vert 
        [I - \Pi_C]c_n - [I - \Pi_C] \mathbf 0
    \Vert^2
    \\
    &=
    \Vert c_n - v\Vert^2 + 
    \Vert 
        c_n - \Pi_C c_n - (\mathbf 0 - \Pi_C \mathbf 0)
    \Vert^2
    \\
    &= 
    \Vert c_n - v\Vert^2 + 
    \Vert 
        c_n - c_n- (\mathbf 0 - v)
    \Vert^2
    \\
    &= 
    \Vert c_n - v\Vert^2 + 
    \Vert 
        v
    \Vert^2. 
\end{aligned}
$$


Therefore, from the last line, the normed difference between $c_n$ and $v$ would be upper bounded: $\Vert c_n\Vert^2 - \Vert v\Vert^2 \ge \Vert c_n - v\Vert^2$. 
Taking the limit $n\rightarrow \infty$ with the assumption that $\Vert c_n\Vert\rightarrow \Vert v\Vert$, then we have $\Vert c_n - v\Vert \rightarrow 0$ which establishes the strong convergence of $c_n$ onto $v \in \text{cl}(C)$. 



#### **Lemma 2 | Another Usefule Lemma**
> Let $T: X \mapsto X$ be a non-expansive mapping. 
> Define $C:= \text{cl.rng}(I - T)$, then it would be convex, closed and non-empty. 
> Set $v = \Pi_C(\mathbf 0)$, which we call it the Minimal Displacement Vector. 
> Define $\delta = \Vert v\Vert = \inf_y \Vert Ty - y\Vert$ to be the minimal displacement distance. 
> Then we claim that following are true: 
> 1. $\forall v \in \mathbb N \; \langle T^nx + nv,v \rangle \le \langle x, v\rangle$. 
> 2. $\liminf_{n\rightarrow \infty} (1/n)\Vert T^nx\Vert \ge \Vert v\Vert$. 
> 3. $\limsup_{n\rightarrow \infty} (1/n)\Vert T^nx\Vert \le \Vert v\Vert$. 
> And therefore, we can concluded that the averaged norm of the fixed point iteration vector equals to $\Vert v\Vert$, the minimal displacement distance. 

**Obervations**

We need to observe what $T^nx + nv$ really is. 
To see we show that it's coming from telescoping the fixed point iterations. 
Let's consider summing up all the displacement vectors between the iterates and $v$: 

$$
\begin{aligned}
    x + \sum_{k = 1}^{n} \left(
        v - (I - T)^{k - 1} x
    \right) 
    &= 
    x + nv - \sum_{ k =1}^{n}(I - T)T^{k-1} x
    \\
    &= 
    x + nv - \sum_{ k =1}^{n} T^{k - 1}x - T^k x
    \\
    &= 
    x + nx - (T^nx - x) 
    \\
    &= T^n x + nv. 
\end{aligned}
$$

That enables the an interpretation of the vector $T^x + nv$ as the sum of the displacement vector from the Iterates and the minimal displacement vector $v$. 

**Proof**

