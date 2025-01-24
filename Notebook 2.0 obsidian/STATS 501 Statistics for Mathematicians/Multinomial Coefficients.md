Given a string, how many different ways we can rearrange it with the same letters but different strings? We 

---
### **Intro**

Counting the arrangement of letters (which contains repetitions) is counting the anagram of a string. 
Identifying the coefficient of the terms in a multi-polynomial expansion is doing algebra. 
The two things here are the same thing. 
This file aims to illustrate and clarify such concepts and provide detailed proofs for the claims involved. 


---
### **Multi-nomial coefficients**



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


---
### **Counting Anagram**

The total number of anagram given a string can be easily counted. 

#### **Claim | Counting Anagram**
> Given any string consists of symbol set $S = \{s_1, s_2, \ldots, s_n\}$. 
> Let 
> $$
>     f(s): S \rightarrow \N:= \{(s_1\mapsto k_1), (s_2\mapsto k_2), \ldots, (s_n\mapsto k_n)\}
> $$ 
> be a function that counts the frequencies of each symbol in the string. 
> Then, the total number of anagram is: 
> $$
> \begin{aligned}
>     \frac{\sum_{s \in S} f(s)}{\prod_{s\in S} f(s)!}
>     = \left(
>         \sum_{i = 1}^{n} s_n
>     \right)\left(
>         \prod_{i = 1}^{n} k_i!
>     \right)^{-1}. 
> \end{aligned}
> $$

**Proof**




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

Take note that the coefficient of $xyz$ is $6$, because it counts all permutations of $x, y, z$ is the multi-set $\{k_1:1, k_2:1, k_3:1\}$. In this case, it is simply the number of available permutations on the cardinality: $3!$. 

Similarly, the coefficients of $xy^2$ counts unique permutations the multiset: $\{k_1:1, k_2:2\}$ which has anagram $3!/2! = 3$, or equivalently, all possible combinations of the string "$xyy$". 
This is true because multiplicative operation is commutative, hence the action of grouping terms $xyy, yxy, yyx$ counts all possible anagram of the string "$xyy$". 



<!-- ### **Example: A Divide and Conquer Approach**

Another way to get the same formula is to use the idea of a "Super Group" and the formula for combinatorics.  

Let's say we have the string "aabbCCDD". 

If I split it by letter type, then there are 2 types: Upper and Lower cased letters. 

The number of such a splitting will be: 

$$
\frac{8}{4!4!}
$$

Now, 2 groups of $4$ remains, and each has 2 groups of 2 elements, because they are different letters, therefore, for each subgroup, the number of combination will be given by: 

$$
\frac{4!}{2!2!} \quad \frac{4!}{2!2!}
$$

Then, every possible permutations of the super group, we have: 

$$
\frac{4!4!}{2!2!2!2!}
$$

In total. However, re-arranging inside the sub-group doesn't change the super group, therefore, we can just multiply then together and get: 

$$
\frac{8}{4!4!}\times \frac{4!4!}{2!2!2!2!} 
=
\frac{8!}{2!2!2!2!}
$$

And, for this example, the above results is the same as obtained via the multinomial coefficient formula.  -->

---
### **A Proof of Some Sort**



