Wiki [here](https://en.wikipedia.org/wiki/Lagrange_multiplier#:~:text=In%20mathematical%20optimization%2C%20the%20method,chosen%20values%20of%20the%20variables)


---
### **Intro**

This is covered as a basic idea in calc but it's actually essential to understanding more advance topics in mathematical optimizations. 

We assume that the function $f(x): \mathbb{R}^n\mapsto \mathbb{R}$ is convex in some region $\Omega$. And suppose that one constratin vector function $G(x)$ is given and $\{x\in \mathbb{R}^n: G(x) = \mathbf{0}\} \subseteq \Omega$. We assume that $G(x) = \mathbf{0}$ is a set that has a smooth boundary. With this assumptions we consider the constrainted optimization problem: 

$$
\max_x f(x) \text{ s.t: } G(x) = \mathbf{0}
$$

Then for this specific example, the Lagrangian of the system is defined as: 

$$
\mathcal{L}(x, \lambda) = f(x) - \lambda^T G(x)
$$

**Optimality Statement**

Assume that $x^+$ solves the original problem and it's a global optimal, then there exists $\lambda^+$ such that: 

$$
\begin{aligned}
    \nabla_x[f(x)]_{x = x_+} &= \nabla_x[G(x)]_{x = x_+}^T\lambda_+ \quad \text{ Where } x\in \{x: G(x) = \mathbf{0}\}
    \\
    \iff  
    \nabla_{x, \lambda}[\mathcal{L}(x, \lambda)] &= \mathbf{0}
\end{aligned}
$$

**Note** $\nabla_x[G(x)]$ is the Jacobian of the function $G(x)$. 


**Intuitive Understanding: 2 Players Game**

This is important because the idea extends to the duality in variantional analysis. Player 2 is a minimization player that controls the term $\lambda^T G(x)$ for $\mathcal{L}$, which pentalizes the first player's constraints satisfactions, while player one is a maximization player tha maximizes objective $f(x)$. 

The 2 players reaches a pareto efficiency at some saddle points of $\mathcal{L}(x, \lambda)$. The pareto efficiency is in fact a solution to the multi-objective optimization problem phrased by the Lagragient. 

The alignment between $\nabla_x[G(x)]^T_{x = x_+}\lambda_+$ and $\nabla_x[f(x)]_{x = x^+}$ means that at the pareto efficiency point, the tagent at $G(x^+) = \mathbf{0}$ is perpendicular to objective gradient at $x^+$ for $f(x)$, which means that: 

> Max player can't increase the objective along the feasibility tangent for the min player. Min player cannot decrease its objective without violating it's own equality constraints. 

---
### **Proof**



