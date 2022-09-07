prereq: [Spectral Method 3](Spectral%20Method%203.md)

Split Step, for stiff system. 

---
### **Stiff System**

$$
u_t - Lu = n(u)
$$

Where the stiffness is coming from the Linear Operator $L$, and then assume that the non-linear term is zero. 


Ok, applying Fourier Transform. 

> $$
> \widehat{u_t} - \alpha(k)\widehat{u} = \widehat{N}(u) 
> $$ 
> (1.0)

Where the function $N(u)$ can be time dependent. 

$$
\widehat{v} = \widehat{u}\exp(-\alpha(k)\Delta t) 
$$

This is a substitution we made. 

$$
\widehat{v} = \widehat{u}\exp(-\alpha(k)\Delta t)
$$
(1.1)

Taking the derivative and using the product rule and then use the (1.0). we will have: 

$$
\frac{d\widehat{v}}{dt} = \widehat{N}(u)\exp(-\alpha(k)\Delta t)
$$
(1.2)

**Initial Conditions**:  $\widehat{u_0} = \widehat{v_0}$

The, use initial condition and (1.1), we have: 

$$
\widehat{u} = \widehat{v}\exp(\alpha(k)\Delta t) \quad \text{update}
$$

Apply IFFT to $\widehat{u}$ to get $u$.

Evaluate the RHS of (1.2) so we have the derivative information for solver. 





