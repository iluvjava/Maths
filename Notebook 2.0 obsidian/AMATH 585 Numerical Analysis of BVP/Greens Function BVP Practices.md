Prereq: [[Greens Function]]

---
### **Intro**

We are particularlly interested in solving BVP problems for steady state solution using Greens Function. Examples are from the Homework and Lectures. 

--- 
### **Neuman Boundary**

This is investigated for the HW. 

---
### **Infinite Boundary**

This is a review for the class for the midterm. Suppose we want to find the Greens Function satisfying the following BVP problem: 

$$
\begin{aligned}
\begin{cases}
    \partial_x^2G(x|\bar{x}) - G(x|\bar{x})= \delta(x - \bar{x})
    \\
    \lim_{x\rightarrow \pm \infty} G(x|\bar{x}) = 0
\end{cases}
\end{aligned}\tag{1}
$$

This is linear and we assume that the Green's Function is piece-wise continuous. Then it would make sense to have delta function after the second derivative to due to discontuity of the first deriative for piece-wise linear function. Intuitively we wish the Greens Function for this BVP to be: 

* Contiuous on the whole domain of $\mathbb{R}$
* The drivative of $G$ around $\bar{x}$ should have unitary jump due to $\delta(x - \bar{x})$ on the RHS. 
* Satisfies the boundary condition of the problem. 

Let's consider the Homogeneous problem by splitting (1) into 2 domain, $(-\infty, \bar{x})\cup (\bar{x}, +\infty)$. 

Solving $\partial_x^2G(x|\bar{x}) - G(x|\bar{x}) = 0$ on both domain implies that the piecewise continuous part of the function takes the form with non-determined coefficients: 

$$
G(x|\bar{x}) = 
\begin{cases}
    c_1\exp(x) + c_2\exp(-x) & x < \bar{x}
    \\
    d_1\exp(x) + d_2\exp(-x) & x > \bar{x}
\end{cases}\tag{2}
$$

To satify the boundary conditions, it has to be that $c_2 = 0\wedge d_1 = 0$, therefore the Greens Funtion has been updated too: 


$$
G(x|\bar{x}) = 
\begin{cases}
    c_2\exp(-x) & x < \bar{x}
    \\
    d_2\exp(-x) & x > \bar{x}
\end{cases}\tag{3}
$$

To satisfy the continuity constrain for the problem, we must have: 

$$
\begin{aligned}
    c_1 \exp(\bar{x}) &= d_2 \exp(-\bar{x}) \implies 
    c_1 = d_2\exp(-2\bar{x})
    \\
    \implies 
    G(x|\bar{x}) &= 
    \begin{cases}
        d_2\exp(x - 2\bar{x}) & x < \bar{x}
        \\
        -d_2 \exp(-x) & x > \bar{x}
    \end{cases}
\end{aligned}\tag{4}
$$

Finally, to determine $d_2$, we use the fact that the derivetive of the function has a unitary jump over the point $x = \bar{x}$. 

$$
\begin{aligned}
    \int_{\bar{x} - \epsilon}^{\bar{x} + \epsilon} 
        G''(x|\bar{x}) 
    dx - \underbrace{\int_{\bar{x} - \epsilon}^{\bar{x} + \epsilon} 
        G(x|\bar{x})
    dx}_{= 0 \text{ as: }\epsilon \searrow 0} &= 1
    \\
    \lim_{\epsilon \searrow 0} G'(x+ \epsilon| \bar{x}) - G'(x - \epsilon| \bar{x}) &= 1
\end{aligned}\tag{5}
$$

Taking the limit non-rigorously, we can assert the conditions that: 

$$
\begin{aligned}
    -d_2 \exp(-\bar{x}) - d_2 \exp(\bar{x} - 2\bar{x}) &= 1
    \\
    -d_2\exp(-\bar{x}) - d_2\exp(-\bar{x}) &= 1
    \\
    -2d_2\exp(-\bar{x}) &= 1
    \\
    d_2 &= \frac{-\exp(\bar{x})}{2}
\end{aligned}\tag{6}
$$

Finally, our expression for the Greens Function is updated to: 

$$
\begin{aligned}
    G(x|\bar{x}) &= 
    \begin{cases}
        \frac{-1}{2}\exp(x - \bar{x}) & x \le \bar{x}
        \\
        \frac{-1}{2}\exp(\bar{x} - x) & x > \bar{x}
    \end{cases}
\end{aligned}\tag{7}
$$

Which is the Greens Function we wish to find for this BVP. 
