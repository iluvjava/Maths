[Lagrange Interpolations](Lagrange%20Interpolations.md)

---
### **Intro**

The Neville's method compute the Lagrange interpolating polynomials recursively. It allows for the advantage of estimating the error while constructing the polynomials while using a subset of the data point. 

#### **The Neville's method**

Let $\{x_i\}_{i = 0}^n$ denotes all the distinct point we want to sample for the function $f$. Choose 2 indices $i < j$ such that $0 \le i < j \le n$, denote $P_f(x | \{x_k\}_{k=1}^{n})$ denotes the interpolating polynomial for the function $f$, given the set of distinct points, the, we have the following recursive relation: 

$$
\begin{aligned}
    P(x) = P_f(x | \{x_k\}_{k =1}^n) = 
    \frac{
        (x - x_j)P_f(x | \{x_k\}_{k = 0}^n\setminus \{j\})
        - (x - x_i)
        P_f(x | \{x_k\}_{k = 0}^n\setminus \{i\})
    }{x_i - x_j}.
\end{aligned}
$$

Directly observe that $P(x)=f(x)$ for $x = x_i, x_j$, and for all the other points we also have $P(x) = f(x)$. Since this function is a linear combinations of a polynomial of degree $n - 1$, $P(x)$ is an interpolating polynomial at $n + 1$ points, and has degree $n$. You may also use the Lagrange polynomials to verify this, but that is just too complicated since any $n + 1$ data point will determine a unique polynomial of degree $n$ that fits the data. 

**Base Case Illustrations**

The base case would be a 3 points, $x_0, x_1, x_2$ interpolations, given as: 

$$
\begin{aligned}
    P(x| x_0, x_1) &= f(x_0)\frac{x_1 - x}{x_1 - x_0} + f(x_1)\frac{x_0 - x}{x_0 - x_1}
    \\
    P(x | x_1, x_2) &= f(x_1)\frac{x_2 - x}{x_2 - x_1} + f(x_2)\frac{x_1 - x}{x_1 - x_2}
    \\
    P(x | x_0, \cdots, x_3)  &= 
    \frac{(x_2 - x)P(x | x_0, x_1) - (x_0 - x)P(x | x_1, x_2)}{(x_0 - x_2)}, 
\end{aligned}
$$

I don't know what much to say about this. 


**Reference**: 

It's from the Cengange Numerics textbook. 