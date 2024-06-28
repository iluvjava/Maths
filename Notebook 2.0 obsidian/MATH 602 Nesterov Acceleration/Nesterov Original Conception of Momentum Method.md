---
alias: Nesterov Acceleration Sequence Method, Nesterov Estimating Sequence


---
- [Smooth Gradient Descend The Basics](Smooth%20Gradient%20Descend%20The%20Basics.md)
- [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md)
- [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)

### **Toc for VS Code**

- [**Toc for VS Code**](#toc-for-vs-code)
- [**Prelimaries, the Estimating Sequence and Function**](#prelimaries-the-estimating-sequence-and-function)
  - [**Def (2.2.1) | Estimating Sequences and Estimating Functions**](#def-221--estimating-sequences-and-estimating-functions)
  - [**Characterizations (Lemma 2.2.1) | Conditions for Descent on Objective Value**](#characterizations-lemma-221--conditions-for-descent-on-objective-value)
- [**An Potential Updates Procedures for Estimating Sequences and Functions**](#an-potential-updates-procedures-for-estimating-sequences-and-functions)
  - [**Lemma 2.2.2  | The Proposed Updates**](#lemma-222--the-proposed-updates)
  - [**Corollary 1 | Characterization of the Estimating Sequences and Functions**](#corollary-1--characterization-of-the-estimating-sequences-and-functions)
- [**Giving a Form to the Estimating Sequence and Functions so It's easy to Derive the Algorithm**](#giving-a-form-to-the-estimating-sequence-and-functions-so-its-easy-to-derive-the-algorithm)
  - [**Lemma 2.2.3 | Updating with the Canonical Form**](#lemma-223--updating-with-the-canonical-form)
- [**Deriving the Generic Accelerated Momentum Method**](#deriving-the-generic-accelerated-momentum-method)
- [**Simplifying The algorith to the Momentum Form**](#simplifying-the-algorith-to-the-momentum-form)
  - [**Eliminating $v^{(k)}$ from the Algorithm**](#eliminating-vk-from-the-algorithm)
  - [**Eliminating the $\\gamma\_k$ Constant**](#eliminating-the-gammak-constant)
- [**A Generic Convergence Results**](#a-generic-convergence-results)
  - [**Thm (2.2.1) | Generic Convergence Results**](#thm-221--generic-convergence-results)
- [**Conclusion**](#conclusion)




---
### **Prelimaries, the Estimating Sequence and Function**

The gradient descent with momentum derived by Nesterov is a constructive approach and it has great potentials for re-interpretations, expansions and generalizations. We faithfully follow "Nesterov's Lectures on Convex Optimizations (2nd edition)", chapter 2 of his book. 

My contributions here involve some extra gory mathematical details for the record keeping, a better exposition and comments on what I think Nesterov tries to do. And finally, correctly identify the way of adding non-smoothness into Nesterov's derivations. 

#### **Def (2.2.1) | Estimating Sequences and Estimating Functions**
> A pair of sequences $\{\phi_k(x)\}_{k = 0}^\infty$ and $\{\lambda_k\}_{\kappa = 0}^\infty$, are called the estimating sequences of the function $f(\cdot)$ if $\lambda_k \rightarrow 0$, and for any $x\in \mathbb R^n$ and $k\ge 0$ we have 
> $$
>   \phi_k(x) \le (1 - \lambda_k)f(x) + \lambda_k \phi_0(x).
> $$

**Observations**

Anchoring on the initial function $\phi_0$, the estimating sequence and estimating function gives a function $\phi_k$ that such the convex combination between $f, \phi_0$ with $\lambda_k$ is always a lower estimation. 

The next lemma provide one sufficient characterizations for an estimating sequence/function, along with the potential usefulness for upper-bounding the optimality gap. 

#### **Characterizations (Lemma 2.2.1) | Conditions for Descent on Objective Value**
> If for some sequence of points $(x^{(k)})_{k = 0}^\infty$, we have  
> $$
>    f(x^{(k)}) \le \phi_k^* := \min_{x\in \mathbb R^n} \phi_k(x), 
> $$ 
> then $f(x^{(k)}) - f^* \le \lambda_k (\phi_0(x^*) - f_*) \rightarrow 0$. 

**Proof**

$$
\begin{aligned}
    f\left(x^{(k)}\right) &\le \phi_k^*
    \\
    & \le \min_{x\in \mathbb R^n}\left(
        (1 - \lambda_k) f(x) + \lambda_k \phi_0(x)
    \right)
    \\
    & \le (1 - \lambda_k) f(x^*) + \lambda_k \phi_0(x^*)
    \\
    \implies 
    f\left(
        x^{(k)}
    \right) - f(x_*) 
    &\le \lambda_k (\phi_0(x^*) - f(x^*)). 
\end{aligned}
$$

**Remarks**

It seems like $x^*$ doesn't have to be strictly a minimizer either. We may define $x_*^{(k)}$ to be an aproximation sequence such that $f(x_*^{(k)}) - \inf_{x}f(x) \le \epsilon_k$, with $\lim_{k\rightarrow \infty} \epsilon_k = 0$. 

To realize these entities, there are 2 questions here. 

1. Formulate an Estimating Sequence and Function, satisfying definition (2.2.1). 
2. Formulate an Estimating Sequence and Function that satisfies the descent conditions, along with an algorithm that generates the sequence of $(x^{(k)})_{k = 0}^\infty$ such that the sequence is satisfied. 

**Open Questions**

Is there a Lypunov interpretation for it? 

---
### **An Potential Updates Procedures for Estimating Sequences and Functions**

The Estimating sequences and function are defined by an objective function $f$. 

#### **Lemma 2.2.2  | The Proposed Updates**
> 1. A function $f(\cdot)\in \mathcal F_{\mu, L}^{1, 1}(\mathbb R^n)$ where $\mu \ge 0$, with potentially $\mu = 0$. It means that the function is Lipschitz smooth, and it could be strongly convex, 
> 2. $\phi_0(\cdot)$ is a arbitrary convex function in $\mathbb R^n$, 
> 3. $\{y^{(k)}\}_{k = 0}^\infty$ is an arbitrary sequence of points in $\mathbb R^n$, it will satisfy condition in item (5.). 
> 4. The coefficients $\{\alpha_k\}_{k = 0}^\infty$ satisfy conditions $\alpha_k \in (0, 1)$ and $\sum_{k = 0}^{\infty}\alpha_k = \infty$, 
> 5. We choose $\lambda_0 = 1$. 
> Then the pair of estimating sequence and function $(\phi_k(\cdot))_{k = 0}^\infty$ and $(\lambda_k)_{k = 0}^\infty$, and the sequence $(y_k)_{k = 0}^\infty$, satisfy the following relations for all $k = \in \N$: 
> $$
>   \begin{aligned}
>       \lambda_{k + 1} &= (1 - \alpha_k) \lambda_k, 
>       \\
>       \phi_{k + 1}(x) &= (1 - \alpha_k)\phi_k(x) + \alpha_k \left(
>               f\left(y^{(k)}\right) + 
>               \left\langle 
>                   \nabla f\left(
>                   y^{(k)}
>               \right), x - y^{(k)} \right\rangle
>               + 
>               \frac{\mu}{2} \left\Vert x - y^{(k)}\right\Vert^2
>           \right), 
>   \end{aligned}\tag{[1]}
> $$
> Are estimating sequences and functions. 

**Observations**

$\phi_{k + 1}(x)$ is the sum of a lower surrogate function and the previous $\phi_k$. 

**Proofs**

Inductively we assume that $\phi_k$ satisfies definition 2.2.1 so that $\phi_k(x) \le (1 - \lambda_k)f(x) + \lambda_k \phi_0(x)$. Then we want to show $\phi_{k + 1}(x)\le (1 - \lambda_{k + 1})f(x) + \lambda_{k + 1}\phi_0(x)$. We may start with the update rule in lemma 2.2.2 so

$$
\begin{aligned}
    \phi_{k + 1}(x) &= (1 - \alpha_k)\phi_k(x) + \alpha_k \left(
            f\left(y^{(k)}\right) + 
            \left\langle \nabla f\left(
                y^{(k)}
            \right), x - y^{(k)} \right\rangle
            + 
            \frac{\mu}{2} \left\Vert x - y^{(k)}\right\Vert^2
        \right)
    \\
    & \triangleright \; \text{using } f \in \mathcal F_{\mu \ge 0, L}^{1, 1}, 
    \\
    \phi_{k + 1}(x) &\le 
    (1 - \alpha_k) \phi_k(x) + \alpha_k f(x)
    \\
    & \triangleright \text{apply IH, on $\phi_k$, ignore $(x)$ for better notation then}
    \\
    &\le 
    \alpha_k f + (1 - \alpha_k)((1 - \lambda_k)f + \lambda_k \phi_0)
    \\
    &= \alpha_k f + (1 - \alpha_k)(1 - \lambda_k)f + (1 - \alpha_k)\lambda_k \phi_0
    \\
    &= (\alpha_k + (1 - \alpha_k)(1 - \lambda_k)) f + (1 - \alpha_k)\lambda_k \phi_0
    \\
    &\quad \triangleright
    \left\lbrace\begin{aligned}
        & \alpha_k + 1 - \lambda_k - \alpha_k + \alpha_k \lambda_k
        \\
        =&\; 
        1 - \lambda_k + \alpha_k \lambda_k
        \\
        =&\;1 - \lambda_k(1 - \alpha_k)  
        \\
        =& \; 1 - \lambda_{k + 1}
    \end{aligned}\right.
    \\
    &= (1 - \lambda_{k + 1})f + (1 - \alpha_k)\lambda_k\phi_0
    \\
    &= (1 - \lambda_{k + 1})f + \lambda_{k + 1}\phi_0. 
\end{aligned}
$$

Next, we wish to prove that the sequence $\lambda_k\rightarrow 0$. For contraposition if $\lim_{n\rightarrow \infty}\lambda_n \ge \epsilon > 0$ then sum over $\alpha_k$ is bounded because: 
$$
\begin{aligned}
    (1 - \alpha_k)\lambda_k &= \lambda_k - \alpha_k \lambda_k
    \\
    &\le
    \lambda_k - \epsilon\alpha_k
    \\
    \implies 
    \epsilon\alpha_k &\le \lambda_k - \lambda_{k + 1}
    \\
    \epsilon \sum_{k = 1}^{\infty}\alpha_k&\le \lambda_1 - \epsilon < \infty, 
\end{aligned}
$$

therefore we must have $\lim_{k\rightarrow \infty} \lambda_k = 0$. 

**Remarks**

To fit this update to the characterizations, lemma 2.2.1, it it's required to identify $\phi_k^*$, the minimum for each of the estimating functions. In the later text by Nesterov, a new lower bound function is proposed with the proximal operator, after some derivation, that lower bound function yield the accelerated proximal gradient method. 

#### **Corollary 1 | Characterization of the Estimating Sequences and Functions**
> 1. A function $f(\cdot)\in \mathcal F_{\mu, L}^{1, 1}(\mathbb R^n)$ where $\mu \ge 0$, with potentially $\mu = 0$. It means that the function is Lipschitz smooth, and it could be strongly convex, 
> 2. $\phi_0(\cdot)$ is a arbitrary convex function in $\mathbb R^n$, 
> 3. $\{y^{(k)}\}_{k = 0}^\infty$ is a sequence of points in $\mathbb R^n$, it will be specific for (5.). 
> 4. The coefficients $\{\alpha_k\}_{k = 0}^\infty$ satisfy conditions $\alpha_k \in (0, 1)$ and $\sum_{k = 0}^{\infty}\alpha_k = \infty$, 
> 5. We choose $\lambda_0 = 1$. 
> Then the pair of estimating sequence and function $(\phi_k(\cdot))_{k = 0}^\infty$ and $(\lambda_k)_{k = 0}^\infty$, defined recursively by the relations 
> $$
>   \begin{aligned}
>       \lambda_{k + 1} &= (1 - \alpha_k) \lambda_k, 
>       \\
>       \phi_{k + 1}(x) &= (1 - \alpha_k)\phi_k(x) + \alpha_k
>               \varphi(x | y^{(k)})
>   \end{aligned}\tag{[1]}
> $$
> 6. Where $\varphi(x| y^{(k)})$ is the lower bounding function satisfying the condition $\varphi(x| y^{(k)}) \le F(x)\;\forall x$. 
> Are estimating sequences and functions. 

**Proof**

The same exact proof follows through, replacing the convexiy lower bound for $f\in \mathcal F_{\mu, L}^{1, 1}$ with rule (6.) above. 




---
### **Giving a Form to the Estimating Sequence and Functions so It's easy to Derive the Algorithm**

Nesterov find a simple quadratic form for the estimating sequence $\phi_k$ such that, it's preseved under the update procedures. 

#### **Lemma 2.2.3 | Updating with the Canonical Form**
> Continuing from the previous corollary,
> let $\phi_0^* + \frac{\gamma_0}{2}\Vert x - v^{(k)}\Vert^2$. Then the process described in lemma 2.2.2 preseves this canonical form for functions $\phi_k(x)$, with $\phi_k(x) = \phi_k^* + \frac{\gamma_k}{2}\Vert x - v_k\Vert^2$, where $v^{(k)}$ is the minmizer of $\phi_k$, and the parameters $\gamma_k, v^{(k)}, \phi_k^*$ that define $\phi_k$ staifies the recurrence
> $$
> \begin{aligned}
>     \gamma_{k + 1} &= (1 - \alpha_k)\gamma_k + \alpha_k \mu
>     \\
>     v^{(k + 1)} 
>     &= \gamma_{k + 1}^{-1}\left(
>         (1 - \alpha_k)\gamma_k v^{(k)} + \alpha_k \mu y^{(k)} - \alpha_k \nabla f\left(y^{(k)}\right)
>     \right)
>     \\
>     \phi_{k + 1}^* 
>     &= 
>     (1 - \alpha_k)\phi_k^* + \alpha_k f\left(y^{(k)}\right) - 
>     \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
>         \nabla f\left(y^{(k)}\right)
>     \right\Vert^2
>     \\
>     &\qquad 
>     + 
>     \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
>     \left(
>         \frac{\mu}{2}\left\Vert
>              y^{(k)} - v^{(k)}
>         \right\Vert^2 + 
>         \left\langle 
>             \nabla f\left(y^{(k)}\right), v^{(k)} - y^{(k)}
>         \right\rangle
>     \right)
> \end{aligned}
> $$
> We name these Lemma 2.2.3 invariances 1, 2, 3. 


**Proof**

All quadratic function in the form $\frac{\gamma_k}{2}\Vert x\Vert^2 + \langle b, x\rangle + c$, they can be written into the cannoical form as presented above. They will be unique determined by $\phi_k^*, v^{(k)}$, the minimum and the minimizer. We only need to show that, the update from lemma 2.2.2 correctly update the convexity constant $\gamma_k$ fo $\phi_{k + 1}$. Inductively assume that $\nabla^2 \phi_k = \gamma_k I$, then the update rule from lemma 2.2.2 has 

$$
\begin{aligned}
    \phi_{k + 1}(x) &= 
    (1 - \alpha_k)\phi_k(x) + 
    \alpha_k \left(
        f\left(y^{(k)}\right) 
        + 
        \left\langle \nabla f \left(
                y^{(k)}
            \right), x - y^{(k)}
        \right\rangle 
        + 
        \frac{\mu}{2}
        \left\Vert x - y^{(k)}\right\Vert^2
    \right)
    \\
    \nabla^2 \phi_{k + 1}(x) &= 
    (1 -\alpha_k) \nabla^2 \phi_k(x) + 
    \alpha_k \mu I = ((1 - \alpha_k)\gamma_k + \alpha_k \mu)I, 
\end{aligned}
$$

and by the update rule, the last line indicate $\nabla^2 \phi_{k + 1}(x) = \gamma_{k + 1} I$, therefore, the canonical form is preserved by the updates. Next, we determine that the recurrence is kept under lamme 2.2.2 for $v^{(k)}$, the minimizer for the quadratic canonical form. Substituting the canonical form of $\phi_{k}(x)$ into (\[1\]), results in 

$$
\begin{aligned}
    \phi_{k + 1}(x) &= 
    (1 - \alpha_k)\left(
        \phi_k^* + \frac{\gamma_k}{2}
        \left\Vert x - v^{(k)} \right\Vert^2
    \right) + 
    \alpha_k \left(
        f\left(y^{(k)}\right) 
        + 
        \left\langle \nabla f \left(
                y^{(k)}
            \right), x - y^{(k)}
        \right\rangle 
        + 
        \frac{\mu}{2}
        \left\Vert x - y^{(k)}\right\Vert^2
    \right)
    \\
    & \triangleright \text{ consider }\nabla \phi_{k + 1}(x) = \mathbf 0, \text{ solve for minimizer then }
    \\
    \mathbf 0 &= (1 - \alpha_k)\gamma_k \left(
        x - v^{(k)}
    \right) + \alpha_k \left(
        \nabla f\left(
            y^{(k)}
        \right) + \mu\left(x - y^{(k)}\right)
    \right)
    \\
    &= ((1 - \alpha_k)\gamma_k + \alpha_k \mu)x - 
    (1 - \alpha_k)\gamma_k v^{(k)} + 
    \alpha_k \nabla f \left(y^{(k)}\right) - \alpha_k \mu y^{(k)}
    \\
    & \triangleright \text{using the recurrence for }\gamma_{k + 1} \text{ to simplify the coefficient of $x$}. 
    \\
    \gamma_{k + 1}x
    &= 
    (1 - \alpha_k)\gamma_{k}v^{(k)} - \alpha_k \nabla f \left(
        y^{(k)}
    \right) + \alpha_k \mu y^{(k)}, 
\end{aligned}
$$

setting $v^{(k + 1)} = x$, it then yields the second invariance from the update. Lastly, we prove that the reuccurrence for $\phi_{k + 1}^*$ holds as well. To prove, we simplify the update rule in (\[1\]) by letting $x = y^{(k)}$, and set $\phi_k$ to its canonical form, and then we equates it to the canonical form of $\phi_{k + 1}$, that is 

$$
\begin{aligned}
    \phi_{k + 1}^* + \frac{\gamma_{k + 1}}{2}\left\Vert
        y^{(k)} - v^{(k + 1)}
    \right\Vert^2 
    &= 
    (1 - \alpha_k)
    \left(
        \phi_k^* + \frac{\gamma_k}{2}\left\Vert y^{(k)} - v^{(k)}\right\Vert^2
    \right) + \alpha_k f\left(y^{(k)}\right)
    \\
    \phi_{k + 1}^* &= 
    (1 - \alpha_k)
    \left(
        \phi_k^* + 
        \frac{\gamma_k}{2}\left\Vert y^{(k)} - v^{(k)}\right\Vert^2
    \right) + \alpha_k f\left(y^{(k)}\right)
    - 
    \frac{\gamma_{k + 1}}{2}\left\Vert
        y^{(k)} - v^{(k + 1)}
    \right\Vert^2
    \\
    &= 
    (1 - \alpha_k)\phi_k^* + \alpha_k f\left(y^{(k)}\right) 
    + 
    \frac{\gamma_k(1 - \alpha_k)}{2}\left\Vert y^{(k)} - v^{(k)}\right\Vert^2 
    - 
    \frac{\gamma_{k + 1}}{2}\left\Vert
        y^{(k)} - v^{(k + 1)}
    \right\Vert^2
    \\
    & \triangleright \text{ Let this be [(4)]}. 
\end{aligned}
$$

We note that the first 2 terms had matched. The remaining terms should match the recurrence as well. We need to find a representation for $y^{(k)} + v^{(k + 1)}$. For that we use the recurrence of $v^{(k)}$, this gives us 

$$
\begin{aligned}
    v^{(k + 1)} - y^{(k)}
    &= 
   \gamma_{k + 1}^{-1}\left(
        (1 - \alpha_k)\gamma_k v^{(k)} + \alpha \mu y^{(k)} - \alpha \nabla f\left(y^{(k)}\right)
    \right) - y^{(k)}
    \\
    &= \gamma_{k + 1}^{-1}
    \left(
        (1 - \alpha_k)\gamma_k v^{(k)}
        + (\alpha_k \mu  - \gamma_{k + 1})y^{(k)}
        - \alpha_k \nabla f\left(y^{(k)}\right)
    \right)
    \\
    & \triangleright 
    \text{ useing } \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu
    \\
    &= 
    \gamma_{k + 1}^{-1}
    \left(
        (1 - \alpha_k)\gamma_k v^{(k)}
        - (1 - \alpha_k )\gamma_k y^{(k)}
        - \alpha_k \nabla f\left(y^{(k)}\right)
    \right)
    \\
    &= 
    \gamma_{k + 1}^{-1}
    \left(
        (1 - \alpha_k)\gamma_k (v^{(k)} - y^{(k)}) 
        - \alpha_k \nabla f\left(y^{(k)}\right)
    \right)
    \\
    \implies 
    - \frac{\gamma_{k + 1}}{2}\left\Vert
        v^{(k + 1)} - y^{(k)}
    \right\Vert^2 
    &= 
    - \frac{\gamma_{k + 1}}{2}
    \left\Vert
        \gamma_{k + 1}^{-1}
        \left(
            (1 - \alpha_k)\gamma_k (v^{(k)} - y^{(k)}) 
            - \alpha_k \nabla f\left(y^{(k)}\right)
        \right)
    \right\Vert^2
    \\
    &= \frac{1}{2\gamma_{k + 1}}
    \left(
        -(1 - \alpha_k)^2 \gamma_k^2
        \left\Vert v^{(k)} - y^{(k)}\right\Vert^2
        - 
        \alpha_k^2 \left\Vert
            \nabla f\left(
                y^{(k)}
            \right)
        \right\Vert^2
    \right.
    \\
    &\qquad 
    \left.
         + 
        2(1 - \alpha_k)\gamma_k \alpha_k 
        \left\langle v^{(k)} - y^{(k)}, \nabla f\left(y^{(k)}\right) \right\rangle
    \right)
\end{aligned}\tag{[5]}
$$

the coefficient for the term $\Vert \nabla f(y^{(k + 1)})\Vert^2$ matches with what we had for the recurrences, and the cross term $\langle v^{(k)} - y^{(k)}, \nabla f(y^{(k)})\rangle$ also matches. It remains to match the coefficient for the term $\Vert y^{(k)} - v^{(k)}\Vert^2$ when we substitute (\[5\]) back into (\[4\]) for the canonical form of $\phi_{k + 1}^*$. 


$$
\begin{aligned}
    - \frac{(1 - \alpha_k)^2\gamma_k^2}{2\gamma_{k + 1}} + 
    (1 - \alpha_k )\frac{\gamma_k}{2}
    &= 
    \frac{(1 - \alpha_k)\gamma_k}{2}
    \left(
        1 - \frac{(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \right)
    \\
    & \triangleright 
    \text{ by update rule for $\gamma_{k + 1}$, replacing $(1 - \alpha_k)\gamma_k$ then }
    \\
    &= 
    \frac{(1 - \alpha_k)\gamma_k}{2}
    \left(
        1 - \frac{\gamma_{k + 1} - \alpha_k \mu}{\gamma_{k + 1}}
    \right)
    \\
    &= 
    \frac{(1 - \alpha_k)\gamma_k}{2}
    \left(
        \frac{\alpha_k \mu}{\gamma_{k + 1}}
    \right). 
\end{aligned}
$$


---
### **Deriving the Generic Accelerated Momentum Method**

To allow the use of characterizations 2.2.1, which will play a major role in proving the convergence of the algorithm, we need choose $x^{(k)}$ algorithmically so that the condition 
$$
\phi_k^* \ge f\left(x^{(k)}\right)
$$

holds. let the above condition be the inductive hypothesis, from lemma 2.2.3, the update rules for $\phi_k$, we have 

$$
\begin{aligned}
    \phi_{k + 1}^* 
    &= 
    (1 - \alpha_k)\phi_k^* + \alpha_k f\left(y^{(k)}\right) - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
        \nabla f\left(y^{(k)}\right)
    \right\Vert^2
    \\
    &\qquad 
    + 
    \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \left(
        \frac{\mu}{2}\left\Vert
            y^{(k)} - v^{(k)}
        \right\Vert^2 + 
        \left\langle 
            \nabla f\left(y^{(k)}\right), v^{(k)} - y^{(k)}
        \right\rangle
    \right)
    \\
    &\triangleright \text{using the inductive hypothesis, substitute $\phi_k^*$}
    \\
    & \ge
    (1 - \alpha_k)f\left(x^{(k)}\right) + \alpha_k f\left(y^{(k)}\right) - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
        \nabla f\left(y^{(k)}\right)
    \right\Vert^2
    \\
    &\qquad 
    + 
    \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \left(
        \frac{\mu}{2}\left\Vert
            y^{(k)} - v^{(k)}
        \right\Vert^2 + 
        \left\langle 
            \nabla f\left(y^{(k)}\right), v^{(k)} - y^{(k)}
        \right\rangle
    \right)
    \\
    & \triangleright \text{ convexity of $f$ has $f(x^{(k)}) \ge f(y^{(k)}) + \langle \nabla f(y^{(k)}), x^{(k)} - y^{(k)}\rangle$}. 
    \\
    &\ge 
    (1 - \alpha_k)
    \left(
        f\left(y^{(k)}\right) 
        + 
        \left\langle 
            \nabla f\left(y^{(k)}\right), x^{(k)} - y^{(k)} 
        \right\rangle
    \right)
    + \alpha_k f\left(y^{(k)}\right) 
    - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
        \nabla f\left(y^{(k)}\right)
    \right\Vert^2
    \\
    &\qquad 
    + 
    \frac{\alpha_k(1 - \alpha_k)\gamma_k\mu}{2\gamma_{k + 1}}
    \left\Vert
        y^{(k)} - v^{(k)}
    \right\Vert^2 
    + 
    
    \left\langle 
        (1 - \alpha_k)\nabla f\left(y^{(k)}\right), 
        \frac{\alpha_k\gamma_k}{\gamma_{k + 1}}
        \left(
            v^{(k)} - y^{(k)}
        \right)
    \right\rangle
    \\
    & \triangleright \text{ remove $\Vert y^{(k)} - v^{(k)}\Vert^2$ since it has a positive multiplier, inequality still holds }
    \\
    &\triangleright \text{Group ther term $f(y^{(k)})$. }
    \\
    &\ge 
    (1 - \alpha_k)
    \left(
        f\left(y^{(k)}\right) 
        + 
        \left\langle 
            \nabla f\left(y^{(k)}\right), x^{(k)} - y^{(k)} 
        \right\rangle
    \right)
    + \alpha_kf\left(y^{(k)}\right) 
    - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
        \nabla f\left(y^{(k)}\right)
    \right\Vert^2
    \\
    &\qquad 
    + 
    \left\langle 
        (1 - \alpha_k)\nabla f\left(y^{(k)}\right), 
        \frac{\alpha_k\gamma_k}{\gamma_{k + 1}}
        \left(
            v^{(k)} - y^{(k)}
        \right)
    \right\rangle
    \\
    &=
    \left\langle 
        (1 - \alpha_k)\nabla f\left(y^{(k)}\right), x^{(k)} - y^{(k)}
    \right\rangle
    + 
    f\left(y^{(k)}\right) 
    - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
        \nabla f\left(y^{(k)}\right)
    \right\Vert^2
    \\
    &\qquad 
    + 
    \left\langle 
        (1 - \alpha_k)\nabla f\left(y^{(k)}\right), 
        \frac{\alpha_k\gamma_k}{\gamma_{k + 1}}
        \left(
            v^{(k)} - y^{(k)}
        \right)
    \right\rangle
    \\
    &= 
    f\left(y^{(k)}\right) 
    - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}}\left\Vert
        \nabla f\left(y^{(k)}\right)
    \right\Vert^2
    +
    \left\langle 
        (1 - \alpha_k)\nabla f\left(y^{(k)}\right), 
        \frac{\alpha_k\gamma_k}{\gamma_{k + 1}}
        \left(
            v^{(k)} - y^{(k)}
        \right) + x^{(k)} - y^{(k)}
    \right\rangle, 
\end{aligned}
$$

we have some freedom to choose vector $y^{(k)}, \alpha_k, \gamma_k$, to do that we perform gradient descent on $y^{(k)}$, recall that for L-Smooth function $f$, with $x^{(k + 1)} = y^{(k)} - 1/L \nabla f(y^{(k)})$ we would have (This is the descent lemma for smooth gradient descent. )

$$
\begin{aligned}
    f\left(
        y^{(k)}
    \right) - 
    \frac{1}{2L}
    \left\Vert
        \nabla f\left(
            y^{(k)}
        \right)
    \right\Vert^2 \ge 
    f \left(
        x^{(k + 1)}
    \right), 
\end{aligned}
$$

fitting that to the inequality would require that 

$$
\begin{aligned}
    \alpha_k^2/(2 \gamma_{k + 1}) &= 1/2L
    \\
    \iff
    L\alpha_k^2 &= (1 - \alpha_k)\gamma_k \alpha_k \mu, 
\end{aligned}
$$

Let's call that Condition (\[1\]). We then force the cross product to be zero then 

$$
\begin{aligned}
    \frac{\alpha_k\gamma_k}{\gamma_{k + 1}} 
    \left(v^{(k)} - y^{(k)}\right)
    &= - x^{(k)} + y^{(k)}
    \\
    \alpha_k \gamma_k \left(
        y^{(k)} - v^{(k)}
    \right) &= 
    \gamma_{k + 1}x^{(k)} - \gamma_{k + 1}y^{(k)}
    \\
    (\alpha_k \gamma_k + \gamma_{k + 1})y^{(k)}
    &= \gamma_{k + 1}x^{(k)} + \alpha_k \gamma_k v^{(k)}
    \\
    & \triangleright \;
        \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu
    \\
    & \triangleright \;
        \gamma_{k + 1} + \alpha_k \gamma_k = \gamma_k + \alpha_k \mu
    \\
    y^{(k)} &= 
    \frac{\alpha_k\gamma_kv^{(k)} + \gamma_{k + 1}x^{(k)}}{
        \gamma_k + \alpha_k \mu
    }, 
\end{aligned}
$$

Let's call this Condition (\[2\]). It's only under Condition (\[1\]) and (\[2\]) that we may achieve $\phi_{k + 1}^* \ge f(x^{(k)})$, for simple quadratic $\phi_k$. The above results in the following algorithm that we initialize with $x^{(0)}, \gamma_0 > 0, v^{(0)} = \mathbf 0$ then 


$$
\begin{aligned}
    \text{(1):}\; & \text{$k$ th iteration generates iterates by}
    \\
    &
    \begin{aligned}
        \text{(a):}\; & \text{Choose }\alpha_k \in(0, 1) \text{ s.t: }
        L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu = \gamma_{k + 1}.
        \\
        \text{(b):}\; &
        \text{Choose } y^{(k)} = 
        (\gamma_k + \alpha_k \mu)^{-1}\left(
            \alpha_k\gamma_kv^{k} + \gamma_{k + 1}x^{(k)}
        \right).
        \\
        \text{(c):}\; & y^{(k)} = 
        \frac{\alpha_k\gamma_kv^{(k)} + \gamma_{k + 1}x^{(k)}}{
            \gamma_k + \alpha_k \mu
        }
        \\
        \;& \text{Find } x^{(k + 1)} \text{ s.t: }
        f\left(
            x^{(k + 1)}
        \right) \le f\left(
            y^{(k)}
        \right) - \frac{1}{2L}\left\Vert
            \nabla f \left(
                y^{(k)}
            \right)
        \right\Vert^2
        \\
        \text{(d)}: & \; \text{Set }
        v^{(k + 1)} 
        = \gamma_{k + 1}^{-1}\left(
            (1 - \alpha_k)\gamma_k v^{(k)} + \alpha_k \mu y^{(k)} - \alpha_k \nabla f\left(y^{(k)}\right)
        \right)
    \end{aligned}
\end{aligned}
$$


**Remarks**

This algorithm is the basis of analysis for the convergence rate. It can also derive many other variants of acceleration method. This is method (2.2.7) in Nesterov's writing. Do not forget about the implicit estimating sequence $\lambda_k$ that is associated with the above algorithm. 

---
### **Simplifying The algorith to the Momentum Form**

In deriving the inductive relations of $\phi_k^* \ge f(x^{(k)})$, 2 relations between the parameters appeared. One comes by forcing the cross term to be zero to strengthen the inequality, and the other one comes by forcing the coefficient of $\Vert \nabla f(y^{(k)})\Vert^2$ to be $-1/2L$, creating the constraints 

$$
\begin{aligned}
    L\alpha_k^2 &= (1 - \alpha_k)\gamma_k + \alpha_k \mu = \gamma_{k + 1}, 
    \\
    y^{(k)} &= 
    \frac{\alpha_k\gamma_kv^{(k)} + \gamma_{k + 1}x^{(k)}}{
        \gamma_k + \alpha_k \mu
    }, 
\end{aligned}
$$

And invariance 1 from lemma 2.2.3. These relations simplifies away the variable $\gamma_k, v^{(k)}$ from the algorithm we derived. To start, we eliminate $\gamma_k$ from the expression for $\alpha_k$. To see that we have

$$
\begin{aligned}
    L \alpha_{k + 1}^2 &= 
    (1 - \alpha_{k + 1})\gamma_{k + 1} + \alpha_{k + 1}\mu
    \\
    &= (1 - \alpha_{k + 1})L \alpha_k^2 + \alpha_{k + 1}\mu
    \\
    \alpha_{k + 1}^2 &= 
    (1 - \alpha_{k + 1}) \alpha_k^2 + \alpha_{k + 1}\frac{\mu}{L}. 
\end{aligned}
$$

We will now use $q_f = \mu/L$. 


#### **Eliminating $v^{(k)}$ from the Algorithm**
The update of $v^{(k)}$ from previously gives 

$$
\begin{aligned}
    v^{(k + 1)} &= 
    \gamma_{k + 1}^{-1}
    \left(
        (1 - \alpha_k) \gamma_k v^{(k)} 
        + 
        \alpha_k \mu y^{(k)}
        - 
        \alpha_k \nabla f\left(
            y^{(k)}
        \right)
    \right)
    \\
    &\quad 
    \triangleright
    \left\lbrace 
        \begin{aligned}
            (\gamma_k + \alpha_k\mu)y^{(k)} &= \alpha_k \gamma_k v^{(k)}
            + 
            \gamma_{k + 1}x^{(k)}
            \\
            \alpha_k \gamma_k v^{(k)}
            &= 
            (\gamma_k + \alpha_k \mu)y^{(k)} - \gamma_{k + 1}x^{(k)}
            \\
            \gamma_k v^{(k)} &= 
            \alpha_k^{-1}
            \left(
                (\gamma_k + \alpha_k \mu)y^{(k)} - \gamma_{k + 1}x^{(k)}
            \right)
        \end{aligned}
    \right.
    \\
    & \triangleright \text{substitute $\gamma_k v^{(k)} $ then}
    \\
    &= 
    \gamma_{k + 1}^{-1}
    \left(
        (1 - \alpha_k) 
        \alpha_k^{-1}
        \left(
            (\gamma_k + \alpha_k \mu)y^{(k)} - \gamma_{k + 1}x^{(k)}
        \right)
        + 
        \alpha_k \mu y^{(k)}
        - 
        \alpha_k \nabla f\left(
            y^{(k)}
        \right)
    \right)
    \\
    &= 
    \frac{1 - \alpha_k}{\gamma_{k + 1}\alpha_k}(\gamma_k + \alpha_k \mu)y^{(k)}
    - 
    \frac{1 - \alpha_k}{\alpha_k} x^{(k)} 
    + 
    \frac{\alpha_k}{\gamma_{k + 1}}\mu y^{(k)}
    -
    \frac{\alpha_k}{\gamma_{k + 1}}\nabla f\left(y^{(k)}\right)
    \\
    &= \gamma_{k + 1}^{-1}
    \left(
        \frac{(1 - \alpha_k)(\gamma_k + \alpha_k \mu)}{\alpha_k} 
        + 
        \alpha_k \mu
    \right)y^{(k)}
    - 
    \frac{1 - \alpha_k}{\alpha_k} x^{(k)} 
    -
    \frac{\alpha_k}{\gamma_{k + 1}}\nabla f\left(y^{(k)}\right)
    \\
    &\quad  \triangleright 
    \left\lbrace
    \begin{aligned}
        \frac{(1 - \alpha_k)(\gamma_k + \alpha_k \mu)}{\alpha_k} 
        + 
        \alpha_k \mu &= 
        \frac{(1 - \alpha_k)\gamma_k}{\alpha_k} + (1 - \alpha_k)\mu + \alpha_k \mu
        \\
        &= \frac{(1 - \alpha_k)\gamma_k}{\alpha_k} + \mu
        \\
        & \triangleright 
        (1 - \alpha_k)\gamma_k = \gamma_{k + 1} - \alpha_k \mu
        \\
        &= \gamma_{k + 1}/\alpha_k - \mu + \mu
        \\
        &= \gamma_{k + 1}/\alpha_k
    \end{aligned}
    \right.
    \\
    &= 
    \alpha^{-1}_k y^{(k)} 
    - 
    \frac{1 - \alpha_k}{\alpha_k} x^{(k)} 
    -
    \frac{\alpha_k}{\gamma_{k + 1}}\nabla f\left(y^{(k)}\right)
    \\
    &= x^{(k)} + 
    \alpha_{k}^{-1}\left(
        y^{(k)} - x^{(k)}
    \right)
    - 
    \frac{\alpha_k}{\gamma_{k + 1}}\nabla f\left(y^{(k)}\right)
    \\
    &= 
    x^{(k)} + \alpha_{k}^{-1}
    \left(
        y^{(k)} - x^{(k)} - \frac{\alpha_k^2}{\gamma_{k + 1}}\nabla f\left(y^{(k)}\right)
    \right)
    \\
    & \triangleright L\alpha_k^2 = \gamma_{k + 1}
    \\
    &= 
    x^{(k)} + \alpha_{k}^{-1}
    \left(
        y^{(k)} - x^{(k)} - L^{-1}\nabla f\left(y^{(k)}\right)
    \right)
    \\
    &
    \triangleright x^{(k + 1)} = y^{(k)} - L^{-1}\nabla f(y^{(k)}) \text{ is a consequence of $(1 - \alpha_k)\gamma_k + \alpha_k \mu = \gamma_{k + 1}$}
    \\
    &= x^{(k)} + \alpha_k^{-1}\left(x^{(k + 1)} - x^{(k)}\right). 
\end{aligned}
$$


Since the extrapolated momentum term is determined by $v^{(k)}$ and $x^{(k)}$, we may formulate $y^{(k + 1)}$ without $v^{(k)}$ as well. Expand the definition of $y^{(k)}$ will yield 

$$
\begin{aligned}
    y^{(k + 1)} &= 
    \frac{
        \alpha_{k + 1}\gamma_{k + 1}v^{(k + 1)} + \gamma_{k + 2}x^{(k + 1)}
    }
    {\gamma_{k + 1} + \alpha_{k + 1}\mu} 
    \\
    &= \frac{\alpha_{k + 1}\gamma_{k + 1}}{\gamma_{k + 1} + \alpha_{k + 1}\mu}
    \left(
        v^{(k + 1)} + \frac{\gamma_{k + 2}}{\alpha_{k + 1}\gamma_{k + 1}}x^{(k + 1)}
    \right)
    \\
    &= 
    \frac{\alpha_{k + 1}\gamma_{k + 1}}{\gamma_{k + 1} + \alpha_{k + 1}\mu}
    \left(
        v^{(k + 1)}
        -
        x^{(k + 1)}
        + 
        \left(
            \frac{\gamma_{k + 2}}{\alpha_{k + 1}\gamma_{k + 1}} + 1
        \right)
        x^{(k + 1)}
    \right)
    \\
    & \triangleright  
    \left\lbrace
        \begin{aligned}
            \frac{\gamma_{k + 2}}{\alpha_{k + 1}\gamma_{k + 1}} + 1 
            & = 
            \frac{\gamma_{k + 2} + \alpha_{k + 1}\gamma_{k + 1}}{
                \alpha_{k + 1}\gamma_{k + 1}
            }
            \\
            & \triangleright  \;
            \gamma_{k + 2} = (1 - \alpha_{k + 1})\gamma_{k + 1} 
            + \alpha_{k + 1}\mu
            \\
            &= 
            \frac{
                (1 - \alpha_{k + 1})\gamma_{k + 1} 
                + \alpha_{k + 1}\mu + \alpha_{k + 1}\gamma_{k + 1}
            }{
                \alpha_{k + 1}\gamma_{k + 1}
            }
            \\
            &= \frac{\gamma_{k + 1} + \alpha_{k + 1}\mu}{\alpha_{k + 1}\gamma_{k + 1}}
        \end{aligned}
    \right.
    \\
    &= 
    \frac{\alpha_{k + 1}\gamma_{k + 1}}{\gamma_{k + 1} + \alpha_{k + 1}\mu}
    \left(
        v^{(k + 1)}
        -
        x^{(k + 1)}
        + 
        \left(
            \frac{\gamma_{k + 1} + \alpha_{k + 1}\mu}{\alpha_{k + 1}\gamma_{k + 1}}
        \right)
        x^{(k + 1)}
    \right)
    \\
    &= 
    x^{(k + 1)} + 
    \frac{\alpha_{k + 1}\gamma_{k + 1}}{\gamma_{k + 1} + \alpha_{k + 1}\mu}
    \left(
        v^{(k + 1)} - x^{(k + 1)}
    \right), 
\end{aligned}
$$

finally, recall that $v^{(k +1)}$ has a form that doesn't require $v^{(k)}$ from the previous iteration and therefore we have that 

$$
\begin{aligned}
    v^{(k + 1)} - x^{(k +1)} &= x^{(k)} + \alpha_k\left(
        x^{(k + 1)} - x^{(k)}
    \right) - x^{(k +1)}
    \\
    &= x^{(k)} + \left(
        \alpha_k^{-1} - 1
    \right)x^{(k + 1)}
    - \alpha_k^{-1}x^{(k)}
    \\
    &= (\alpha_k^{-1} - 1)\left(
        x^{(k + 1)} - x^{(k)}
    \right), 
\end{aligned}
$$

resulting in the expression 

$$
\begin{aligned}
    y^{(k + 1)} = 
    x^{(k + 1)} + 
    \frac{\alpha_{k + 1}\gamma_{k + 1}(\alpha_k^{-1} - 1)}{\gamma_{k + 1} + \alpha_{k + 1}\mu}
    \left(
        x^{(k + 1)} - x^{(k)}
    \right), 
\end{aligned}
$$

for the extrapolated momentum term for the algorithm.  The extrapolated step $y^{(k + 1)}$ will be used for the next iteration for $x^{(k + 1)}$, and the coefficients for $x^{(k + 1)} - x^{(k)}$ is the momentum term. 


#### **Eliminating the $\gamma_k$ Constant**

Observe that the new update formula for the extrapolated momentum $y^{(k + 1)}$, of the future iteration, contains a momentum term. Let the $\beta_k$ we then simplify away the $\gamma_{k + 1}$. We make use of the first constraints. 

$$
\begin{aligned}
    \beta_k &= 
    \frac{\alpha_{k + 1}\gamma_{k + 1}(\alpha_k^{-1} - 1)}{\gamma_{k + 1} + \alpha_{k + 1}\mu}
    \\
    &= \frac{(1 - \alpha_k)\gamma_{k + 1}\alpha_{k + 1}}{
        \alpha_k(\gamma_{k + 1} + \alpha_{k + 1}\mu)
    }
    \\
    &\; 
    \triangleright \text{using }
    \mu\alpha_{k + 1} = L \alpha_{k + 1}^2 - L(1 - \alpha_{k + 1})\alpha_k^2
    \\
    &= \frac{\alpha_{k + 1}\gamma_{k + 1}(1 - \alpha_k)}{
        \alpha_k(\gamma_{k + 1} + L \alpha_{k + 1}^2 - (1 - \alpha_{k + 1})\gamma_{k + 1})
    }
    \\
    &= 
    \frac{\alpha_{k + 1}\gamma_{k + 1}(1 - \alpha_k)}{
        \alpha_k(
            L \alpha_{k + 1}^2 + \alpha_{k + 1}\gamma_{k + 1}
        )
    }
    \\
    &= 
    \frac{\gamma_{k + 1}(1 - \alpha_k)}{
        \alpha_k(
            L \alpha_{k + 1} + \gamma_{k + 1}
        )
    }
    \\
    &\; \triangleright \text{using }
    \gamma_{k + 1} = \alpha_k^2 L
    \\
    &= 
    \frac{
        \alpha_{k}^2L(1 - \alpha_k)}{
        \alpha_k(
            L \alpha_{k + 1} + \alpha_{k}^2L
        )
    }
    \\
    &= 
    \frac{\alpha_k^2 (1 - \alpha_k)}{
        \alpha_k(\alpha_k^2 + \alpha_{k + 1})
    }
    \\
    &= 
    \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}. 
\end{aligned}
$$

Finally, we get a momentum update term without the constant $\gamma_{k}$ from the estimating function. 
This results in the following simplified generic accelerated momentum method 

$$
\begin{aligned}
    & \text{0. Choose any $x^{(0)} \in \mathbb R^n, \alpha_0 \in (0, 1),  y^{(0)} = x^{(0)}$}. 
    \\
    & \text{1. the kth iteration $k \ge 0$ is }
    \\
    & \quad 
    \begin{aligned}
        & \text{(a.) } x^{(k + 1)} = y_k - L^{-1}\nabla f(y^{(k)})
        \\
        & \text{(b.) } 
        \alpha_{k + 1} \in (0, 1) \text{ s.t: }
        \alpha_{k + 1}^2 = (1 + \alpha_{k + 1})\alpha_k^2 + q_f \alpha_{k + 1}
        \\
        & \text{(c.) } 
        \beta_k := \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}
        \\
        & \text{(d.) }
        y^{(k + 1)} = x^{(k + 1)} + \beta_k\left(
            x^{(k + 1)} - x^{(k)}
        \right)
    \end{aligned}
\end{aligned}
$$

This is 2.2.19 in Nesterov's textbook. 

---
### **A Generic Convergence Results**

We present a generic convergence results based on the above generic method. This is listed as Theorem 2.2.1 in Nesterov's writing. 

#### **Thm (2.2.1) | Generic Convergence Results**
> The scheme generates a sequence of points $\{x^{(k)}\}_{k = 0}^\infty$ such that 
> $$
> \begin{aligned}
>     f(x^{(k)})  - f^* &\le 
>     \lambda_k 
>     \left(
>         f(x^{(0)}) - f^* + \gamma_0
>         \Vert x^{(0)} - x^*\Vert^2
>     \right), 
> \end{aligned}
> $$
> and by the generic accelerated momentum method, we have $\lambda_0 = 1$ and $\lambda_k = \prod_{i = 0}^{k - 1}(1 - \alpha_i)$. 

**Proof**

This is just an example of lemma 2.2.1 for the proposed Generic Accelerated Momentum method. 

**Remark**

It's complicated, please visit [[Nesterov's Generic Convergence Results]] for more information about the proof of convergence. 


---
### **Conclusion**

The Nesterov's framework for extrapolated momentum requires the use of 
- An estimating function and estimating sequence. 
  - Def 2.2.1
  - Lemma 2.2.1
- It requires a way of updating the Nesterov sequence/functions consistently to work. For example in 
    - Lemma 2.2.2
    - A lower bounding function $\phi(x | y^{(k)})$, at the extrapolated point $y^{(k)}$. 
    - A way of updating the estimating sequence/function. 
- It may require a descent lemma, for example, it showed up at our derivation at the very end to inductively looking for $x^{(k)}$ such that $\phi_k^* \ge f(x^{(k)})$ for the generated sequence of iterates. 

However, this only seems to work with the assumption of convexity of the objective function. 
