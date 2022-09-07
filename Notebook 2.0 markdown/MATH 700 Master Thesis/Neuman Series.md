[Useful Matrix Identities](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Useful%20Matrix%20Identities.md)

---
### **Intro**

Neuman Series is: 

$$
(\text{Id} - T)^{-1} = \sum_{k = 0}^{\infty}T^k
$$

If we assume that the series converge at all. 

In the case of linear operator, we can derive the series from the formula proved in the prereqsite of this page. 

> $$
> (I + P)^{-1} = I- P（I+ P)^{-1} = I - (I + P)^{-1}P \tag{1}
> $$

Unroll the recurrence and we get the Neuman Series. 
