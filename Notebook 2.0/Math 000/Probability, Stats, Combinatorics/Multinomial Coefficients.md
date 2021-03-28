Given a string, how many different ways we can rearrange it with the same letters? 

This is what we call Anagram of a given string. 

---
### **Intro**
Suppose that we were given a string, "godoggy". 

We want to know how many strings are there such that they are consisted of the same letters as in this string. 

---
### **Multinomial**

Using a multi-set to represent the string it will be: 

$$
S = \{g: 3, 0: 2, d:1, y: 1\}
$$

In total, there are $7!$ many permutations of a given sequences of 7 symbols. 

Spoiler: The totally number of anagram is: 

$$
\frac{7!}{3!2!}
$$

This is however, not entirely Intuitive as to how this is always true, but it's not hard to generalized: 

$$
\frac{n!}{n_1!n_2!\cdots n_k!}
$$

Is the number of permutations of a given multi set with $n$ elements, and $k$ of then without repetition. And each unique symbol has frequency of $n_1, n_2\cdots n_k$. 


---
### **Proofs**

The expression above is the coefficient of the Multinomial expansion: 

$$
\left(x_{1}+x_{2}+\cdots+x_{m}\right)^{n}=\sum_{k_{1}+k_{2}+\cdots+k_{m}=n}\left(\begin{array}{c}
n \\
k_{1}, k_{2}, \ldots, k_{m}
\end{array}\right) \prod_{t=1}^{m} x_{t}^{k_{t}}
$$

For each term of the polynomial, it will contain multiplications of variables using $x_1, x_2\cdots x_m$, and the sum of their power will be less than $n$. 

And their coefficients represents the total number of permutations using $k_i$ of the symbols $x_i$. This is just straight up from the algebra. 

Prove that this formula is true and then we will be able to prove understand the formula for the permutation is true as well. 

**Observe**: 
 The number of terms in the sum can be produced by the [[Stars And Bars]] theorem. It's basically summing up all the different ways of $m$ positive integers that can sum up to $n$ exactly. 


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

