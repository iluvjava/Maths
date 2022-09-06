This is a comparison between [[Conjugate Gradient for Dummy]] and the method of momentum. 

---
### **Intro**

The conjugate gradient method is secretively a momentum method. 

A momentum method make use of previous descend direction to speed up the descend on the objective function. 

Classical momentum can be characterized as: 

$$
\begin{aligned}
    v^{(k + 1)} &= \alpha v^{(k)} - \beta\nabla[f](x^{(k)})
    \\
    x^{(k + 1)} &= x^{(k)} + v^{(k + 1)}
\end{aligned}
$$
Where the term $v^{(k + 1)}$ regarded as the momentum, $\alpha_k$ is the amount of momentum, and $\beta_k$ is the learning rate. 

The following can be deduced: 

$$
v^{(n)} = \alpha^{n - 1}v^{(0)} - \beta \sum^{n - 2}_{i = 0}
    \alpha^{(n - 1- i)}\nabla[f](x^{i})
$$

With the assumption that $\alpha, \beta$ is a constant, then the sequence is looking like a geometric sequence. 

There is a terminal velocity for the momentum if the gradient is unchanging. 

**Intution**

The speed at each time step is dragged by the gradient. This is like the physics, but in physics is $-v^2$ (which can reach terminal velocity even with accelerations!), but in here it's discretized and it's $v$, so it's faster. 


---
### **In Relation to Conjugate Gradient Method**

For one update of the guess, the conjugate graidnet employ the following: 

$$
x^{(k +1)} = x^{(k)} + \alpha_k r^{(k)} + \beta_k (x^{(k)} - x^{(k -1)})
$$

* $r^{(k)} = -\nabla[f](x^{(k)})$ which is basically the gradient at that point. 
* $x^{(k)} - x^{(k - 1)} = v^{(k)}$ which is basically the momentum term, and it's the same descend direction $d^{(k)}$ as discussed in Conjugate Gradient. 
* Take note that the $\beta_k$ here, is actually the $\beta_{k + 1}$ in the conjugate gradient notes. The coefficients from the residual conjugations process. 

$$
\begin{aligned}
    x^{(k +1)} &= x^{(k)} + \alpha_k r^{(k)} + \beta_k (x^{(k)} - x^{(k -1)})
    \\
    v^{(k + 1)} &= \alpha_k r^{(k)} + \beta_k (x^{(k)} - x^{(k - 1)})
    \\
    \implies & \begin{cases}
        v^{(k + 1)} &= \alpha_k r^{(k)} + \beta_k v^{(k)}
        \\
        x^{(k + 1)} &= x^{(k)} + v^{(k + 1)}
    \end{cases}
\end{aligned}
$$

Observe that this is a accelerated gradient scheme with: 

* Gradient learning rate: $\alpha_k = \Vert r^{(k)}\Vert_2^2/ \Vert v\Vert_A^2$. 
* And the momentum is: $\beta_k = \Vert r^{(k + 1)}\Vert_2^2/\Vert r^{(k)}\Vert_2^2$. **Observe**: This is different form the classical momentum formulation in the Intro part. In that part $\beta_k = \beta$, a constant that is not changing. 