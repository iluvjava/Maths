- [Graph Theory Terminology](../AMATH%20514%20Combinatorics%20Optimizations/Graph%20Theory%20Terminology.md)

---
### **Intro**

#### **A Big Quote**
> Few of us really know the shit we learned from programming classes on algorithm and data structure. 
Because they are math taught by computer scientists, unreliable. 
> We will try fixing that in this file. 

#### **Assumption set 1**
> Let graph $G = (V, A)$ be a graph consists of vertices $V$ and arcs $A$. 
> The arcs are tuples of vertices from $V$. 
> We make the following assumptions: 
> 1. There is a cost function $c: V\times V \rightarrow \overline\R$. Let $c_{i, j}$ denote the cost of arc $(i, j)$. If arc $(i, j) \not \in A$ , set $c_{i, j} = \infty$. 
> 2. $G$ is connected. For all $v_0, v_n \in V$, there exists sequence $(v_{i}, v_{i + 1}) \in A$ for $i = 0, \ldots, n - 1$. 
> 3. There is no directed cycle with a total negative cost. 


#### **Definition | A walk with fixed length**
> Let $u, v \in V$. 
> A walk $W_{u,v} =(u, w_1, \ldots, w_{n-1}, v)\in (\{u\}\times V^{n-1}\times \{v\}) \subseteq V^{n + 1}$ is a sequence of vertices has length $n$ and starting at $u$ and ends in $v$ and all arcs are in $A$. 

**Remarks**

The walk has costs and it's denoted by: 

$$
\begin{aligned}
    c(W_{u, v}) = c(u, w_1) + \left(
        \sum_{k = 1}^{n - 2} c(w_k, w_{k + 1})
    \right) + c(w_{n - 1}, v)
\end{aligned}
$$


---
### **Subpaths of Shortest Paths**

#### **Definition | Path, Cycle**
> Let $u, v \in V$ and $n \in \N$, define: 
> 1. $P_{v_0, v_n}^n = (v_0, \ldots, v_n) \in V^{n + 1}$ is a path of vertices going from $u$ to $v$ with $n$ number of arcs in total, ordering matters and all $v_0,\ldots, v_n$ are unique. 
> 2. $P_{a_1, a_n}^n = (a_1, \ldots, a_n) \in A^n$ is a path of arcs going from $u$ to $v$ such that odering matters, it's an element of $A^{n}$ and all arcs $a_1, \ldots, a_n$ are unique. 
> 
> If no subscript is provided, assume that it's a path of vertices. 
> If $u = v$, and it's known in the contex, then it's called a "cycle". 


**Remarks**

Because of the product space nature, path concatenation can be denoted by $\times$. 
Let $p^{(1)}_{v, u}, p^{(2)}_{u, w}$ be a path then $p^{(1)}_{v, w} \times p^{(2)}_{u, w}$ is a $v, w$ walk 


#### **Definition | All paths of a fixed length**
> We define all such path given the starting and ending vertices $(v_0,v_{n - 1}) \in V\times V$, $v_0 \neq v_{n - 1}$ to be: 
> $$
> \begin{aligned}
>     \Pi(v_0, v_{n - 1}, n) &= 
>     \left\lbrace
>         (v_0, \ldots, v_{n}) \in V^{n + 1}: 
>         (\forall i = 1, \ldots, n - 1)(\forall j = 0, \ldots, i)\; 
>             v_i \neq v_j \wedge (v_{i - 1}, v_{i})\in A
>     \right\rbrace. 
> \end{aligned}
> $$

Hence, a path of vertices minimizing the total cost between $v_0, v_{n - 1}$ is: 

$$
\begin{aligned}
    P_{u, v}^+ \in 
    \argmin{k= 1, \ldots, |V|}
    \left\lbrace
        \left. 
            \sum_{i = 1}^{k}
            c_{p_{i}, p_{i + 1}}
        \right| 
        p \in \Pi(u, v, k)
    \right\rbrace
    \subseteq 
    \bigcup_{k = 1}^{|V|} \Pi(u, v, k) \subseteq V. 
\end{aligned}
$$


Such a path will be called the **Optimal Path**. 


#### **Lemma 1 | No negative cycles**
> Fix any $u, v \in V$ with $u \neq v$. 
> Let $W_{u, v} \in \bigcup_{i \in \N} (\{u\}\times V^{i} \times \{v\})$ be any $u, v$ walk. 
> If there is no negative cycles, then there exists a unique $P_{u, v}$ path in $W_{u, v}$ which has a lower costs. 

**Proof**

Suppose $W_{u, v}^n = (u, w_1, w_2, \ldots, w_{n - 1}, v)$, if it's a path, then there is nothing to prove. 
Else it's a walk then there admit smallest $i\in \{1, \ldots, n -1\}$ and largest $j\in \{1, \ldots, n - 1\}$ such that $w_i = w_j$ and $i < j$.
This divides the walk into parts: a unique $P_{u, v}= (u,\ldots, w_{i - 1}, w_{j + 1}, \ldots, v)$ without repeatition hence it's a path, and $W_{i, j} = (w_i, w_{i + 1}, \ldots, w_{j})$ which is a walk ending in the same vertices and it has 
$$
\begin{aligned}
    c(W_{u, v}) = c(W_{i,j}) + c(P_{u, v}). 
\end{aligned}
$$

