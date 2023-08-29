Given a string, how many different ways we can rearrange it with the same letters but different strings? We 

---
### **Intro**
Suppose that we were given a string, "godoggy". 

> We want to know how many strings are there such that they are consisted of the same letters as in this string. 

---
### **Counting Anagram**

The anagram of a string a specific ordering of the multi-set containing the letters used in a given string. Using a multi-set to represent the string "godoggy" it will be: 

$$
S = \{g: 3, 0: 2, d:1, y: 1\}
$$

In total, there are $7!$ many permutations of a given sequences of 7 symbols. The total number of anagram is given by: 

$$
\frac{7!}{3!2!}
$$

In general, suppose that there exists an multi-set of symbols $\{s_1:n_1, s_1:n_2, \cdots, s_k:n_k\}$, and we are interested in the total number of unique anagram that can be created by using all the symbols from the multi-set, then it's given as: 

> $$
> \frac{n!}{n_1!n_2!\cdots n_k!}
> $$

**Remark**: 

Intuitively, the subset of all the same letter repeating letters multiplied by all permutations of the other letter provides us the total number of permutations. Therefore to eliminate the repetitions it make intuitive senes to divide by the total number of ways all possible subset of repeating elements can repeat by the total number of permutations of all letters, ignoring the repeating letters. 


---
### **Multinomial Expansions**

The expression above is the coefficient of the Multinomial expansion: 

$$
\left(x_{1}+x_{2}+\cdots+x_{m}\right)^{n}=\sum_{k_{1}+k_{2}+\cdots+k_{m}=n}\left(\begin{array}{c}
n \\
k_{1}, k_{2}, \ldots, k_{m}
\end{array}\right) \prod_{t=1}^{m} x_{t}^{k_{t}}.
$$

For each term of the polynomial, it will contain multiplications of variables using $x_1, x_2\cdots x_m$, and the sum of their power will be less than $n$. And their coefficients represents the total number of permutations using $k_i$ of the symbols $x_i$. This is just straight up from the algebra. 

Prove that this formula is true and then we will be able to prove understand the formula for the permutation is true as well. 

**Observe**: 

The number of terms in the sum can be produced by the [[../MATH 000 Math Essential/Probability, Stats/Stars And Bars]] theorem. It's basically summing up all the different ways of $m$ positive integers that can sum up to $n$ exactly. 

**Example**: 

$$
(x + y + z)^3 = x^3+3 x^2 y+3 x^2 z+3 x y^2+6 x y z+3 x z^2+y^3+3 y^2 z+3 y z^2+z^3
$$

Take note that the cofficient of $xyz$ is $6$, because exponent of $x, y, z$ is the multi-set $\{k_1:1, k_2:1, k_3:1\}$, which is simply the number of available permutations on the cardinality: $3!$. Similarly, the coefficients of $xy^2$ is the multiset: $\{k_1:1, k_2:2\}$ which has anagram $3!/2! = 3$.

---
### **Example: A Divide and Conquer Approach**

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

And, for this example, the above results is the same as obtained via the multinomial coefficient formula. 

---
### **A Proof of Some Sort**



