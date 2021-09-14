[[Hermitian Adjoint]]: Needs to know what conjugate transpose is doing to the matrix. 

Theorem 2.1.9 in book \<Matrix Analysis\>

---
### **Intro**

> This is the theroem statement: 
> $$
> A\in \mathbb{M}_n \quad A^{-1} \sim A^H \iff 
> B\in \mathbb{M}_n: A = B^{-1}B^H
> $$
> The inverse of matrix $A$ is similar to $A^H$ if and only if $A$ can be written as the product of $B^{-1}B^H$. 

The assumptions are: 
* Matrix $A$ is invertible. 
* Matrix $B$ is invertible. 

**Proof $\leftarrow$** 

$$
\begin{aligned}
    A &= B^{-1}B^H
    \\
    A^H &= (B^{-1}B^H)^H = (BB^{-H})
    \\
    A^{-1} &= B^{-H}B
    \\
    (B^H)\underbrace{B^{-H}B}_{A^{-1}}(B^{-H}) &= \underbrace{BB^{-H}}_{A^H}
\end{aligned}
$$

If $A = B^{-1}B$ then $A^{-1}$ is similar to the matrix $A^H$ by the transformation represented by $B^H$

$\blacksquare$

**Proof $\rightarrow$**

Note: This direction is way harder to proof. We wish to show that: 

> $$
> A^{-1}\sim A^{H}\implies A = B^{-1}B^H
> $$

Our task is to look for the matrix $B$. It's procedurals. Firstly we would like to find this representation of: 

$$
H = A^HHA \quad \text{ Where: }\quad  H^H = H \wedge \exists \; H^{-1}  \tag{1}
$$

Let's start by considering that: 

$$
\begin{aligned}
    & A \sim A^{H} 
    \\
    \implies & SAS^{-1} = A^H \wedge S = A^HSA
    \\
    \text{Let: } & S_\theta = e^{i\theta}S
    \\
    \implies & S_\theta + S_\theta^H
    =
    A^HS_\theta A + A^H S_\theta^H A
    \\
    & S_\theta + S_\theta^H 
    =
    A^H(S_\theta + S_\theta^H)A
\end{aligned}\tag{2}
$$

Consider the choice of $\theta$ to make $S_\theta + S_\theta^H$ invertible, then: 

$$
\begin{aligned}
    & \exists \; x \neq \mathbf{0}: 
    H_\theta x = \mathbf{0}
    \\
    \implies & (S_\theta + S_\theta^H)x =\mathbf{0}
    \\
    & x = -S^{-1}_\theta  S_\theta^{H}x
    \\
    & x = e^{-2i\theta} S^{-1}S^Hx
    \\
    & S^{-1}S^{H}x = -e^{2i\theta}x
\end{aligned}\tag{3}
$$

Therefore, to make it invertible we will have to choose $\theta\in (0, \pi]$ such that it's not an eigenvalue for the matrix $S^{-1}S^H$

Choose that $\theta$, then we consider $S$ using that $\theta^+$ which is then used to construct the matrix $H$: 

> $$
> H = A^HHA\tag{4}
> $$

We are halfway there, let's talk about the motivation for the second part of the proof. 

**Motivations and Tricks to Reach there**

Let's consider: 

$$
\begin{aligned}
    B &= (I - A^H)H
    \\
    B^H &= H(I - A)
\end{aligned}\tag{5}
$$

Then: 

$$
\begin{aligned}
    A &= B^{-1}B^H
    \\
    BA &= B^H
\end{aligned}\tag{6}
$$

To this regard, it would mean that: 

$$
\begin{aligned}
    BA &= (I - A^H)HA 
    \\
    &= (HA - A^HHA)
    \\
    &= (HA - H)
    \\
    &= H(A - I)
    \\
    B^H &= H(I - A)
\end{aligned}\tag{7}
$$

Notice that, we are one constant way by expression (7), however, $B$ is invertible when the eigen value of $A$ contains 1, in that case, we are farther away from where we want to get, hence, let's consider: 

**Some Extra Ingredients**

> $$
> \begin{aligned}
>     B &= \beta (\alpha I - A^H)H
> \end{aligned}\tag{8}
> $$
> Where we need $|\alpha| = 1$ and $\alpha \in \mathbb{C}$, and we have the free choice for $\beta \in \mathbb{C}$, which will reveal itself after a while. 

Let's consier again on the values before which is going to be: 

$$
\begin{aligned}
    BA &= \beta(\alpha I - A^H)HA 
    \\
    &= \beta(\alpha HA - A^HHA)
    \\
    &= \beta(\alpha HA - H)
    \\
    &= H(\beta\alpha A - \beta I)
    \\
    B^H &= H(\bar{\beta} \bar{\alpha}I - \bar{\beta}A)
    \\
    \implies 
    H(\bar{\beta} \bar{\alpha} - \bar{\beta}A) &= H(\beta\alpha A - \beta I)
    \\
    \implies \beta &= -\bar{\beta}\bar{\alpha}
\end{aligned}\tag{9}
$$

If we were to assume the choice of $\alpha = e^{i\varphi}$ then it means that: 

$$
\beta  = \exp \left(
    \frac{i(\pi - \varphi)}{2}
\right)
$$

And that concludes the proof both ways. 

$\blacksquare$
