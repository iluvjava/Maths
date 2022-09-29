wiki: [TSP](https://en.wikipedia.org/wiki/Travelling_salesman_problem)
[[Graph Theory Terminology]]


---
### **Intro**

A tour goes through all the vertices once on the graph and ends up on the vertex that it started with, without repeating any other vertices on the graph. The traveling salesman consider a weight assignment function $f(x): E\mapsto \mathbb R$, and search for a tour $T$ such that its weight $f(T)$ is the smallest. The problem is np hard and we consider reducing it to an integer programming and analyze its properties and behaviors. 


---
### **MZT Reductions 1960**

The reduction was introduced back in 1960 and here is the paper [Integer Programming of Traveling Salesman Problem](https://dl.acm.org/doi/pdf/10.1145/321043.321046). We will introduce the reduction and rationalize why it's correct. This reduction is an IP with a polynomial size, which probably means it's not total unimodular if NP hard and P are not equivalent. We consider decision variable $x_{i, j}\; \forall (i, j)\in [n]\times [n]$ where $|V| = n$, if $(i, j)\not\in E$ we let $f(x_{i, j}) = \infty$. Next, a naive approach to formulate the problem considers the following system of constraints to assert the solution is indeed a tour: 

$$
\begin{aligned}
    \min\sum_{i = 1}^{n} & \sum_{j = 1}^{n} f(e_{i, j}) x_{i, j} \; \text{s.t:} 
    \\
    \sum_{j \neq i, j = 1}^{n}
        x_{i, j} &= 1 \quad \forall i\in [n] \quad & [1]
    \\
    \sum_{i \neq j, i = 1}^{n}
        x_{i, j} &= 1 \quad \forall j\in [n] \quad & [2]
    \\
    x_{i, j} &\in \{0, 1\} \quad\forall (i, j)\in [n]\times [n], 
\end{aligned}
$$

this approach asserts that for each vertex $i$, there must exist exactly 2 edges $e_{i, j}, e_{j', i}\in T$ goes into and out of the vertex, however it's possible to have the solution to be a tour between 2 closest vertices on the graph (a tour involving 2 vertices, remember it's a directed graph.), and that would be the optimal solution for the problem. To assert a full tour to be our solution, MZT considers one additional variable $u_i\in \mathbb Z, i\in \{2, \cdots, n\}$ with $2 \le u_i \le n$, the key is to have $x_{i, j} \implies u_j \ge u_i + 1$. To achive that, we consider the following 2 potential constraints

$$
\begin{aligned}
    & u_i \ge u_j + 1 \quad \forall (i, j)\in \{2, \cdots, n\}^2& [3.1] 
    \\
    & u_j + (n - 2) \ge u_i + (n - 1)x_{i, j} \quad \forall (i, j)\in \{2, \cdots, n\}^2,  & [3.2]
\end{aligned}
$$
in the case of \[3.1\] condition $x_{i, j} = 1\implies u_j \ge u_i + 1$ is asserted, but it imposes extra constraint when $x_{i, j} = 0$, where $u_j \ge u_i$, which is could be impossible if that graph not happens to be a DAG.[^1] Conditions \[3.2\] however, doesn't impose any constraint when $x_{i, j} = 0$ because $u_j + (n - 2) \ge u_i$ is true for all $2\le u_i, u_j \le n$. Therefore \[3.2\] should be adopted over \[3.1\]. Next, we want to show that it indeed elimiates multiple disconnected tour on the graph. 


---
### **Dantzig Fulkerson Johnson Reductions**



[^1]: When all decision variables $x_{i, j} = 0$, the graph is also a DAG, the constraint can then be satisfied. 