The walk $W_{i, j}$ has: 
1. (**Case I**): It itself is a cycle then its total cost is positive. 
2. (**Case II**): It has more than one cycle hence its total cost is positive. This can be seemed by looking for smallest $i^{(1)} \in \{i + 1, \ldots, j - 1\}, j^{(1)} \in \{i + 1, \ldots, j - 1\}$ such that $w_{i^{(1)}} = w_{j^{(1)}}$ breaking down the walk into: a cycle without repeating vertices, and $w_{i^{(1)}}, w_{j^{(2)}}$ walk which starts and end on the same vertices. 

Under either case, the non-negativity of the cost asserts $c(W_{u, v}) \ge c(P_{u, v})$. $\square$


#### **Theorem 1 | All Joined Subpaths of an optimal path are optimal**
> Let $u, v\in V$ and $u \neq v$. 
> Let $p = (u, w_1, \cdots, w_{n - 1}, v) \in \bigcup_{k= 1}^{|V|}\Pi(u, v, k)$ be an optimal $u, v$ path. 
> If Assumption Set 1 applies, then for any $i \in \{1, \ldots, n -1\}$, the path $p^{(1)} = (u, \ldots, w_i)$ and $p^{(2)} = (w_i, \ldots,v)$ are optimal $u, w_i$, $w_i, v$ paths. 

**Proof**

We do proof by contradiction. 
Assume WLOG, let path $p^{(1)}$ be not optimal.
Then there exists $q^{(1)}$ with strictly lower cost. 
Then $q^{(1)}\times p^{(2)}$ is a $u, v$ walk. 
Using **Lemma 1** it contains a unique $u, v$ path $q$ with fewer costs so: 

$$
\begin{aligned}
   c(p) = c(p^{(1)}\times p^{(2)}) > c(q^{(1)} \times p^{(2)}) \ge c(q). 
\end{aligned}
$$

Therefore, $c(p)$ is not an optimal path which is a contradiction. 


#### **Colollary 1 | Subpath Plus Arc Optimality Conditions**
> Fix $s \in V$. 
> Let $d: V \rightarrow \overline \R_+$. 
> Let $d(i)$ denotes the cost of a $s, i$ path then $d(j)$ is the least cost directed path function from $s$ to $j$ if and only if $d(j) \le d(i) + c_{i, j}\;\forall (i, j)\in V\times V$. 

**Proof**

We show: $\implies$.
Let $d(j)$ be least cost on all $s, j$ path. 
Hence there exists a path $p = s, \ldots, i, j$ with costs $d(j)$. 
Then the subpath $p' = s, \ldots, i$ is optimal by **Theorem 1** so $c(p') = d(i)$. 
Arc $(i, j)$ is a subset of all $i, j$ paths so $d(i) + c_{i, j} \ge d(j)$, it will always has greater cost. 

We show $\impliedby$. 
Without lost of generality, choose any $i, j \in V$, let $v: V \rightarrow V$ be an arbitrary permutation of $V$ such that $v_1 = s$. 
Consider a path $p = (v_1, \ldots, v_n)$
Suppose that $d$ that satisfies: 

$$
\begin{aligned}
    d(v_n) &\le d(v_{n - 1}) + c(v_{n - 1}, v_n)
    \quad \forall v_{n - 1}, v_{n} \in V, v_n \neq v_{n - 1}, 
    \\
    d(v_{n - 1}) &\le d(v_{n - 2}) + c(v_{n - 2}, v_{n - 1})
    \quad 
    \forall v_{n - 2} \in V, v_{n - 2} \not \in \{v_n, v_{n -1}\}, 
    \\
    (&\cdots)
    \\
    d(v_{2}) &\le d(v_{1}) + c(v_1, v_2) \quad \forall v_1 \in V, v_1 \not \in \{v_i\}_{i=2}^{n - 1}. 
\end{aligned}
$$

using all these relations it has: 

$$
\begin{aligned}
    d(v_n) &\le d(v_{n - 1}) + c(v_{n - 1}, v_n)
    \\
    &\le (d(v_{n - 2}) + c(v_{n - 2}, v_{n - 1})) + c(v_{n - 1, v_n})
    \\
    &\le (d(v_{n - 3}) + c(v_{n - 3}, v_{n - 2}))
    + c(v_{n - 2}, v_{n - 1}) + c(v_{n - 1, v_n})
    \\
    (&\cdots)
    \\
    \implies
    d(v_n) &\le \sum_{k = 1}^{n - 1}c(v_{k}, v_{k + 1}) 
    % \; \forall \{v_{\sigma(i)}\}_{i = 1}^n, \sigma \text{ is any permutation of } \{1, \ldots, n\}
\end{aligned}
$$

Hence, if $d(v_n)$ is the least cost path, then it has length less than all other possible least cost path, hence it has to be the cost of the least cost path. 

**Note**:

If $(v_{i}, v_{i + 1}) \not \in A$, then set $c_{v_{i}, v_{i + 1}} = \infty$ for all such arcs, then the argument follows smoothly. 

**References**: Chapter 4 of the book: Network Flows, theory, Algorithms and Applications. Shortest subpath is property 4.2. 

---
### **In Relations to Linear Programming**

The shortest path problem is related to the linear programming problem. The above conditions just an application of strong duality. Visit [LP for Source Tree Shortest Paths](../AMATH%20514%20Combinatorics%20Optimizations/Everything%20Network%20Flow/LP%20for%20Source%20Tree%20Shortest%20Paths.md) for more information. 
