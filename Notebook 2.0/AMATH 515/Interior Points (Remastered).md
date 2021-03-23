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
\mathcal{L}(x, v) =\frac{1}{2}\Vert Ax - b\Vert^2 - v^T(d - Cx) \quad v \ge 0, d - Cx \ge 0 \tag{1}
$$

Take note that this is the same as the results we gotten from [[Duality (Example Transformation)]], and the positivity constraint of the dual variable is taken from the indicator function into the Lagrangian. 

**Derivative on the Lagrangian**

$$
\nabla_x\mathcal{L}(x, v) = 
A^T(Ax - b) + C^Tv
$$

$$
\nabla_v \mathcal{L}(x, v) = d - Cx
$$

Setting the system to zero we obtained the optimality conditions for the primal and dual problems (Applied Strong Duality). 

However, if we treat this as a system of equation, and we want to solve this then we need the Jacobian of the system, which is needed for solving for the optimal solutions with newton's method. 

However, in practice, the problem is formulated using the complementary slackness conditions, and it's relaxed by a multiplier $\mu$, phrased as a multi-variable function. 

$$

F_\mu(x, v)= 
\begin{bmatrix}
    A^T(Ax - b) + C^Tv 
    \\
    v^T(d - Cx) - \mu \mathbb{J}
\end{bmatrix} = \mathbf{0}
$$

Take note that, the second block vector in the expression is NOT the derivative from the dual variable, it's the relaxed version of the complementary slackness. 

The idea here is to update the value of $\mu$, together with the values for $x, v$, keeping the positivity constraint for both the primal and the dual variables. The update will be described by as the following:

$$
\begin{bmatrix}
\Delta x \\ \Delta v
\end{bmatrix} = 
\text{Jocobian}^{-1}(x, v; F_\mu)F_\mu(x, v) \tag{2}
$$

Consider taking the derivative of $F_\mu$ wrt to $x$ which is a vector: 

$$
\nabla_x[F_\mu(x, v; \mu)] = 
\begin{bmatrix}
    A^TA \\ \text{diag}(v)C
\end{bmatrix}
$$

$$
\nabla_v[F_\mu(x, v; \mu)] = 
\begin{bmatrix}
    C^T \\ d - Cx 
\end{bmatrix}
$$

Take note that the derivative for the component $v^T(d - Cx)$ is computed as: 

$$
\nabla_x(\text{diag}(v)Cx) = \text{diag}(v)\nabla_x[Cx] = \text{diag}(v) C
$$

And hence the Jacobian of the function $F_\mu(x, v)$, written in block form is given as: 

$$
\text{Jacobian}(x, v; F_\mu) = 
\begin{bmatrix}
A^TA & C^T \\ \text{diag}(v)C & d - Cx 
\end{bmatrix}
$$

How do we make sure that this matrix is invertible? We simply don't make this assumption yet, and we will be using the Pseudo-inverse when actually using teh inverse in the algorithm. 


---
### **Formulation for Newton's Method**

By solving on the optimality conditions, we get the optimal solution, getting both the primal and the dual, very convenient. 

The update of the primal and dual variable is given as expression (2), however, there are 2 parts remains unclear: 

1. How do we update the parameter $\mu$
2. How do we keep the points inside the feasible region? 
3. How do we keep the dual variable positive? 


