- [Characterizing Functions for Optimizations](Characterizing%20Functions%20for%20Optimizations.md)
- [Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)

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
> 


