[[Lorenz Attractor]]

The Lorenz attraction is called a strange attractor. This is the best representation of chaos. 

---
### **Def: Strange Attractor**

$S$ is a strange attractor for the system $x' = f(x)$ or $x_{n + 1} = f(x_n)$ if: 

1. $S$ is an **invariant under the dynamics**. For all initial value problem inside the set, it will stay there fore all time. 
2. There is an open set $A$ such that $S\subseteq A$ such that any element of $A$ will converge to $S$ after the time goes to infinity. $A$ is like a trapping region. 
3. $S$ is the **smallest set** with the properties (1.) and (2.)
4. S exhibits SDIC

Conditions (1.), (2.), (3.) defines an attractor, and with (4.) it becomes a Strange Attractor. 

The lorenz attractor is a strange attractor. 

---
### **Causes and Creation of the Strange Attractor**

Stretching and folding is what causes the Chaos structure. 

Imagine a box volume, then the volume will get stretch as the dynamical system progress, and then it fold back onto itself. This is the kind of transformation that causes chaos. 

---
### **The Baker's Map**

See the textbooks for more information. This is a simple to understand dynamical system than can produce a strange attractor. 

The invariant set of this transformation is a Middle 3rd Cantor set. Which is a demonstration of how chaotic dynamics occurs for the Lorenz equation. 

Let's define the Backers Map: 

$$
\text{Baker} = 
\begin{cases}
    x_{n +1} = \begin{cases}
        2x_n & x_n\in [0, 1/2)
        \\ 
        2x_n - 2 & x_n \in [1/2, 1]
    \end{cases}
    \\[1.4em]
    y_{n + 1} = \begin{cases}
        ay_n & x_n \in [0, 1/2) 
        \\
        ay_n + 1/2 & x_n \in [1/2, 1]
    \end{cases}
\end{cases}
$$

And this is the dynamical system we are looking at. 

Whenever $a \in [0, 1/2]$, the the orbits of the dynamical system will be contain in the box: $[0, 1]\times [0, 1]$. 

