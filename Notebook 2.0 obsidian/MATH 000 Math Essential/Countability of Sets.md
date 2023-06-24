---
alias: Enumerosity
---
### **Intro**

This would be the foundations of theoretical mathematics. Infinity like this would never occur in the real life, not even close, but it will be some very interesting mental exercises for the bright minds. 

The set of all natural numbers, $\N$ has a concept of cardinality to it, a measure on the number of elements in the set. We can directly associate the member in $\N$ to a subset of $\N$. For example, $n\in \N$ is the number of elements from $1$ to $n$.  Immediately observe that there can't exists any natural number representing the number of elements in the set $\N$. For any natural number $n$, it can count the number of natural numbers from $1$ to $n$, but we can add one more element to the set such that the set become larger and yet is still not $\N$. We denote this to be $\aleph_0$. The cardinality of the set $\N$. Finally, we make implicit use of the [Continuum Hypothesis](https://en.wikipedia.org/wiki/Continuum_hypothesis). 

---
### **Enumerosity of Sets**

To set is the same cardinality of there exists a bijection between the 2 sets. The set $A$ would be larger than $B$, if there exists $f: A\mapsto B$ such that $f$ is a surjective function, then it would mean $A$ has a cardinality that is larger than or equal to $B$. 

**Theorem 1: $|\N| = |\Z|$**

The $f$, a bijection between $\N$ and $\Z$ is: 

$$
\begin{aligned}
    f = 
    \begin{cases}
        -k/2 & k\in 2\N
        \\
        (k - 1)/2 & k \in 2\N - 1
    \end{cases}
\end{aligned}
$$

**Theorem 2: $|\mathbb Q_{++}| \le |\N|$**

> The cardinality of the natural number is bigger than or equal to the cardinality of the positive rationals. 

Arrange the set of rationals like $\{\frac{p}{q}| (p, q)\in \N\times \N\}$. This cross product will be slightly larger than all the rationals because it counts repeated rationals. For example, all $p/q$ where $p=q$ are essentially ones, but they appears as a different element in the cross product $\N \times \N$. We propose the following bijective mapping that does the trick. It's: 

$$
f(m, n) = 2^{m - 1}(2n - 1), 
$$

we use the fundamental theorem of arithmetic, where every natural number is the product of some primes, the product looks like $2^{\alpha_1}\times p_2^{\alpha_2}\times\cdots\times p_k^{\alpha_k}$, it either contains the number $2$ raised to some integer powers, or it doesn't. And if it doesn't, then the remaining product would be an odd number, which fits exactly for the form of $2n - 1$ for some $n\in \N$. Hence the above function $f$ is a bijection. Finally, by the use of the Continuum Hypothesis we can claim that $|\Q_{++}| = |\N|$. 

One could perfect the argument to involve the use of a perfectly bijective function from the rationals to the naturals, or, somehow take into account on all the repeating elements counted for $\Q_{++}$ and show that we still have the same cardinality. This part of the proof is complicated and I am not sure how to proceed. 



**Remarks**

We can use the previous theorem to show that $|\Q| \le |\Z| = |\N|$, because $\Z$ can be partitioned natural numbers with $\pm$ and the extra number zeros. The zeros will falls onto the axis of the cartesian coordinates while the set $\Z\times \Z$ handles is more than enough to represents rational numbers with positive and negative signs. 

Cantor's argument is followed by the constructions of another function that takes the following form. The zig zag walks on the diagonals of an infinite 2D grid, a classical proof considered for this theorem proves surjectivity of such mapping mapping, instead of bijectivity. Here we present the function that maps natural numbers to a 2D grid board to show that $|\N|= |\N\times \N|$[^1][^2]: 

