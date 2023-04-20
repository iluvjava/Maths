
[[Lagrangian and Dualization Techniques]], [[Dualization Examples]], [[../../AMATH 516 Numerical Optimizations/Duality/Convex Conjugate Computations Examples]]

--- 

### **Intro**

We are going to interpret the dual and primal problems under some concrete examples, which is suppose to serve as intuitions when reasoning around these things. 

### **Trivial Example**

This is a very interesting one, and it's gonna feel weird, but it does gives us some interpretations for the idea of dualization. 

$$
\begin{aligned}
    & \min_x \{g(x)\}
    \\
    =& \min_x \{\max_{z} \{x^Tz - g^\star (z)\}\}
    \\
    \underset{[0]}{\ge} &
    \max_z\min_x \{
            x^Tz - g^\star (z)
        \}
    \\
    =& 
    \max_z\left\lbrace
        \min_x \left\lbrace
            x^Tz
        \right\rbrace
        -
        g^\star(z)
    \right\rbrace
    \\
    \underset{[1]}{\implies}
    =& 
    \max_z\left\lbrace
        \min_x \left\lbrace
            x^Tz - \delta^\star_0(z)
        \right\rbrace
        -
        g^\star(z)
    \right\rbrace
    \\
    \underset{[2]}{\implies} =
    &
    \max_z\left\lbrace
        -\delta_0(z) - g^{\star}(z)
    \right\rbrace
    \\
    =&  g^{\star}(\mathbf{0 })
\end{aligned}
$$

\[0\]: Maxmin, Min Max Lemma. 

\[1\]: The convex conjugate of the equality indicator function, $\delta_0^\star(z) \equiv 0$.  

\[2\]: 
$$
 \min_x \left\lbrace
    x^Tz - \delta^\star_0(z)
\right\rbrace = 
-\max_x \{
        z^T(-x) - (-\delta^\star_0(z))
    \}
=
-\delta_0(z)
$$

**Recall the Interpretations of the Convex Conjugation function is a function:**

* Putting in the gradient and it gives me the negative $y$ intercept such that my the hyperplane parallel to my gradient touches the function. 

**In this case**

* I want to touch my function $g(x)$ using the flat hyper plane, and I want the $y$ intercept for it (essentially $-g^\star{\mathbf{0}}$). Which it will then be stopped by the gloabal minima. 

**Why does MinMax MaxMin Lemma produces the inequality?** 
