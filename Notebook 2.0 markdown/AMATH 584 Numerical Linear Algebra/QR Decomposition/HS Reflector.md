This is a brief demonstration on how the Householder Reflector is going to work for our purpose, using the idea of orthogonal projector. 

[Projector](../Matrix%20Theory/Projector.md)

---
### **Introduction**

HS reflector stands for Householder Reflectors, it's a unitary complex rank one matrix that transform the **unitary vector**$x$ into $y$ by reflecting the vector $x$ using the separating hyperplane between them[^1]. There are infinitely such hyperplanes for the 2 vectors in the complex case, and in the real case, there are 2. 

Let vector $v = y - x$. Then, the hyperplane that is separating these 2 vector $x$, $y$ will be orthogonal to $v$.

Firstly, orthogonally project $x$ onto the vector $v$, $v$ is the subspace orthogonal to the separating hyper plane between $x, y$. 

$$x - x\left(\frac{vv^H}{v^Hv}\right)$$

If we go 2 times the distance on the direction of $v$, then the vector $v$ is going to meet the vector $y$. This is by basic triangle geometry, which is given by the expression: 

$$x - 2\left(\frac{vv^H}{v^Hv}\right)x$$

Which is essentially another project onto the vector $y$, which is also a reflector the hyperplane separating the vector $x$ and $y$, given as: 

$$
\left (I - 2\frac{vv^H}{v^Hv} \right)
$$

Illustration: 

![](HS_Reflector%201.jpeg)

Vector on the hyper plane doesn't get reflected, and vector orthognal to thehyper plane got their sign swapped, therefore this is a rank one unitary transformation. It has eigenvalue of $1$ with geometric multiplicity of $n - 1$ and $-1$ eigenvalue with geometric multiplicity of $1$. 

---
### **Properties and Facts**

* $P^2 = P$
* $P^H = P$
* $P = P^{-1}$
* $Px = y$

---
### **Comments**

Used a lot for QR, Hessenberg Form transform. 

The matrix is Hermitian and it's a projector, and it's therefore, known as an Orthogonal Projector. 

[^1]: Unitary $x, y$, if not $(y - x)$ will not be the normal of the hyperplane separating the vector $x, y$. 

