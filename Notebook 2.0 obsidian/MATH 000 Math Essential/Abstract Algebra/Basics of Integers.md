### **Intro**

We introduce the euclidean division algorithm first. I will add stuff here whenever I need some properties of integers. Some of these properties are not unique to integers tho, A quantized real number line can act the same. 

* Integers division is denoted as $a\div b$ is the integer division between $a, b$. And $a\% b$ denotes that remainder of $a$ dividing by $b$. 
* $a|b$ means that $a$ divides $b$, meaning that there exists $q\in \mathbb Z$ such that $b = qa$, where $q = b\div a$. $1$ divides any integers and $0$ divides none. Everything divides $0$. 
  * The divisor relationship is transitive and they form a DAG graph if we draw them out. 


**Theorem: The well ordering principle**
> Every nonempty subset of the natural number contains a smallest element. 

Take this for granted, analogous to the completeness theorem for the real numbers. 

**Definition: Greatest common divisor**

> $n$ is the greatest common divisor of $a, b$ if it's the largest $n$ such that $n|a, n|b$. 

---
### **Euclidean Division Algorithm**

The euclidean division algorithm computes the greatest common divisor for 2 integers $a, b$. Let $\text{gcd}(a, b)$ be a function that takes in $a \le b$ and for all $\text{gcd}(0, b) = b$, because any number divides $0$. Then the Euclidean division algorithm is given as: 

$$
\begin{aligned}
    \text{gcd}(a, b) := \begin{cases}
        \text{gcd}(b\% a, a) & a\neq 0, 
        \\
        b       & a = 0.
    \end{cases}
\end{aligned}
$$

if the above function is called, please observe that if we have $a < b$ then: 
$$
\begin{aligned}
    & a < b
    \\
    & b\%a < a
    \\
    & a\%(b\%a) < b\%a
    \\
    & \cdots 
\end{aligned}
$$
and by the well ordering principle, eventually we will terminate, because the remainder operations is bounded by zero, and the Euclidean algorithm make the number smaller and smaller as it recur. While recurions make things easy to implement, we would still consider the iterative method for Euclidean Division algorithm. 

**Iterative euclidean algorithm**

1. Let `S:={a, b}` be a stack with `a <= b`. 
2. Peek the first 2 elements from the stack name it `r1, r2`. 
3. Push `r1%r2` back into the stack. If the value is zero, then return `r_2`, which is going to be the GCD. 

**Algorithm invariances**

1. Suppose that $d = \text{gcd}(a, b)$ with $a < b$, then $\text{gcd}(a\div d, b\div d) = 1$.
2. Suppose that $q$ is positive integers then $\text{gcd}(a, b - qa) = \text{gcd}(a, b)$. 

---
### **Linear Combinations and GCD**

> The greatest common divisor between 2 numbers is the minimum number they can create using integers of linear combinations of the 2 numbers. Let $a, b$ be 2 integers then $d = ma + nb$ for all $m, n \in \mathbb Z$, then the smallest possible $d$ satisfying the equation if and only if the greated common divisor between the 2 integers $a, b$ is also $d$. 

To prove, we use the well ordering principle to assume that there exists minimum to the of all positive real integers: $\{ma + n b: m, n \in \mathbb Z\}$, and then let that number to be $d$. We then consider applying the Euclidean division algorithm to the linear combinations, obtaining that $d|(ma + nb)$, if this is not the case, then there is a smaller value of $d$, making a contradiciton. 

To see the converse, of $d = (ma + nb)$ then $d|a, d|b$, since $d$ is the smallest such value, it's the smallest number that can divide both $a, b$, which is equivalent to the definition of the greatec common divisor of $a, b$. 


---
### **Basics Properties and Claims**

1. if $b|ac$ then $b|\text{gcd(a, b)}c$. 
2. if $b|ac$ and $\text{gcd}(a, b) = 1$ then $b|c$. 
3. if $b|c, c|a$ and $\text{gcd}(a, b) = 1$ then $\text{gcd}(a, c) = 1$. 




---
### **Additive Modulo**




---
### **Relative Primes**

> Let $a, b \in \mathbb Z$, then $a, b$ are relative primes to each other iff $\text{gcd}(a, b) = 1$. 
