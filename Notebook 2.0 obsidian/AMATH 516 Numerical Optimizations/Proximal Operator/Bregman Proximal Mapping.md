- [Bregman Divergence](../Bregman%20Divergence.md)

---
### **Intro**

2-Norm is a type of Bregman divergence. 
The 2-Norm is used in the proximal mapping. 
Hence, in this file we investigate the generalization of a proximal mapping when the 2-Norm inside of the proximal mapping is a Bregman Divergence instead of just a regular 2-Norm. 
We will faithfully follow Chapter 9 of Amir Beck's First-Order Method textbook[^1], and complement it with a paper by Heinz et al.[^2], and some Rockafellar classics. 


---
### **The Bregman Proximal Mapping**

Amir Beck introduced theories about Bregman proximal mapping as a generalization of the proximal point method[^1] and applied it to the Mirror Proximal method. 
For more about proximal point method visit [Proximal Point Method, Interpretations](Proximal%20Point%20Method,%20Interpretations.md). 
Given a set $C$, for $\omega$ to be a function that introduces the Bregman distances, recall that it will be 
1. Essentially Smooth. 
2. Strictly convex and differentiable on the set $C$. 

These conditions belongs to the characterizations  [Simply Legendre Type](Simply%20Legendre%20Type.md). 
The strict convexity condition is necessary. 
To generalize the famous properties of [Moreau Envelope and Convex Proximal Mapping](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md), Amir Beck constructed assumption 9.3 and we quote 

#### **Assumption 9.2 | Favorable Assumptions for Bregman Divergence on Mirror Descent**
> For the Bregman prox operator to possess favorable conditions that generalize the Euclidean based proximal mapping, we propose the following conditions for the function $\omega$ and the domain $C$ of our interest: 
> 1. $\omega$ is proper closed and convex. 
> 2. $\omega$ is differentiable over $\text{dom}(\partial \omega)$. Recall the fact that $\text{ri.dom}(f)\subseteq \text{dom}(\partial f)\subseteq \text{dom}(f)$. 
> 3. $C \subseteq \text{dom}(\omega)$. 
> 4. $\omega + \delta_C$ is $\sigma$-strongly convex with $\sigma > 0$. 

**Importance**

Consider the Bregman proximal mapping ${\text{argmin}}_{x\in C}(\psi(x) + \omega(x))$ such that $\text{dom}(\psi) \cap \text{dom}(\partial \omega)$. 
The above conditions are sufficient to retain these properties of the Proximal mapping when $\omega$ is just $\Vert \cdot\Vert^2/2$. 
1. Unique minimizer exists for the Bregman proximal mapping. 
2. The third proximal lemma. 

We formalize these consequences in the following lemmas. 

#### **Lemma 9.7 | Uniquness of this mapping**
> Let $\omega$ be proper closed and convex, differentiable over $\text{dom}(\partial \omega)$. 
> Let $\psi$ be convex proper and closed satisfying $\text{dom}(\psi)\subseteq \text{dom}(\partial\omega)$. 
> Let $\omega + \delta_{\text{dom}(\psi)}$ be strongly convex with $\sigma > 0$. 
> Then the minimizer of $\text{argmin}_{x\in \mathbb E}\{\psi(x) + \omega(x)\}$ is unique and belongs to $\text{dom}(\partial \omega)$. 

**Proof**

Let $\phi = \psi + \omega$ then $\phi$ is strongly convex on $C$. 
By strong convexity there exists an unique minimizer $x^*$ for $\psi + \omega$. 
The unique minimizer has $x^*\in \text{dom}(\phi) = \text{dom}(\psi)$ because $\text{dom}(\psi)\cap \text{dom}(\omega)  = \text{dom}(\psi)$. 
Fermat's theorem has $\mathbf 0\in \partial[\psi + \omega](x^*)$. 
Recall that if $\omega$ is differentiable on $\text{dom}(\partial \omega)$ and we have 

