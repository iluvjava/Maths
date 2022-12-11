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

The euclidean division algorithm computes the greated common divisor of for 2 integers $a, b$. Let $\text{gcd}(a, b)$ be a function that takes in $a \le b$ and for all $\text{gcd}(0, b) = b$, becaue any number divides $0$. Then the Euclidean divison algorithm is given as: 

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

$$
\begin{aligned}

\end{aligned}
$$