---
alias: Fenchel Equality, Fenchel Identity
---
* [Convex Conjugation Introduction](Convex%20Conjugation%20Introduction.md)
* [Subgradients Intro](../Non-Smooth%20Calculus/Subgradients%20Intro.md)
* [Biconjugate Theorem](Biconjugate%20Theorem.md)

---
### **Intro**

The Fenchel inequality ties together the idea of convex conjugate, subgradient, and convexity of functions. 

#### **Observation-1 | Fenchel Inequality**
> Let $f$ be a proper function, then it's possible to choose $x\in \text{dom}(x)$ such that $f(x)\neq \infty$, by this we have: 
> $$
> \begin{aligned}
>   & f^\star(y) = \sup_{x'\in X} \{\langle y, x'\rangle - f(x')\} \ge \langle y, x\rangle - f(x)
>   \\
>   & f(x) + f^\star(y) \ge \langle x, y\rangle. 
> \end{aligned}
> $$
> This is direct from the definition of Fenchel Conjugate. 

However, the equality can be achieved if, the function $f$ is closed and convex. We state the theorem. 

#### **Theorem 1 | Fenchel's Identity and Equivalences**
> Let $f$ be convex and proper, then there exists $x, y\in X$ which makes the following conditions equivalent: 
> 1. $f(x) + f^\star(y) = \langle x, y\rangle$, 
> 2. $y \in \partial f(x)$, 
> 3. $x\in \partial f^\star(y)$ IF, $f$ is also l.s.c. 

The first item shows that equality can be achieved, and the second and third conditions gives what to expect for $x,y$ when equality is achieved. 
The proof at the end of this file. 


#### **Theorem 2 | Subgradient via dual**
> Let $f$ be convex and proper, then it holds that
> $$
> \begin{aligned}
>	 & y \in \partial f (x) \iff 
>     y \in \argmax{z} \left\lbrace
>         \langle x, z\rangle - f^\star(z)
>     \right\rbrace, \\ 
>     & f(x) = f^{\star\star}(x).
> \end{aligned}
> $$

**Proof**

We can use the previous theorem and start with the equivalence between (1), (2) in Theorem 1 which yields: 

$$
\begin{aligned}
    y &\in \partial f(x) \\
    \iff 
    f(x) &= \langle  x, y\rangle - f^\star(y)
    \\
    &\le 
    \sup_z \left\lbrace
        \langle x, z\rangle - f^\star (z)
    \right\rbrace
    \\
    &= f^{\star\star}(x) = \text{cl}\; f(x) \le f(x). 
\end{aligned}
$$

Hence it has $\sup_{z}\{ \langle x, z\rangle - f^\star(z)\} = \langle x, y\rangle - f^\star(y)$ hence $y \in \argmax{z}\{\langle x, z\rangle - f^\star(z)\}$. 
At the same time it has $f(x) \le f^{\star\star}(x) \le f(x)$, hence $f^{\star\star}(x) = f(x)$. 
For the converse we use $f(x) = f^{\star\star}(x)$ that we just proved.
Suppose that $y \in \argmax{z}\{\langle x, z\rangle - f^\star(z)\}$ hence it has 

$$
\begin{aligned}
    \langle x, y\rangle - f^\star(y) &= 
    \sup_{z} \left\lbrace
        \langle x, z\rangle - f^\star(z) 
    \right\rbrace = f^{\star\star}(x) = f(x)
    \\
    \iff \langle x, y\rangle - f^\star(y) &= f(x). 
\end{aligned}
$$

Using Proposition 1 (1) it's equivalent to $y \in \partial f(x)$. 

$\blacksquare$


---
### **Fenchel Equality**

Recall these facts: 
- Conjugate is convex. (In Prereq)
- Zero in subgradient is global optimal for any convex function. [Convex Subgradient](../Non-Smooth%20Calculus/Convex%20Subgradient.md)
- Subgradient strong sum rule. [Subgradient Sum Rule](../Non-Smooth%20Calculus/Subgradient%20Sum%20Rule.md)

**Proof**

We first show that, (1) is equivalent to item (2). 
By the definition of convex conjugate we have: 
$$
\begin{aligned}
   & 
   f(x) + f^\star(y) = \langle x, y\rangle
   \\
   \iff &
   f(x) + \sup_{z\in X}
   \{
      \langle y, z\rangle - f(z) 
   \} = \langle x, y\rangle 
   \\
   \iff &
   \sup_{z\in X}
   \left\lbrace
      \langle y, z\rangle - f(z)
   \right\rbrace = \langle x, y\rangle - f(x)
   \\
   \iff &
   x \in \arg\sup_{z\in X}
   \left\lbrace
      \langle y, z\rangle - f(z) 
   \right\rbrace \neq \emptyset
   \\
   \iff & 
   x \in - \arg\inf_{z\in Z} \left\lbrace
      f(z) - \langle y, z\rangle
   \right\rbrace
   \\
   \underset{\text{[1]}}{\iff} &
   \mathbf 0 \in \partial [z \mapsto f(z) - \langle y, z\rangle](x) 
   \\
   \underset{\text{[2]}}{\iff} & 
   \mathbf 0 \in \partial f(x) - y \quad 
   \\
   \iff & 
   y \in \partial f(x)
\end{aligned}
$$

- \[1\]: The function $f(z)$ is convex and proper, we may use the Fermat's rule for convex subgradient. 
- \[2\]: We use the strong subgradient sum rule since $f$ is convex proper, and $\langle . y\rangle$ is affine with domain on the entirety of $X$. 

We had shown that, (1), (2) are equivalent conditions. We now show (3). Adding the fact that $f$ is lower semi-continuous, its epigraph is closed. Hence, we invoke [Biconjugate Theorem](Biconjugate%20Theorem.md) to attain: $f = f^{\star\star}$. Re-applying the above proved equivalences, we have: $f^\star(y) + (f^\star)^\star(x) = \langle z, y\rangle \iff x \in \partial f^\star(y)$. By $f^{\star\star} = f$, we have $y\in \partial f(x)$as well. Therefore, $y\in \partial f(x)\iff x \in \partial f^\star(y)$. The closure of the function is essentially.

$\blacksquare$

**Alternative Proof**

The equivalence between (1), (2). 
Starting with (1), for all $z$, it has 

$$
\begin{aligned}
    0 &= f(x) + f^\star(y) - \langle x, y\rangle
    \\
    &= \langle x, y\rangle - f(x) - f^\star (y)
    \\
    &= \langle x, y\rangle - f(x) - \sup_{w}  \left\lbrace \langle w, y\rangle - f(w) \right\rbrace
    \\
    &\le \langle x, y\rangle - f(x) - \langle z, y\rangle + f(z)
    \\
    &= \langle y, x - z\rangle - f(x) + f(z) 
    \\
    &= f(z) - f(x) - \langle y, z - x\rangle.
\end{aligned}
$$
The last line is greater than zero which implies $y \in \partial f(x)$. 
To see the converse, observe that Frenchel Inequality combined with the above results has for all $z \in \R^n$: 

$$
\begin{aligned}
    0 &\le 
    f(x) + f^\star(y) - \langle x, y\rangle
    \le 
    f(z) - f(x) - \langle y, z - x\rangle. 
\end{aligned}
$$

Set $z = x$ then the third term compresses the first term to zero, which is (1). 

Because $f$ is closed, bi-conjugate theorem applies and $f^{\star\star} = f$. 
Applying (1) to $f^\star$ instead it yields: 
$$
\begin{aligned}
    y \in \partial f^*(x) \iff 
    0 &= f^\star(y) + (f^\star)^\star(x) - \langle  x, y\rangle
    \\
    &= f^*(y) + f(x) - \langle x, y\rangle
\end{aligned}
$$

So (3) and (1) is equivalent if bi-conjugate theorem holds. 

$\blacksquare$


**Remarks**

One of the key things people focus on is relevant to the optimality conditions of the primal dual problem. The original function reaches optimality means that $z\in \partial f(\mathbf 0)$, and equivalently we have $x^+ \in \partial f^\star(0)$. 

The last item, (3) is very important because it opens up a new way of looking for both, subgradient and conjugate functions under various context. Giving us new interpretations for both entities, and helps with computational rules and proving those rules. 
