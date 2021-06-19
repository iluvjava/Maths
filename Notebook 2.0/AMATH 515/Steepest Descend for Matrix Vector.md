The steepest descend method for solving the matrix vector equation. 
Basic understanding about [[Hermitian Adjoint]] is needed for exploiting the structure of symmetric matrix using steepest Descend. 

---
### **Intro**

Our objective is to solve: 

> $$
> Ax = b
> $$

Where we **assume that the matrix $A$ is Symmetric Positive Definite** and sparse, and we treat it as a black box transformation applied to vectors.

Consider the function: 

$$
\begin{aligned}
f(x)    & =\frac{1}{2}x^TAx - b^T x + c
\\
\nabla_x[f(x)] &= \frac{1}{2}(A^T + A)x - b
\\
\underset{(1)}{\implies}
\nabla_x[f(x)] &= Ax - b
\\
\text{Let: }\quad \nabla_x[f(x)] &= 0
\\
\implies 
    Ax & = b 
\end{aligned}
\tag{1}
$$

(1): Using that assumption that matrix $A$ is orthogonal. 

* Therefore, looking for the minima of the function $f(x)$ is equivalent to solving the matrix vector equation. Only true when the matrix is Symmetric

**Defined Quantities**:

0. $Ax_+ = b$
1. $e^{(i)} = x^{(i)} - x_+$
2. $r^{(i)} = b - Ax^{(i)}$
3. $r^{(i)} = -Ae^{(i)} = -A(x^{(i)} - x_+) = -Ax^{(i)} + b$
4. $r^{(i)} = -\nabla_x[f](x^{(i)})$

$e^{(i)}$ is the error on the input space and $r^{(i)}$ is the error on the output space. 

Residual is also the gradient at that particular step. 

**Observe**

> The residual is the gradient of the function. 

> If the matrix is not symmetric, then the gradient is not the residual at each teration. 

---
### **Steepest Descend Method Proof** 

$$
\begin{aligned}
    x^{(k + 1)} & = x^{(k)} + \alpha r^{(k)}
    \\
    f(x^{(k + 1)}) &= f(x^{(k)} + \alpha r^{(k)})
    \\
    \underset{(1)}{\implies}
    \partial_\alpha[f(x^{(k)} + \alpha r^{(k)})]&= 
    r^{(k)T}\nabla_x[f](x^{(k + 1)}) 
    \\
    \text{let}\quad r^{(k)T}\nabla_x[f](x^{(k + 1)})  &= 0
    \\
    \underset{(2)}{\implies}
    r^{(k)T}r^{(k + 1)} &= 0
\end{aligned}
\tag{2}
$$

(1): Basic Calculus 

(2): by 4. and a sign change. 

To solve for alpha, we need to consider: 

$$
\begin{aligned}
    r^{(k)T}r^{(k + 1)} &= 0
    \\
    r^{(k)T}(b - Ax^{(k + 1)}) &= 0
    \\
    r^{(k)T}(b - A(x^{k} + \alpha r^{(k)})) &= 0
    \\
    r^{(k)T}b - r^{(k)T}Ax^{(k)} - \alpha r^{(k)T}Ar^{(k)}&= 0
    \\
    r^{(k)T}(b - Ax^{(k)}) &= \alpha r^{(k)T}Ar^{(k)}
    \\
    r^{(k)T}r^{(k)} &= \alpha r^{(k)T}Ar^{(k)}
    \\
    \alpha = \frac{||r^{(k)}||_2^2}{r^{(k)T}Ar^{(k)}}
\end{aligned}
\tag{3}
$$

Alpha is the step size for the steepest descend method. We have expressed the direction of $\alpha$ in terms of quantities from the previous step. 

**Graphical Interpretation**

The fact that $r^{(k + 1)}\perp r^{(k)}$ means that we always turns a right angle while we travels in the gradient field of the function $f(x)$. This is true by the definition of the residual vector $r$. 

**Algorithm Description**

$$
\begin{aligned}
    & r^{(k)} = b - Ax^{(k)}
    \\
    & \alpha = \frac{||r^{(k)}||_2^2}{r^{(k)T}Ar^{(k)}}
    \\
    & x^{(k + 1)} = x^{(k)} + \alpha r^{(k)}
\end{aligned}
$$

---
### **Convergence Analysis**

