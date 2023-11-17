- [Smooth Gradient Descend The Basics](Smooth%20Gradient%20Descend%20The%20Basics.md)
- [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md)
- [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)

---
### **Intro**

The gradient descent with momentum derived by Nesterov is a constructive approach and it has great potentials for re-interpretations, expansions and generalizations. We follow Nesterov's Lectures on Convex Optimizations (2nd edition), chapter 2 of his book. My contributions here involves extra gory mathematical details, better exposition and comments on what Nesterov ties to do. And finally, correctly identify the way of adding non-smoothness into Nesterov's derivations. 

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
> 1. A function $f(\cdot)\in \mathcal F_{\mu, L}^{1, 1}(\mathbb R^n)$ where $\mu \ge 0$, with potentially $\mu = 0$. Itmeans that the function is Lipschitz smooth, and it could be strongly convex, 
> 2. $\phi_0(\cdot)$ is a arbitrary convex function in $\mathbb R^n$, 
> 3. $\{y^{(k)}\}_{k = 0}^\infty$ is an arbirary sequence of points in $\mathbb R^n$, 
> 4. The coefficients $\{\alpha_k\}_{k = 0}^\infty$ satisfy conditions $\alpha_k \in (0, 1)$ and $\sum_{k = 0}^{\infty}\alpha_k = \infty$, 
> 5. We choose $\lambda_0 = 1$. 
> Then the pair of estimating sequence and function $(\phi_k(\cdot))_{k = 0}^\infty$ and $(\lambda_k)_{k = 0}^\infty$, defined recursively by the relations 
> $$
>   \begin{aligned}
>       \lambda_{k + 1} &= (1 - \alpha_k) \lambda_k, 
>       \\
>       \phi_{k + 1}(x) &= (1 - \alpha_k)\phi_k(x) + \alpha_k \left(
>               f\left(y^{(k)}\right) + 
>               \left\langle f\left(
>                   y^{(k)}
>               \right), x - y^{(k)} \right\rangle
>               + 
>               \frac{\mu}{2} \left\Vert x - y^{(k)}\right\Vert^2
>           \right), 
>   \end{aligned}
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
            \left\langle f\left(
                y^{(k)}
            \right), x - y^{(k)} \right\rangle
            + 
            \frac{\mu}{2} \left\Vert x - y^{(k)}\right\Vert^2
        \right)
    \\
    & \triangleright \; \text{using } f \in \mathcal F_{\mu, 0}^{1, 1}, 
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
    &\triangleright\quad 
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
>         (1 - \alpha_k)\gamma_k v^{(k)} + \alpha \mu y^{(k)} - \alpha \nabla f\left(y^{(k)}\right)
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
    
\end{aligned}
$$