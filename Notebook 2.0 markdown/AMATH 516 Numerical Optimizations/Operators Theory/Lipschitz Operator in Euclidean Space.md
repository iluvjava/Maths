[Introduction to Operators for Optimizations](Introduction%20to%20Operators%20for%20Optimizations.md)

---
### **Lipschitz Operator**

> And operator is called *Lipschitz* with a constant $L$ when for any $(u, v)\in \text{gph}(F), u \in F(x), v \in F(y)$ we have the inequality: 
> $$
> \begin{aligned}
>     \Vert u - v\Vert_2 \le L \Vert x - y\Vert_2,
> \end{aligned}
> $$

For simplicity we use the 2 norm to formulate the definition. And please observe that, for any operator to be Lipschitz, it has to be the case that the operator is single valued. If this is not true, the LHS of the function can simply chosen to be $u\in F(x), v\in F(x)$ with $u\neq v$, giving us a contradiction. An operator is called *non-expansive* if its Lipschitz constant is $\le 1$. An operator is called a *contraction* if $L< 1$. 

**properties**

1. The set of Lipschitz operators are closed under addition and composition. 
