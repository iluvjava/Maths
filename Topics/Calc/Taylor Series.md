Super basic high school maths

---

#### Proof of Taylor Theorem 

* The proof is an application of Rolle's Theorem

#### Formula for Single Variable

> $$T_n(f|x_0) + \sum_{k = n + 1}^\infty 
> \left(\frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)
> =\left(\sum_{k=0}^n \frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)+ \mathcal{O}((x - x_0)^{n + 1})$$

The Big O notation is denoting the error term for the expansion, given by the Lagrange Remainder

Lagrange Remainder
> $$\frac{f^{(n + 1)}(x_0)}{(n + 1)!}(x - x_0)^{n + 1}$$

Notice, this will give an upper bound for the error involved in the Taylor expansion by consider the quantity: 

$$M =\left| \sup_{x \in [\min(x_0, x), \max(x_0, x)]} f^{(n + 1)}(x) \right|$$

And this will give us 
> $$|T_n(f| x_0) - f(x)| =  \left| 
> \frac{M}{(n + 1)!}(x - x_0)^{n + 1}
> \right| \quad \forall x \in [\min(x_0, x), \max(x, x_0)]$$


---

### Complex Analysis And Taylor Series

[[Laurent Series]] For more info, and it needs a lot more to deal with than in the real case. 



