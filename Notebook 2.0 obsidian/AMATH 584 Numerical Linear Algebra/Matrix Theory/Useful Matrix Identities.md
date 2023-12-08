How do we inverse matrix operations when we have the inverse of some kind of sum of matrices? 

Results can be generalized to rings too. 

---
### **List of Formulas**

Let $P$ be invertible squared matrix, then we can say that: 

> $$
> (I + P)^{-1} = I- P(I+ P)^{-1} = I - (I + P)^{-1}P \tag{1}
> $$

By symmetry

> $$
> P(I + P)^{-1} = (I + P)^{-1}P \tag{2}
> $$

Let's get a big fancier: 

> $$
> (I + AB)^{-1} = I - A(I - BA)^{-1}B \tag{3}
> $$
> Observe that $AB$ is swapped into BA. As long as this is invertible, this will be true, $A, B$ doesn't have to be squared matrices. 

**Need to exploit both (1), (2), (3) for expression (4)**. 

> $$
> A(I + BA)^{-1}  = (I + AB)^{-1}A \tag{4}
> $$
> This is call the **push through identity**, just push the A through the $()^{-1}$, and swapping the $BA$ into $AB$
---
### **Proofs for (1)**

$$
\begin{aligned}
    (I + P)^{-1}(I + P) &= I
    \\
    (I + P)^{-1} + (I + P)^{-1}P &= I
    \\
    (I + P)^{-1} &= I - (I + P)^{-1}P 
\end{aligned}
$$

Symmetry Can be Exploited by considering: 

$$
\begin{aligned}
    (I + P)(I + P)^{-1} &= I
    \\
    (I + P)^{-1} + P(I + P)^{-1} &= I
    \\
    (I +P)^{-1} &= I - P(I + P)^{-1}
\end{aligned}
$$

$\blacksquare$


---
### **Proofs for (2)**

We wish to prove that $(I + AB)^{-1}$ and $I - A(I - BA)^{-1}B$ to be the inverse of each other. It shares similar structure compare to expression (1), (2), but under the hood they are in fact every different. 

Considering multiplying these 2 quantities together and then we have: 

$$
\begin{aligned}
    & (I - A(I + BA)^{-1}B)(I + AB) 
    \\
    =& 
    (I + AB) - A(I + BA)^{-1}B(I + AB) 
    \\
    =&
    (I + AB) - A(I + BA)^{-1}(B + BAB)
    \\
    =&
    (I + AB) - A(I + BA)^{-1}(I + BA)B
    \\
    =&
    (I + AB) - AB
    \\
    =&
    I
\end{aligned}
$$

$\blacksquare$

---
### **Proofs for (3)**

Ok, let's use what we learned and then apply it for expression (3): 

Consider expression (2): 

$$
\begin{aligned}
    (I + AB)^{-1} &= I - A(I - BA)^{-1}B
    \\
    (I + AB)^{-1}A &= A - A(I - BA)^{-1}BA
    \\
    &= A \underbrace{(I - (I - BA)^{-1}BA)}_{I - (I - P)^{-1}P}
    \\
    (I + AB)^{-1}A &= A(I - BA)^{-1}
\end{aligned}
$$
$\blacksquare$


Take note that, when the inverse is not involved, then, we have the direct push through formula which is: 

> $$
> B(I + AB) = (I + BA)B
> $$

Feel free to swap the $A,B$ which will leads back to the expression (3), but one inverse transformation away. 

---
### **Applications, Special Cases, Corollaries**

**Inverse of a Sum**

> $$
>   (B + A)^{-1} = B^{-1} - B^{-1}A(B + A)^{-1}
> $$
> And symmetrically we also have: 
> $$
> (A + B)^{-1} = A^{-1} - A^{-1}B(A + B)^{-1}
> $$

For this one we are going to use expression (3) and the identity that for any matrix $A,B$ such that $AB$ is invertible, we have: 

$$
AB = B^{-1}A^{-1}
$$

Observe the following fact: 

$$
\begin{aligned}
    B^{-1}(I + AB^{-1})^{-1} = ((I + AB^{-1})B)^{-1} = (B + A)^{-1}
\end{aligned}
$$

From expression (3), we can figure out $(I + AB^{-1})$, which is going to be the following: 

$$
\begin{aligned}
    (I + AB^{-1})^{-1} &\underset{(3)}{=} I - A(I + B^{-1}A)^{-1}B^{-1}    
    \\
    B^{-1}(I + AB^{-1}) &= 
    B^{-1} - B^{-1}A(I + B^{-1}A)^{-1}B^{-1}
    \\
    &= B^{-1} - B^{-1}A[B(I + B^{-1}A)]^{-1}
    \\
    (B + A)^{-1}&= B^{-1} - B^{-1}A(B + A)^{-1}
\end{aligned}
$$

**Note**: Try apply this formula recursively, then we obtained matrix series. 

**Note**: This can be used to derive the famous Woodburry's Formula. 


$\blacksquare$

**Corollary: Hua's Identity**

> $$
> (A + B)^{-1} = A^{-1} - (A + AB^{-1}A)^{-1}
> $$



