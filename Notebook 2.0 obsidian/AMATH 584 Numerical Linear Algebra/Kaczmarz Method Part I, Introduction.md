- [Dykstra Projection Algorithm](../MATH%20---%20Unexplored/TOPICS/Dykstra%20Projection%20Algorithm.md)
- [Projector](Matrix%20Theory/Projector.md)

--- 
### **Intro**

**References**
- Wiki https://en.wikipedia.org/wiki/Kaczmarz_method for more. 
- Paper: R. Ansorge, Hamburg 1984 "Connections Between the Cimmino-Method and the Kaczmarz Method for the Solution of Singular and Regular Systems of Equations". 


#### **Assumption 1**
> Unless specified, we make the following assumptions. 
> 1. $A \in \R^{n \times m}$ is a matrix. 
> 2. $b \in \text{rng}\; A$. 
> 3. $x^* \in \text{null}(A)^\perp$ has $Ax^* = b$. 
> 4. $\e_i$ denotes the standard basis vector. 
> 5. Without loss of generality, rows of matrix $A$ is normalized, i.e: $\Vert A^T\e_i\Vert = 1$ for all $i = 1, \ldots, n$. 

#### **Algorithm 1 | Kaczmarz Method**
> In the settings provided by Assumption 1. 
> For any $x_0 \in \R^m$, the Karzmac algorithm has for all $k = 1, \ldots, N$: 
> $$
> \begin{aligned}
>     x_{k + 1} = 
>     x_{k - 1} - 
>     \frac{\langle Ax_k - b, e_{i_k}\rangle}{\Vert A^T \e_{i_k}\Vert}A^T\e_{i_k}. 
> \end{aligned}
> $$

There are many strategies for choosing $i_k$ given each $k$. 
1. Choose it randomly using a uniform distribution. 
2. Choose the $i_k$ such that it maximizes $|\langle Ax_k - b, \e_{i_k}\rangle|$. 


