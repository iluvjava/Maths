- [Characterizing Functions for Optimizations](Characterizing%20Functions%20for%20Optimizations.md)
- [Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)
- [Existence of a Minimizer](Existence%20of%20a%20Minimizer.md)

---
### **Intro**

The writing is faithfully followed from Rockafellar & Wetts chapter one. 
We will do a brief intro first and then start proving things. 
The extended real system allows mathematician to model optimization problem with constraints. 
Sometimes, an optimization problem will come with parameters as well. 
Those problem can be model as $f: \mathbb R^n \times \mathbb R^m \mapsto \overline \R$. 
Let $p(u) = \inf_x f(x, u)$  be the minimum given the parameters. 
The central conflict here is that: 
> $f(x, u)$ being a lsc function is not sufficient to conclude that $p(u)$ is a lsc function. 

**Observations**

This creates issues for optimization problem where we want to optimize for parameters $u$ with $x$ fixed. 
The remedy is complicated and that is what the entire file is about. 

---
### **Level Boundedness**

Recall the definition of Level boundedless of a function from the reading materials listed on the top of this file. 
We define a strengthened version of the definition. 

#### **Def 1.16 | Uniform Level Boundedness**
> Function $f: \R^n \times \R^m \mapsto \overline\R$ presented as $f(x, u)$ is level bounded in $x$, locally and uniformlly if for all $\bar u \in \R^m$, and $\alpha \in \R$, it satisfies that 
> *  There exists neighborhood $V \in \mathcal N(\bar u)$, a bounded set $B \subseteq \R^n$, such that $\{x, | f(x, u) \le \alpha\}\subseteq B$ for all $u \in V$. 
>
> Or equivalently, for all $\bar u \in \R^m$ and $\alpha \in \R$ it satisfies that 
> * There exists neighborhood $V \in \mathcal N(\bar u)$ such that the set $\{(x, u) | u \in V, f(x, u) \le \alpha\}$ is bounded in $\R^n \times \R^m$. 


**Observations**

Obviously this is a stronger characterization of a level bounded function. 
The definition can be weakened by considering value $\bar u$ chosen from a subset. 

#### **Thm 1.17 | Consequence of Uniform Level Boundedness**
> Define function $p(u) = \inf_x f(x, u)$, set-valued mapping $P(u) = \argmin{x} f(x, u)$, then in the case of a proper lsc function $f: \R^n \times \R^m \mapsto \overline \R$ such that $f$ is level-bounded in $x$, locally uniformly in $u$, then we have the following list of consequences: 
> 
> 1. The function $p$ is proper and lsc on $\R^m$; and for each $u\in \text{dom}(p)$, the set $P(u)$ is nonempty and compact, and empty when $p\not \in \text{dom}(p)$. 
> 2. If $x_n \in P(u_n)$, with $u\rightarrow \bar u \in \text{dom}(p)$, such that $p(u) \rightarrow p(\overline u)$ (i.e, when $p$ is continuous at $\bar p$ relative to a set $U$ containing $\bar u, u_n$), then the sequence $\{x_n\}_{n\in \mathbb N}$ is bounded with all its cluster point in $P(\bar u)$
> 3. For $p$ to be continuous at a point $\bar u$ relative to set $U$ with $\bar u \in U$, one sufficient condition is the exitence of some $\bar x \in P(\bar u)$ such that $f(\bar x, u)$ is continuous in $u$ at $\bar u$, relative to $U$. 

**Observations**

The role of the set $U$ is board. For example, $f(x, u) = \max(x, 0)$ could be viewed as take the maximnum using an index set $\{1, 2\}$, a subset of the natural number. 
Relative continuity of $f: \R^n \mapsto \R$ wrt to $U$ at $\bar x$ demands $(\forall \epsilon > 0)(\exists \delta > 0): f(\mathbb B_\delta(\bar x)\cap U) \subseteq \mathbb B_\epsilon(f(\bar x))$. 

In the second condition, $u_n$ is a minimizing sequence for the function $p$, and yet the corresponding minimizers $x_n$ for each $u_n$ gives a bounded, with all its cluster points having very good property. 

**Proof (1)**

