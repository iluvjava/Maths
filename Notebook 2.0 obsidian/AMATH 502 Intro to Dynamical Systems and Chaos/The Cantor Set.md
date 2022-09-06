[[Fractal]]

This is a continuation on the fractal topic 
1. This is going to show us a fractal, and we will be using it for dynamics next week. 


---
### Cantor Set

Let's start with the line:

$$
C_0 = [0, 1]
$$

We remove the middle open interval with width a third of the above interval. 

$$
C_1 = \left\lbrack0, \frac{1}{3}\right\rbrack
\cup \left\lbrack\frac{2}{3}, 1\right\rbrack
$$

$$
C_2 = \left\lbrack 
    0, \frac{1}{9}
\right\rbrack  
\cup
\left\lbrack
    \frac{2}{9}, \frac{1}{3}
\right\rbrack
\cup 
    \left\lbrack
        \frac{2}{3}, \frac{7}{9}
    \right\rbrack
\cup
    \left\lbrack
        \frac{8}{9}, 1
    \right\rbrack
$$
$$
\cdots
$$

Apply this recursively, on each of the left and right. Recursively, we can index this like a tree, it's either on the left, or it's on the right. 

We will get to that part later, which is important.  

Then after the infinitely many iterations, we will have the legit Cantor set and it's like: 

$$
\lim_{n\rightarrow \infty}C_n
$$

We will be left with the end point of the open interval, and it's not the interval itself. 


#### Property of C

1. It's not $\emptyset$, this is true because the point $\frac{1}{3}$ is always in it. 
2. $C$ is a fractal $\rightarrow$ it has structure at every scale. 
3. $C$ is self-similar
4. $C$ is uncountable!!!!

**Base 3 Numeric System**

Digits are 0, 1, 2. A number between [0, 1/3] will look like 0.0...., a number between $1/3, 2/3$, it will be like 0.1...., and between 2/3 and 1, it will be like 0.2....

Depending on which third of the set it fall into, we will have a different digits in the number. 

Notice that, the Cantor set is doing the following: 

**Remove the numbers with 1 in the Tricimal Expansion when we construct the Cantor set**. 

Therefore, we have a all the numbers such that, it's digits are consisted of $2, 0$ in tridec. 

**$C$ is Uncountable because**:

Then, we can make a table of all of them, and then we use the same argument, the proof by contradiction for the real number set, then we will be able to proof that the Cantor set is uncountable. Because I can choose a number from the diagonal that is different from every points listed, and then we will have a different number that is in the contour set. 

**$C$ has zero Lebesgue Measure**!

---
### **Lesbague Measure**

To think of this, think of probability

The number of rationals in $(0, 1)$ is measured zero. 

The number of irrationals in $(0, 1)$ is measured 1. 

The Cantor set: It's having measure of 0, BUT it's an **Uncountable Set**. 


**How to prove a set has a Lesbague Measure zero**? 

The idea is to see how much we have removed from the set $[0, 1]$. 

For the $C$, we remove 1, 2, 4, 8... intervals with length $1/3$, $1/9$, $1/27$....

For step n, we removed $2^n$ of intervals of length $3^{n + 1}$, hence the total measure of what we removed for the $C$ is: 

$$
\sum_{i = 0}^{\infty}\left(
        \frac{2^n}{3^{n + 1}}
    \right)
     = \frac{1}{3}\sum_{i = 0}^{\infty}\left(
            \left(
                \frac{2}{3}
            \right)^n
         \right)
     = \frac{1}{3}\frac{1}{1 - \frac{2}{3}} = 1
$$

We removed all open intervals, and hence $C$ has a measure of zero. 

---
### **Totally Disconnected**

All points in the set are sell separated from other points. 

Given any elements in the set, we can find a epsilon region around the point such that no other points in the set are in the epsilon region. 

$C$ is totally disconnected 

---
### **No Isolated Points**

This means that $x\in C$, there is another point that is arbitrarily close to it. 


---
### **Fractal Dimension**

Example: We are going to look at the Koch Curve. 

![Koch Curve and Coastlines – Fractal Foundation](https://fractalfoundation.org/wp-content/uploads/2010/05/kochprog440.jpg)

This is how the Koch Curve Fractal looks like. 

let's check out the length of the fractals: 

$$
l_1 = 1 \quad l_2 = \frac{4}{3} \quad l_2 = \left(
    \frac{4}{3}
\right)^2
$$

The length is going to infinity. However, this is a line with infinite dimension. 

#### **The Similarity Dimension**

This only works for self similar sets. 

Suppose that, a self-similar set consists of $m$ copies of itself scaled down by a factor of $R$. 

How many copies of itself it has when we scale it down (zoom in)? 

Then the dimension is: 

$$
d = \frac{\ln(M)}{\ln(R)} \quad M = R^d
$$

**Example: The Line Segment**

A line segment is a line segment when we zoom in, this is self similarity. 

If we cut it in half we get two copies of itself, scaled down by a factor of 2. 

This means that, $M = 2$, and $R = 2$, we have 2 copies when we scaled zoom in by 2x. 

Then we have: 

$$
\frac{\ln(2)}{\ln(2)} = 1 = d
$$

The line segment has a dimension of 1. Which is what we want really. 

**Example: Consider a Square**

We can cut it into 4 little square, evenly, then we have $M = 4$, we will need to zoom in by 2x to get the sub-square looking like the super-square. 

This means that $M = 4$,  while $R = 2$, which means that: 

$$
\frac{\ln(4)}{\ln(2)} = d= 2
$$

**Example: Consider Cantor Set**

We made 2 copies of the same set, and each of the copies are $1/3$ in size of the original, so we need to zoom in by 3x to get the same shape. 

This means that: $M = 2$ and $R = 3$. 

And this means that

$$
d = \frac{\ln 2}{\ln 3} = 0.63...
$$

This is a set with dimension that is between zero and one. Which is making sense because it has Lebsegue Measure of zero. 

**Example: Koch Curve**

We make 4 copies of the curves when we construct it, and it's $1/3$ of the original, and this means that: 

$$
d = \frac{\ln 4}{\ln 3} = 1.26
$$

Notice that, if we have a different shape each time, then we don't have self similarity anymore, and then we will have some trouble trying to get the fractal dimensions. 

---
### Some Proofs and Intuition

To show that the set is totally **disconnected**, we need to show that, for any $x, y \in \mathcal{C} \wedge x < y \;\exists z: x<z<y \wedge z\in \mathcal{C}^c$

Basically for any number that are not equal and take from the contour set, there exists a number stuck between those 2 such that it's not from the Cantor set. 

To show that there are no isolated points, just show that: 

>$$
>\forall \epsilon > 0 \exists\; x < y : x, y \in \mathcal{C} \wedge |x - y| < \epsilon
>$$

From the construction off the Cantor set. 