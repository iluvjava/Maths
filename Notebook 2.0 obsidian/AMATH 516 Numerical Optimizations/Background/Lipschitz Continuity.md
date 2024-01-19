[Real Analysis Basics](Real%20Analysis%20Basics.md)

---
### **Intro**

Lipschitz Continuity is a type of continuity for function. Let's consider the Euclidean space to be the metric space and we consider functions of the type: $f(x):\mathbb{R}^m\mapsto \mathbb{R}^n$. Then, the function is Lipschitz if: 

> $$
> \exists L\in \mathbb{R}: \Vert f(x) - f(y)\Vert \le L \Vert x - y\Vert
> $$

Sometime, the function has Lipschitz Continuity over a compact domain, in that case the function is referred as Locally Lipschitz. 

**Remarks**

Take notes that, all Lipschitz continuous functions are also uniformly continuous. 
This is direct from the definition above. 
Proof Skipped. However, the converse is not true and one exception is $\sqrt{x}$ where it has it's derivative being unbounded at $x = 0$, uniformly continuous is a more general characteristics for functions compare to Lipschitz, but they are very god damn close. The statement that is stronger than Lipschitz continuity is differentiable function, under the ordinary definition of differentiability. 

$||\cdot||$ here is any norm, more importantly, it can be entirely different norm. Things are very different when we are in infinite dimensional spaces. 


---
### **Beta-Smoothness**

A function is beta smooth if its derivative is Lipschitz Continuous.  See [Beta Smoothness](Beta%20Smoothness.md) for more information. 
The condition of beta-smoothness is stronger than Lipschitz continuity.
See [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) for more information about using the global Lipschitz continuity used in convex optimization methods. 


---
### **Local Lipschitz Coninuity**

For this part of the content, we faithfully follow Prof Wang's teaching of MATH 564 at the university of Britich Columbia, Okanagan. 

#### **Def 2.29 | Lipschitz Function**

> Let $A\subseteq \mathbb R^n$, We say that $f: \mathbb R^n \mapsto \mathbb R$ is Lipschitz if $\exists K > 0$ such that $|f(x)  - f(y)| \le K\Vert x - y\Vert$ for all $x, y \in  A$. 
> 1. When $A$ is $\mathbb R^n$, we say that $f$ is a *Lipschitz function*. 
> 2. We say that if $f$ is *locally Lipschitz* on $O \subseteq \mathbb R^n$ if for all $x \in O$, there exists $\mathcal N(x) \subseteq O$, a neighbourhood of $x$ that is in $O$, such that $f$ is Lipschitz on $\mathcal N(x)$. 


**Observations**

If the topology defines the neighbourhood function to be the open ball around $x$, then we have point $x$ in the boundary to be inadmissible for a neighbourhood $\mathcal N(x)$ because points on the boundary intersect points outside the boundary and the function takes positive infinity for points that are outside of the boundary, meaning that all locally Lipschitz function are locally Lipschitz on an open set. 

If a function $f$ is locally Lipschitz on a compact set, then it's globally Lipschitz. 
Recall from [Heine Borel](Heine%20Borel.md) that a compact sets in in finite Euclidean space has finite open subcover. 
The domain of the function can be covered by a union of finitely many open sets. 
On each of these subcover, the function is Lipschitz. 
Taking the maximum among all the Lipschitz constants on these subcovers provides us with a Lipschitz constant over the compact domain. 

### **Remarks**

The definitions can be extended to functions whose domain is in $\mathbb R^n$ if we use different norms. 
For all normed spaces, Lipschitz continuity can be defined for any single-valued mapping. 

#### **Facts | Calculus of Locally Lipschitz Functions**
Let $f_1, f_2$ be locally lipschitz around the same point $\bar x$ then the following functions are still locally Lipschitz around $\bar x$. 
1. $f_1 + f_2$. The sum 
2. $f_1f_2$. The product
3. $f_1 / f_2$ where $f_2(\bar x)\neq 0$. 
4. $\max(f_1, f_2)$ or $\min(f_1, f_2)$. 




#### **Example**

> Let $f = x^2$ be a function on $\mathbb R$, then 
> 1. $f$ is locally Lipschitz. 
> 2. $f$ is not a Lipschitz function! 

**Demonstration**

