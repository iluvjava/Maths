[[Convex Hull, Convex Span]]


----
### **Theorem Statement**

> Let $x\in \text{cvxh}(Q)$, where $Q\subseteq \mathbb R^d$, then there exists at most $d + 1$ points: $\{x_i\}_{i = 1}^{d+1}$ in $\text{cvxh}(Q)$ such that $x \in \text{cvxspan}(\{x\}_{i = 1}^{d + 1})$. 


**Proof**

For any element in $\text{cvxh}(Q)$, it's possible to choose a countably many elements to represent the as a convex combinations of them. If the point we choose is $\le d + 1$, then there is nothing to prove, as in the case where we have finite $Q$ with cardinarlity $\le d + 1$. Else, we consider convex combinations of $k > d + 1$: 

$$
\begin{aligned}
    & x = \sum_{j = 1}^{k}\lambda_j x_j \quad \lambda \in \Delta_{k}
    \\
    k > d + 1 \implies 
    \exists& \; 2\le j\le k: u_j \neq 0 \wedge \sum_{i = 2}^{k}u_i(x_i - x_1) = \mathbf 0
\end{aligned}
$$

The set of vectors $\{x_j - x_1\}_{j = 2}^{k}$ is linear dependent simply because there are strictly more than $d + 1$ vectors that we are dealing with. Now consider the choice of $\alpha$ for the expression: 

$$
\begin{aligned}
    & x = \left(
        \sum_{j = 1}^{k} \lambda_j x_j 
    \right)- \alpha \sum_{j = 2}^{k} u_i(x_i - x_1)
    \\
    \text{def } &\quad 
    J := \{j: u_j \neq 0\}
    \\
    \implies & 
    x = 
    \left(
        \sum_{j = 1}^{k} \lambda_j x_j 
    \right) - \alpha \sum_{j\in J}^{} u_i(x_i - x_1)
\end{aligned}
$$

Now, we consider the choice of $\alpha \in \min_{j\in J}\{\lambda_j/u_j\}$, and let $j^+$ be the $\arg\max$ of that then we consider the term $x_{j^+}$: 

$$
\begin{aligned}
    & \lambda_{j^+}x_{j^+} - \alpha u_{j^+}(x_{j^+} - x_1)
    \\
    = & \lambda_{j^+}x_{j^+} - \lambda_{j^+}(x_{j^+} - x_1)
    \\
    =&  x_1
\end{aligned}
$$

Therefore, we may represent $x\in \text{cvxspan}(\{x_i\}_{i = 1}^k\setminus \{x_{j^+}\})$, and now, we have $x$ being represented as a convex combinations of $d - 1$ element, only a subset of points from where we started. Repeat such a process inductively until we obtained $k = d+ 1$. 


**Remarks**

The problematic part about the proof is the statement where I just claim it's possible to represent any points in a convex hull as a convex combinations of a subset of finite many points taken from $Q$, this is obvioius for all $x\in \text{relint}\circ \text{cvxh}(Q)$,  however, it's not so obvious for points that are on the boundary. 

Next thing regarding the technicality is that, we can definitely support $x$ using fewer than $d + 1$ vector, and that happens if the convex set is contained in an affine space having fewer dimensions than the Euclidean space. However, this prove can't handle that and the part where $(x_j - x_1)$ is linear dependent is going to fail as an assumption. 