![[../Assets/cantor's zigzag.png]]

$$
f(m, n) = \begin{pmatrix}
    m + n - 1
    \\
    2
\end{pmatrix} + m, 
$$

where the term choosing 2 elements from $m + n - 1$ elements is the number of integer points $(i, j)$ such that $i + j \le m + n - 1$, or, a triangle. This establish the mapping from $\N \times \N$ to $\N$. To see the inverse mapping...(??? #UNFINISHED) 

---
### **Theorem: [Cantor's Theorem](https://en.wikipedia.org/wiki/Cantor%27s_theorem)**

This is commonly refers to as the Cantor's Diagonalization argument. Here we prove the Cantor's theorem first, and then explain some of its applications. 

> Let $A\neq \emptyset$  then the power set has a cardinality that is strictly larger than $A$ because there cannot exists any surjective function $f: A \mapsto \mathcal P(A)$. Therefore $|\mathcal P(A)| > |A|$. 

**Proof**

For contradiction, let $f: A \mapsto \mathcal P(A)$ be bijective let $B= \{x\in A| x\not\in f(x)\}$, then $B\subseteq A$ so $B \in \mathcal P(A)$. <span style="color:red">For any</span> $\xi\in A$, there are 2 cases, either $\xi\in f(\xi)$ or $\xi\not\in f(\xi)$ note that: 

$$
\begin{aligned}
    & \xi \in f(\xi) \implies f(\xi) \neq B & (1)
    \\
    & \xi \not\in f(\xi) \implies f(\xi) \neq B& (2)
\end{aligned}
$$

in (1), from $x\in f(\xi)$, we know that $\xi\not\in B$, hence there exists $\xi$ that is in $f(\xi)$, but not $B$. In (2), we know that $\xi\not\in f(\xi)$, therefore $\xi \in B$, then there exists $\xi$ that is in $B$ but not $f(\xi)$, this is a contradiction to the surjectivity of the mapping. This means that we can't have such a surjective mapping from the set to its power set. 

**Remarks**

This is trivial for the case when $A$ is finite, but in the case of set with $\aleph_0$ or infinity that is larger, we have to stick to this version of the proof. The construction of the set $B$ was exactly Cantor's diagonal argument used for the introduction to most people, but now presented with mathematical rigor and formality. 


---
### **Theorem 3 Reals are Larger than Integers**

Observe that every real numbers in $[0, 1)$can be represented as a binary number that encodes the membership of all elements in the set $\N$, indicating a subsets of $\N$. Therefore, this problem is equivalent of asking whether $\mathcal P (\N)$ and $\N$ has the same cardinality. From Cantor's theorem, we know that the power set would be strictly larger. Hence the subset of $\R$, $[0, 1)$ has a larger cardinality, therefore, the cardinality of all the reals is larger. 

**Remarks**

Invariance under translation and strictly positive scaling of any open real intervals will assure that every open epsilon region of the real around a singleton will yield more real numbers than integers. 

---
### **Theorem 4 | Infinite Countable Cross Product of $\{0, 1\}$ is Uncountable**

Any countably cross product, denoted as $\prod_{n\in \N}\{0, 1\}$ can be mapped to a binary number in the range $[0, 1)$, because they have infinitely many digits trailing behind it. Therefore it's uncountable by the previous: theorem 3. 

**Remarks**
The cross product of countably infinite sets are going to be countable as well. Replacing the finite set with 2 elements in it only going to increase the total amount of elements. 

---
### **Theorem 6 | Unions of Countably Many Countable Set is Countable**

Consider $S_i$ to be a sequence of set that has the same cardinality with $\N$, then the set $G = \bigcup_{i \in \N}S_i$ is a countable set. We consider ordering all elements in the set $G$ with a tuple $(i, j)\in \N\times \N$. For any $(i, j)$ we have the element $(S_i)_j$ denoting the $j$ th element of the set $S_i$. We can map this to every element in $G$ by the fact that all $S_i$ has the same cardinality as $\N$. Then this problem reduces to finding a bijective maps between the set $\N\times \N$ and $\N$. 


---
### **Theorem 5 | Finite Cross Product of Countable sets are Countable**

We do this inductively. WLOG we just let the finite many countable set to be all $\N$. Assuming that we have a function $f_n:\N^n \mapsto \N$ such that it's bijective, we also let $f:\N^2 \mapsto \N$ to be the function we constructed for theorem 2. We show that we can construct a function of the form $f_{n + 1}: \N^{n + 1} \mapsto \N$ that is also bijective. The function simply is: 

$$
f_{n +1}(x_1, x_2, \cdots, x_{n + 1}) := f(f_n(x_1, x_2, \cdots, x_n), x_{n + 1}).
$$

This is true because on $f_{n + 1}$ operates on $\N^{n}\times \N$. We consider the following to show that it's a bijective function by the construction. 

 
* The function is surjective because for any $k\in \N$, have $f$ being bijective mapping it back to $x, x_{n + 1}$, and due to bijectivity of $f_n$, $x$ then gets mapped back to a unique number. 
* It's bijective because the above claim is true for every $k\in N$ by the bijectivity of $f$. 

The base case of the argument is simply Cantor's Zigzag argument used for theorem 2. 



[^1]: The image sourced from [here](https://nivotko.wordpress.com/2012/12/28/on-bijection-of-nxn-to-n/). 
[^2]: Recall [[Probability, Stats, Combinatorics, Information Theory/Stars And Bars]], this one is specific applications of integers under a particular probability simplex in 2D. 