$$
\begin{aligned}
    \partial \omega(x) &= \{\nabla \omega(x)\} \; \forall x \in \text{dom}(\partial \omega)
    \\
    \text{dom}(\partial \omega)&= 
    \text{ri.dom}(\omega). 
    \\
    \text{dom}(\psi) &\subseteq \text{dom}(\partial \omega)
    \\
    &= \text{ri.dom}(\omega)
    \\
    \implies \text{ri.dom}(\psi) &\subseteq \text{ri.dom}(\omega)\quad \triangleright \text{ri.dom}(\psi) \subseteq \text{dom}(\psi). 
\end{aligned}
$$

Therefore, we use the sum rule for gradient obtaining $\mathbf 0\in \partial \psi(x^*) + \partial \omega(x^*)$. So $x^*\in \text{dom}(\partial\psi)\cap \text{dom}(\partial \omega) = \text{dom}(\partial \omega)$. 



**Remark**

I feel like Amir's Beck proof is not showing why the subgradient sum rule can be used here to get to the Fermat's rule. 
This part of the proof is modified. It may be replaced with other theorems.

#### **Def | Bregman Prox and Admissibility Conditions for it**
> If we define the following 
> * Let $\omega: \mathbb E \mapsto \bar{\mathbb E}$ be proper, closed, cvx and differentiable over $\text{dom}(\partial \omega)$; 
> * let $\psi: \mathbb E \mapsto \bar {\mathbb E}$ be proper, closed, cvx, satisfying $\text{dom}(\psi)\subseteq \text{dom}(\partial \omega)$;
> * $\omega + \delta_{\text{dom}(\psi)}$ be $\sigma$-strongly convex, $\sigma > 0$. 
> * Assuming $b\in \text{dom}(\partial \omega)$, let $a$ be Bregman Proximal Mapping applied at the point $b$ defined as 
> $a := \underset{x\in \mathbb E}{\text{argmin}}\{\psi(x) + D_\omega(x, b)\}$. 


**Note:**

The goal of the admissibility conditions of Bregman proximal mapping is to assure existence and single valuedness property of the mapping. 
This is essential in the use of deriving algorithms. 

**Observations**

Directly we may expand the definition of the Bregman Divergence over $\omega$ and we have 

$$
\begin{aligned}
    \underset{x \in \mathbb E}{\text{argmin}} \left\lbrace
       \psi(x) + D_\omega(x, b)
    \right\rbrace &= 
    \underset{x \in \mathbb E}{\text{argmin}}
    \left\lbrace
        \psi(x) + \omega(x) - \omega(b) - \langle \nabla \omega(b), x - b \rangle
    \right\rbrace
    \\
    &= 
    \underset{x \in \mathbb E}{\text{argmin}}\left\lbrace
        \psi(x) + \omega(x) - \langle \nabla \omega(b), x\rangle
    \right\rbrace. 
\end{aligned}
$$

Which gives us an alternative representation of the Bregman proximal mapping defined at point $b$ for $\psi, \omega$. 
Now observe that the function $\psi(x) + \langle \nabla (b), x\rangle$ has domain on $\text{dom}(\partial \omega)$. 
Applying lemma 9.7, we have that $a \in \text{dom}(\partial \omega)$. 
And $a$ is the unique minimizer, satisfying $\mathbf 0 = \nabla \psi(a) + \nabla\omega(a) - \nabla \omega(b)$. 


**Rmarks**

Other type of admissibility conditions for the Bregman Proximal operator exists, and it really depends on which literature we are reading. 


#### **Thm 9.12 | The second prox lemma**
> Based on the definition of the Bregman Divergence, it has $\forall u \in \text{dom}(\psi)$: 
> $$
>    a = \arg\min_{x\in \mathbb E} \{\psi(x) + D_\omega(x, b)\} \implies  \langle \nabla \omega(b) - \nabla \omega(a), u - a\rangle \le \psi(u) - \psi(a).
> $$


