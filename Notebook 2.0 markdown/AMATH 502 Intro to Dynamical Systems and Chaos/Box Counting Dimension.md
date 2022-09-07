[The Cantor Set](The%20Cantor%20Set.md)

We are going to measure the dimension of the fractal in a new way. 

The box counting way of measure the fractal dimension of a shapes doesn't require self-similarity, and it's consistent with the method of self-similarity. 

---
### **Intro**

When the fractals are not self-similar, but we want to get the dimension, then we use the idea of the Box Counting dimension. 

---
### **Box Counting Dimension**

$S\subseteq \mathbb{R}^D$, the dimension of S should be $\le D$

We are going to cover the set, with a lot of boxes. 

> Let $N(\epsilon)$ to be the minimal number of D-dimensional "Boxes" of side length $\epsilon$ that are needed to completely cover the set $S$. 

"Boxes?": In 1D, they are line segment, in 2D they are boxes and cubes in 3D etc. 

Then the fractal dimension will be defined as: 

$$
    d = \lim_{\epsilon \rightarrow 0} \frac{\ln(N(\epsilon))}{\ln(1/\epsilon)}
$$

Notice that, this is also applicable to self-similar fractals as well, this definition is consistent. 

**Note**: the quantity $\epsilon$ is the width on one side of the "box", which is not the same as the volumn measured under whatever that dimension the box is in.  

Exercise: Check that this is consistent with the previous def of the fractal dimension. 

Intuitively: 

This is like measuring the density of the set. For any line or shapes that have integral dimension, the number of squares with a size will balance out with the number of squares needed. But this is not the case with fractals. 

---
### **Example: Middle Third Cantor Set**

Notice that, we can choose $\epsilon_n = \frac{1}{3^n}$. 

Then, we have line segment of $1$ at the start, and then we have $\frac{1}{3}$ line segment to describe the set. 

Then, it's not hard to see that, the function $N(\epsilon)$ will be defined for boxes of size $1/3^n$, and at each level of zooming, we will have $2^n$ boxes to cover the whole set. 

$$
N\left(
    \frac{1}{3^n}
\right)  = 2^n
$$

And then we have: 

$$
d = \lim_{n\rightarrow \infty} \frac{\ln(2^n)}{\ln(3^n)} = \frac{\ln(2)}{\ln(3)}
$$

This matches the calculation we did before. 

Notice that, the choice of the box size is smarter than before. 

---
### **Example: Random 2D Menger Sponge**

Consider a $3 \times 3$ box, defined recursively, infinitely, and at each level, we remove on of the $9$ boxes at random for the unit square, repeat the process for all levels. 

Consider $n = 0$, then we need one unit box to cover the whole set. 

Consider $n = 1$, then we removed one sub-box, then we will ned 8 boxes to cover the whole set. 

Consider $n = 3$, then we are left with 8 sub-boxes, and each of them lost one of their sub-boxes. Then there will be $8^2$ boxes in total to cover with boxes with size $1/9$

Then we have: 

$$
\epsilon = \frac{1}{3^n} \quad N(\epsilon) = 8^n
$$

Then the dimension will be: 

$$
d = \lim_{n\rightarrow \infty}\frac{\ln(8^n)}{\ln(3^n)} = \frac{\ln(8)}{\ln(3)} \approx 1.89
$$

