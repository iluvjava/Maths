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