**Proof**

$a\in \text{dom}(\partial \psi)$ satisfies the zero subgradient optimality condition and hence

$$
\begin{aligned}
    \partial \psi(a) &\ni \nabla \omega(b) - \nabla \omega(a). 
\end{aligned}
$$

The subgradient inequality from $\psi$ at $a$ implies 

$$
\begin{aligned}
    \implies 
    \langle \partial \psi(a), u -a\rangle 
    &\ge \psi(u) - \psi(a)
    \\
    \langle \nabla \omega(b) - \nabla \omega(a), u - a\rangle &\ge 
    \psi(u) - \psi(a). 
\end{aligned}
$$

$\blacksquare$


**Remark**

The consequences of the lemma will be realized together in mirror prox algorithm, together with the cosine lemma for the Bregman divergence. 
Replacing function $f$ with $\lambda f$ where $\lambda > 0$ then we can get the Bregman proximal operator with a different type of multiplier on the Bregman divergence for the function, i.e: $\arg\min_{x \in \mathbb E}\{\psi(x) + \lambda^{-1}D_\omega(x, b) \}$. 

When the bregman divergence function $\omega = (1/2)\Vert \cdot\Vert^2$, it reduces to the second proximal lemma: 

$$
\begin{aligned}
    \langle b - a, u - a\rangle \ge \psi (u) - \psi(a). 
\end{aligned}
$$


---
### **An Example of Bregman Proximal Mapping**

Surprisingly, the [Proximal Gradient Method](Proximal%20Gradient%20Method.md) is related to the idea of a Bregman Proximal Mapping. 
We have the following claim: 

#### **Claim | Proximal Gradient and Bregman Prox**
> With $f$ being $L$-Lipschitz smooth differentiable function. 
> Let $g$ be convex with $\phi = f + g$ being closed convex proper. 
> Suppose that $L < \gamma^{-1}$ for some $\gamma$. 
> Then we have the Bregman prox interpretation of the proximal gradient method: 
> $$
> \begin{aligned}
>   \prox_{\gamma g} (x - \gamma^{-1}\nabla f(x)) = \argmin{u} 
>   \left\lbrace
>       \phi(u) + D_{h}(x, u)
>   \right\rbrace,
> \end{aligned}
> $$
> where $h = \frac{1}{2\gamma}\Vert \cdot\Vert^2 - f$. 
> $D_h(\cdot, \cdot)$ is Bregman divergence. 

**Proof**

Directly we start by considering: 

$$
\begin{aligned}
    \prox_{\gamma g} \left\lbrace
        x - \gamma^{-1} \nabla f(x)
    \right\rbrace
    &= 
    \argmin{u}
    \left\lbrace
        f(x) + g(u) + \langle \nabla f(x), u - x\rangle 
        + \frac{1}{2\gamma} \Vert x - u\Vert^2
    \right\rbrace
    \\
    &= 
    \argmin{u}
    \left\lbrace
        f(x) + \underbrace{f(u)+ g(u)}_{\phi(u)} - f(u) + \langle \nabla f(x), u - x\rangle 
        + \frac{1}{2\gamma} \Vert x - u\Vert^2
    \right\rbrace
    \\
    &= 
    \argmin{u}
    \left\lbrace
        \phi(u) - D_f(u, x)
        + 
        \frac{1}{2\gamma} \Vert x - u\Vert^2
    \right\rbrace
    \\
    &= 
    \argmin{u} \left\lbrace
        \phi(u) + D_{\left[\frac{1}{2\gamma}\Vert \cdot\Vert^2 - f\right]}(x, u)
    \right\rbrace. 
\end{aligned}
$$

