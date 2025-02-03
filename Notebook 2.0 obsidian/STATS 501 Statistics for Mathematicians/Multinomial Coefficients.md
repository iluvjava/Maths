
### **Intro**

Given a string, how many different ways it can be rearrange it with the same letters? 

Counting the arrangement of letters (which contains repetitions) is counting the anagram of a string. 
Identifying the coefficient of the terms in a multi-polynomial expansion is doing algebra. 
The two things here are the same thing. 
This file aims to illustrate and clarify such concepts and provide detailed proofs for the claims involved. 





---
### **Anagram**
Suppose that we were given a string, "good". 
An anagram is any arrangement of letters from the strings. 
Without listing them exhaustively, here are the examples: 
1. "good"
2. "godo"
3. "oodg"
4. "doog"

Since the ordering doesn't matter, it remains to character specific symbols (the letters), and the number of appearances in the string (i.e: frequencies). 

We adopt the concept of a multi-set for any given string. 
For example, in this case the string is "good". 
Define the set $A := \{\text{``g"}, \text{``o''}, \text{``d''}\}$ which contains all the symbols in the string. 
Define function $f : A \rightarrow \N$ which maps the symbols to their frequencies, in this case we have the paring $f:=\{(\text{``g''}, 1), (\text{``o''}, 2), (\text{``d''}, 1)\}$. 

The length of the string is given by $\sum_{a \in A} f(a) = 1 + 2 + 1 = 4$, and the total number of unique symbols in the string is $|A| = 4$. 

**Goals**

Suppose that we have a fixed a string. 
1. Given a string, how many anagrams are there? Prove and justify a formula for it. 
2. Provide a specific anagram, find an function that maps to another anagram such that if we apply the function repeatedly, it cycles through all the possible anagram. 
3. Suppose that a string $S$ associates with $N$ in total, identify a function and a procedure such that it's a one-to-one map from $\{1, \cdots, N\}$ to all the anagram of the string. 


#### **Definition | A sequence of symbols**
> Let $S$ be a set of symbols. 
> Let $n \in \N$ be some natural number. 
> Then a sequence of symbols is some mapping $g: \{1, \ldots, n\} \rightarrow S$. 


A sequence of symbols can be permuted. 
Let $\sigma: \{1, \ldots, n\}\rightarrow \{1, \ldots, n\}$ be a bijective function (a permutations), then a permutation of a string $g$ is $g \circ \sigma$, a composition. 


#### **Definition | Anagram**
> Fix $n \in \N$. 
> An anagram of string $g: \{1, \ldots, n\}$ is a set of strings of all possible arrangement of the string using the same symbols. 

We now formalize the idea of an anagram. 
Since we don't care about the ordering of letters in word, define $S$ to be a set of symbols. 
Define $f: S \rightarrow \N$ to be the frequencies of each symbols in $S$, and it must satisfy: 

$$
\begin{aligned}
    (\forall s \in S)\; \sum_{s \in s}^{} f(s) = n,  f(s) > 0. 
\end{aligned}
$$

An anagram is a string $g: \N \rightarrow S$ such that it satisfies: 

$$
\begin{aligned}
    (\forall s \in S): \sum_{i = 1}^{n} \mathbf 1\{g(i) = s\} = f(s). 
\end{aligned}
$$

I.e: The frequencies of each symbol in $g$ matches with $f$. 

**Question**
> Given $S, f$, how many anagrams are there? How can we map from an integers to a unique anagram? 

**Equivalent questions**
> Given any $n \in \N$, $S = \{1, \ldots, n\}$,  and $f: S \rightarrow \N$ such that it has $f(s) > 0 \; \forall s \in S$ and $\sum_{s \in s}^{}f(s) = N$. 
> Then, how many functions $g: \{1, \ldots, N\} \rightarrow S$ are there such that it satsfies: 
> $$
> \begin{aligned}
>     (\forall s \in S): \sum_{i = 1}^{N} \mathbf 1\{g(i) = s\} = f(s). 
> \end{aligned}
> $$
> Then, find a bijection between each functions $g$ and an integer. 




---
### **Counting Anagram**

The total number of anagram given a string can be easily counted. 
Especially when we were already given a formula as the guess, it remains to verify that it's correct. 

#### **Claim | Counting Anagram**
> Given any string consists of symbol set $S = \{s_1, s_2, \ldots, s_n\}$. 
> Let 
> $$
>     f(s): S \rightarrow \N:= \{(s_1\mapsto k_1), (s_2\mapsto k_2), \ldots, (s_n\mapsto k_n)\}
> $$ 
> be a function that counts the frequencies of each symbol in the string. 
> If $s \not \in S$, set $s\mapsto 0$. 
> Then, the total number of anagram is: 
> $$
> \begin{aligned}
>     \frac{\left(\sum_{s \in S} f(s)\right)!}{\prod_{s\in S} f(s)!}
>     = \left(
>         \left(\sum_{i = 1}^{n} k_i\right)!
>     \right)\left(
>         \prod_{i = 1}^{n} k_i!
>     \right)^{-1}. 
> \end{aligned}
> $$


**Proof (Direct)**

Let $N  = \sum_{s \in S}^{}f(s)$. 
Denote $\mathcal A$ to be the set of all anagram of $S, f$. 
Take any $g \in \mathcal A$. 
Denote $\mathcal P_n$ to be the set of all permutations of $\{1, \ldots, N\}$. 
For any $\sigma \in \mathcal P$, $g \circ \sigma$ is a permutation of $g$. 
There are $N!$ permutations of $g$. 

However, some of then are equivalent to each other as an ordered list of symbols. 
Let $g, g'$ be two anagram, define their equivalent relations: 

$$
\begin{aligned}
    g \equiv g' \iff \forall i \in \{1, \ldots, N\}: g(i) = g'(i). 
\end{aligned}
$$

It partitions the set of all permutations of $g$ into equivalent classes. 
We are going to show that: 
1. Each of the equivalent classes has size $k_1!k_2!\ldots k_n!$. 

And hence by equivalent class partitioning, the number of unique anagram after permutation is $N!/(k_1!k_2!\ldots k_n!)$. 

Take any $s_j \in S$, it appears in a subset of indices in $g$, i.e: $\{i \in \{1, \ldots, N\}: g(i) = s_j\}$, and it will have size $k_j$. 
Permutating within the subset of indices yields equivalent string and that is $k_j!$ many. 
Doing this for all symbol yields a total of: 

$$
\begin{aligned}
    \prod_{i= 1}^{n} k_i!. 
\end{aligned}
$$

This is the size of all equivalent classes for any string $g$. 
By $N!$ number of valid permutations and permutation partitioning, divide by the above to get the total number of anagrams to be: 

$$
\begin{aligned}
    \frac{N!}{k_1!k_2! \ldots k_n!}. 
\end{aligned}
$$


**Proof (Inductive)**

Suppose that we have a string $g$ that is an anagram of $S, f$. 
Denote $\mathcal A$ to be a set of strings consist of all anagrams of $S, f$.
Pick any string $g \in \mathcal A$. 
Let $u$ be a new symbol added to the string, if $u \not\in S$, we define assign $f(u) = 0$. 






<!-- 
**Proof (Inductive proof)**

We prove by induction. 
Let $\mathbb H(S, f)$ be the inductive hypothesis given frequencies map $f$, and the symbol set $S$ of some string of symbols. 
The base case with $|S|=1$ is trivial to satisfy. 
Inductively we assume that

$$
\begin{aligned}
    |S| &= n, 
    \\
    \mathbb H(S, f)
    & = n!\left(
        \prod_{i = 1}^{n} k_i!
    \right)^{-1}. 
\end{aligned}
$$

The proof proceeds by adding a new element $u$ to give $S\cup \{u\}$ and there would be two cases

1. CASE I: $u \in S$. 
2. CASE II: $u \not \in S$. 

**CASE II** yields the simple proof. 
For all $s \in S$, $s \neq u$, for each anagram of $S, f$, denotes $g: \{1, \ldots, n\}\rightarrow S$ as an instance of an anagram (i.e: a string), a new string can be composed for all $i = 1, \ldots, n + 1$ by arrangement: 
$$
\begin{aligned}
    g(1), g(2), \ldots,g(i), u, g(i + 1), \ldots, g(n). 
\end{aligned}
$$
When $i = 0$, $A[0: i]$ is an empty string, and it means attaching $u$ on first position as the first element. 
This accounts for $(n + 1) \mathbb H(S, f)$ combinations in total by inductive hypothesis because the string excluding symbol $u$ gives $\mathbb H(S, f)$ many permutations. 
Therefore, we have

$$
\begin{aligned}
    \mathbb H(S\cup\{u\}, f\cup \{(u\mapsto 1)\}) 
    = (1 + n)\mathbb H(S, f) = 
    (n + 1)!\left(
        \prod_{i = 1}^{n} k_i !
    \right)^{-1}. 
\end{aligned}
$$

**CASE I** yields a more difficult counting procedure. 
Any anagram $g_i, g_j$ has the same arrangement of $u$ if $g_i^{-1}(u) = g_j^{-1}(u)$, i.e: $u$ are on the same position for both string. 
This equivalent relation partitions into $C_{f(u)}^n$ number of groups of size $(f(u)!)$.
 
Pick any family of string that where $u$ lies in the same position and denote it by: $[G, U, u]$ where $U \subseteq \{1, \ldots, n\}$ with $|U| = f(u)$. 
With $U$ fixed, for any string $g \in [G, U, u]$: 

$$
\begin{aligned}
    g(1), g(2), \ldots, g(n). 
\end{aligned}
$$
We insert $u$ into the string to make new string and count it. 
The new symbol can be inserted into position between $(i, i + 1)$ for $i = 0, 1, \ldots, n$, which is a total of $n + 1$ options. 
 -->


<!-- Let $u \in S$, define the new frequencies mapper 

$$
\begin{aligned}
    f^+(s) := \begin{cases}
        f(s) & s \neq u, 
        \\
        f(u) + 1 & s = u. 
    \end{cases}
\end{aligned}
$$

For any anagram $g: \{1, \ldots, n\} \rightarrow S$, we can make a new anagrams with the inclusion of $u$ by arrangement: 

$$
\begin{aligned}
    g(1), g(2), \ldots, g(n), u. 
\end{aligned}
$$

This accounts for $1$ more instance of a new anagram. 
For all $i = 1, \ldots, n$ such that $g(i) \neq u$, we can swap $u$ with $g(i)$. 
There are $n - f(u)$ possible ways of swapping it to produce a different anagram and using inductive hypothesis, it counts a total of $n - f(u)$ new anagram.  -->


<!-- **Something is wrong with the proof, at this point.** -->


<!-- 
The anagram of a string a specific ordering of the multi-set containing the letters used in a given string. 
Using a multi-set to represent the string "godoggy" it will be: 

$$
S = \{g: 3, 0: 2, d:1, y: 1\}
$$

In total, there are $7!$ many permutations of a given sequence of 7 symbols. The total number of anagram is given by: 

$$
\frac{7!}{3!2!}
$$

In general, suppose that there exists an multi-set of symbols $\{s_1:n_1, s_1:n_2, \cdots, s_k:n_k\}$, and we are interested in the total number of unique anagram that can be created by using all the symbols from the multi-set, then it's given as: 

> $$
> \frac{n!}{n_1!n_2!\cdots n_k!}
> $$

**Remark**: 

Intuitively, the subset of all the same letter repeating letters multiplied by all permutations of the other letter provides us the total number of permutations. Therefore to eliminate the repetitions it make intuitive senes to divide by the total number of ways all possible subset of repeating elements can repeat by the total number of permutations of all letters, ignoring the repeating letters.  -->


---
### **Multinomial Expansions**

Define the notation for natural numbers $n, k_1, k_2, \ldots, k_m$: 
$$
\begin{pmatrix}
    n \\
    k_{1}, k_{2}, \ldots, k_{m}
\end{pmatrix}
:= 
\frac{n!}{\prod_{i = 1}^{m}k_i!}. 
$$

Then, the expression multinomial expansion is given by: 

$$
\begin{aligned}
    \left(x_{1}+x_{2}+\cdots+x_{m}\right)^{n}=\sum_{k_{1}+k_{2}+\cdots+k_{m}=n}
        \begin{pmatrix}
            n \\
            k_{1}, k_{2}, \ldots, k_{m}
        \end{pmatrix}
    \prod_{t=1}^{m} x_{t}^{k_{t}}, 
\end{aligned}
$$

Each term $x_t^{k_t}$ has coefficient that counts all possible way where, $k_1 + k_2 + \ldots + k_m = n$ and $k_i \ge 0\; \forall i = 1, \ldots, m$. 




**Note**: 

The number of terms in the sum can be produced by the [Stars And Bars](../MATH%20000%20Math%20Essential/Probability,%20Stats/Stars%20And%20Bars.md) theorem. It's basically summing up all the different ways of $m$ positive integers that can sum up to $n$ exactly. 

**Example**: 

Consider: 

$$
    (x + y + z)^3 = x^3+3 x^2 y+3 x^2 z+3 x y^2+6 x y z+3 x z^2+y^3+3 y^2 z+3 y z^2+z^3
$$

**Anagram in coefficients of multinomial terms**

Take note that the coefficient of $xyz$ is $6$, because it counts all permutations of $x, y, z$ is the multi-set $\{k_1:1, k_2:1, k_3:1\}$. 
In this case, it is simply the number of available permutations on the cardinality: $3!$. 

Similarly, the coefficients of $xy^2$ counts unique permutations the multiset: $\{k_1:1, k_2:2\}$ which has anagram $3!/2! = 3$, or equivalently, all possible combinations of the string "$xyy$". 
This is true because multiplicative operation is commutative, hence the action of grouping terms $xyy, yxy, yyx$ counts all possible anagram of the string "$xyy$". 


---
### **Permutations of multisets**



