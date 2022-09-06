### **Intro**

**Definition**: 
> The stable set of a graph is a subset of vertices such that none of the vertices are sharing edges on the original graph. 

Let $S$ be the stable set of the graph $G := (V, E)$: 
$$
    S \subseteq G, u, v \in S \implies \neg (\{u, v\} \in E)
$$

If a set of vertices is a stable set, then its subset is still going to be a stable set. Therefore, we are interested in the Maximum Stable set, usually denoted as: $\alpha(G)$; the cardinality of the maximum independent set. 