[[Hessenberg Transform with Arnoldi Iterations]] 

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

