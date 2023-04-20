requires: [Fractal](Fractal.md)

---
### **Cantor Set**

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

Apply this recursively, for all of the interval in the set, we take it, remove the middle third, and split it into 2 other intervals. Such a constructions make it possible to index any of the interval using a binary number with infinitely many digits. After the infinitely many iterations, we will have the legit Cantor set and it's like: $C = \lim_{n\rightarrow \infty}C_n$, the limit of such a sequence of set exists because $C_1\supseteq C_2\cdots$, and this sequence of set is monotone, therefore it converges. 

---
### **Property of C**

1. It's not $\emptyset$, this is true because the point $\frac{1}{3}$ is always in it. 
2. $C$ is a fractal $\rightarrow$ it has structure at every scale, and it's the same set after zooming into the left/right third by a factor of 3, from such an invariant property, we deduce that the set is also self similar. 
4. $C$ is *uncountable*!!!

**Theorem: The Cantor Set is uncountable**
> It's absolutely possible to get a bijection between the set of natural numbers and the Cantor set. 

**Base 3 Numeric System**

Digits are 0, 1, 2. A number between [0, 1/3] will look like 0.0...., a number between $1/3, 2/3$, it will be like 0.1...., and between 2/3 and 1, it will be like 0.2....Depending on which third of the Cantor set it falls into, we will have a different digit that indicates the location of the number. Notice that, the Cantor set is doing the following: 

> If we represent the real line segment $[0, 1]$ with tricimal number, then, removing the numbers with 1 in the Tricimal Expansion when we construct the Cantor set. 

Therefore, the Cantor set has all the numbers such that, its digits are consisted of $2, 0$ in tridecimal system

> **$C$ is Uncountable**:

Then, we can make a table of all of them, and then we use the same argument, the proof by contradiction for the real number set, then we will be able to proof that the Cantor set is uncountable. Because I can choose a number from the diagonal that is different from every points listed, and then we will have a different number that is in the contour set. 

> **$C$ has zero Lebesgue Measure**

We skip the proof for now. Remember that a Cantor set is equivalent to a singleton in a real line, under the view of Lebesgue Measure. 

---
### **Lesbague Measure**

To reason better, recall probability spaces. The number of rationals in $(0, 1)$ is measured zero. The number of irrationals in $(0, 1)$ is measured 1 (Fact).  The Cantor set: It's having measure of 0, BUT it's a *uncountable*. 


**How to prove the Cantor set has a Lebesgue Measure zero**? 

The idea is to see how much we have removed from the set $[0, 1]$. For the $C$, we remove 1, 2, 4, 8... intervals with length $1/3$, $1/9$, $1/27$.... For step n, we removed $2^n$ of intervals of length $3^{n + 1}$, hence the total measure of what we removed from the $[0, 1]$ is: 

$$
\sum_{i = 0}^{\infty}\left(
        \frac{2^n}{3^{n + 1}}
    \right)
     = \frac{1}{3}\sum_{i = 0}^{\infty}\left(
            \left(
                \frac{2}{3}
            \right)^n
         \right)
     = \frac{1}{3}\frac{1}{1 - \frac{2}{3}} = 1, 
$$

we removed all open intervals, and hence $C$ has a measure of zero. 

---
### **Totally Disconnected**

**Definition: Separated Sets**
> Two sets $A, B \subset \mathbb R$ are separated if, they are the union of 2 disjoint sets in $\mathbb R$. 

**Definition: Disconnected Sets in Reals**

> The set $S\subset \mathbb R$ is totally disconnected if for any distinct $x, y \in S$, there exists separated sets $A, B$ where $x\in A, y\in B$ and $S = A\cup B$. 

**References**: Abbott's Real analysis textbook, Exercise 3.4.8, 3.4.9.

**Remarks**: 

Total disconnectivity is a stronger version of disconnectivity. Briefly speaking, it means all points in the set are sell separated from other points. Given any 2 elements in the set, we can find an epsilon region around the point such that no other points in the set are in the epsilon region. The set $\mathbb Q$ is totally disconnected. $C$ is totally disconnected 

**Some Proofs and Intuition**

To show that the set is totally **disconnected**, we need to show that, for any $x, y \in \mathcal{C} \wedge x < y \;\exists z: x<z<y \wedge z\in \mathcal{C}^c$. In laymen's term, for any 2 distinct number $x, y$ taken from the contour set, there exists a number $z$ stuck between those 2 such that it's not from the Cantor set, partitioning the cantor into the union set from the left of $z$, and from the right of $z$. 

---
### **No Isolated Points**

> The Cantor set has no isolated points. If $x\in C$, there is another point in the Cantor set that is arbitrarily close to it. To show that there are no isolated points we show
>$$
>\forall \epsilon > 0 \exists\; x < y : x, y \in \mathcal{C} \wedge |x - y| < \epsilon
>$$

We skip the proof here, and I think it's obvious from the construction of the Cantor set since the distance between the binary encoding of 2 binary numbers in tridecimal system representing a point in cantor set can be as close to each other as possible, we do this by matching up the highest $N$ digits of these 2 binary numbers. 

---
### **Nowhere Dense**

The cantor set is an example of a set that is nowhere dense. 

**Definition: Nowhere dense**
