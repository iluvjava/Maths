- [Convex Sets Intro](Background/Convex%20Sets%20Intro.md)
- [Gradient, Hessian Characterization of Convex Functions](CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convex%20Functions.md)
- [Simply Legendre Type](Simply%20Legendre%20Type.md)

---
### **Intro**

Bregman distance generalizes the Euclidean distance. Recall that the Euclidean norm between 2 points appeared Rockafellar's proximal point method; it also appeared in the [Proximal Gradient, Forward Backwards Envelope](Proximal%20Methods/Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md). 
In this article, we will faithfully follow Amir Beck's First order method[^1] chapter 9, and then we will augment it with classics Rockafellar in convex analysis, and Heinz's NoLips paper. 

The important part is, this ideas can generalize the concepts of strong convexity and smoothness into a much general settings for optimizations and their analysis. 

#### **Definition (9.2) | Bregman Divergence**
> Let $\omega$ be a proper closed convex function that is differentiable over $\text{dom}(\partial \omega)$. The Bregman distance associated with $\omega$ is the function $D_\omega: \text{dom}(\omega) \times \text{dom}(\partial \omega)\mapsto \mathbb R$, given by 
>
> $$
> \begin{aligned}
>   D_{\omega}(x,y) &= \omega(x) - \omega(y) - \langle \nabla \omega(y), x - y\rangle. 
> \end{aligned}
> $$

**Observations**

$D_\omega(x, x_0)$ is, $\omega(x) - (\omega(x_0) + \langle \nabla\omega (x_0), x - x_0\rangle)$, it's the difference between the function $\omega(x)$ and the linearization of $\omega$ at $x_0$. 
It contains the second-order information for the differentiable function. Because $\omega$ is closed and convex, we immediately know that $D_\omega(x, y) \ge 0$, by convexity. 

**Remarks**

