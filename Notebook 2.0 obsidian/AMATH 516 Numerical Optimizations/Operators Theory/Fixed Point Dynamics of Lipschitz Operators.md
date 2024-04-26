---
aliases:
  - Fixed Point Iterations of Nonexpansive Operators
---
- [Fixed Point Iterations 1D](Fixed%20Point%20Iterations%201D.md)
- [Nonexpansive Operator](Lipschitz%20Operator%20in%20Hilbert%20Space.md)

---
### **Intro**

We are in Hilbert space. 
We discuss fixed point iterations sequence $T^n x$ of a non-expansive operator $N$ when: 
1. It has a fixed point set. 
2. It doesn't have a fixed point set. 

When it has a fixed point set, the iteration may not converge to the fixed point set. 
A basic counter example would be the minus identity operator. 
When a fixed point set of the non-expansive operator exists, use [Krasnoselskii Mann Iteration](Krasnoselskii%20Mann%20Iteration.md) to look for the fixed point set of the Non-expansive operator. 
The interesting part is that even if the fixed point set of the Non-expansive operator is empty, there is still convergence for the operator. 

Before we start, we set up our goal to be proving the following master theorem regarding he fixed point iterations of a non-expansive operator: 

#### **Thm (Pazy) | The Convergence of the Averaged Iterates**
> Let $T: X \mapsto X$ be non-expansive, then $C = \text{cl.rng}(I - T)$ is a closed, convex and non-empty convex subset of $X$, and the fixed point iterations $T^n x$ satisfies for all $x \in X$: $(1/n)T^nx \rightarrow - v$. 
> It converges strongly to the negative of the minimal displacement vector! 



#### **Thm | Trichotomy of Non-Expansive Fixed Point Iterations**
> Let $T : C \mapsto C$ be non-expansive, $C$ is non-empty, closed and convex subset of $X$, then exactly one of the following is true about the fixed point iteration of the operator: 
> 1. $\mathbf 0 \in \text{rng }(I - T)$, then $(T^nx)_{n \in \mathbb N}$ is bounded. 
for all $x \in C$, or for some $x \in C$. 
> 2. $\mathbf 0 \in \text{cl.}\text{rng }(I - T)$, $(1/n) T^nx \rightarrow \mathbf 0$ for some/all $x \in C$ and $\limsup_{n\rightarrow \infty} (1/n)\Vert T^nx\Vert \; \forall x \in C$. 
> 3. $\mathbf 0 \not \in \text{cl.rng }(I - T)$ and $0 \le \lim_{n\rightarrow \infty} \frac{1}{n}\Vert T^n x\Vert$ for all $x\in C$. 


---
### **In Preparations for the Master Theorem**

We want to show the Trichotomy of the iterates of fixed point iterations. 

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



#### **Lemma 2 | Another Useful Lemma**
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

That enables the an interpretation of the vector $T^n x + nv$ as the sum of all displacements from the iterates and the vector $v$. 

For the first part of the claim, where it says that $C$ is a closed, convex and non-empty set is because $N$ is non-expansive, and therefore $I - N$ is maximally monotone because $T$ maps from $X$ to $X$, the entire ambient space. 
And, it's not non-trivial results from Rockfellar's convex analysis that, the range of a maximally monotone operator is a closed, convex set. See [Monotone Operators In Depth](Monotone%20Operators%20In%20Depth.md) for more information. 

**Proof**

From the observation directly, we have the following interpretations 

$$
\begin{aligned}
    \langle T^n x + nv, v\rangle &=  
    \langle v, x\rangle + 
    \sum_{k = 1}^{n}
    \langle v - (I - T)^{k -1}x, v\rangle, 
\end{aligned}
$$

now, fix any value of $k \in \{1, \cdots, n\}$, then the quantity inside of the sum will be less than zero because: 

$$
\begin{aligned}
    \left\langle v - (I - T)T^{-1} x, v, v
    \right\rangle 
    &= 
    \left\langle 
        \Pi_C(\mathbf 0) - (I - T)T^{k - 1} x, 
        \Pi_C(\mathbf 0)
    \right\rangle
    \\
    &= 
    \left\langle 
        \Pi_C(\mathbf 0) - (I - T)T^{k - 1} x, 
        \Pi_C(\mathbf 0) - \mathbf 0
    \right\rangle
    \\
    (I - T)T^{k-1}x \in C \implies 
    & \le 0, 
\end{aligned}
$$

here we made use of the obtuse angle theorem. 
Therefore each term inside of the sm oummation is less than zero and we have 