To show (1.).
Fix $x_0 \in \mathbb R$ choose $r > 0$ then choose $x, y \in (x_0 - r, x_0 + r)$, then we have 
$$
\begin{aligned}
    |f(x) - f(y)| &= |x^2 - x^2|
    \\
    &= |x - y||x + y|
    \\
    &\le |x - y|(|x| + |y|) 
    \\
    &= |x - y|(|x - x_0 + x_0| + |y - x_0 + x_0|)
    \\
    &\le   |x - y|(|x - x_0| + |x_0| + |y - x_0| + |x_0|)
    \\
    &\le 
    2|x - y|(r  + |x_0|), 
\end{aligned}
$$

where we made use of the fact that $|x - x_0| \le r$ by how we choose $x, y$. 
Notice that $r + |x_0|$ is a bounded quantity for all values of $x_0 \in \mathbb R$. 
Therefore the function is a locally Lipschitz function. 

To see (2.)
Just fix $x = 0$ and let $y\in \mathbb R$  then the Lipschitz condition is $y^2 \le K|y|$, which means $y^2/|y| \le K$ and it's impossible to find a fixed $K \in \mathbb R$ such that the condition is true for all values of $y \in \mathbb R$. 

**Remarks**

The norm function $\Vert \cdot\Vert$ is a classical example of a Gloablly Lipschitz function. 

----
### **Equivalence for F-Differentiable Functions that is Locally Lipschitz**

The following theorem is taken from Prof Wang teaching of class 564 in UBCO 2024 Winter term 2. 

#### **Thm | Bounded Gradient and Local Lipschitz Continuity**
> Let $f: \mathbb  R^n \mapsto \mathbb R$ be a differentiable function. Then $f$ is Lipschitz on $O$ iff $\exists O$ such that $x \in O \implies \Vert \nabla f(x)\Vert\le K$. 

**Proof**

For proving the direction $\implies$, le tassume that $f$ is Lipschitz on $O$ then by definition for all $x, y \in O$ we have $|f(x) - f(y)| \le K \Vert x - y\Vert$. 
Where $K \in \mathbb R$. 
Directly consider the substitution $h = x - y$ and a scalar $t > 0$ then we have

$$
\begin{aligned}
    |f(x + t h) - f(x)| &\le K t\Vert h\Vert
    \\
    \iff 
    \frac{|f(x + t h) - f(x)|}{t} &\le K \Vert h\Vert \quad \text{ by } t > 0
    \\
    |\langle \nabla f(x), h\rangle| &\le K \Vert h\Vert \quad \text{ by $f$ differentiable. }
    \\
    \left|
        \frac{\langle \nabla f(x), h\rangle}{\Vert h\Vert}
    \right| &\le K, 
\end{aligned}
$$

Taking the supremum of the LHS for all $h \neq \mathbf 0$ yields $\Vert \nabla f(x)\Vert$ by an appliction of the Cauchy Schwartz inequality. 

For the other direction, assuming that $\Vert \nabla f(x)\Vert \le K$ for all $x \in O$. 
By MVT then 

$$
\begin{aligned}
    \exists c \in [x, y] : |f(x) - f(y)| &= |\langle \nabla f(c), x - y\rangle|\le 
    \Vert \nabla f(c)\Vert \Vert x - y\Vert \le K \Vert x - y\Vert. 
\end{aligned}
$$

So $f$ is Lipschitz continuous on the set $O$. 


---
### **Counter Example | Differentialble Everywhere but not Locally Lipschitz Everywhere**

The following is in MATH 564 taught by professor Wang in UBCO 2024 Winter Term 2. 
The result is highly unintuitive. 

### **Example | Differentiable but not Locally Lipschitz**

> The function: 
> $$
> \begin{aligned}
>     f(x) =
>     \begin{cases}
>         |x|^{3/2} \sin(1/x) & t \neq 0, 
>         \\
>         0 & \text{else}. 
>     \end{cases}
> \end{aligned}
> $$
> is a function that has 
> 1. It's differentiable on $\mathbb R$, but it's not $C^1$ around $x = 0$. (So this function is from the subset of function that is differentiable but not continuously differentiable. )
> 2. It's not Locally Lipschitz. 

**Observations**

The function is differentiable but it's not continuously differentable. 
By considering its derivative on $\mathbb R\setminus \mathbb \{ 0\}$ gives us

$$
\begin{aligned}
    f'(x) &= 
    \frac{|x^{3/2}|}{x^{3/2}}\frac{3}{2} x^{1/2}\sin(1/x) + 
    |x|^{3/2} \left(
        \frac{-1}{x^{2}}
    \right)\cos(1/x)
    \\
    &= 
    
\end{aligned}
$$

Here we used the fact that the derivative of $|\cdot|$ function has representation $|\cdot|/(\cdot)$. 


**Proof**



