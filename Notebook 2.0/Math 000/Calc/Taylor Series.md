Super basic high school maths

---

#### **Proof of Taylor Theorem**

* The proof is an application of Rolle's Theorem

#### **Formula for Single Variable**

> $$T_n(f|x_0) + \sum_{k = n + 1}^\infty 
> \left(\frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)
> =\left(\sum_{k=0}^n \frac{f^{(k)}(x_0)}{k!}(x - x_0)^k \right)+ \mathcal{O}((x - x_0)^{n + 1})$$

**The Big O**

The order of error is bounded by the Big O. It's a constant multiple of the term inside big O, assuming the function is at least $C^n$ smooth. 

**Remainder**
> $$\frac{f^{(n + 1)}(x_0)}{(n + 1)!}(x - x_0)^{n + 1}$$

**Exact Expression (Integral Remainder):**

> $$
> \varphi(x) = \left(
>     \sum_{k = 0}^{n} \frac{f^{(k)}(a)(x - a)^k}{k!} 
> \right) + \int_{a}^{x} \frac{f^{(n + 1)}(t)(x - t)^n}{n!}dt
> $$

Which can be verifeid by considering $\varphi^{(n + 1)}(x)$. 

**Exact Expression (Intermediate Value Theorem)**

Anod the representation would be using the intermediate value theorem, by assuming that the function is $C^n$ smooth. So that, the $n$ the deriative is at least continuous. In that sense we have the following Taylor Series: 

> $$
> \exist \; t \in (x, c) : f(x) = \left(
>     \sum_{k = 0}^{n} \frac{f^{(k)}(c)(x - c)^k}{k!}
> \right) + 
> \frac{f^{(n + 1)}(t)(x -c)^{n + 1}}{(n + 1)!}
> $$

Verified by taking the $n$ th derivative on the expression so that the remaining terms give arise to the IVT theorem for $f^{(n)}(x)$. 


**Upper Bound Description**

> $$M =\left| \sup_{x \in [\min(x_0, x), \max(x_0, x)]} f^{(n + 1)}(x) \right|$$

And this will give us 
> $$|T_n(f| x_0) - f(x)| =  \left| 
> \frac{M}{(n + 1)!}(x - x_0)^{n + 1}
> \right| \quad \forall x \in [\min(x_0, x), \max(x, x_0)]$$


---

### **Complex Analysis And Taylor Series**

[[Laurent Series]] For more info, and it needs a lot more to deal with than in the real case. 



