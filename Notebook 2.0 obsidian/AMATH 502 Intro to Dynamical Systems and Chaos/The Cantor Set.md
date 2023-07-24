requires: [[Fractal]]

---
### **Cantor Set**

To construct the set on the unit interval of the real line, we start with the line:

$$
C_0 = [0, 1]
$$

We remove the middle open interval with width a third of the above interval. 

$$
\begin{aligned}
    C_1 &= \left\lbrack0, \frac{1}{3}\right\rbrack
    \cup \left\lbrack\frac{2}{3}, 1\right\rbrack
    \\
    C_2 &= \left\lbrack 
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
    \\
    & \cdots
\end{aligned}
$$

Apply this recursively, for all of the interval in the set, we take it, remove the middle third, and split it into 2 other intervals. Such a constructions make it possible to index any of the interval using a binary number with infinitely many digits. After the infinitely many iterations, we will have the legit Cantor set and it's like: $C = \lim_{n\rightarrow \infty}C_n$, the limit of such a sequence of set exists because $C_1\supseteq C_2\cdots$, and this sequence of set is monotone, therefore it converges. 

**Remarks**

The set describes a type of invariance transform. If we zoom into the left third, or the right third of the set, the set remainds unchanged. This can be mathematically represented by 

$$
\begin{aligned}
    C &= (3C) \cap [0, 1]
    \\
    C &= (3C - 2)\cap [0, 1], 
\end{aligned}
$$

Which represent the action of zooming into the left third, or, zooming by x3, and then only look at the right third. If a set is the same under both transformation, then the set would be the cantor set on the interval $[0, 1]$. 

---
### **Property of the Cantor Set**

We show the following about the Cantor set. 

1. It's not $\emptyset$, this is true because the point $\frac{1}{3}$ is always in it. 
2. $C$ is a fractal $\rightarrow$ it has structure at every scale, and it's the same set after zooming into the left/right third by a factor of 3, from such an invariant property, we deduce that the set is also self similar. 
4. $C$ is uncountable. 

**Thm | The Cantor Set is uncountable**
> It's absolutely possible to get a bijection between the set of natural numbers and the Cantor set. 

**Proof**

During the construction process of the cantor set, consider number whose digits are $\in \{0, 1\}$ written in the form of $0.d_1d_2\cdots d_k,\cdots$ with $k\rightarrow \infty$ and all $d_k\in \{0, 1\}$. Choose any number $x\in C$, then it will be the case that it's in any of the super set $C_k$ for $k\in \mathbb N$. The digits of the number $x$ are determined by whether, it's in the left, or the right side of the current branch of the set $C_k$. For example, if $x\in [0, 9]$, then the first 2 digits of $x$ are zeros, giving $x=0.00\cdots$, if it's in the branch $[2/9, 1/3]$ then $x=01\cdots$. This process continues and it will be determine all digits of $x$ in this binary representations. Therefore, the set $C$ is uncountable, it's able to encode the membership of every binary number with infinite digits. 


---
### **Lebesgue Measure**

The set is uncountable, and yet, it has a zero measure like any countable sets on the real line. This is a famous counter example, for a reference for this theorem, we take it from [here](http://mathonline.wikidot.com/the-cantor-set) on the internet. 

#### **Thm | The Cantor Set has a Zero Lebesgue Measure**

> To reason better, recall probability spaces. The number of rationals in $(0, 1)$ is measured zero. The number of irrationals in $(0, 1)$ is measured 1 (Fact).  The Cantor set: It's having measure of 0, BUT it's a *uncountable*. 

**Proof**

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


**Remarks**

To understand the concept of a measure, and what the hell it is, see [Measure Theory Basics](../MATH%20601%20Functional%20Analysis/Measure%20Theory%20Basics.md). 

---
### **Totally Disconnected**

This section is describing the topology of the Cantor set. 

#### **Def | Separated Sets**
> Two sets $A, B \subset \mathbb R$ are separated if, they are the union of 2 disjoint sets in $\mathbb R$. 

#### **Def | Disconnected Sets in Reals**

> The set $S\subset \mathbb R$ is totally disconnected if for any distinct $x, y \in S$, there exists separated sets $A, B$ where $x\in A, y\in B$ and $S = A\cup B$. 

**References**: 

Abbott's Real analysis textbook, Exercise 3.4.8, 3.4.9.

**Remarks**: 

Total disconnectivity is a stronger version of disconnectivity. Briefly speaking, it means all points in the set are sell separated from other points. Given any 2 elements in the set, we can find an epsilon region around the point such that no other points in the set are in the epsilon region. The set $\mathbb Q$ is totally disconnected. $C$ is totally disconnected 

**Some Proofs and Intuition**

To show that the set is totally **disconnected**, we need to show that, for any $x, y \in \mathcal{C} \wedge x < y \;\exists z: x<z<y \wedge z\in \mathcal{C}^c$. In laymen's term, for any 2 distinct number $x, y$ taken from the contour set, there exists a number $z$ stuck between those 2 such that it's not from the Cantor set, partitioning the cantor into the union set from the left of $z$, and from the right of $z$. 

---
### **No Isolated Points**

> The Cantor set has no isolated points. If $x\in C$, there is another point in the Cantor set that is arbitrarily close to it. To show that there are no isolated points we show
>$$
>\forall \epsilon > 0 \exists\; x < y : x, y \in \mathcal{C} \wedge |x - y| < \epsilon, 
>$$
> which asserts the fact that no epislon region contains exactly one point in it. 

We skip the proof here, and I think it's obvious from the construction of the Cantor set since the distance between the binary encoding of 2 binary numbers in tridecimal system representing a point in cantor set can be as close to each other as possible, we do this by matching up the highest $N$ digits of these 2 binary numbers, additionally, the earliest digits that are different indicate the the minimal absolute distance between the 2 numbers are $1/3^n$. 

---
### **Nowhere Dense**

The cantor set is an example of a set that is nowhere dense. A set is nowhere dense if, the closure of its interior is empty. 