$$
\begin{aligned}
    &
    \begin{aligned}
        ([1]): &
        \left\langle T^nx + nv, v \right\rangle 
        - \langle v, x\rangle \le 0 \; ;
        \\
        ([2]): &
        \frac{1}{n}\langle x - T^nx, v\rangle
        \le 
        \frac{1}{n}\Vert x - T^nx\Vert\Vert v\Vert \; ;
    \end{aligned}
    \\
    &
    \begin{aligned}
        ([1]) \implies 
        \left\langle T^nx, v \right\rangle + n\Vert v\Vert^2 
        - \langle v, x\rangle &\le 0
        \\
        \langle T^n x - x, v\rangle &\le -n \Vert v\Vert^2
        \\
        \langle x - T^n, v\rangle &\ge n \Vert v\Vert^2; 
    \end{aligned}
    \\
    & 
    \begin{aligned}
        ([1]) \wedge ([2])
        & \implies 
        \Vert v\Vert^2 
        \le 
        \frac{1}{n}
        \left\langle x - T^n x, v \right\rangle 
        \le  
        \frac{1}{n}\Vert x - T^nx\Vert\Vert v\Vert
        \\
        & \implies 
        \Vert v\Vert 
        \le 
        \frac{1}{n}\Vert x - T^n x\Vert
        \le 
        (1/n)(\Vert x\Vert + \Vert T^n x\Vert)
        \\
        & \implies 
        (1/n)\Vert T^n x\Vert 
        \ge
        \Vert v\Vert - \frac{1}{n}\Vert x\Vert
    \end{aligned}
    \\
    \implies &
    \liminf_{n\rightarrow \infty} 
    \frac{1}{n}\Vert T^n x\Vert 
        \ge
    \Vert v\Vert.
\end{aligned}
$$

The second claim of the statement is now true. 
To see that the upper cluster point of the averaged norm of the iterates is bounded by $\Vert v\Vert$, we consider $y_n \in X$, by the fact that $v = \Pi_C(\mathbf 0)$, there exists $y_n \in C$ such that it minimizes its distance to $\mathbf 0$, so $\lim_{n\rightarrow \infty} \Vert Ty_n - y_n\Vert = 0$. 
For $y_n$, fixed any $m\in \mathbb N$ and consider $y_m$ and 

$$
\begin{aligned}
    & ([3]): 
    T^ny_m = 
    y_m + \sum_{k = 1}^{n}\left(
        T^k y_m - T^{k - 1}y_m
    \right)\; ; 
    \\
    & ([4]): 
    \text{Nonexpansive} T \implies 
    \Vert T^k y_m - T^{k-1} y_m\Vert &\le 
    \Vert T^{k-1} y_m - T^{k-2} y_m\Vert \le \cdots 
    \Vert Ty_m - y_m\Vert. 
\end{aligned}
$$

Therefore, use ([4]) on ([3]) we have 

$$
\begin{aligned}
    ([5]):
    \Vert T^n y_m\Vert  &\le 
    \Vert y_m\Vert + \sum_{k = 1}^{n}
    \left\Vert
        T^{k}y_m - T^{k-1}y_m
    \right\Vert
    \\
    &\le \Vert y_m \Vert + n \Vert Ty_m - y_m\Vert. 
\end{aligned}
$$

Now, the fixed point iterations vector satisfies: 

$$
\begin{aligned}
    \Vert T^n x\Vert &\le 
    \Vert T^nx - T^n y_m\Vert + 
    \Vert T^n y_m\Vert
    \\
    \text{$T$ nonexpansive} \wedge ([5])
    \implies 
    &\le 
    \Vert x - y_m\Vert + \Vert y_m\Vert + 
    n \Vert Ty_m - y_m\Vert 
    \\
    \implies 
    \frac{1}{n}\Vert T^n x\Vert
    &\le 
    (1/n)\Vert x - y_m\Vert + \Vert y_m\Vert /n
    + 
    \Vert Ty_m - y_m\Vert. 
    \\
    \implies 
    \limsup_{n\rightarrow \infty} 
    \frac{\Vert T^n x\Vert}{n} 
    &\le 
    \Vert Ty_m - y_m\Vert 
    \\
    \implies 
    \limsup_{n\rightarrow \infty} 
    \frac{\Vert T^n x\Vert}{n} 
    &\le 
    \lim_{m\rightarrow \infty }\Vert Ty_m - y_m\Vert = \Vert v\Vert. 
\end{aligned}
$$

And comining the results about the upper abd lower cluster point of the norm of the fix point iteration vector we have the claim that $\lim_{n\rightarrow \infty}(1/n)\Vert T^n x\Vert = \Vert v\Vert$. 

#### **Thm (Pazy) | Limit of the Fixed Point Iteration Vector**
> Let $T: X \mapsto X$ be non-expansive, then $C = \text{cl.rng}(I - T)$ is a closed, convex and non-empty convex subset of $X$, and the fixed point iterations $T^n x$ satisfies for all $x \in X$: $(1/n)T^nx \rightarrow - v$. 
> It converges strongly to the negative of the minimal displacement vector! 

