No pre-req needed, this is very basic. 

---
### **Intro**

The method of characteristic is suitable for solving a limited form of first order PDE where, we reduce the problem to initial value problem, by the use of a characteristic lines, which are just words for the solution of a system of ODEs. We introduce the generic way of solving it and then follow this up with an example. 

**Reference**: 

Professor Eric Foxall course notes for math 319, at UBC Okanagan. 


#### **PDE Problem Format**

We state the format of the PDE that the method of characteristic is capable of solving. Consider the first order PDE involving $u(x, y): \mathbb R^2 \mapsto \mathbb R$, with equation given by: 
$$
\begin{aligned}
    & \langle \nabla u(x, y), F(x, y)\rangle = G(x, y, u)
    \\
    & \text{where: }
    \\
    & \nabla u(x, y) = \begin{bmatrix}
        \partial_x u
        \\
        \partial_y u
    \end{bmatrix}
    \\
    & F(x, y) : \mathbb R^2 \mapsto \mathbb R^2 := \begin{bmatrix}
        F_1(x, y) \\ F_2(x, y)
    \end{bmatrix}
    \\
    & \text{Initial Cond set: } u(x, y) = f(x, y) \quad \forall (x, y) \in S
\end{aligned}\tag{$\star$}
$$


#### **Characteristic Lines**

The characteristic lines are the paramatric curves which solves the ODE system: 

$$
\begin{aligned}
    \begin{cases}
        x ' = F_1(x, y) ,
        \\
        y' = F_2(x, y).
    \end{cases}
\end{aligned}\tag{$*$}
$$

Now, suppose that we hold $(x_0, y_0)\in S$ such that it corresponds to a solution $(x(t), y(t))$ for the above system (More on this later). Along this charateristic line, consider the derivative of the solution on these lines $\partial_t u(x(t), y(t))$, which has

$$
\begin{aligned}
    \partial_t u(x(t), y(t)) &= \partial_x u(x(t), y(t))x'(t) + \partial_y u(x(t), y(t)) y'(t)
    \\
    &= \partial_x u(x(t), y(t))F_1(x(t), y(t)) + \partial_y u(x(t), y(t))F_2(x(t), y(t))
    \\
    &= \langle \nabla u(x(t), y(t)), F(x(t), y(t))\rangle 
    \\
    &= G(x(t), y(t), u(x(t), y(t))), 
\end{aligned}
$$

write $u(x(t), y(t))= w(t)$, then this is an ODE equation wrt to $t$. Notice that in the case when $G(x,y, y) = 0$, we have $u(x(t), y(t))$ being a constant, meaning that along the characteristic lines, the solution $u(x, y)$ have to be a constant, the characteristic lines are the contour of the function $u(x, y)$. This gives us the following ODE

$$
\begin{aligned}
    w'(t) = G(x(t), y(t), w(t)), 
\end{aligned}\tag{$\star *$}
$$


#### **Flow Notations**

> We introduce the flow notations for solutions of ODEs. Denote $D\subseteq \mathbb R^2$ to be the region where we solve the PDEs. Let $\phi(x_0, y_0, t): \mathbb R^2 \mapsto \mathbb R^2$ to be the solution of $(*)$ with initial conditions and $t$ amount of time. 


#### **IVPs for all Characteristic Lines**

Let $\phi(x_0, y_0, t)$ denotes the solution to $(\star)$ with initial conditions $(x_0, y_0)\in S$, if we consider it for all possible initial conditions in $S$, then we get the following system of solutions

$$
\begin{aligned}
    \begin{cases}
        \partial_t \phi(x_0, y_0, t) = F(\phi(x_0, y_0, t)) & \forall (x_0, y_0) \in D, t\in \mathbb R,
        \\
        \phi(x_0, y_0, 0) = (x_0, y_0) & \forall (x_0, y_0) \in S. 
    \end{cases}
\end{aligned}\tag{$\star\star*$}
$$

