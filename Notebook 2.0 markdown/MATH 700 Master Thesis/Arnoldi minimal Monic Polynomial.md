[Hessenberg Transform with Arnoldi Iterations](../AMATH%20584%20Numerical%20Linear%20Algebra/Hessenberg%20Form/Hessenberg%20Transform%20with%20Arnoldi%20Iterations.md) 

---
### **Intro**

The arnoldi iterations procudes a low rank similarity transform between the matrix $H_k$ and the original matrix $A$, given an initial guess $q_1$. The similarity transform is $Q_k^TH_kQ_k\approx A$. Denote $\mathcal P_k$ be a kth degree polynomial sharing the same form as the characteristic polynomial of matrix $H_k$, denote $\bar{p}_k(x)$ as the characteristic polynomial of $H_k$ then: 

$$
\begin{aligned}
    \bar{p}_k(x) = \min_{p_k\in \mathcal P_k}
    \Vert 
        p_k(x)q_1
    \Vert_2
\end{aligned}
$$

The proof can be found Trefethen's: \<Numerical Linear Algebra\> about arnoldi. 


### **Proof**



