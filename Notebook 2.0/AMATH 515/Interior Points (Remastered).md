The previous discussion on interior points have some inconsistency with the HW, and it's not easy to follow. For example I didn't explain what the log barrier function is for, hence we are following on the previous discussion citing other things, to construct a revised version for it. 

Previous Version: [[Interior Points]],

References
1. [[Dualization Examples]], About how we get the Lagrangian
2. [[Exploiting the Lagrangian (KTT)]], Some more information and background about the optimality conditions we are exploiting for Interior Points algorithm. 

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

Firstly, let's pick up from the strong duality: [[Dualization Examples]], we conclude the saddle node of the Lagrangian representing the optimality conditions which should give us: 

$$
\begin{cases}
    \partial_x \mathcal{L}(x, z; s) = 0 &\implies A^T(A \bar{x} - b) + C^T\bar{z}  = 0 
    \\
    \partial_z\mathcal{L}(x, z; s) = 0 &\implies s_i, z_i \ge 0 \wedge s_iz_i =0\quad \forall i
\end{cases}
$$

However, notice that the complementary slackness doesn't help with an algorithmic approach to the problem. 

Take note that, when formulating the problem into it's optimality form and then applying the Newton's solver, there seems to be different approaches to it. 

Note, in the general case, the 2-Norm objective can be replaced with any convex functions. 

**What is not involved:** 

* Feasibility Search 
* Other type of constraints 


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


??? I have no idea how the log barrier plays a role for the formulations of the Interior Points algorithm. 

---
### **The Lagrangian**

$$
\mathcal{L}(x, v) =\frac{1}{2}\Vert Ax - b\Vert^2 - v^T(d - Cx) \quad v \ge 0, d - Cx \ge 0 \tag{1}
$$

Take note that this is the same as the results we gotten from [[Duality (Example Transformation)]], and the positive constraint of the dual variable is taken from the indicator function into the Lagrangian. 

**Derivative on the Lagrangian**

$$
\begin{aligned}
    \nabla_x\mathcal{L}(x, v) &= 
    A^T(Ax - b) + C^Tv
    \\
    \nabla_v \mathcal{L}(x, v) &= d - Cx    
\end{aligned}
$$

Setting the system to zero we obtained the optimality conditions for the primal and dual problems (Applied Strong Duality). 

However, if we treat this as a system of equation, and we want to solve this then we need the Jacobian of the system, which is needed for solving for the optimal solutions with newton's method. 

However, in practice, the problem is formulated using the complementary slackness conditions, and it's relaxed by a multiplier $\mu$, phrased as a multi-variable function. 

$$

F_\mu(x, v)= 
\begin{bmatrix}
    A^T(Ax - b) + C^Tv 
    \\
    v^T\circ (d - Cx) - \mu \mathbb{J}
\end{bmatrix} = \mathbf{0}
\quad v \ge 0, d - Cx \ge 0 
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
    A^TA \\ -\text{diag}(v)C
\end{bmatrix}
$$

$$
\nabla_v[F_\mu(x, v; \mu)] = 
\begin{bmatrix}
    C^T \\ 
    \text{diag}(d - Cx )
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
    A^TA & C^T \\
    -\text{diag}(v)C & \text{diag}(d - Cx )
\end{bmatrix}
$$

How do we make sure that this matrix is invertible? We simply don't make this assumption yet, and we will be using the Pseudo-inverse when actually using teh inverse in the algorithm. 


---
### **Formulation for Newton's Method**

By solving on the optimality conditions, we get the optimal solution, getting both the primal and the dual, very convenient. 

The update of the primal and dual variable is given as expression (2), however, there are 3 parts remains unclear: 

1. How do we update the parameter $\mu$
2. How do we keep the points inside the feasible region? 
3. How do we keep the dual variable positive? 

Let's make the variable $x^+, v^+$ denotes the updated primal and dual variables. Then the constraints can be noted as: 

$$
\begin{aligned}
    x^+ &= x + \alpha\Delta x \quad \wedge  \quad d - Cx^+\ge \mathbf{0}
    \\
    v^+ &= v + \alpha\Delta v \quad \wedge \quad v^+ \ge \mathbf{0}
\end{aligned}
$$

Where $\alpha$ is the step we are going to take in the direction given by the newtons' method, the constrain that $\alpha > 0$ is implicit[^1]. 

And, when updating the parameter $\mu$, it's more of an art than anything else, and hence, we will be using this update for $\mu$: 

$$
u^+ = \frac{1}{10} \frac{\langle z^+, s^+\rangle}{\text{len}(z^+)}
$$