Where the set $S$ is the set of initial conditions. This will be clarified later. 

---
### **Solution Method**

On a high level, we do: 
1. Solve for the characteristics lines. For all initial conditions, link the characteristic line solution with it, giving us $\phi(x_0, y_0, t)$. 
2. Checks conditiosn for well-posedness for $\phi (x_0, y_0, t)$ given the set $S$. 
3. Connects points $(x, y)\in D$ to the flow lines and back to the initial conditions set $S$ by solvng for $\phi(x_0, y_0, s) = (x, y)$. 
4. Solve for $u$ along $\phi(x_0, y_0, t)$ with $(x_0, y_0)$ determined by the previous step, using sytem $(\star *)$. Then $w(s)$ will be the solution. 


#### **Step 2 Details | Checking wellposedness**
Well-posedness of problem $(\star\star)$ has the sufficient conditions
1. For any characteristics curves, $(x(t), y(t))$, any chocie of initial conditions $(x_0, y_0)\in S$ must corresponds to a unique solution $w(t)$, for $(\star*)$. 
2. The intersection of all characteristics curves with the set $S$ is a single point. 
3. The characteristics curves should not loop back to itself. 

An equivalent conditions for (3.) is that: 

3. (alt) there is no change along characteristics

Pratically, we consider: 
- If $G= 0$, then suppose that $(x_0, y_0) \in S$, show that if $t$ is such that $\phi(x_0, y_0, t) \in S$, then it has to be that $\phi(x_0, y_0, t) = (x_0, y_0)$, the solution for $(*)$ is static. 
- Else we check (3.) well-posedness, there is no loop for $\phi(x_0, y_0, t)$ for all $(x_0, y_0)\in S$, equivalently, if $\phi(x_0, y_0, t) = (x_0, y_0) \implies t = 0$. 


#### **Steps 3,4 Details | Solving along the characteristics Line**

Pick any point $(x, y)\in D$, describe it using the characteristic lines, mainly, solve for $(s, x_0, y_0)$ for $\phi(x_0, y_0, s) = (x, y)$, creates a mapping $(x, y)\mapsto(x_0, y_0, s)$ suchthat $\phi(x_0, y_0, s) = (x, y)$. 
- If $G = 0$, then $f(x, y)$ from $(**)$ solves $(\star)$. 
- Else, set $u(x, y) = w(s)$, where $w(t)$ is the solution to IVP ($\star*$), with initial conditions $w(0) = f(x_0, y_0).$



---
### **Example**

We solve 

$$
\begin{aligned}
    \begin{cases}
        \partial_x u + 2 \partial_y u = u & \forall (x, y) \in \mathbb R^2,
        \\
        u(x, 0) = x & \forall x \in \mathbb R.
    \end{cases}
\end{aligned}
$$

and we observe that $G(x, y, u(x, y)) = x$, $F(x, y) = [1 \; 2]^T$. We proceed with the steps: 

**Step 1**

$$
\begin{aligned}
    (x', y') = (1, 2) \implies \phi(x_0, y_0, t)= (x_0 + t, y_0 + 2t)
\end{aligned}
$$

**Step 2**

The solution to the system indeed is unique, so that for each initial condition $(x_0, y_0)$ has a unique soltuion corresponds to it. Additionally, notice that it this function is a line in $\mathbb R^2$, and it doesn't have loop. The set $S$ is $(x, 0)$, which intersect with any $\phi(x_0, y_0, t)$ at only one point for sure. 

**Step 3**

Choose any $(x_0, 0)\in S$, then solve $\phi(x_0, 0, s) = (x, y)$, which is $(x_0 + s, 2s) = (x, y)$, which is $(x_0, 0, s) = (x - y/2, 0, y/2)$. 

**Step 5**

Set $w(t) = u(\phi(x_0, 0, s)) = G(\phi(x_0, 0, t), w(t)) = w(t)$, solving it yields $w(t) = w(0)\exp(t)$. 