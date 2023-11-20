- [Smooth Gradient Descend The Basics](Smooth%20Gradient%20Descend%20The%20Basics.md)
- [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md)
- [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)

---
### **Intro**

The gradient descent with momentum derived by Nesterov is a constructive approach and it has great potentials for re-interpretations, expansions and generalizations. We follow Nesterov's Lectures on Convex Optimizations (2nd edition), chapter 2 of his book. 

My contributions here involve some extra gory mathematical details for the record keeping, a better exposition and comments on what I think Nesterov tries to do. And finally, correctly identify the way of adding non-smoothness into Nesterov's derivations. 

#### **Def (2.2.1) | Estimating Sequences and Estimating Functions**
> A pair of sequences $\{\phi_k(x)\}_{k = 0}^\infty$ and $\{\lambda_k\}_{\kappa = 0}^\infty$, are called the estimating sequences of the function $f(\cdot)$ if $\lambda_k \rightarrow 0$, and for any $x\in \mathbb R^n$ and $k\ge 0$ we have 
> $$
>   \phi_k(x) \le (1 - \lambda_k)f(x) + \lambda_k \phi_0(x).
> $$

**Observations**

Anchoring on the initial function $\phi_0$, the estimating sequence and estimating function gives a function $\phi_k$ that such the convex combination between $f, \phi_0$ with $\lambda_k$ is always a lower estimation. 

The next lemma provide one sufficient characterizations for an estimating sequence/function. 

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
> 3. $\{y^{(k)}\}_{k = 0}^\infty$ is an arbitrary sequence of points in $\mathbb R^n$, 
> 4. The coefficients $\{\alpha_k\}_{k = 0}^\infty$ satisfy conditions $\alpha_k \in (0, 1)$ and $\sum_{k = 0}^{\infty}\alpha_k = \infty$, 
> 5. We choose $\lambda_0 = 1$. 
> Then the pair of estimating sequence and function $(\phi_k(\cdot))_{k = 0}^\infty$ and $(\lambda_k)_{k = 0}^\infty$, defined recursively by the relations 
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

$\phi_{k + 1}(x)$ is the sum ofa lower surrogate function and the previous $\phi_k$. 

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

Next, we wish to prove that the sequence $\lambda_k\rightarrow 0$. For contradiction if $\lim_{n\rightarrow \infty} \ge \epsilon > 0$ then 
$$
\begin{aligned}
    (1 - \alpha_k)\lambda_k &= \lambda_k - \alpha_k \lambda_k
    \\
    &\le
    \lambda_k - \epsilon\alpha_k
    \\
    \epsilon\alpha_k &\le \lambda_k - \lambda_{k + 1}
    \\
    \epsilon \sum_{k = 1}^{\infty}\alpha_k&\le \lambda_1 - \epsilon < \infty, 
\end{aligned}
$$

therefore we must have $\lim_{k\rightarrow \infty} \lambda_k = 0$. 

**Remarks**

To fit this update to the characterizations, lemma 2.2.1, it it's required to identify $\phi_k^*$, the minimum for each of the stimating functions. 


---
### **Giving a Form to the Estimating Sequence and Functions so It's easy to Derive the Algorithm**

Nesterov find a simple quadratic form for the estimating sequence $\phi_k$ such that, it's preseved under the update procedures. 

#### **Lemma 2.2.3 | Updating with the Canonical Form**
> Let $\phi_0^* + \frac{\gamma_0}{2}\Vert x - v^{(k)}\Vert^2$. Then the process described in lemma 2.2.2 preseves this canonical form for functions $\phi_k(x)$, with $\phi_k(x) = \phi_k^* + \frac{\gamma_k}{2}\Vert x - v_k\Vert^2$, where $v^{(k)}$ is the minmizer of $\phi_k$, and the parameters $\gamma_k, v^{(k)}, \phi_k^*$ that define $\phi_k$ staifies the recurrence
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
        \nabla f\left(y^{(k)}\right), x^{(k)} - y^{(k)}
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

we have some freedom to choose vector $y^{(k)}, \alpha_k, \gamma_k$, to do that we perform gradient descent on $y^{(k)}$, recall that for L-Smooth function $f$, with $x^{(k + 1)} = y^{(k)} - 1/L \nabla f(y^{(k)})$ we would have 

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
    \alpha_k^2/(2 \gamma_{k + 1}) &= 1/L
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
    \text{(a):}\; & \text{Choose }\alpha_k \in(0, 1) \text{ s.t: }
    L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu.
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
    }.
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
$$


**Remarks**

This algorithm is the basis of analysis for the convergence rate. It can also derive many other variants of acceleration method. 

---
### **Adapting the Algorithm for Proximal Gradient Descent**

#### **Claim | Envelope Acceleration**
> If $f$ in the Nesterov's algorithm is chosen to be the smooth part of the composite $f = g + h$, we can change the condition in (c) part of the algorithm and assert the same kind of descent condition using the Forward Backwards Envelope. 

**Justifications**

With $\tilde f_x$ being the upper surrogate model at $f(x) = g(x) + h(x)$, which is defined as

$$
\tilde f_x (y) = 
    h(y) + 
    \left\langle \nabla g(x), y -x \right\rangle + g(x) + \frac{L}{2}\Vert y - x\Vert^2, 
$$

Then the envelope is $f_\text{FB} (x) = \min_y (\tilde f_x(y))$, and with that we have the forward backwards envelope derived from [Proximal Gradient, Forward Backwards Envelope](Proximal%20Methods/Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md), it would have 

$$
\begin{aligned}
    \text{Let }\mathcal T &= [I + L^{-1}\partial h]^{-1}\circ[I - L^{-1}\nabla g]
    \\
    f\left(
        \mathcal T(x)
    \right) &\le f_{FB}(x) = 
    \text{env}_h^{L^{-1}}(x - L^{-1}\nabla g(x))
    - 
    \frac{1}{2L}\Vert \nabla g(x)\Vert^2. 
\end{aligned}
$$

Replacing $x = y^{(k + 1)}$, let $x^{(k + 1)} = \mathcal T y^{(k + 1)}$ then the above rule becomes the new descent rule 

$$
f \left(\underbrace{\mathcal T y^{(k)}}_{x^{(k + 1)}}\right) 
- 
\text{env}_h^{L^{-1}}\left(
    y^{(k)} - L^{-1}\nabla g\left(y^{(k)}\right)
\right)
\le - \frac{1}{2L}
\left\Vert \nabla g\left(y^{(k)}\right)\right\Vert^2
$$

It's a descent rule because 

$$
\begin{aligned}
    \text{env}_h^{L^{-1}}\left(
        y^{(k)} - L^{-1}\nabla g\left(y^{(k)}\right)
    \right) = \min_z \tilde f_{y^{(k)}}(z) &\le f(y^{(k)})
    \\
    \implies 
    f\left(
        x^{(k + 1)}
    \right) - f\left(
        y^{(k)}
    \right)
    &\le 
    \frac{1}{2L}
    \left\Vert \nabla g\left(y^{(k)}\right)\right\Vert^2.
\end{aligned}
$$

we had bridged the Nesterov generic method to the framework of proximal gradient via the forward backward envelope interpretation. 


**Warn**
<mark style="background: #FF5582A6;">
There is something wrong with this claim. The forward backwards envelope is not quite right. </mark>