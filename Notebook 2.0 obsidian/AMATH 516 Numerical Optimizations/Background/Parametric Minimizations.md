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

**References**
- Rockafellar and Wetts, Chapter 1.

---
### **Level Boundedness**

Recall the definition of Level boundedless of a function from the reading materials listed on the top of this file. 
We define a strengthened version of the definition. 

#### **Def 1.16 | Uniform Level Boundedness**
> Function $f: \R^n \times \R^m \mapsto \overline\R$ presented as $f(x, u)$ is level bounded in $x$, locally and uniformly in $u$ if for all $\bar u \in \R^m$, and $\alpha \in \R$, it satisfies that 
> *  There exists neighborhood $V \in \mathcal N(\bar u)$, a bounded set $B \subseteq \R^n$, such that $\{x, | f(x, u) \le \alpha\}\subseteq B$ for all $u \in V$. 
>
> Or equivalently, for all $\bar u \in \R^m$ and $\alpha \in \R$ it satisfies that 
> * There exists neighborhood $V \in \mathcal N(\bar u)$ such that the set $\{(x, u) | u \in V, f(x, u) \le \alpha\}$ is bounded in $\R^n \times \R^m$. 


**Observations**

Obviously this is a stronger characterization of a level bounded function. 
The definition can be weakened by considering value $\bar u$ chosen from a subset. 

#### **Thm 1.17 | Consequence of Uniform Level Boundedness**
> Define function $p(u) = \inf_x f(x, u)$, set-valued mapping $P(u) = \argmin{x} f(x, u)$, then in the case of a proper lsc function $f: \R^n \times \R^m \rightarrow \overline \R$ such that $f$ is level-bounded in $x$, locally uniformly in $u$, then we have the following list of consequences: 
> 
> 1. The function $p$ is proper and lsc on $\R^m$; and for each $u\in \text{dom}(p)$, the set $P(u)$ is nonempty and compact, and empty when $p\not \in \text{dom}(p)$. 
> 2. If $x_n \in P(u_n)$, with $u_n\rightarrow \bar u \in \text{dom}(p)$, such that $p(u_n) \rightarrow p(\overline u)$ (e.g: when $p$ is continuous at $\bar p$ relative to a set $U$ containing $\bar u, u_n$), then the sequence $\{x_n\}_{n\in \mathbb N}$ is bounded with all its cluster point in $P(\bar u)$
> 3. For $p$ to be continuous at a point $\bar u$ relative to set $U$ with $\bar u \in U$, one sufficient condition is there exists $\bar x \in P(\bar u)$ such that $f(\bar x, u)$ is continuous in $u$ at $\bar u$, relative to $U$. 

**Observations**

The role of the set $U$ is board. For example, $f(x, u) = \max(x, 0)$ could be viewed as take the maximum using an index set $\{1, 2\}$, a subset of the natural number. 
Relative continuity of $f: \R^n \mapsto \R$ wrt to $U$ at $\bar x$ demands $(\forall \epsilon > 0)(\exists \delta > 0): f(\mathbb B_\delta(\bar x)\cap U) \subseteq \mathbb B_\epsilon(f(\bar x))$. 

In the second condition, $u_n$ is a minimizing sequence for the function $p$, and yet the corresponding minimizers $x_n$ for each $u_n$ gives a bounded, with all its cluster points having very good property. 

**Proof (1)**

For a quick overview: 
1. **(STEP I)**: $f$ is either $\equiv \infty$ or it's proper lsc and level bounded. In the second case we have $\text{dom}\; p \neq \emptyset$. 
2. **(STEP II)**: We show that the set $(\text{lev}_{\le \alpha} \; p)\cap V$ equals to $\Pi_{(\cdot, u)} \left[\text{lev}_{\le \alpha}\; f \cap \R^n \times V\right]$, meaning that a slice of the epigraph of $p(u)$ is the conanical projection of the $\text{epi}\; f$ restricted to $V$ for $\text{epi}\; f$. 
3. **(STEP III)**: The set $(\text{lev}_{\le \alpha} \; p)\cap V$ is closed by $\text{lev}_{\le \alpha}\; f \cap \R^n \times V(\bar u)$ can be closed for any $\bar u$, hence the epigraph of $p$ is closed and equivalently $p$ is lsc. 

Recall [Existence of a Minimizer](Existence%20of%20a%20Minimizer.md). 
In finite euclidean space, a minimizer exists for a coercive lsc function. 
Fix any $u \in \R^n$. 
Define $f_u(x) := f(x, u)$.
By level bounded $x$ locally and uniformly in $u$, $f$ is
* either $f_u \equiv \infty$ **(CASE I)**. 
* or $f_u$ is proper, lsc, and level bounded **(CASE II)**. 
 
 $f(x, u)$ is proper then $\exists \bar x, \bar u$ such that $f(\bar x,\bar u) < \infty$, so $f_{\bar u}(\bar x) < \infty$ hence $p(\bar u) < \infty$ so $p$ is proper. 
$f_u$ is proper, level-bounded, and l.s.c too because:
$$
\text{epi}\;f_u =\Pi_{(\cdot, u)}\text{epi}f. 
$$ 
In **(CASE II)** it has $\text{dom}\; p \neq \emptyset$, by level boundedness $P(u) \neq \emptyset$ and compact. 
The non-empty of $P(u)$ is due the existence of minimizer.  
We have $p(u) \le \alpha$ if and only if $\exists x: f(x, u) \le \alpha$. 
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
The connonical projection $\Pi_{(\cdot, u)}$ is a continuous mapping so it preserves compactness of sets. 
For any $\bar u \in \R^m$ there exists a closed neighborhood, set $V(\bar u) \subseteq \R^m$ such that $\text{lev}_{\le \alpha} f$ is bounded and closed (so compact) by level bounded in $x$ uniformly and locally in $u$ assumption of $f$. 
Therefore $(\text{lev}_{\le \alpha} \; p)\cap V(\bar u)$ is closed because $\text{lev}_{\le \alpha}\;f \cap \R^n \times V(\bar u)$ is closed. 
Take any $u_n \rightarrow \bar u$ in $\text{lev}_{\le \alpha} \; p \cap V(\bar u)$, by closure $\bar u \in \text{lev}_{\le \alpha} \; p$. 
So the level set of $p$ is a closed set which is equivalent to $p$ lsc. 

**Proof (2)**

Choose any $\alpha$ with $\alpha > p(\bar u)$. 
Eventually $\alpha > p(u_n) = f(x_n, u_n)$. 
Take $V \in \mathcal N(\bar u)$ closed then level bounded in $x$ locally and uniformly in $u$ yields $n \in \N$ sufficiently large such that for all larger $n$ $(x_n, u_n)\in (\text{lev}_{\le \alpha}f)\cap (\R^n \times V)$. 
By compactness from previous part the sequence is bounded and admits cluster point $(\bar x, \bar u)\in \text{lev}_{\le \alpha}f$. 
This is true for all $\alpha > p(\bar u)$ hence $f(\bar x, \bar u) \le f(\bar x, u)$ so $\bar x \in P(\bar u)$. 

**Proof (3)**

$p$ is lsc from previous proof.
$f(\bar x, \cdot)$  is upper semi-continuous at $\bar u$ because it's continuous. 
It implies that $p$ is upper semi-continuous at $\bar u$. 
Both u.s.c, and l.s.c is sufficieint for continuity of $p$. 


---
### **Illustrative Examples**