**Keeping the Constraints**

$$
\begin{aligned}
    d - Cx^+ &\ge \mathbf{0} 
    \\
    d - C(x + \alpha\Delta x) &\ge  \mathbf{0} 
\end{aligned}
$$

We are search for the value of $\alpha$ such that, the value of $x, v$ advances as much as possible while keeping the constraints for the system. 

Notice that: 

$$
\begin{aligned}
d - Cx - \alpha C\Delta x &\ge \mathbf{0}
    \\ 
- \alpha C\Delta x&\ge Cx - d 
\end{aligned}\tag{3}
$$

**Intuitive Understanding**: 

When we optimize, we make a step to a new point, that new point is still going to be in the feasible region defined by the inequality. 

For each of the constraint, we approach the boundary closer for some of them, and we get away from some other boundaries, the amount of changes for each of the constraint is given by: $C\Delta x$. 

**Approaching the Boundary**

If we are getting closer to constrain index by $i$, then the quantity $(C\Delta x)_i$ will be positive, and negative other-wise, Because the constraints are given as $Cx \le d$. 

Therefore, imagine the inequalities as a stack of them, we do the operations on each of them depending on the sign take for $(C\Delta x)_i$ (It should not be equal to zero because the derivative is becoming zero when we are closing in with one of the boundaries.), then it will become: 
$$
-\alpha \begin{cases}
    \ge \left(
        \frac{Cx - d}{C\Delta x} 
    \right)_i
    & \text{if}\quad (C\Delta x)_i > 0
    \\
    \le
    \left(
         \frac{Cx - d}{C\Delta x}
    \right)_i
     & \text{if}\quad (C\Delta x)_i < 0
\end{cases} \tag{4}
$$

Hence, the quantities that define the upper bound for the value $\alpha$ is when $(C\Delta x)_i > 0$, which is the constraint that we are closing in. 

Compactly, the best $\alpha$ can be written as: 

$$
\alpha \le \min\left\lbrace
    \delta_+^E\left(
        \frac{d - Cx}{C\Delta x}
    \right)
\right\rbrace \tag{5}
$$ 
[^2]

And, this make sense because what is inside the min operator is the negativity indicator function. Keep in mind that $d - Cx$ will always be positive, then the sign of the fraction inside will be determined by the sign of $(C\Delta x)_i$. If it's positive, then it's in the first case in expression (4), imposing a upper bound for the $\alpha$, which is preserved by $\delta_+$. Otherwise, it's negative, then it's set to infinity by $\delta_-$, then $\alpha$ is not restricted by it. As desired. 

**Keeping Dual Positive**: 

When updating the dual variable, the positive constraint of it must apply, keeping the properties of the complementary slackness. The constraint is: 

$$
v + \alpha\Delta v \ge 0
$$

$$
\alpha\Delta v \ge -v
$$

We continue the trick of viewing it as a stack of inequalities and divides it by the variable $\Delta v_i$, then: 

$$
\alpha \begin{cases}
    \ge \frac{-v_i}{\Delta v_i} & \text{if}\quad \Delta v_i> 0
    \\
    \le \frac{-v_i}{\Delta v_i} & \text{if} \quad \Delta v_i < 0
\end{cases}
$$

Then in this case the upper bound is determined by the second case. And it can be conveniently represented as: 

$$
\alpha \le \min\left\lbrace
    \delta_+^E\left(
        \frac{-v_i}{\Delta v_i}
    \right)
\right\rbrace \tag{6}
$$

Choosing the minimal option between the results from expression (6) and (5), then we will have the best update value for the quantity $\alpha$, giving use the next value to take for $v^+, x^+$. 

---
### **Edge Cases**

If at the beginning, the positive constraint for the slack variable is not satisfied, then the given solution is never feasible, therefore, a 2 phase simplex is needed to search for the feasible solution first. 

---
### **The Interior Points Algorithm**

1. Compute Jacobian, Compute $F_\mu$, solve for $\Delta x, \Delta v$. 
2. Get the value for $\alpha$. 
3. Update $x^+, v^+$ keep the consratints.
4. Update $\mu$. 

Repeat the above process by defining $x, v$ for the next step as $x^+, v^+$ from the previous step. 



[^1]: If $\alpha < 0$, we are getting away from the optimal, which is not what we want. 
[^2]: The function $\delta_+: \mathbb{R} \mapsto\mathbb{R}$ is vectorized for the input. A univariate function is applied element-wise to all the entries of the vector. 