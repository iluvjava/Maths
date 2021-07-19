The steepest descend method for solving the matrix vector equation. 
Basic understanding about [[Hermitian Adjoint]] is needed for exploiting the structure of symmetric matrix using steepest Descend. 

---
### **Intro**

Our objective is to solve: 

> $$
> Ax = b
> $$

Where we **assume that the matrix $A$ is Symmetric Positive Definite**[^1] and sparse, and we treat it as a black box transformation applied to vectors.

Consider the function: 

$$
\begin{aligned}
f(x) &=\frac{1}{2}x^TAx - b^T x + c
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

> The problem we are solving has nothing to do with minimizing the 2 norm of $Ax - b$. It's only for the symmetric matrix $A$. It's minimzing the energy norm, if $A$ is symmetric positive definite. 
> $$ \arg \min_x \Vert x\Vert_A + x^Tb$$

> If the matrix is not positive definite, then it has null space, potentially ill-conditioned or not invertible. 

> If the matrix is not definite at all, then the object function $f(x)$ won't have a global minimal anymore. 

> If the matrix is negative definite, then just minimize $-A$ instead.

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
        \underbrace{1 - 
        \frac{\Vert r^{(k)}\Vert_2^4}
        {
            \Vert r^{(k)}\Vert_A^2
            \Vert e^{(k)}\Vert_A^2
        }}_{\omega^2}
    \right)
\end{aligned}
\tag{6}
$$

(1): By 3. from defined quantities in the intro section. 

That last expression in (6) is not easy to analyze let me tell you that! 

Therefore, for simplicity, let's just project the residual vector onto 2 eigenvectors of the matrix $A$.

$$
\begin{aligned}
    e^{(0)} & = \sum_{i = 1}^{2}\xi_i v_i = \xi_1 v_1 + \xi_2 v_2    
    \\
    r^{(0)} &= -(\xi_1 \lambda_1 v_1 + \xi_2 \lambda_2 v_2) 
    \\
    \implies 
    \Vert r^{(0)} \Vert_2^4 &= (\xi_1^2 \lambda_1^2 + \xi_2^2 \lambda_2^2)^2
    \\
    \implies 
    \Vert r^{(0)}\Vert_A^2 &=
    \xi_1^2 \lambda_1 ^3 + \xi_2^2 \lambda_2^3
    \\
    \implies
    \Vert e^{(0)}\Vert_A^2
    &=  
    \xi_1^2 \lambda_1 + \xi_2^2 \lambda_2 
\end{aligned}
\tag{7}
$$

Now we are ready to take a look at the value for $\omega^2$, which is going to give us an upper bound for the rate of convergence. 

Recall the fact that the condition number measured under 2-norm is the ratio between the max and the min eigenvalue of the matrix. 

$$
\begin{aligned}
    \omega^2 &=1 - \frac
    {
        (\xi_1^2 \lambda_1^2 + \xi_2^2 \lambda_2^2)^2
    }
    {
        (\xi_1^2\lambda_1 + \xi_2^2 \lambda_2)
        (\xi_1^2\lambda_1^3 + \xi_2^2\lambda_2^3)
    }
    \\
    &= 
    1 - 
    \frac{
        (\xi_1^4\lambda_2^4)^{-1}
    }
    {
        (\xi_1^4\lambda_2^4)^{-1}
    }
    \frac
    {
        (\xi_1^2 \lambda_1^2 + \xi_2^2 \lambda_2^2)^2
    }
    {
        (\xi_1^2\lambda_1 + \xi_2^2 \lambda_2)
        (\xi_1^2\lambda_1^3 + \xi_2^2\lambda_2^3)
    }
    \\
    &= 
    1 -
    \frac{
        (\lambda_1^2 \lambda_2^{-2} + \xi_2^2\xi_1^{-2})^2
    }{
        (\lambda_1\lambda_2^{-1} + \xi_2^2\xi_1^{-2})
        (\lambda_1^3\lambda_2^{-3} + \xi_2^2\xi_1^{-2})
    }
\end{aligned}\tag{8}
$$

And now, let's introduce the variable $\mu$ as the ratio of the projection onto the dominate eigenvectors, in which case we have: $\kappa = \lambda_1\lambda_2^{-1}$ and $\mu = \xi_2\xi_1^{-1}$. 

And then the above expression (8) can be rewritten as: 

$$
\omega^2 = 1 - \frac{(\kappa^2 + \mu^2 )^2}
{
    (\kappa + \mu^2)(\kappa^3 + \mu^2)
}
$$

Observe that, as long as these 2 quantities, $\mu, \kappa$ are not equal to each other, the faction will result in a value that is less than one, and larger than zero. 

To minimize the quantity $\omega^2$, consider $\mu^2 = \kappa^2$, Then after some simplification we have: 

$$
\begin{aligned}
    \omega^2 &= 1 - \frac{4\kappa}{
        \kappa^5 + 2\kappa^4+ \kappa^3
    }
    \\
    \omega^2 &\le\frac{\kappa - 1}{\kappa+1}
\end{aligned}
$$


And, observe the fact that as $\kappa \rightarrow \infty$, the quantity of $\omega^2$ is approaching 1, implying a very slow convergence rate for the iterations.

**Moral of the Story**

Steepest descend can be very slow for matrix with large condition number, this is especially true if the initial condition is making $\mu^2 = \xi^2$.


---
### **Why This?**

**Claim:**

> This is a prelude to conjugate gradient method.



[^1]: The fact that the matrix $A$ is definite remains unused through out the analysis in this file... 