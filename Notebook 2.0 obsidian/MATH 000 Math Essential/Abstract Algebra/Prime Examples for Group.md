[[Group Basics]]


---
### **Intro**

Here we consider a list of prime examples that are used when reasoning with the abstract structure of different groups and concepts regarding group theory. 

---
### **Additive modulo of all integers**

A group can be factored into several sets where by an equivalence relations/homomorphism. We start with a classic examples where $\phi(x)$ takes in $x$ and modulo by $n$. The relations $a\equiv b \iff a \equiv b\; (\text{mod } n)$ is an equivalence relation and one can define the equivalence set: 

$$
\begin{aligned}
    [a]_n = \{x: x \equiv a \; (\text{mod } n)\}, 
\end{aligned}
$$

and in the case where $n = 2, a =0$, the equivalent set $[0]_2$ slice out all the even integers from the set $\mathbb Z$. The 2 equivalence set forms a group under the same multiplications. In general, let $n\in \mathbb N$ and we consider the group $\mathbf Z_n$ to denote the group for the equivalent set, then: 

$$
\begin{aligned}
    \mathbf Z_n := \{[0]_n, [1]_n, \cdots ,[n - 1]_n\}, 
\end{aligned}
$$

is a group because under the same operator $+$ defined for the integers. Consider any 3 elements take from the group $[a]_n, [b]_n, [c]_n$, then we have: 

1. Closure of the elements: $[a]_n + [b]_n \in \mathbf Z_n$ and $[a]_n + [b]_n = [a + b]_n$. 
2. The identity element is $[0]_n$
3. The inverse of the element $[a]_n$ is $[-a]_n$. Which is unique for all element in $\mathbf Z_n$. 
4. The associative property is satisfied and it's trivial to check. 

**Remark**
1. This group is a [[Cyclic Group]]
2. This group is an Abelian Group 
3. This group is a finite group 
4. This group is factored by the equivalence relation under additive modulo for integers. 
5. Note that, a homomorphism defined as $\phi(x):=[x]_n$  will also construct the class through the equivalence relations $\phi(a) = \phi(b)$. 


