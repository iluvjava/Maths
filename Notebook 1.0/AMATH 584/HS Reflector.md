This is a brief demonstration on how the Householder Reflector is going to work for our purpose, using the idea of orthogonal projector. 

[[Projector]]

---

### Introduction

Given a vector $x$ in $\mathbb{C}^n$, and we want to transform the vector onto another vector say $s$ using the hyperplane seperating betweeen $s$, $v$ while at the same time producing the matrix for such a transformation. 

In general, we are looking for the matrix which performs a reflection transformation on vectors in $\mathbb{C}^n$ where, and the plane of reflection is the hyperplane seperating the vector $x$ and $y$ where these 2 vectors are not collinear and the vector $y$ is also **unitary** (complex modulus is 1)

Let vector $v = y - x$. Then, the hyperplane that is separating these 2 vector $x$, $y$ will be orthogonal to $v$.

Firstly, perform a projection of $v$ onto the orthogonal subspace hyperplane, which is the vector $v$; which is given by: 

$$x - x\left(\frac{vv^H}{v^Hv}\right)$$

However, if we go 2 times the distance on the direction of $v$, then the vector $v$ is going to meet the vector $y$. This is by basic triangle geometry, which is given by the expression: 

$$x - x2\left(\frac{vv^H}{v^Hv}\right)$$

Which is essentially another project onto the vector $y$, which is also a reflector the hyperplane separating the vector $x$ and $y$, which is: 

$$
\left (I - 2\frac{vv^H}{v^Hv} \right)
$$

And this is the orthogonal project. 

---
Ok, we claimed that the matrix will act as a reflector, then let's see all the vectors on the Hyperplane separating the $x$ and $y$ will be the eigen vector with eigen values of 1. 

