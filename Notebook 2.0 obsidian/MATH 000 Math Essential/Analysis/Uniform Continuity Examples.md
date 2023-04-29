[Real Analysis Basics](Real%20Analysis%20Basics.md)


---
### **Intro**

We present some examples to enlighten the concept of uniform continuity. Recall that a function $f: \mathbb R \mapsto \mathbb R$ is uniformly continuous when for all $\epsilon > 0$, exists $\delta_\epsilon$ such that for all $|x - y| \le \delta_\epsilon \implies |f(x) - f(y)|\le \epsilon$. 

---
### **Example-1 | $\sqrt{x}$**

We show that the function is uniformly continuous. 

**Claim-1**
> The function $\sqrt(x)$ is uniformly continuous on $\R_+$. Which means that for all $\epsilon > 0$ there exists $\delta_\epsilon$ such that whenever $|x - y|\le \delta_\epsilon$, we have $|\sqrt{x} - \sqrt{y}|\le \epsilon^2$. 

**Proof**: 

Consider the following chains of inequality with $x, y$ both $\ge 0$: 

$$
\begin{aligned}
    x + y &= x + y
    \\
    x + y - 2\sqrt{xy} &\le x + y + 2\sqrt{xy}
    \\
    \implies 
    (\sqrt{x} - \sqrt{y})^2 &\le (\sqrt{x} + \sqrt{y})^2
    \\
    \iff 
    |\sqrt{x} - \sqrt{y}|^2 &\le |\sqrt{x} + \sqrt{y}|^2,
\end{aligned}
$$

therefore we may consider the the following chains of inequalities: 

$$
\begin{aligned}
    |\sqrt{x} - \sqrt{y}|^2
    \le 
    |\sqrt {x} - \sqrt{y}||\sqrt{x} + \sqrt{y}|
    \le |x - y|^2 \le \epsilon^2, 
\end{aligned}
$$

and this conclude it, we can choose $\delta_\epsilon$ for every $\epsilon > 0$, then the function value $\sqrt{x} - \sqrt{y}$ will be bounded in abs by $\epsilon^2$. 