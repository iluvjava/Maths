Pre-req
- [Norm, for Beginners](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Norm,%20for%20Beginners.md). 


---
### **Intro**

Dual norm denoted as $\Vert \cdot\Vert_\star$ is defined for a norm $\Vert \cdot\Vert$ in $\mathbb E$. Here it's the definition: 

$$
\Vert y\Vert_\star := \max_{x}\left\lbrace
    \langle x, y\rangle: \Vert x\Vert \le 1
\right\rbrace
$$

Which is just simply, the objective value of a linear program on the convex set $\Vert x\Vert$ defined by the norm ball in the Euclidean space. Note, it's also the support function of a specific unit norm ball. See [[Support Function]] for more info. 

The idea is very useful for duality and looking for the prox of some functions that involves the use of some type of norms. 


---
### **Generalized Cauchy-Schwarz Inequality** 

**Theorem Statement**: 
$$
\begin{aligned}
    |\langle x, y\rangle| \le \Vert x\Vert\Vert y\Vert_\star
\end{aligned}
$$

The proof is direct from the definition of dual norm: 

$$
\begin{aligned}
    \Vert y\Vert_\star &\ge  \langle y, x\rangle\; \forall x: \Vert x\Vert \le 1
    \\
    \implies \Vert y\Vert_\star &\ge \frac{\langle y, x\rangle}{\Vert x\Vert} \; \forall x \neq \mathbf 0
\end{aligned}
$$

The absolute value can be obtained by considering $\Vert - y\Vert_\star$. $\Vert -y\Vert_\star = -\min_x\{\langle x, y\rangle: \Vert x \Vert \le 1\}$. 

---
### **P-Norm Dual**

The dual of the p-norm $\Vert y\Vert_p^\star$, is $\Vert y\Vert_{q}$ such that $1/p + 1/q = 1$. In the special case we have $(\Vert y\Vert_\infty)^\star = \Vert y\Vert_1$

**Proof**

An exercise for the reader, which is likely to be myself. 

---
### **Dual of The Induced Energy Norm**


**#UNFINISHED: Look for the Dual of the induced energy norm**. 



Source: \<First Order method in Optimizations\> By SIAM Example 1.6, they a quick example. 

---
### **Misc**

To understand dual norm in a more abstract context, i.e: As the dual space of formed by linear functional of a Banach space, visit [Linear Functionals and Dual Spaces](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Linear%20Functionals%20and%20Dual%20Spaces.md). 