For a quick overview: 
1. $f$ is either $\equiv \infty$ or it's proper lsc and level bounded. In the second case we have $\text{dom}\; p \neq \emptyset$. 
2. We show that the set $(\text{lev}_{\le \alpha} \; p)\cap V$ equals to $\Pi_{(\cdot, u)} \left[\text{lev}_{\le \alpha}\; f \cap \R^n \times V\right]$, meaning that a slice of the epigraph of $p(u)$ is the conanical projection of the $\text{epi}\; f$ restricted to $V$ for $\text{epi}\; f$. 
3. The set $(\text{lev}_{\le \alpha} \; p)\cap V$ is closed by $\text{lev}_{\le \alpha}\; f \cap \R^n \times V(\bar u)$ can be closed for any $\bar u$, hence the epigraph of $p$ is closed and equivalently $p$ is lsc. 

Recall the key minimizer existence theorem. 
In finite euclidean space, a minimizer exists for a coercive lsc function. 
Fix any $u \in \R^n$. 
Define $f_u(x) = f(x, u)$. 
It's either $f_u \equiv \infty$ or $f_u$ is proper, lsc, and level bounded. 
The former is true because $f(x, u)$ is proper meaning that there exists $\bar x, \bar u$ such that $f(\bar x,\bar u) < \infty$, so that $f_{\bar u}(\bar x) < \infty$ hence $p(\bar u) < \infty$. 
Otherwise, $f_u$ inherit the properness, level_boundedness, and lower semi-continuity from $f(x, u)$. 
This is by the observations that 
$$
\text{epi}\;f_u =\Pi_{(\cdot, u)}\text{epi}f. 
$$ 
In the second case with $\text{dom}\; p \neq \emptyset$, by level boundedness we have $P(u) \neq \emptyset$ and compact. 
The none empty of $P(u)$ is due the existence of minimizer.  
Specifically we have $p(u) \le \alpha$ if and only if $\exists x: f(x, u) \le \alpha$. 
Therefore we have for all $V \subseteq \R^m$, 
$$
\begin{aligned}
    (\text{lev}_{\le \alpha} \; p)\cap V
    = 
    \Pi_{(\cdot, u)} \left[
        \text{lev}_{\le \alpha}\; f 
        \cap \R^n \times V
    \right]. 
\end{aligned}
$$

We think this through with 

$$
\begin{aligned}
    \Pi_{(\cdot, u)} [\text{lev}_{\le \alpha}\; f]&= 
    \left\lbrace
        u \in \mathbb \R^m |\; 
        \exists x \in \R^n: f(x, u) \le \alpha
    \right\rbrace
    \\
    \Pi_{(\cdot, u)} [\text{lev}_{\le \alpha}\; f \cap 
    \R^n \times V]
    &= 
    \left\lbrace
        u \in V |\; 
        \exists x \in \R^n: f(x, u) \le \alpha
    \right\rbrace
    \\
    &= 
    \left\lbrace
        u \in V | \; 
        x \in P(u) \wedge f(x, u) \le \alpha
    \right\rbrace
    \\
    &= 
    \left\lbrace
        u \in V | \;  p(u) \le \alpha
    \right\rbrace
    \\
    &= 
    (\text{lev}_{\le \alpha} \; p)\cap V. 
\end{aligned}
$$
The connonical projection $\Pi_{(\cdot, u)}$ is a continuous mapping. 
With the equality we have $(\text{lev}_{\le \alpha} \; p)\cap V$ if $\text{lev}_{\le \alpha}\;f \cap \R^n \times V$ if a closed set. 
For any $\bar u \in \R^m$ there exists closed neighborhood, set $V(\bar u) \subseteq \R^m$ be that neighborhood. 
The set $\text{lev}_{\le \alpha} f$ is bounded and closed by assumptions placed on $f$. 
Therefore the set $(\text{lev}_{\le \alpha} \; p)\cap V(\bar u)$ if $\text{lev}_{\le \alpha}\;f \cap \R^n \times V(\bar u)$ is always closed. 
Therefore $\text{lev}_{\le \alpha} \; p \cap V(\bar u)$ is a closed set for all $\bar u$. 
Take any sequence $u_n \rightarrow \bar u$ in $\text{lev}_{\le \alpha} \; p \cap V(\bar u)$, by closure we have $\bar u \in \text{lev}_{\le \alpha} \; p$. 
So the level set of $p$ is a closed set which is equivalent to $p$ lsc. 

**Proof (2)**


**Proof (3)**



---
### **Illustrative Examples**



