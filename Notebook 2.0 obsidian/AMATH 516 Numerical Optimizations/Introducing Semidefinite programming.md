- [Introducing Cone](Background/Introducing%20Cone.md)
- [A Brutal Introduction to Linear Programming](../AMATH%20514%20Combinatorics%20Optimizations/A%20Brutal%20Introduction%20to%20Linear%20Programming.md)
- [Positive Definiteness](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Positive%20Definiteness.md)

---
### **Intro**

This file introduces the basic scope of semidefinite programming. 


**Semidefinite matrices**. 
Let $X \in \R^{m \times m}$
Denote $X \succeq 0$ to denote the relation that $X$ is a positive semidefinite matrix (PSD). 
Denote the set of all SPD $X$ by $\mathcal S^{m}$. 
Recall that a real PSD matrix $X$ is Positive semidefinite if and only if it's a symmetric matrix, and it means that it: 
1. Diagonalizable;
2. Only has non-negative real eigenvalues; 
3. The eigenvectors are orthogonal vectors. 

**Traces are linear functionals on matrices**. 
We make the observation that, all functions mapping from $\mathcal S^m \rightarrow \R$ has representation using the Trace of a matrix and parameterized by another matrix $A \in \R^{m \times m}$: 
$$
\begin{aligned}
    \text{Tr}(AX) = \sum_{i = 1}^{m} \sum_{j = 1}^{m} A_{i, j}X_{i, j}. 
\end{aligned}
$$


A semidefinite programming problem has linear equality constraints and, a variable matrix that is a positive semidefinite. 
The following definition defines semidefinite programs. 

#### **Definition | Positive semidefinite program**
> Let $A_i \in \R^{n\times n}$ for all $i = 1, \ldots, m$.
> Let $C \in \R^{n\times n}$. 
> Let $b_i \in \R$ for all $i = 1, \ldots, m$ be a sequence of real number. 
> Then a semidefinite program is the following problem 
> $$
> \begin{aligned}
>     \sup_{X \succeq 0}\left\lbrace
>         \text{Tr}(CX) |\; 
>         (\forall i =1 ,\ldots, m)\; 
>         \text{Tr}(A_iX) = b_i 
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations**

**Linear programs are Positive semidefinite programs.**
For linear programming problem are a subset of semidefinite program. 
Since, the elements in the matrix $X$ doesn't have to all be variables (It can always be set to zero by an equality constraint), that a diagonal matrix $X \succeq 0$ made from variable vector $x \in \R^n$ is equivalent to $x \in \R^n_+$. 
Next, since $X$ is diagonal, $\text{Tr}(AX)$ simplifies into a element-wise product between diagonal elements of $X$ and the diagonal of matrix $A$. 
This reduces the problem into a linear program. 

**Inequality constraints don't matter**. 
If there are inequality constraints associated, i.e: $\text{Tr}(AX) - b \le 0$, then it's the same as reintroducing a new diagonal element on matrix $X$ as a slack variable and reformulate the above into an equality constraint. 

**In other words**;
> SDP is made of a positive semidefinite constraint on a matrix of variables over a set of linear equality constraints. 

---

---
### **Some more details**

We place attentions on positive semidefinite cone, since it is the new items compared to linear programming. 

#### **Theorem | semidefinite cone**
> The set of positive semidefinite matrix $\mathcal S^m$ is a cone, and: 
> 1. It's closed, 
> 2. It's convex, 
> 3. It's pointed. 

**Proof**

#### **Definition | linear matrix inequality**

#### **Definition | Spectralhedral**
