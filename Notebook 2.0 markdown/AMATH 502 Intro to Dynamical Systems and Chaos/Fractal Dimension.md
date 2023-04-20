[Fractal](Fractal.md)

---
### **Fractal Dimension**

Example: We are going to look at the Koch Curve. 

![Koch Curve and Coastlines – Fractal Foundation](https://fractalfoundation.org/wp-content/uploads/2010/05/kochprog440.jpg)

This is how the Koch Curve Fractal looks like. The length of the fractals: 

$$
l_1 = 1 \quad l_2 = \frac{4}{3} \quad l_2 = \left(
    \frac{4}{3}
\right)^2. 
$$

The length is going to infinity. 

---
### **The Similarity Dimension**

This concept only works for self similar sets. Suppose that, a self-similar set consists of $m$ copies of itself scaled down by a factor of $R$. How many copies of itself it has when we scale it down (zoom in)? The more there are, the higher the dimension, the less there are, the smaller the dimension. We define: 

> $$
> d = \frac{\ln(M)}{\ln(R)} \quad M = R^d
> $$

To be the fractal dimension of a self similar fractal. 

**Example: The Line Segment**

A line segment is a line segment when we zoom in, this is self similarity. If we cut it in half we get two copies of itself, scaled down by a factor of 2. This means that, $M = 2$, and $R = 2$, we have 2 copies when we scaled zoom in by 2x. Then we have: $\frac{\ln(2)}{\ln(2)} = 1 = d$. The line segment has a dimension of 1. Which is what we want really. 

**Example: A Square**

We can cut it into 4 little square, evenly, then we have $M = 4$, we will need to zoom in by 2x to get the sub-square looking like the super-square. This means that $M = 4$,  while $R = 2$, which means that: $\frac{\ln(4)}{\ln(2)} = d= 2$

**Example: Consider [The Cantor Set](The%20Cantor%20Set.md)**

We made 2 copies of the same set, and each of the copies are $1/3$ in size of the original, so we need to zoom in by 3x to get the same shape. This means that: $M = 2$ and $R = 3$. hence the dimension is: 

$$
d = \frac{\ln 2}{\ln 3} = 0.63...
$$

This is a set with dimension that is between zero and one. Which is making sense because it has Lebesgue Measure of zero, and under the view of Lebesgue measure, this set is very much not the same as a one dimensional line segment. 

**Example: Koch Curve**

We make 4 copies of the curves when we construct it, and it's $1/3$ of the original, and this means the dimension is: 

$$
d = \frac{\ln 4}{\ln 3} = 1.26. 
$$
