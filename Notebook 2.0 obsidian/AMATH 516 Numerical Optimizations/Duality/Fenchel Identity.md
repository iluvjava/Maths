* [[Convex Conjugation]]
* [[../Non-Smooth Calculus/Subgradient Definition]]

---
### **Fenchel's Identity**

Fenchel's Identity relates the subgradient to the conjugate function. The conjugate function returns the negative offset of the affine minorants that supports the function $f$ at given point; namely $f(x) \ge \langle x, z\rangle -f^\star(z)$ is established directly as a consequence. 

**Claim 1**
> The dual variable is in the sub gradient of the original function. (Make sense geometrically), The argument is reversible, which means that: 
> $$
> z \in \partial f(x) \tag{1}
> \iff f(z) + f^{*}(x^+) = z^Tx^+
> $$
> For $z \in \arg\sup_x\{z^T - f(x)\}$, and $f$ be a closed and convex function. 

**Proof**: 

Recall: **f is closed and convex**, by definition equality is attainable using supporting halfspaces defined via the convex conjugate functions: 

$$
\begin{aligned}
    & f^\star(z) = \sup_x \{z^Tx - f(x)\} \ge z^Ty - f(y) \quad \forall y
    \\ \underset{[1]}{\implies}
    & z^Tx^+ - f(x^+) \ge  z^Ty - f(y) \quad \forall y, x^+\in \arg\sup_x\{z^Tx - f(x)\}
    \\ \underset{[2]}{\implies}
    & f(y) \ge  z^T(y - x) + f(x^+) \quad
    \\ \underset{[3]}{\implies}
	& z \in \partial f(x^+)
\end{aligned}
$$

\[1\]: $x^+$ is fixed by the sup, it solves the supreme operator.

\[2\]: to 3: Just algebra.

\[3\]: By the definition of subgradient of convex function, the Cauchy subgradient inequality.

Suppose $x^{+} = \arg\sup_x\{z^Tx - f(x)\}$, then 

$$
\begin{aligned}
    \underset{(1)}{\implies} f^\star(z) + f(x^+) &= z^Tx^+
    \\
    \underset{[1]}{\implies} f^{\star\star}(z) + f^{*}(x^+) &= z^Tx^+
    \\ \underset{f \text{ convex}}{\implies}
    f(z) + f^{*}(x^+) &= z^Tx^+
\end{aligned}
$$

**Remarks**

* We do consider the case where $x^+$ has some of its components to be infinity (**#CITATION_NEEDED**). In that case, the claim $z\in \partial f(x^+)$ would still hold. 

* Notice that, this time, $z, x$ swapped, and we have $f^\star(x)$ instead of $f(x)$. Go through the same proof for (1) but with $f(x)$ as $f^{\star\star}(x)$, then we will a new claim:

**Corollary: Fenchel's Identity**
> $$
> z\in \partial f(x^+) \iff x^+ \in \partial f^\star(z) \tag{2}
> $$
> Given dual, primal variable $x, z$, they are in the subgradient of each of their objective function, $f, f^\star$. 

**Proof**

See the remarks before the claim. 

**Remarks**

One of the key things people focuses on is relavent to the optimality conditions of the primal dual problem. The original function reaches optimality means that $z\in \partial f(\mathbf 0)$, and equivalently we have $x^+ \in \partial f^\star(0)$. 

This corollary is **extremely important** because it opens up a new way of looking for both, subgradient and conjugate functions under various context. Giving us new interpretations for both entities, and helps with computational rules and proving those rules. 

