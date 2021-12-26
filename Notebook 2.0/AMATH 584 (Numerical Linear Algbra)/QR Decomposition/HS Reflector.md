This is a brief demonstration on how the Householder Reflector is going to work for our purpose, using the idea of orthogonal projector. 

[[Projector]]

---
### **Introduction**

HS reflector stands for Householder Reflectors, it's a unitary complex rank one matrix that transform the vector $x$ into $y$ by reflecting the vector $x$ using the separating hyperplane between them. There are infinitely such hyperplanes for the 2 vectors in the complex case, and in the real case, there are 2. 

Let vector $v = y - x$. Then, the hyperplane that is separating these 2 vector $x$, $y$ will be orthogonal to $v$.

Firstly, orthogonally project $x$ onto the vector $v$, $v$ is the subspace orthogonal to the separating hyper plane between $x, y$. 

$$x - x\left(\frac{vv^H}{v^Hv}\right)$$

If we go 2 times the distance on the direction of $v$, then the vector $v$ is going to meet the vector $y$. This is by basic triangle geometry, which is given by the expression: 

$$x - 2x\left(\frac{vv^H}{v^Hv}\right)$$

Which is essentially another project onto the vector $y$, which is also a reflector the hyperplane separating the vector $x$ and $y$, given as: 

$$
\left (I - 2\frac{vv^H}{v^Hv} \right)
$$

Illustration: 

![](HS_Reflector%201.jpeg)

Vector on the hyper plane gets reflected to zero, and vector orthognal to thehyper plan stays unchanged after the transformation, therefore this is a rank one unitary transformation. 

---
### **Properties and Facts**

* $P^2 = P$
* $P^H = P$
* $P = P^{-1}$


---
### **Comments**

Used a lot for QR, Hessenberg Form transform. 



