[[Closed Convex Set]]
We will need to understand the basic idea behind the closed convex set to understand that is going on with the idea of duality. 

Content: 
1. Affine Minorants of a function
2. Convex conjugate and some examples
3. Double conjugacy and minmax lemma

---
### **Intro**

Duality: 
* Weak duality: Also there. 
* Strong Duality: Only for convex function convex constraints. 

At the heart of duality there are 2 things: 

1. Expressing the constraints as delta function in the objective function using augmented real realm. 
2. Lagrangian
3. Fenchel Transform


---
### **Exercise 4.26**

Exercise is in the course reader. 

**Statement**: 
> A closed convex set is the supremum of all it's **affine minorants**.

**Affine Minorants**: 
It's an affine function that is less than or equal to the function $f(x)$. 

**Observe**: 
The affine minorants of the function $f$ are all the half spaces that contains the epigraph of $f$. Epigraph is a closed and bounded set. 

**Mathematically**:

$$
f(x) = \sup_{g_i} \{f(x) \ge g_i(x) \; \forall x: g_i(x) \text{ is affine }\} 
$$

**Observe**
This is related to the differential characterization of convex function, assuming that the function is $C1$ smooth: 

$$
f(y) = \sup_x\{f(x) + \nabla f(x)^T(y - x)\}
$$

---
### **Convex Conjugate**

The convex conjugate of a convex function $f(x)$ is defined by: 

$$
f^*(z) = \sup_x\{\langle x, z\rangle - f(x)\}
$$

**Interpretations**:

If I have a vector $z$, I am gonna change the orientation of the vector using $x$, and I am taking the difference between the vector and the function $f(x)$, ok, after doing this, how much above the $f(x)$ I can make it to be? That is $f^*(z)$. 

If I fixed vector $z$, I am gonna define a half space $z^Tx$, taking the difference between this and $f(x)$, how much above $f(x)$ I can get by tweaking $x$? That value is $f^*(z)$. 

---
### **Epigraph of $f(x)$ and affine Minorants of $f^*(x)$**. 

Choose any point from the epigraph of the function $f$ for level $\alpha$: 

$$
(x, \alpha) \in \underset{\alpha}{\text{epi}}(f)
$$

Then, consider affine function defined via this point $x$ in the epigraph: 
$$
l_x(z) = x^Tz - \alpha
$$

Then: 

$$
f^*(z) = \sup_{(x, \alpha)\in \underset{\alpha}{\text{epi}}(f)} l_x(z) = \sup_{x} (x^Tz - f(x))
$$

This is true because the $\alpha \ge f(x)$

And when the point we choose on is on the function $f$, then we are trying to the affine linear function to be as high as possible. 

---

### **Example 1**

Let $f(x) : = |x|$, then: 

$$
f^*(x) := \sup_{x} \{x^Tz - f(x)\} = \begin{cases}
    +\infty & |x| > 1 \\ 0 & \text{else}
\end{cases}
$$

And this will be the conjugate of the convex function $|x|$. 

**Intuitively**: 

Well, of course, if I choose any function line with a slope $z$, and if the slope is above $1$, then it can surpasses $|x|$ as much as we want. If not, then there is no way we can get close to it, and the distance between them will actually get larger and larger, so then it has to be set to $0$, and that is why the conjugate function is the infinity norm indicator function. 

**Update**: 


Suppose I have all the affine minorants of the convex function. Then $f^*(z)$ denotes the vertical distance I move my $z^x$ hyperplane so that it matches (Exactly) one of the affine minorants of the function $f(x)$. If I can't find it, then $f(x)$ is gonna be $\infty$

---
### **Example 2**

Let $f(x) = \frac{1}{2}\Vert x\Vert^2$

$$
f^*(z) = \sup_x\{x^Tz - \frac{1}{2}\Vert x\Vert^2\}
$$

And, because it's smooth, we can just take the derivative, and then solve for the optimal for each $z$, and the this is just : 

$$
f^*(z) = \frac{1}{2}\Vert z\Vert^2
$$

---
### **Example 3**

This is going to be a bit tricky: 

let: 

$$
f(x) = v^Tx + a
$$

Then the conjugate is defined by: 