For more details of analysis, consult [Conjugate without pain](https://sites.math.washington.edu/~morrow/498_13/conjgrad.pdf) for more details. 

But a summary will be given here regardless. 

**Claim:**

> Although the steepest descend method takes the best step at each iteration, it's not incorperating the previous iterations to figure out the best descend direction.


Consider expressing the error terms using the orthogonal eigenvectors for the symmetric positive definite matrix. 

**Quantities**:

1. $v_i$ are the eigen vectors for the Symmetric matrix $A$, and they are all normalized, meaning that $\Vert v_i\Vert_2 = 1$
2. $\xi_i$ are the list of scalars needed to reconstruct the error vector using the orthogonal eigenvectors. 

$$
\begin{aligned}
    e^{(k)} &= \sum_{i = 1}^{n} \xi_i v_i
    \\
    \implies 
    r^{(k)} &= -Ae^{(k)} 
    \\
    r^{(k)} &= -\sum_{i = 1}^{n} \xi_i\lambda_i v_i
    \\
    \implies 
    \Vert r^{(k)}\Vert_2^2 &= \sum_{i= 1}^{n}\xi^2\lambda_i^2
    \\
    \implies 
    \Vert e^{(k)}\Vert_2^2 &= \sum_{i = 1}^{n}\xi_i^2   
\end{aligned}
\tag{4}
$$

Let's introduce the Engergy norm for a symmetric matrix: 
$$
\Vert x\Vert_A^2 = x^TAx
$$

Then we have the expression: 

$$
\begin{aligned}
    \Vert e^{(k)}\Vert_A^2 &= \sum_{i = 1}^{n} \xi_i^2\lambda_i
    \\
    \Vert r^{(k)}\Vert_A^2 &= 
    \left(
        -\sum_{i = 1}^{n} \xi_i\lambda_i
    \right)\left(
        \sum_{i = 1}^{n}
            \xi_i\lambda_i^2
    \right)
    \\
    &= 
    \sum_{i = 1}^{n}\xi_i^2 \lambda_i^3
\end{aligned}
\tag{5}
$$

To find $\Vert e^{(k + 1)}\Vert_A^2$, recall $\alpha = \frac{||r^{(k)}||_2^2}{r^{(k)T}Ar^{(k)}}=\Vert r^{(k)}\Vert_2^2/\Vert r^{(k)}\Vert_A^2$, which means that: 

$$
\begin{aligned}
    \Vert e^{(k + 1)}\Vert_A^2 &= 
    (x^{(k + 1)} - x_+)^TA(x^{(k + 1)} - x_+)
    \\
    \Vert e^{(k + 1)}\Vert_A^2 &= 
    (x^{(k)} + \alpha r^{(k)} - x_+)^TA(x^{(k)} + \alpha r^{(k)} - x_+)
    \\
    &= (e^{(k)} + \alpha r^{(k)})^TA(e^{(k)} + \alpha r^{(k)})
    \\
    &= 
    \Vert e^{(k)}\Vert_A^2 + \alpha^2 \Vert r^{(k)}\Vert_A^2 + 2\alpha r^{(k)}Ae^{(k)}
    \\
    \underset{(1)}{\implies}
    &= 
    \Vert e^{(k)}\Vert_A^2 + \alpha^2 \Vert r^{(k)}\Vert_A^2 -2\alpha r^{(k)T}r^{(k)}
    \\
    &=\Vert e^{(k)}\Vert_A^2
    + 
    \left(
        \frac{\Vert r^{(k)}\Vert_2^2}
        {\Vert r^{(k)}\Vert_A^2}
    \right)^2 \Vert r^{(k)}\Vert_A^2
    -
    2 \left(
        \frac{\Vert r^{(k)}\Vert_2^2}
        {\Vert r^{(k)}\Vert_A^2}
    \right)\Vert r^{(k)}\Vert_2^2
    \\
    &= 
    \Vert e^{(k)}\Vert_A^2 
    -
    \frac{
        \Vert r^{(k)}\Vert_2^4
    }{
        \Vert r^{(k)}\Vert_A^2
    }
    \\
    &= \Vert e^{(k)}\Vert_A^2 \left(
        1 - 
        \frac{\Vert r^{(k)}\Vert_2^4}
        {
            \Vert r^{(k)}\Vert_A^2
            \Vert e^{(k)}\Vert_A^2
        }
    \right)
\end{aligned}
\tag{6}
$$

(1): By 3. from defined quantities in the intro section. 

That last expression in (6) is not easy to analyze let me tell you that! 

---
### **Why This?**

**Claim:**

> This is a prelude to conjugate gradient method. 

