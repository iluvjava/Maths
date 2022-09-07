* [Normal Cone](../Background/Normal%20Cone.md)
* [Convex Sets](../Background/Convex%20Sets.md)

---
### **Intro**

Let $\Omega_1, \Omega_2$ be 2 convex sets where $\text{ri}(\Omega)\cap \text{ri}(\Omega) \neq \emptyset$, then the normal cone one one point $\bar x$ in the their intersection is the sum of normal cone of both at the same point

$$
N(\bar x| \Omega_1 \cap \Omega_2) = N(\bar x| \Omega_1) + N(\bar x| \Omega_2)
$$

where $\bar x \in \text{ri}(\Omega_1)\cap \text{ri}(\Omega_2)$. 

**Proof**: 

$\supseteq$ is trivial, Let's choose any $v\in N(\bar x| \Omega_1 \cap \Omega_2)$. We define 2 sets: $\theta_1, \theta_2$: 

$$
\begin{aligned}
    &\theta_1 := \Omega_1\times \mathbb R_+
    \\
    &\theta_2 := \{(x, \lambda)| x\in \Omega_2 \wedge \lambda \le \langle v, x - \bar x\rangle\}.
\end{aligned}
$$

We want to show that $\text{ri}(\theta_1)\cap \text{ri}(\theta_2)=\emptyset$. Assume for contradiction that $(x, \lambda)\in \text{ri}(\theta_1)\cap \text{ri}(\theta_2)$ so then $x\in \Omega_1\cap \Omega_2$ and because it's the relative interior: 

$$
\begin{aligned}
    & x\in \Omega_1\cap \Omega_2
    \\
    & 0 < \lambda < \langle v, x - \bar x\rangle
\end{aligned}
$$

However, because $v\in N(\bar x| \Omega_1\cap \Omega_2)$, we have $0 \le \lambda < \langle v, x - \bar x\rangle \le 0$, which is a contradiction. Using proper separations between $\theta_1, \theta_2$ we have: 

$$
\begin{aligned}
    & \langle w, x\rangle + \lambda_1 \gamma \le \langle w, y\rangle + \lambda_2\gamma \quad \forall (x, \lambda_1)\in \theta_1, (y, \lambda_2)\in \theta_2
    \\
    &
    \langle w, \tilde x \rangle + \tilde \lambda_1 \gamma < \langle w, y\rangle + \tilde \lambda_2 \gamma \quad 
    \exists (\tilde x, \tilde \lambda_1) \in \theta_1, (\tilde y, \tilde \lambda_2)\in \theta_2, 
\end{aligned}
$$

observe that $(\bar x, 1)\in \theta_1, (\bar x, 0)\in \theta_2$ which by definition giving us: 

$$
\begin{aligned}
    & \langle w, \bar x\rangle + \gamma \le \langle w, \bar x\rangle + 0
    \\
    & \gamma \le 0.
\end{aligned}
$$

However, $\gamma \neq 0$ because if it is, then $(x, \lambda_1)\in \theta_1, (y, \lambda_2)\in \theta_2 \implies  x\in \Omega_1, y\in \Omega_2$, giving us $\langle w, x\rangle\le \langle w, y\rangle$ by $\gamma = 0$, implying that $\text{ri}(\Omega_1)\cap \text{ri}(\Omega_2)= \emptyset$, contradicting the assumption. Therefore $\gamma < 0$. Finally, $(x, 0)\in \theta_1, (\bar x, 0)\in \theta_2$. Thus we have: 

$$
\begin{aligned}
    & \langle  w, x\rangle\le \langle w, \bar x\rangle \quad \forall x\in \Omega_1
    \\
    & \langle w, x - \bar x\rangle\le 0
    \\
    & w \in N(\bar x| \Omega_1)
\end{aligned}
$$

Finally, we have $(\bar x, 0)\in \theta_1$ and $(y, \lambda)\in \theta_2\forall y \in \Omega_2$ and $\lambda = \langle v, y - \bar x\rangle$ because $\langle v, y - \bar x\rangle \le \langle v, y - \bar x\rangle$ trivially then

$$
\begin{aligned}
    & \langle w, \bar x\rangle \le \langle w, y\rangle + \gamma \langle v, y - \bar x\rangle \quad \forall y\in \Omega_2
    \\
    & \langle w, \bar x - y\rangle + \gamma\langle v, \bar x - y \rangle\le 0
    \\
    & \langle w + \gamma v, \bar x - y\rangle \le 0
    \\
    & -w - \gamma v \in N(\bar x |\Omega_2)
    \\
    & w/\gamma + v \in N(\bar x| \Omega_2) \text{ by: } -\gamma > 0
    \\
    & v \in \frac{w}{-\gamma} + N(\bar x| \Omega_2). 
\end{aligned}
$$

Observe that $w/(-\gamma)\in N(\bar x| \Omega_1)$ still, therefore, $v \in N(\bar x| \Omega_1) + N(\bar x| \Omega_2)$. 


**Remarks**: 
The proof is very interesting, it's not my own original proof but it did has some interesting constructions behind it. Would be great if I can one day do my own original proof. 


**Source**: [here](https://maunamn.wordpress.com/6-normal-cones-to-convex-sets/). It's not my own proof and I take it from somewhere else. 

