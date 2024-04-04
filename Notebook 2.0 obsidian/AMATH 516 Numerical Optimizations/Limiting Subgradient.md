---
alias: Mordukhovich Limiting Subdifferential
---

---
- [Fechet Regular Subgradient](Fechet%20Regular%20Subgradient.md)


---
### **Intro**

The limiting subgradient creates closure to regular subgradient. 
To start we define F-attentative convergence of a sequence. 
This is required for the limiting subgradient definition, which is based on the regular subgradient. 

#### **Def | F-Attentative Convergence**
> Define let $x_n \in \mathbb R^n$ be a sequence that converges to $\bar x$, then $x_n \rightarrow_f \bar x$ to be $f$-attentative convergence if and only if the following conditions are true for the sequence: 
> 1. $x\rightarrow \bar x.$
> 2. $f(x_n)\rightarrow f(\bar x).$
> Take note that if function is continuous at $\bar x$, then would be true trivially. 

#### **Def | Mordukhovich Limiting Subdifferential**
> Let $f: \mathbb R^n \rightarrow \bar {\mathbb R}$ and $\bar x \in \text{dom}(f)$. 
> Let $x_\gamma \rightarrow_f \bar x$ be attentative convergence. 
> We define the limiting subgradient: 
> $$
> \begin{aligned}
>     \partial f(\bar x) &= 
>     \left\lbrace
>         v \in \mathbb R^n | 
>         \exists v_\gamma \in \hat \partial f(x_\gamma), x_\gamma \rightarrow_f \bar x, 
>         v_\gamma \rightarrow v
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations**

Take note that, if we have $\hat \partial f(\bar x) = \emptyset$, it won't mean that the limiting subgradient is empty. 
As long as $f$ is lower semi-continuous at $\bar x$, there exists some choice of $x_\gamma \rightarrow_f \bar x$ such that, $v_\gamma \in \hat \partial f(x)$ exist. 
As long as the sequence of set $\hat \partial f(x_\gamma)$ share some points in common when $x\rightarrow_f \bar x$. 



#### **Thm | Outer Limit Characterizations**
> The limiting sub-differential can be characterized by Kuratowski convergence of the regular subgradient over all sequences that attains $f$-attentative convergence around $\bar x$. 
> Define $U(f, \bar x, \delta) = \{x \in \mathbb R^n | \max(\Vert x - \bar x\Vert, |f(x) - f(\bar x)| \le \delta)\}$. 
> Define Kuratowski convergence of a set value operator, which in this case is $\partial f(x)$ to be 
> $$
> \begin{aligned}
>     \limsup_{x\rightarrow_f \bar x} \hat \partial f(x) &= 
>     \left\lbrace
>         v \in \mathbb R^n 
>         \left | 
>         \exists x_\gamma \rightarrow_f \bar x, v_\gamma \in \hat \partial f(x_\gamma), v_\gamma \rightarrow v\right.
>     \right\rbrace. 
> \end{aligned}
> $$
> Then the limiting subgradient will admit representation 
> $$
> \begin{aligned}
>     \partial f(\bar x) &= \limsup_{x\rightarrow_f \bar x} \hat \partial f(x)
>     = \bigcap_{\delta > 0} \overline{
>         \hat \partial f(U(f, \bar x, \delta))
>     }. 
> \end{aligned}
> $$
> Which is the set inversection of all the closed range of regular subgradient over the $f$-attentative region around $\bar x$ for all values of $\delta > 0$. 

**Observations**

Intersection of infinitely many closed set is still a closed set, and therefore, limiting subgradient $\partial f(\bar x)$ is a closed set. 
Observe that $f$ is L.S.C, if and only if there there exists a sequence $\{x\}_{n\in \mathbb N} \cap U(f, \bar x, \delta) \neq \emptyset$ for all $\delta > 0$. 
The closure of the regular gradient is related to the convergence of the sequence $v_\gamma \rightarrow v$. 
Which may not be a member of the regular subgradient $\hat \partial f(\bar x)$. 

**Proof**


The first equality is part of the definition for the limiting subgradient. 
We prove the sequence equality to show that the set outer limit is indeed the intersection of closure of the range of regular subgradient over the $f$-attentative region. 
Let $v \in \limsup_{x\rightarrow_f \bar x}\hat \partial f(x)$ then there exists sequence $x_\gamma \rightarrow_f \bar x$ , and the sequence $v_\gamma$ such that $v_\gamma \in \hat \partial f(x_\gamma)$ for all $\gamma \in \mathbb N$. Fix $\delta > 0$, then by attentative convergence $\exists K \in \mathbb N\; \forall \gamma > K$ such that $x_\gamma \in U(f,\bar x, \delta)$ and therefore we have 
$$
\begin{aligned}
    v_\gamma 
    &\in \hat f(U(f, \bar x, \delta))
    \\
    &= \bigcup_{x \in U(f, \bar x, \delta)} \hat \partial f(x)
    \\
    v = \lim_{\gamma \rightarrow \infty}
    v_\gamma
    &= 
    \overline {
        \hat \partial f(U(f, \bar x, \delta))
    }, 
\end{aligned}
$$

by the convergence of $v_\gamma$. 

Conversely consider $v \in \bigcap_{\delta > 0} \overline{\hat \partial f(U(f, \bar x, \delta))}$. 
Take $\delta = 1/k$ so that $\delta \rightarrow 0$. 
With that we have for each $v_\gamma$ there exists $x_\gamma \in U(f, \bar x, 1/k)$ such that $v_\gamma \in \hat \partial f(x_\gamma)$. 
By the fact that $\exists x_\gamma \in U(f, \bar x, 1/k)$ for all $k\in \mathbb N$, the sequence of $x_\gamma$ will exhibits $f$-attentative convergence. 

---
### **Examples**

We illustrate the this serves as a closure of the regular subgradient over region where the function may not be differentiable. 