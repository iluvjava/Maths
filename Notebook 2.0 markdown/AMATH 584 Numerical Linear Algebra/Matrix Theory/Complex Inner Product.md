[Finite Euclidean Inner Product](../../AMATH%20516%20Numerical%20Optimizations/Background/Finite%20Euclidean%20Inner%20Product.md): Inner product defined under euclidean space. 
[Inner Product Axiomatically Defined](../../MATH%20601%20Functional%20Analysis/Functional%20Spaces/Inner%20Product%20Axiomatically%20Defined.md)

In this section, we introduce define the complex of a dot product of 2 vectors from the field: $\mathbb{C}^n$

---
### **Definition**

> Let $x, y\in\mathbb{C}^n$, then their inner product is denoted as $\langle x, y\rangle = \sum_{j = 1}^{n}\bar{x}_jy_j$

Immediately, this is not commutative: $\langle x, y\rangle \neq \langle y, x\rangle$

---
### **Conjugate Transpose (Adjoint)**
Before the discussion we might need to refresh a bit on the idea of complex conjugate. For this section we denote the complex conjugate of a complex number as $z^*$. 

The Adjoint, or Conjugate Transpose for matrices are defined as $\bar{A}^T$.

Let the $\bullet^H$ be the complex conjugate of applied to an unknown subject: $
\bullet$

* Complex Conjugate is not the same as transpose, consider: $x,y \in \mathbb{C}^n$, and then we consider the quantity of $x^H y$ and $y^H x$, and **they are not the same**, they are conjugate of each other. 
* To deal with this problem, we have to take closer inspection and know what we are doing. But the moral of the story is, the conjugate transpose operations is an extension of the conjugate for complex number, instead of an extension of the transpose on complex matrices and vectors. 


**Complex Conjugate of Vec Dot**

* Let $\bullet^H$  be the conjugate of a complex number when the operand is a scalar, and let it be a Conjugate transpose when the operands are matrices or vectors. 
$$(x^Hy)^* =(x^Hy)^H= y^Hx$$
This is key to grasp some of the properties of the complex conjugate and how it affect matrices. Good news is, the conjugate and the transpose part acts on their own domain, hence we can just directly show that: 

$$
(\bar{x}^Ty)^* = (x^T\bar{y}) = \bar{y}^Tx = y^Hx 
\tag{2}
$$ 


or consisely writeen as: 

$$(x^Hy)^*= y^Hx$$

Notice that, the Conjugate transpose doesn't behave exactly the same like a transpose, but they it combines with the transpose operator together, it will start behaving like a Conjugate operator but for the matrices and vectors. 
The most important thing is: "**IT DOESN'T COMMUTE**" 


* The $\bullet^H$ if we want the operator to makes sense, then we have to treat vectors as matrices, and scalar too so that things are **consistent**, and that means that following expression is not going to make sense. Suppose that, $\alpha \in \mathbb{C}$ and $v \in \mathbb{C}^n$, then the scalar vector should be: 

$$v\alpha$$ 

instead of 

$$\alpha v \leftarrow \text{This is wrong}$$ 

because the dimension mismatched. 

---

### **Dot Product for $\mathbb{C}^n$**

The dot product for $a, b\in \mathbb{C}^n$ as the conjugate transpose multiplications of the vectors. The definition is: 
> This is the new Inner Product for $\mathbb{C}^n$
> $$x^Hy = \sum_{i = 1}^m \bar{x}_iy_i$$

Which is completely different from the real vectors dot product because of the conjugate part. 

Modularity of complex number $||x||^2 = x^Hx$, and hence the following definition will be defined via complex number as well. 

$$\cos{\alpha} = \frac{x^Hy}{||x||_2||y||_2}$$

Yeah, if the conjugate part of the vector product is not present, then he modular of the vector basically breaks down. 

> **Unknow**: The expression above maybe not assure that, $\cos(\alpha)$ is going to be a real number, is there an absolute value on the numerator? 

> **Unknown**: if this is the new dot product for the complex matrices, should it be involved with the multiplications of the complex matrices...?? 
> I don't think so I will update it


---
### **Bilinearity**
* $(x_1 + x_2)^Hy = x_1^Hy + x_2^Hy$
* $x^H(y_1 + y_2) = x^Hy_1 + x^Hy_2$
* $(\alpha x)^H(\beta y) = \bar{\alpha}\beta x^Hy$; Note on the complex scalar, there is a bar on alpha. 

---
### **Orthogonality**

Same thing, if 2 vectors are orthogonal, then for $x, y \in \mathbb{C}^n$, then $x\perp y \implies x^Hy = 0$


---
### **Properties**

**Conjugation When Communiting**

> Let $x, y \in \mathbb{C}^n$, then $\langle x, y\rangle = \overline{\langle y, x\rangle}$. 

**Proof**

$$
\begin{aligned}
    \langle x, y\rangle &= \sum_{j = 1}^{n} \bar{x}_jy_j
    \\
    \langle y, x\rangle &= \sum_{ j = 1}^{n} x_j \bar{y}_j
    \\
    \implies 
    \langle x, y\rangle &= \overline{\langle y, x\rangle}
\end{aligned}
$$

**Conjugating when Moving Scalar Around**

> Consider $x\in \mathbb{C}^n$, $y\in \mathbb{C}^n$,$\alpha \in \mathbb{C}$ then $\langle x, \alpha y\rangle = \langle \bar{\alpha}x, y\rangle$

**Proof**: Skipped

**Only Binlinear on the First Parameter**

> let $\alpha \in \mathbb{C}, x, y\in \mathbb{C}^n$. Then it would mean that only the first parameter is linear: $\langle \alpha x, y\rangle = \alpha\langle x, y \rangle$. 

This is neccessary, suppose other wise that both parameters are Bi-linear, then consider: 

$$
\begin{aligned}
    \langle \alpha x, \alpha x\rangle &= 
    \alpha^2 \sum_{j = 1}^{n}|x_j|^2 \neq \mathbb{R}
\end{aligned}
$$

The product of a vector on itself ceased to be a real number. However, if we only allows bi-linearity on the firat parameter, then we can use the previous theorem to get: 

$$
\begin{aligned}
    \langle \alpha x,\alpha x \rangle &= \langle \alpha\bar{\alpha}x, x\rangle 
    \\
    &= 
    \bar{\alpha}\alpha \langle x, x\rangle
    \\
    &= 
    |\alpha|^2\langle x, x\rangle \in \mathbb{R}
\end{aligned}
$$

This definition of inner product induce a norm for the space of $\mathbb{C}^n$. We are lucky. 