**Proof**

THe fact that $C$ is a closed, convex and non-empty convex set is because $T$ is non-expansive, $I - T$ would be maximally monotone, and there is one non-trivial theorem from Rockfellar that the range and domain of a maximally monotone function is closed and convex. 

From reverse telescoping we have 

$$
\begin{aligned}
    (1/n)(-T^nx + x) &= 
    \frac{1}{n}\sum_{k = 1}^{n}(I - T)T^{-1} x
    \in \text{cvxh.rng}(I - T)\subseteq C. 
\end{aligned}
$$

Lemma-2 assures $(1/n)\Vert T^nx\Vert \rightarrow \Vert v\Vert$ converges in norm to the vector $v = \Pi_C(\mathbf 0)$. 
Under our current situation, consider that: 

$$
\begin{aligned}
    \left|
        (1/n)\Vert T^n x\Vert - (1/n)\Vert x\Vert
    \right|
    \le 
    (1/n)\Vert T^nx - x \Vert 
    &\le 
    \frac{1}{n}\Vert T^n x\Vert + \frac{\Vert x  \Vert}{n}
    \\
    \implies 
    \Vert v\Vert =
    \lim_{n\rightarrow \infty}(1/n)\Vert T^n x\Vert 
    \le 
    \lim_{n\rightarrow \infty } (1/n)\Vert T^n x - x\Vert 
    &\le 
    \Vert v\Vert
    \\
    \implies
    \lim_{n\rightarrow \infty} (1/n)\Vert T^n x - x\Vert 
    &= \Vert v\Vert. 
\end{aligned}
$$

Since the vector $-(1/n)T^nx + x \in C$, we can claim using the first lemma that the vector $(1/n)(-T^nx + x)\rightarrow v$, but with $x/n \rightarrow \mathbf 0$, we have that $(1/n)(-T^nx)\rightarrow v$. 
The theorem is now proven. 

**Remarks**

This behaviors prompted people to invent the concept of a generalized fixed point set. 
The convergenced of the averaged iterates $(1/n) x_n$ is a compromised to the convergence since if $x_n$ converges, $(1/n)x_n$ converges to the zero vector. 
Let $v = \Pi_{C}(\mathbf 0)$, the set $\{x \in X : x - Tx = v\}$ is the generalized fixed point set. 
When fixed point set exists, $\mathbf 0 \in C$, hence $x - Tx = \mathbf 0$, producing the original definition of the fixed point set. 



#### **Thm (Browder Petryshyn) | Boundedness of the Iterates**
> If $T$ is nonexpansive then $\text{fix}T \neq \emptyset$, then the following are equivalent: 
> 1. $\text{fix} T \neq \emptyset$. 
> 2. $\forall x \in X: T^n x$ is bounded. 
> 3. $\exists x \in X : (T^n x)$ is bounded. 

**Proof**

$y \in \text{fix }T$ then for any $x \in X$ $\Vert T^n x - T^ny\Vert  = \Vert T^nx - y\Vert \le \Vert T^{n-1}x - y\Vert \le \cdots \le \Vert x - y\Vert$. 
$T$ being a Lipschitz operator produced these sequence of inequalites. 
Therefore, $\Vert T^nx - y\Vert \ge |\Vert T^nx\Vert - \Vert y\Vert| \le \Vert x - y\Vert$, so $\Vert T^nx - y\Vert$ is bounded. 


(1.) implies (3.) is obvious. 
To show that (3.) implies (1.) however, it's not easy at all. 




---
### **Illustrative Examples**

We propose examples to illustrate different type of behaviors of the fixed point sequences based on the displacement vectors: 
1. $\mathbf 0\in \text{rng}(I - T)$. 
   1. The operator $I$. Convergence on the iterates. 
   2. Skew 90 degree rotation. 
2. $\mathbf 0 \in \text{cl.rng}(I - T)$. No convergence of the iterates. 
   1. $\Pi_{\mathbb R_-}(x - \exp(x))$, projected gradient descent of the exponential function. 
   2. 
    $$
    f(x) = \begin{cases}
        x + 1 & x \le 1 \\ x + 1/x & x \ge 1 
        \end{cases}
    $$
3. $\mathbf 0\not\in \text{cl.rng}(I - T)$. 
   1. $(x)\mapsto x + v$, direct translation. 

All of these are not STRICTLY averaged operators because we are going to talk about averaged operator next. 


---
### **Fixed Point Dynamics for Averaged Operators**

In this section we strengthen the results for nonexpansive operator for averaged operators. 




