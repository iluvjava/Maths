### **Intro**

This would be the foundations of theoretical mathematics. Infinity like this would never occur in the real life, not even close, but it will some very interesting mental exercises for the bright minds. 

The set of all numbers, $\N$ has a concept of cardinality to it, a measure on the number of elements in the set. We can directly associate with member in $\N$ to a subset of $\N$. Immediately observe that there can't exists any integers representing the number of elements in the set $\N$. For any integers $n$, we can add one more element to the set such that it's not quite $\N$, but now larger than $n$. We denote this to be $\aleph_0$. The cardinality of the set $\N$. 

---
### **Enumerosity**

To set is the same cardinality of there exists a bijection between the 2 sets. The set $A$ would be larger than $B$, if there exists $f: A\mapsto B$ such that $f$ is a surjective function, then it would mean $A$ has a cardinality that is larger than $B$. 

**Theorem: $|\N| = |\Z|$**

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

**Theorem: $|\mathbb Q^+| \le |\N|$**

Arrange the set of rationals like $\{\frac{p}{q}| (p, q)\in \N\times \N\}$. This cross product will be slightly larger than all the rationals because it counts repeated rationals. For example, all $p/q$ where $p=q$ are essentially ones, but they appears as a different element in the cross product $\N \times \N$. The zig zag walks on the diagonals of an infinite 2D grid, a classical proof considered for this theorem proves surjectivity of such mapping mapping, instead of bijectivity. Here we present the function that maps natural numbers to a 2D grid board to show that $|\N|= |\N\times \N|$[^1][^2]: 

$$
f(m, n) = \begin{pmatrix}
    m + n - 1
    \\
    2
\end{pmatrix} + 1 = 2^{m - 1}(2n - 1), 
$$
![[../Assets/Pasted image 20230204231522.png]]
where the term choosing 2 elements from $m + n - 1$ elements is the number of integer points $(i, j)$ such that $i + j \le m + n - 1$, or, a triangle. This establish the mapping from $\N \times \N$ to $\N$. To see the inverse mapping, we use the fundamental theorem of arithmetic, where every natural number is the product of some primes, the product looks like $2^{\alpha_1}\times p_2^{\alpha_2}\times\cdots\times p_k^{\alpha_k}$, it either contains the number $2$ raised to some integer powers, or it doesn't. And if it doesn't, then the remaining product would be an odd number, which fits exactly for the form of $2n - 1$ for some $n\in \N$. Hence the above function $f$ is a bijection. 

**Remarks**

We can use the previous theorem to show that $|\Q| \le |\Z| = |\N|$, because $Z$ can be partitioned natural numbers with $\pm$ and the extra number zeros. The zeros will falls onto the axis of the cartesian coordinates while the set $\Z\times \Z$ handles is more than enough to represents rational numbers with positive and negative signs. 


**Theorem: [Cantor's Theorem](https://en.wikipedia.org/wiki/Cantor%27s_theorem)**

This is commonly refers to as the Cantor's Diagonalization argument. Here we prove the Cantor's theorem first, and then explain some of its applications. 

> Let $A\neq \emptyset$  then the power set has a cardinality that is strictly larger than $A$ because there cannot exists any surjective function $f: A \mapsto \mathcal P(A)$. Therefore $|\mathcal P(A)| > |A|$. 

**Proof**

For contradiction, let $f: A \mapsto \mathcal P(A)$ be bijective let $B= \{x\in A| x\not\in f(x)\}$, then $B\subseteq A$ so $B \in \mathcal P(A)$. For any $\xi\in A$, there are 2 cases, either $\xi\in f(\xi)$ or $\xi\not\in f(\xi)$ note that: 

$$
\begin{aligned}
    & \xi \in f(\xi) \implies f(\xi) \neq B & (1)
    \\
    & \xi \not\in f(\xi) \implies f(\xi) \neq B& (2)
\end{aligned}
$$

in (1), from $x\in f(\xi)$, we know that $\xi\not\in B$, hence there exists $\xi$ that is in $f(\xi)$, but not $B$. In (2), we know that $\xi\not\in f(\xi)$, therefore $\xi \in B$, then there exists $\xi$ that is in $B$ but not $f(\xi)$, this is a contradiction to the surjectivity of the mapping. This means that we can't have such a surjective mapping from the set to its power set. 

**Remarks**

This is trivial for the case when $A$ is finite, but in the case of set with $\aleph_0$ or infinity that is larger, we have to stick to this version of the proof. 


---
### **Reals are Larger than Integers**

Observe that every real numbers in $[0, 1)$can be represented as a binary number that encodes the membership of all elements in the set $\N$, indicating a subsets of $\N$. Therefore, this problem is equivalent of asking whether $\mathcal P (\N)$ and $\N$ has the same cardinality. From Cantor's theorem, we know that the power set would be strictly larger. Hence the subset of $\R$, $[0, 1)$ has a larger cardinality, therefore, the cardinality of all the reals are larger. 

---
### **Countably Cross Product of $\{0, 1\}$ is Uncountable**


---
### **Unions of Countably Many Countable Set is Countable**




[^1]: The image sourced from [here](https://nivotko.wordpress.com/2012/12/28/on-bijection-of-nxn-to-n/). 
[^2]: Recall [[Probability, Stats, Combinatorics, Information Theory/Stars And Bars]], this one specific applications of integers under a particular probability simplex in 2D. 