$$
f^*(z) = \sup_x \{x^Tz - v^Tx - a\} = \sup_x \{x^T(z - v) - a\}
$$

When, $z - v$, this term can't go higher than $-a$ because it's always $-a$. else, it can go as high as it wants. 

Then: 
$$
f^*(z) = \begin{cases}
    -a & z = v \\ +\infty & z \neq v
\end{cases}
$$

---

### **Double Conjugacy and MinMax Lemma**

What is the relationship between the conjugate function and the original function. 

> $$
> f^{**}(x) \le f(x)
> $$



#### The sup, inf; inf sup Lemma :

Consider any function $F(x,y)$, then: 

> $$
> \sup_y\inf_x F(x, y) \le \inf_x\sup_y F(x,y)
> $$

Right, when we nest the operations, the first thing we try to do will overshadow the next thing we are trying to do. 

Starting on the inner term of LHS, we have: 

$$
\forall x: F(x, y) \ge \inf_x F(x, y)
$$

By the definition of $\inf_x$, notice that, we leave $y$ here as fixed value, but it's actually true for all $y$ too, so then we have: 

$$
\forall x, y: F(x, y) \ge \inf_x F(x, y)
$$

Well then certainly this is true for the $y$ the gives the supremum which means that: 

$$
\forall x: \sup_y F(x, y) \ge \sup_y \inf_x F(x, y)
$$

Where I just fixed the special $y$ that gives the sup of the inf. 

And then, I can apply the idea to the LHS,and choose the $x$ that gives inf. 

$$
\inf_x\sup_y F(x,y) \ge \sup_y \inf_x F(x, y)
$$

#### Proof of the theorem

And It's not hard to prove the theorem at this point now, applying the definition of the conjugacy, we should have:

$$
f^{**}(z) = \sup_z \left\lbrace 
    z^Tx - f^*(x)
\right\rbrace
=
\sup_x \left\lbrace 
    z^Tx - \sup_{y} \left\lbrace
        z^Ty - f(y)
    \right\rbrace
\right\rbrace 
$$

$$
\sup_x \left\lbrace 
    z^Tx + \inf_{y} \left\lbrace
        f(y) - z^Ty
    \right\rbrace
\right\rbrace 
$$

$x,y$ is not interacting, then we can say that: 
$$
\sup_x \left\lbrace 
    \inf_{y} \left\lbrace
        z^Tx + f(y) - z^Ty
    \right\rbrace
\right\rbrace
$$
So collecting like terms and then apply the lemma: 

$$
\sup_x \left\lbrace 
    \inf_{y} \left\lbrace
       z^T(x - y) + f(y)
    \right\rbrace
\right\rbrace
\le \inf_y
    \left\lbrace
        \sup_z \left\lbrace 
            z^T(x - y) + f(y)
        \right\rbrace
    \right\rbrace
$$

Notice that the inner sup part is just taking the sup of the affine linear function, define: 

$$
\delta_0 (x) := \begin{cases}
    \infty & x = 0
    \\
    0 & x \neq 0
\end{cases}
$$

And then we can have: 

$$
\sup_x 
\left(
    z^T(x - y) + f(y)
\right) = \delta_0(y -x) + f(y)
$$

And 
$$
\inf_y \left(
    \delta_0(y -x) + f(y)
\right) = f(x)
$$

The indicator function just forces $y$ to be $x$, and then we have: 

$$
f^{**}(x) \le f(x)
$$

### Strong Conjugacy

And, the equality is true whe $f(x)$ is closed, proper, and convex. 

**Claim 1: Cojugate Order Reversal**

> $$ f\le g \implies f^* \ge g^* $$

**Claim 2:**

> When f is closed and convex, $f$ is the sup of all of its affine minorants. This is true by thinking of the closed and convex sets. 

**Claim 3: Conjugate of Affine Linear Function**
> The double conjugate of affine linear function is the function itself. 

Then: 

Let $g$ be any affine minorants of the function $f$ ($f \ge g$), then $f^* \le g^*$ and $f^{**} \ge g^{**}$

However, $g$ is affine linear, then we can say that: 

$$g^{**} = g \implies f^{**} \ge g $$

but $g \le f^{**} \le f$

By definition that $f$ is closed, proper, and convex, we will have $g$ equals to $f$, and hence $f^{**} = f$
