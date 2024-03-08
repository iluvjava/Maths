
- [Normal Cone](Normal%20Cone.md)
- [Regular Subgradient](Subgradient%20Intro.md)

---
### **Intro**

We discuss some of the properties expected of Variational normal cones. 
Recall the definition of a regular Frechet normal cone defined on set $C \subseteq \mathbb R^n$: 

#### **Def | Frechet Regular Normal Cone**

$$
\begin{aligned}
    v \in \widehat N_C(\bar x) \iff 
    \limsup_{
        \substack{
            x \rightarrow \bar x 
            \\
            x \in C}
        }
    \frac{\langle c, x - \bar x\rangle}{\Vert x - \bar x\Vert} \le 
    0 \quad 
    \forall c \in C. 
\end{aligned}
$$


**Remarks**
The reader should realize the similarity between the definition of the limiting normal cone and the limiting subgradient. 

---
#### **Def | Limiting Normal Cone**
> Let $C \subseteq \mathbb R^n$. Let $\bar x \in C$. 
> Then we define $v \in N_C(\bar x)$ to be the limiting normal cone and $v$ is defined by the characterization that: 
> $$
> \begin{aligned}
>     N_C(\bar x) := 
>     \left\lbrace
>         v \in \mathbb R^n\left| 
>             \exists\; 
>              x^{(\gamma)}  \overset{\in C}{\longrightarrow} \bar x \text{ s.t: }
>             v^{(\gamma)} \in \widehat 
>             N\left(x^{(\gamma)}\right), v^{(\gamma)}\rightarrow v
>         \right.
>     \right\rbrace
> \end{aligned}
> $$
> In short, the outer set limit of the set operator $\widehat N_C(\bar x)$ is the limiting normal cone. 


---
### **The Basics**

We introduce some basic properties of the normal based on the definition of the normal cone. 

#### **Thm | The Basics of Regular Normal Cone**
> Let $C \subseteq \mathbb R^n$, let $\widehat N_C(\bar x)$ be the regular normal cone then 
> 1. $\widehat N_C(\bar x)$ is a closed convex cone. 
> 2. $N_C(\bar x)$ is a closed cone. 
> 3. $\mathbf 0 \in \widehat N_C(\bar x) \subseteq N_C(\bar x)$. 

**Proof** 

From the definition it's direct that $\widehat N_C(\bar x)$ is a cone and it's closed. 
To see (1.) is true, so that C is convex, observe that for non-negative $\alpha, \beta$, and $u \in \widehat N_C(\bar x), v \in \widehat N_C(\bar x)$, then $\alpha u \in \widehat N_C(\bar x)$ and $\beta v \in \widehat N_C(\bar x)$. 
Consider the expression 

$$
\begin{aligned}
    \frac{\langle \alpha u + \beta v, x - \bar x\rangle}{ o(\Vert x - \bar x\Vert)} 
    &= 
    \alpha\left(
        \frac{\langle  u, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)} 
    \right) + 
    \beta
    \left(
        \frac{\langle v, x -\bar x\rangle}{o(\Vert x - \bar x\Vert)}
    \right)
    \\
    \limsup_{x \overset{\in C}{\rightarrow } \bar x}
        \frac{\langle \alpha u + \beta v, x - \bar x\rangle}{ o(\Vert x - \bar x\Vert)} 
    &= 
    \limsup_{x \overset{\in C}{\rightarrow } \bar x}
    \alpha\left(
        \frac{\langle  u, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)} 
    \right) + 
    \beta
    \left(
        \frac{\langle v, x -\bar x\rangle}{o(\Vert x - \bar x\Vert)}
    \right)
    \\
    &= 
    \alpha \limsup_{x \overset{\in C}{\rightarrow } \bar x}
        \frac{\langle  u, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)} 
    + 
    \beta \limsup_{x \overset{\in C}{\rightarrow } \bar x}
    \frac{\langle v, x - \bar x\rangle}{o(\Vert x - \bar x\Vert)}. 
    \\
    & \le 0
\end{aligned}
$$

At the last line we used the fact that the limit exists due $\alpha v, \beta u \in \widehat N_C(\bar x)$. 
And the conclusion of the above derivation would be that $\alpha u + \beta v \in \widehat N_C(\bar x)$ as well, and therefore the cone is a convex cone. 
The set is closed because by the definition we have that $\mathbf 0 \in \widehat N_{C}(\bar x)$ trivially. 

#### **Thm | Parallelization Properties of Normal Cone**
> Let $C = \Omega_1 \times \Omega_2$, so that it can be represented as the product space of 2 vector spaces. 
> I.e: $A \subseteq \mathbb R^k$, $B \subseteq \mathbb R^l$, with $k + l = n$. 
> Then the regular normal cone has $\widehat N_C(\bar x) = \widehat N_{\Omega_1}(\bar x) \times \widehat N_{\Omega_2}(\bar x)$. 
> The same thing happens for limiting normal cone. 


**Proof**


To show $\supseteq$ consider $(v_1, v_2) \in \widehat N_{\Omega_1}(\bar x_1)\times \widehat N_{\Omega_2}(\bar x_2)$. 


$$
\begin{aligned}
    \langle v_i, x_i - \bar x_i\rangle 
    &\le o (\Vert x_i - \bar x_i\Vert) \quad i \in \{1, 2\}
    \\
    \langle v_1, x_1 - \bar x_1\rangle + \langle v_2, x_2 - \bar x_2\rangle 
    &\le 
    o(\Vert x_0- \bar x_1\Vert) + o(\Vert x_2 - \bar x_2\Vert)
    \\
    \langle (v_1, v_2), (x_1 - \bar x_1, x_2 - \bar x_2)\rangle
    &\le 
    o(\Vert x_1 - \bar x_1\Vert) + o(\Vert x_2 - \bar x_2\Vert)
    \\
    \frac{\langle (v_1, v_2), (x_1 - \bar x_1, x_2 - \bar x_2)\rangle}{
        \Vert (x_1, x_2) - (\bar x_1, \bar x_2)\Vert
    }
    &\le 
    \frac{o(\Vert x_1 - \bar x_1\Vert) + o(\Vert x_2 - \bar x_2\Vert)}{
        \Vert (x_1, x_2) - (\bar x_1, \bar x_2)\Vert
    }.