which basically verifies the claim. 
To see that $(1/(2\gamma))\Vert \cdot\Vert^2 - f$ is a function of Legendre type, the hypothesis in the claim that $f$ is convex $L$-Lipschitz smooth, with $L < \gamma^{-1}$, then we have $\lim_{\Vert x\Vert\rightarrow \infty}(1/(2\gamma))(\Vert \cdot\Vert^2 - f) = \infty$ as well. 
At the last step, the property of $D_f + D_g = D_{f + g}$ should be obvious from the definition of Bregman divergence induced by $f, g$ of Legendre type. 

**Remark**

This interpretation bridges the concept between a Bregman Proximal Point method, and the method of proximal gradient descent. 
In this case, the proximal gradient is a specific case of Proximal point method using Bregman Divergence. 
However, not all method can be reduced to proximal point since any operator $T$ the update the iterates $x_{k + 1} = Tx_k$, may not corresponds to a gradient dynamics of any potential function. 
Finally, set $g = 0$, the zero function. 
Then the above derivation can derive a Bregman Prox interpretation of the gradient descent method. 


[^1]: A. Beck, First-Order Methods in Optimization | SIAM Publications Library. in MOS-SIAM Series in Optimization. SIAM. Accessed: Oct. 19, 2023. [Online]. Available: https://epubs.siam.org/doi/book/10.1137/1.9781611974997
[^2]: H. H. Bauschke, J. Bolte, and M. Teboulle, “A Descent Lemma Beyond Lipschitz Gradient Continuity: First-Order Methods Revisited and Applications,” Mathematics of OR, vol. 42, no. 2, pp. 330–348, May 2017, doi: 10.1287/moor.2016.0817.


---
### **Three Points Bregman Lemma with The Second Prox Lemma**

Assuming that $\omega$ is able to induce Bregman divergence $D_\omega$. 
A descent inequality of the Bregman Envelope that is analogous to [Moreau Envelope and Convex Proximal Mapping](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md), which is essential to the derivation of convergence of algorithms that uses the Bregman Proximal mapping. 

#### **Thm | The Bregman Prox Envelope descent inequality**
> Let $\omega$ induce a Bregman Divergence $D_\omega$ in $\R^n$ and assume that it satisfies Bregman Prox Admissibility conditions for function $\varphi: \R^n \mapsto \overline \R$.
> Then we claim that for all $c \in \text{dom}(\omega), b \in \text{dom}(\partial \omega)$, 
> If 
> $$
> \begin{aligned}
>     a = \argmin{x}\left\lbrace
>        \varphi(x) + D_\omega(x, b)
>     \right\rbrace, 
> \end{aligned}
> $$
> we have the inequality, 
> $$
> \begin{aligned}
>     (\varphi(c) + D_\omega(c, b)) - 
>     (\varphi(a) + D_\omega(a, b)) \ge 
>     D_\omega(c, a). 
> \end{aligned}
> $$

**Proof**

Suppose that $c \in $
Using the second prox lemma for the Bregman Proximal mapping, we have for all $c \in \R^n$: 

$$
\begin{aligned} 
    \langle \nabla \omega(b) - \nabla \omega(a), c - a \rangle
    & \le 
    \varphi(c) - \varphi(a), 
\end{aligned}
$$

recall 3 points (cosine inequality) lemma of a Bregman Divergence, we have equality for the LHS of the above: 

$$
\begin{aligned}
    & 
    \langle \nabla w(b) - \nabla w(a), c - a\rangle
    = 
    D_\omega(c, a) + D_\omega(a, b) - D_\omega(c, b)
    \\
    \\
    & 
    \begin{aligned}
        \implies &
        D_\omega(c, a) + D_\omega(a, b) - D_\omega(c, b) 
        \le \varphi(c) - \varphi(a)
        \\
        \iff &
        \varphi(c) + D_\omega(c, b) - \varphi(a) - D_\omega(a, b)
        \ge 
        D_\omega(c, a). 
    \end{aligned}
\end{aligned}
$$

And this is the decent inequality. 

---
### **A Simple Application of Bregman Proximal Mapping**



