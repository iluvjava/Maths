[[Schur Decomposition]]

---
### **Intro**

We are going to use the Schur Theorem to prove the following statement: 

**Theorem Statement**

> Any normal matrix is similar to a diagonal matrix. Alternatively: "Normal matrices are diagonalizable"


**Lemma 1**

Given matrix $R$ that are upper triangular, and normal, then: 

> $$
> R^HR = RR^H \text{ Where: } R \text{ is Diagonal}
> $$

**proof:** 

* Just by considering the diagonal elements of $R^HR, RR^H$. 

$$
\begin{aligned}
    (R^HR)_{i, i} &= 
    \sum_{j = 1}^{n}(R^H)_{i, j} R_{j, i}
    \\
    (R^HR)_{i, i} &=
    \sum_{j = 1}^{n}
        \bar{R}_{j, i}R_{j, i}
    \\
    &= 
    \sum_{j = 1}^{n}
    |R_{j, i}|^2
    \\
    \underset{[1]}{\implies}&= 
    \sum_{j = 1}^{i} |R_{j, i}|^2
\end{aligned}
$$

\[1\]: Because it's upper triangular. 

Similarly, we have: 

$$
(RR^H)_{i, i} = \sum_{j = i}^{n}|R_{i, j}|^2 
$$

Consider the first diagonal element and them down the diagonal, we start with the first 2 element to show the pattern. 

$$
\begin{aligned}
    (RR^H)_{1, 1} = |R_{1, 1}|^2 &= \sum_{j = 1}^{n}|R_{i, j}|^2
    \implies R_{i, j} = 0 \; \forall \;2 \le j \le n
    \\
    \underset{[1]}{\implies}
    \underbrace{|R_{1, 2}|}_{ = 0}r^2 + |R_{2, 2}|
    &= 
    |R_{2, 2}|^2 = \sum_{j = 2}^{n}|R_{2, j}|^2 \implies R_{2, j} = 0 \quad \forall \; 2 \le j \le n
\end{aligned}
$$

\[1\]: $R_{1,2} = 0$ because of the results from the line before this line. 

We can do this to all the diagonal elements of the matrix $R^HR$, because other previous row will be set to zero while figuring out the equation for the diagonal, it will set the right handside of the next equation only equals to the $i$ th diagonal. Therefore, inductively we know that $RR^H, R^HR$ are diagonal matrices. 


---
### **Theorem Statement**

**The proof of the theorem statement**: 

Consider the the Shcur decomposition we have $A = QRQ^H$ where $Q$ is unitary and $R$ is upper diagonal. : 

$$
\begin{aligned}
    A^HA &= OR^HQ^HQRQ^H 
    \\
    &= QR^HRQ^H
    \\
    AA^H &= QRR^HQ
    \\
    A^HA &= AA^H \implies
    RR^H = R^HR
\end{aligned}
$$

By lemma, and that last line of the above statement, we know that $R^HR, RR^H$ is a diaognal matrix, therefore the theorem is proven. 






