The previous discussion on interior points have some inconsistency with the HW, and it's not easy to follow. For example I didn't explain what the log barrier function is for, hence we are following on the previous discussion citing other things, to construct a revised version for it. 
[[Interior Points]], [[Duality (Example Transformation)]]

Objective: 
1. Phrase the 2-Norm Inequality Constrained Optimization Problem
2. Log Barrier and Fenchel Conjugate

---
### **Intro**

The goal is to derive a precise, algorithmic approach to 2-Norm optimization with linear constraints from the ground up. So the problem format will be given by: 

$$
\min \left\lbrace
    \frac{1}{2}\Vert Ax - b\Vert^2 + \delta_+(d - Cx)
\right\rbrace
$$

The problem is convex objective and convex constraints, hence the strong duality is applicable here. 

Where, the indicator function seeks to assert the constraints from the linear inequalities. 

Firstly, let's pick up from the strong duality: [[Duality (Example Transformation)]], we conclude the saddle node of the Lagrangian representing the optimality conditions which should give us: 

$$
\begin{cases}
    \partial_x \mathcal{L}(x, z; s) = 0 &\implies A^T(A \bar{x} - b) + C^T\bar{z}  = 0 
    \\
    \partial_z\mathcal{L}(x, z; s) = 0 &\implies s_i, z_i \ge 0 \wedge s_iz_i =0\quad \forall i
\end{cases}
$$

However, notice that the complementary slackness doesn't help with an algorithmic approach to the problem. 

Take note that, when formulating the problem into it's optimality form and then applying the Newton's solver, there seems to be different approaches to it. 

---
### **The Log Barrier** 

$$
\lim_{\mu \rightarrow 0_+} -\mu\ln(d - Cx) = \delta_+(d - Cx)
$$

Notice that, as the value of $\mu$ approaches $0$ from the positive side, so them we can consider the problem that: 

$$
\min_x \left\lbrace
    \frac{1}{2}\Vert Ax - b\Vert^2 -
    \sum_{i = 1}^{n}
        \mu \ln((d - Cx)_i)
\right\rbrace
$$

---
### **The Lagrangian**
$$
\mathcal{L}(x, v) =\frac{1}{2}\Vert Ax - b\Vert^2 - v^T(d - Cx) \quad v \ge 0, d - Cx \ge 0
$$


---
### **Formulation for Newton's Method**

By solving the optimality conditions, we get the optimal solution, getting both the primal and the dual, very convenient. 
