Here, I will summarized some of the examples we had for convex conjugates of different functions. 
[[Convex Conjugate Function]]

---
### **Intro**

Here we will be packing a bunch of good examples with proofs, so it can serves as a good references for when looking for Fenchel Conjugates for functions. 

Most of them will be coming straight from the HW problems for the class. 


---
### **Infinity Norm Indicator Function**

This is the infinity Norm function: 

---
### **2-Norm Indicator Function**

---
### **Summation of Functions**


Objective: look for convex conjugate of the function: 

$$
\left(
    \sum_{i = 1}^{n}g(x_i)
\right)^* = f^*(z)
$$

Note that this is a function that is multi-variable scalar function, then by definition of the Fenchel Conjugate we have: 

$$
f^*(z) = \sup_{x}\left\lbrace
    z^Tx - \sum_{i = 1}^{n}g(x_i)
\right\rbrace
$$

Focusing on the second term we have that: 

$$
\sup_{x}\left\lbrace
   \sum_{i = 1}^{n}\left(
       z_ix_i - g(x_i)
   \right) 
\right\rbrace 
$$

$$
\sup_{x_1, x_2, \cdots, x_n}\left\lbrace
   \sum_{i = 1}^{n}\left(
       z_ix_i - g(x_i)
   \right) 
\right\rbrace 
$$

$$
\sum_{i = 1}^{n}\left(
    \sup_{x_i}\left\lbrace
       z_ix_i - g(x_i)
\right\rbrace\right) 
$$

$$
\implies f^*(z) = 
\sum_{i = 1}^{n}
    g^*(z_i)
$$