\end{aligned}
$$

That last statement proved what we want by the observation that $\Vert (x_1, x_2) - (\bar x_1, \bar x_2)\Vert = \Vert x_1 - \bar x_1\Vert + \Vert x_2 -\bar x_2\Vert$. 
Taking limsup on the LHS yields the result $(v_1, v_2) \in \widehat N_{\Omega_1 \times \Omega_2}((\bar x_1, \bar x_2))$. 
$\supseteq$ is now proven. 
To show that other direction consider $(v_1, v_2)\in \widehat N_{\Omega_1 \times \Omega_2}(\bar x)$. 
By the definition that would give 
$$
\begin{aligned}
    \langle (v_1, v_2), (x_1 - \bar x_1, x_2 - \bar x_2)\rangle &\le 
    o (\Vert (x_1 - \bar x_1, x_2 - \bar x_2)\Vert) \quad 
    \forall (x_1, x_2) \in \Omega_1 \times \Omega_2. 
\end{aligned}
$$

If $x_1 = \bar x_1$ then $\langle (v_1, v_2), (x_1 - \bar x_1, x_2 - \bar x_2)\rangle = \langle v_2, x_2 - \bar x_2\rangle \le o(\Vert x_2 - \bar x_2\Vert)$, which implies that $v_2 \in \widehat N_{\Omega_2}(\bar x_2)$. 
Similarly if we set $x_2 = \bar x_2 \in \Omega_2$, we deduce that $v_1 \in \Omega_1(\bar x  _1)$. 
Therefore the $\subseteq$ is proven. 

For the limiting normal cone, consider the limit $(x_1^{(n)}, x_2^{(n)}) \in \Omega_1 \times \Omega_2$ for $n \in \mathbb N$. 
Then we have that

$$
\begin{aligned}
    N_{\Omega_1\times\Omega_2}(\bar x_1, \bar x_2) &= 
    \underset{n \rightarrow \infty}{
        \text{Limsup }
    } 
    \widehat N_{\Omega_1 \times \Omega_2}((\bar x_1, \bar x_2))
    \\
    &= \underset{n \rightarrow \infty}{\text{Limsup}}
    \left(
        \widehat N_{\Omega_1}(\bar x_1)
    \right)\times \left(
        \widehat N_{\Omega_2}(\bar x_2) 
    \right)
    \\
    &= 
    \left(
        \underset{n \rightarrow \infty}{\text{Limsup}} 
        \widehat N_{\Omega_1}(\bar x_1)
    \right)
    \times 
    \left(
        \underset{n \rightarrow \infty}{\text{Limsup}} 
        \widehat N_{\Omega_2}(\bar x_2)
    \right). 
\end{aligned}
$$

Because set limit can be broacasted to each of the components directly for any converging sequence. 


---
### **Normal Cone of Graph of a Lipschitz Mapping**

The normal cone of the graph of a Lipschitz mapping is related to the regular subgradient. 

####  **Thm | Tangent Cone of Locally Lipschitz Mapping**
> Let $F: \mathbb R^n \mapsto \mathbb R^m$ be locally Lipschitz, let $S = \text{gph}(F):= \{(x, F(x)) | x \in \mathbb R^n\}$. 
> Then we have 
> 1. $(x^*, - y^*) \in \widehat N_S(\bar x, F(\bar x))\implies x^* \in \widehat \partial [\langle y^*, F(\cdot)\rangle](\bar x)$. 
> 2. $(x^*, - y^*)\in N_S(\bar x, F(\bar x)) \implies x^* \in \partial [\langle y^*, F(\cdot)\rangle](\bar x)$. 

**Observation**

The converse is not gonna be proved here. 

**Proof**

Directly from the definition we have 

$$
\begin{aligned}
    (x^*, - y^*) \in \widehat N_S(x, F(\bar x)) 
    \iff 
    0 \ge \langle (x^*, -y^*), (y - \bar x, F(y) - F(\overline x))\rangle + 
    o(\Vert (y - \bar x, F(y) - F(\bar x))\Vert)
\end{aligned}
$$

By locally Lipschitz property of the mapping $F$, we have $o(\Vert (y - \bar x, F(y) - F(\bar x))\Vert)$ is of $o(\Vert y - \bar x\Vert)$. 
With that we simply the conditions and gives 

$$
\begin{aligned}
    0 &\ge 
    \langle (x^*, - y^*), (y - \bar x, F(y) - F(\bar x))\rangle
    + o(\Vert y - \bar x\Vert)
    \\
    0 &\ge 
    \langle x^*, y - \bar x\rangle - 
    \langle y^*, F(y) - F(\bar x)\rangle
    + 
    o(\Vert y - \bar x\Vert)
    \\
    \langle y^*, F(y) - F(\bar x)\rangle - \langle x^*, \bar x - y\rangle
    &\ge 
    o(\Vert y - \bar x\Vert). 
\end{aligned}
$$

The condition of the last line is equivalent to the definition of regular subgradient, i.e: $x^* \in \widehat \partial [z \mapsto \langle y^*, F(z)\rangle](\bar x)$. 


---
### **Variational Characterzation of the Frechet Normal Cone**