The definition is taken from Amir Beck [^1]. 
For more about Bregman divergence in general, visit [Wikipedia Bregman Divergence](https://en.wikipedia.org/wiki/Bregman_divergence#cite_note-cs.utexas.edu-1). 

#### **The Legendre Type**

If we apply the Bregman distance to the $\omega$ function of Legendre Type, it will enjoy many favorable properties that make the math easier to analyze. 
In the context of convex analysis, a function of Legendre type has a gradient mapping that is one-to-one, satisfying $(\nabla f)^{-1} = \nabla f^\star$, providing us with a crucial link to the dual of the problem.
See more about the Legendre Type function in the prerequisite listed at the start of the file. 

#### **Assumption**
> Let's assume that the Bregman distance we use, is always applied to a function $\omega$ such that it's a Legendre Type. 


**Remarks**

The assumptions made in Amrir's Beck [^1] writing differ entirely from those above. Here, we used the definition 2.1 in a paper by Heinz et. al.[^3]. 
Furthermore, recall that a function of Legendre type on a convex set $C$ is only differentiable on any convex subset of $\text{dom}(\partial f)$. 
The above fact should clarify the domain of the Bregman distance being $\text{dom}(\omega)\times \text{dom}(\partial \omega)$ because the domain of the subgradient may not be the domain of the function, for a differentiable convex function. 



#### **Example-1 | The Energy Function**

Let's say that the energy function is $f$, defined as $\Vert x\Vert^2/2$.
This is a Legendre function because it's differentiable on the entirety of $\mathbb R^n$. 
Using the definition, the Bregman divergence is 

$$
\begin{aligned}
    D_f(x, y) &= \frac{\Vert x\Vert^2}{2} - \frac{\Vert y\Vert^2}{2}
    - \left\langle \nabla 
        \left[ \frac{\Vert \cdot\Vert^2}{2}\right] (y), x - y
    \right\rangle
    \\
    &= \frac{\Vert x\Vert^2}{2} - \frac{\Vert y\Vert^2}{2}
    - \left\langle \nabla 
        y, x - y
    \right\rangle
    \\
    &= 
    \frac{\Vert x\Vert^2}{2} - \frac{\Vert y\Vert^2}{2}
    - \left\langle \nabla 
        y, x
    \right\rangle + \Vert y\Vert^2
    \\
    &= 
    \frac{\Vert x\Vert^2}{2} - \frac{\Vert y\Vert^2}{2} - \langle y, x\rangle
    \\
    &= \frac{\Vert x - y\Vert^2}{2}. 
\end{aligned}
$$

Immediately observe that the above formula is used everywhere in analyzing optimization algorithms. 
If we generalize the above expression into different contexts, the Bregman divergence measures the proximity of 2 points, using a $f$, a function of Legendre Type. 
The above Euclidean distance measure is symmetric and isotropic. 
Other Legendre Type functions may not provide those properties. 


---
### **The 3 Points Lemma**

The following lemma is famous enough to deserve a name. 

#### **Lemma | 3 Points lemma, Cosine law**
> Let $\omega: \mathbb E\mapsto (-\infty, \infty]$, and it's closed convex and proper, and it's of Legendre Type, then for all $a, b \in \text{dom}(\partial \omega)$, and $c \in \text{dom}(\omega)$, we have 
> $$
> \begin{aligned}
>     \langle \nabla \omega(b) - \nabla w(a), c - a\rangle
>     = 
>     D_\omega(c, a) + D_\omega(a, b) - D_\omega(c, b)
> \end{aligned}
> $$

**Observations**

Pay attention to that, $a, b\in \text{dom}(\partial \omega)$ but $c \in \text{dom}(\omega)$, $a, b$ comes from a smaller set than where $c$ is coming from. 

**Proof**

$$
\begin{aligned}
    D_\omega(c, a) + D_\omega(a, b) &= 
    \omega(c) - \omega(a) - \langle \nabla \omega(a), c - a\rangle
    + 
    \omega(a) - \omega(b) - \langle \nabla \omega(b), a - b\rangle
    \\
    &= 
    \omega(c) - \omega(b) - \langle \nabla \omega(a), c- a\rangle - 
    \langle \omega(b), a - b\rangle
    \\
    &= 
    \omega(c) - \omega(b) + \langle -\nabla \omega(a), c- a\rangle 
    +
    \langle \omega(b), b - a\rangle 
    \\
    &= 
    \omega(c) - \omega(b) + \langle -\nabla \omega(a), c- a\rangle 
    + \langle \omega(b), b - c + c - a\rangle
    \\
    &= 
    \omega(c) - \omega(b) - \langle \nabla \omega(b), c - b\rangle + 
    \langle \nabla \omega(b) - \nabla \omega(a), c - a\rangle
    \\
    &= 
    D_\omega(c, b) + \langle \nabla \omega(b) - \nabla \omega(a), c - a\rangle. 
\end{aligned}
$$

It is simple algebra. 

**Remarks**

This lemma is a generalization of Consine Law in Euclidean space. 
Consider a direct substitution of $\omega = \Vert \cdot\Vert^2/2$, the energy function. 
Rewriting and substituting, it yields 

$$
\begin{aligned}
    D_\omega(c, b) 
    &= D_\omega(c, a) + D_\omega(a, b) - 
    \langle \nabla \omega(b) - \nabla \omega(a), c - a\rangle
    \\
    (1/2)\Vert c - b \Vert^2
    &= 
    (1/2)\Vert c- a\Vert^2 + (1/2)\Vert b - a\Vert^2 - 
    2 \langle b - a, c - a\rangle. 
\end{aligned}
$$

Rewriting the LHS to be $(1/2)\Vert c- a - (b - a)\Vert^2$, then the above formula is equivalent to the vector form of the Cosine Rule.
The original Cosine rule has two vectors, but it doesn't matter since a substitution $c - a = v, u = b - a$ would reveal the equivalence. 
The cosine rule interpretation makes it easier to memorize and reveals some insights. 

We encourage the readers to consider the case when $a, b, c$ are all on one line. 
We speculate that if there exist points $a, b \in \text{dom}(\partial f)$ and $c \in \text{dom}(f)$ such that $\langle \nabla \omega(b) - \nabla \omega(a), c - a\rangle = 0$, then it would recover the analogous Pythagoras theorem for the Bregman divergence. 

Finally, observe that if we have $c = b$, then the 3 points lemma becomes: 

$$
\begin{aligned}
    \langle \nabla \omega(b) - \nabla \omega(a), b - a\rangle = 
    D_\omega(b, a) + D_\omega(a, b), 
\end{aligned}
$$

And it has now become symmetric, and has only 2 points on it. 

---
### **Bregman Proximal Mapping**

One important possibility introduced by Bregman divergence is the generalization of Euclidean based proximal mapping. 
See [Bregman Proximal Mapping](Bregman%20Proximal%20Mapping.md) for more information. 


---
### **Examples of Bregman Divergence**

For the first example we take a look at the famous KL-Divergence. 
For more about KL-Divergence, visits [KL-Divergence](KL-Divergence.md). 

#### **Example | KL Divergence is Bregman Div of Negative Entropy over Unit Simplex**
> Let $\omega(x) =\sum x\odot \log(x)$ for all $x\in \mathbb R_{++}$, then $B_\omega(x)$ gives the KL-Divergence. 

**Demonstrations**

We consider the gradient of $\omega$ directly giving 

$$
\begin{aligned}
    \nabla \omega(y) &= 
    \nabla \left[\sum x\odot\log(x)\right]
    \\
    &=\sum_{i = 1}^{n} \partial_x[x\log(x)](y_i)\e_i
    \\
    &= \sum_{i = 1}^{n} [1 + \log(\cdot)](y_i)\e_i
    \\
    \langle \nabla \omega (y), y - x\rangle
    &= 
    \sum_{ i =1}^{n}
    (1 + \log y_i) \langle y - x, \e_i\rangle
    \\
    &= 
    \sum_{i = 1}^{n} (1 + \log y_i)(y_i - x_i). 
\end{aligned}
$$

Then using the definition of a Bregman Divergence we have the expression that for all $x \in \mathbb E$: 

$$
\begin{aligned}
    D_\omega(x, y) &= 
    \omega(x) - \omega(y) - \langle \nabla \omega(y), y - x\rangle
    \\
    &=
    \sum_{i = 1}^{n} x_i \log x_i - \sum_{ i =1}^{n} y_i \log y_i
    - 
    \sum_{i = 1}^{n} (1 + \log y_i)(y_i - x_i)
    \\
    &= \sum_{i = 1}^{n} x_i \log x_i - \sum_{ i =1}^{n} y_i \log y_i
    - 
    \sum_{i = 1}^{n} (\log y_i) (y_i - x_i) - 
    \left(
        \sum_{i = 1}^{n} y_i - x_i
    \right)
    \\
    &= 
    \sum_{i = 1}^{n} x_i \log x_i - \sum_{i = 1}^{n}(\log y_i)(-x_i) - 
    \underbrace{\left(
        \sum_{i = 1}^{n} y_i - x_i
    \right)}_{=0}
    \\
    &= 
    \sum_{i = 1}^{n}x_i \log(x_i/y_i). 
\end{aligned}
$$

Which is what we aimed to demonstrate. 

[^1]: A. Beck, _First-Order Methods in Optimization | SIAM Publications Library_. in MOS-SIAM Series in Optimization. SIAM. Accessed: Oct. 19, 2023. [Online]. Available: [https://epubs.siam.org/doi/book/10.1137/1.9781611974997](https://epubs.siam.org/doi/book/10.1137/1.9781611974997)

[^3]: H. H. Bauschke, J. Bolte, and M. Teboulle, “A Descent Lemma Beyond Lipschitz Gradient Continuity: First-Order Methods Revisited and Applications,” Mathematics of OR, vol. 42, no. 2, pp. 330–348, May 2017, doi: 10.1287/moor.2016.0817.


