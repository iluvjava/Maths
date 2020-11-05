How to reduct higher order of ODEs into a simple, first order system of ODEs for solving with given numerical schemes discussed for IVP problems 

Prereq: [[IVP]]

---

### Canonical Form of Higher Order ODEs


Consider a given system of equtions involving differential from zero up to n, expressed in the following form: 

> $$y^{(n)} = f\left(y^{(n - 1)}, y^{(n - 2)}... y'', y', y, t\right)$$ 

and then we will be using the substitution: 
$$w_1 = y \rightarrow w_1' = y'$$

$$w_2 = y' \rightarrow w_2' = y''$$

$$w_3 = y''\rightarrow w_3' = y^{(3)}$$

$$\vdots$$

$$w_n = y^{(n - 1)} \rightarrow w_n' = y^{(n)}$$


And the we can express the high order equations in terms of the new variable $w_{i}$ where $1 \leq i \leq n$, and then this will give us a new sytem of equations, expressed as $\vec{w}' = f(t, \vec{w})$

