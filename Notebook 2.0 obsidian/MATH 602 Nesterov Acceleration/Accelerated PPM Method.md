- [Nesterov Estimating Sequence](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Convex Proximal Point Method, Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Nesterov Type Acceleration via Proximal Point Method Part II](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20II.md)

---
### **Intro**

This writing will follow some of the mathematics in Osman Guller's writings, on his way of accelerating the Proximal point method using Nesterov Acceleration sequence. 
We will follow the paper faithfully with method of Nesterov's Estimating sequence. 
We will first introduce the notations that we are going to work with: 


#### **Standardizing the notations**

In this section, we will first standardize the notations, it helps with summarizing contents from several papers that are talking about the same topic. We are focusing first order optimizations with the following list of major entities: 

$$
\begin{aligned}
    & F: \R^n \mapsto \R^n, \tilde F  \approx F, 
    \\
    & \mathcal M_F^{\lambda_k}(x; y) := F(x) + \frac{1}{2\lambda_k}\Vert x - y\Vert^2. 
    \\
    & \mathcal J_{\lambda_k} :=  (1 + \lambda_k\partial F)^{-1}, 
    \\
    & \widetilde{\mathcal J}_{\lambda_k} \approx  (1 + \lambda_k\partial F)^{-1},
    \\
    & \mathcal G_{\lambda_k} := \lambda_k^{-1}(I - \mathcal J_{\lambda_k}),
    \\
    & \widetilde{\mathcal G}_{\lambda_k} := \lambda_k^{-1}(I - \widetilde{\mathcal J}_{\lambda_k}). 
\end{aligned}
$$

Here, $F, \mathcal J, \mathcal G$ denotes objective function, resolvent on the objective function. Their subscript correlates to the constant $\lambda_k$ used in the resolvent operator. 
Their approximation counter part has $\widetilde{(\cdot)}$ on on them. 
To ease the notation, sometimes their subscript will become $k$ when it's clear that we are talking about a sequence of proximal point iteration with $(\lambda_k)_{k \ge 0}$.



