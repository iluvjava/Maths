[[Network Flow Standard Form]]

---
### **Intro**

Specialized algorithms for minimum cost flow type of problems are very fast, compare to the alternative such as the interior points method, or the simplex that solves the LP representation of the problem instead of the network flow problem directly. We will go over the Dual problems, how to identify the optimal flows and potentials if one of the other is given, and we will introduce the negative cycles removal algorithms for the min cost flow problem. 

**Assumptions**

1. All data on the graphs are integers. 
2. The network is directed. There is only one arc between each node. 
3. The sum of all the supplies and demands will sum up to zero. 
4. All costs are non-negative in the network. 

---
### **The Dual of the LP**

We restate the dual formulation from the network standard form LP for the problem, but using different symbols. 







**References**: 

Ahuja's Network Flow Algorithm Textbook, Chapter 9