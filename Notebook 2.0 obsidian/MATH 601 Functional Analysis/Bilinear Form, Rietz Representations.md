- [Hilbert Space Introduction](Functional%20Spaces/Hilbert%20Space%20Introduction.md)
- [Linear Mapping in Hilbert Space](Linear%20Mapping%20in%20Hilbert%20Space.md)
- [Linear Functionals and Dual Spaces](Linear%20Functionals%20and%20Dual%20Spaces.md)

---
### **Intro**

We introduce more quirks for linear operators in the Hilbert spaces, with inner product for extra flavors. 


#### **Thm | Rietz Representation Theorem**
> Let $\mathcal H$ be a Hilbert space, then every bounded linear functional $f$ on $\mathcal H$ can be represented by an inner product. that is, for all $f \in \mathcal H^\star$, there exists $z \in \mathcal H$ such that: 
> 1. For all $x \in \mathcal H$, $f(x)  = \langle z, x\rangle$
> 2. $z$ is unique for each functional $f$ in $\mathcal H^\star$. 
> 3. $\Vert f \Vert = \Vert z\Vert$. 

**Proof**

The case $f$ is the zero functional is a trivial case because $\mathbf 0$ does the job. Assuming $f$ is not the zero functional. $\text{null}(f)$ is a closed set by the property of linear operators in Banach space. Then: $\mathcal H = \text{null}(f)\oplus \text{null}(f)^\perp$ with $\text{null}(f)^\perp \neq \{\mathbf 0 \}$ by $f$ being the non zero functional, then consider the existence of $z_0$ where: 

$$
\begin{aligned}
    & z_0 \in \text{null}(f)^\perp\setminus \{\mathbf 0\}
    \\
    & \forall x \in \mathcal H: 
    \\
    & \quad 
    \begin{aligned}
        f(f(x)z_0 - f(z_0)x) &= f(x)f(z_0) + f(z)f(z_0) = 0
        \\
        \iff
        f(x)z_0 - f(z_0)x &\in \text{null}(f)
        \\
        \iff 
        
        \langle f(x)z_0 - f(z_0)x, z_0 \rangle &= 0
        \\
        \iff 
        f(x) \Vert z_0\Vert^2 - f(z_0)\langle x, z_0\rangle &= 0
        \\
        \iff 
        f(x) &= \frac{f(z_0)\langle x, z_0\rangle}{\Vert z_0\Vert^2}. 
    \end{aligned}
\end{aligned}
$$

Therefore, (1) has representation $z = z_0f(z_0)/\Vert z_0\Vert^2$. Next we show that such a $z$ is indeed unique. Let $z_1, z_2 \in \mathcal H$ both satisfies the condition, then: 

$$
\begin{aligned}
    f(x) &= \langle z_1, x\rangle = \langle z_2, x\rangle 
    \implies 
    \langle z_1 - z_2, x\rangle = 0
    \\
    &\implies
    (x = (z_1 - z_2) \implies \langle z_1 - z_2, z_1 - z_2\rangle = 0 \implies z_1 = z_2). 
\end{aligned}
$$

Fincally, using Cauchy Swartz inequality we have: $|f(x)|\le \Vert z\Vert\Vert x\Vert$, but we also have: $|f(z)| = \Vert z\Vert \le \Vert f\Vert$, hence it has to be that $\Vert f\Vert = \Vert z\Vert$. Therefore. 

**Remarks**

Unbounded linear functional would still have the representation of inner product form, it's just that their norm would be infinity. As a consequence of the representation theorem, we have the self-dual theorem: 
$$
\mathcal H^\star =  \mathcal H
$$
for any Hilbert space $\mathcal H$. 


#### **Def-1 | Bilinear Form**
> $h(x, y): \mathcal H_1 \times \mathcal H_2\mapsto \mathbb R$ is a bilinear mapping from the cross product of 2 Hilbert space to the field of reals if, it's linear on both of its parameters. And we define the norm of a bilinear form to be: 
> $$
> \begin{aligned}
>     \Vert h(x, y) \Vert = 
>     \sup_{\substack{x \in \mathcal H_1\setminus \{\mathbf 0\} \\ y \in \mathcal H_2\setminus \{\mathbf 0\}}}    
>     \left\lbrace
>         \frac{|h(x, y)|}{\Vert x\Vert \Vert y\Vert}
>     \right\rbrace. 
> \end{aligned}
> $$


---
### **Representation of Bilinear Form in Hilbert space**

Similar to linear functionals in Hilbert space that has an inner product representation, it's the same for bilinear functionals constructed between 2 Hilbert spaces. 


#### **Thm | Bounded Bilinear form with Linear Operator**
> Let $h$ be a mapping between $\mathcal H_1 \times \mathcal H_2$ to the field of reals, then there exists a unique linear operator $S \in \mathcal B(\mathcal H_1, \mathcal H_2)$ such that: 
> 1. $h(x, y) = \langle S x, y\rangle$ for all $x\in \mathcal H_1, y \in \mathcal H_2$. 
> 2. $\Vert h\Vert = \Vert S\Vert$. 

**Proof**: 

We ignore one parameter and represent bilinear form as a linear functional, invoking the Rietz Representation theorem we deduce that there exist a linear mapping from $\mathcal H_2$ to $H_1$ (or the other direction). And then we show from definition of the norm on bilinear form that the norm would be the same as the norm on the linear operator $S$.