[[Conjugate Gradient with Krylov Subspace]], [[Lanczos Algoritm]]
Make sure to understand the derivation of the conjguate gradient algorithm under the Krylov Subspace method. 

Make sure to understand the Lancosz algorithm as the Arnoldi Iterations for symmetric matrices. 

The referece is from Tyler Chen, 4.1: [here](https://chen.pw/research/cg/cg.pdf)

---
### **Intro**

The key here is the third Corollary from the material [[Conjugate Gradient with Krylov Subspace]], stated here: 

> $$
> \langle r^{(k)}, r^{(j)} \rangle = 0 \quad \forall\; 0 \le j \le k - 1
> $$

The relations is derived using the properties of the Krylov Subspace, and it's the key connection to Lancos Algorithm because Lancosz algorithm will generate a sequence of $q_i$ such that they are all orthogonal to each other. 

At the same time, recall the recurrence relations of the Orthogonal Vectors for matrix $A$ during the Lancosz Algorithm: 

> $$
> \begin{aligned}
>     [AQ]_{:, 1 < k < n} &= \beta_{k - 1}q_{k - 1} + \alpha_{k}q_k + \beta_{k}q_{k + 1}
>     \\
>     [AQ]_{:, 1} &= \alpha_1 q_1 + \beta_1 q_2
>     \\
>     [AQ]_{:, n} &= \beta_{n - 1}q_{n - 1} + \alpha_n q_n
> \end{aligned}
> $$

---
### **The Residual Vectors are the Orthogonal Vectros From Lanczos**

**Claim 1**

> The orthognal vectors generated from the conjugate gradient algorithm is the vector rescaled from the Lancozs Orthogonal Vectors.

