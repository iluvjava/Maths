[[Real Analysis Basics]]. 

----
### **Intro**

We prove the Bozano Weierstrass theorem from first Principles. Confusions where quite involved when I first learn the topic, and it still is not easy to grasp after I started my graduate degree. Here we follow on of the proof from Wikipedia, and then we show it with mostly man, other than words. We do it for $\R$ first, and then state the Euclidean space $\R^n$ later. 

**Theorem: BozanaWeierstrass | Converging Subsequences**
> For any closed and bounded subset of $C\subseteq\R$, an infnite sequence $x_n\in C$ will contain a converging subsequence such that $x_{n_k}$ converges to a point $\bar x \in C$. 

**Lemma 1**: 
> For any sequence $x_n$ it will contain a montone subsequence. 

---
### **Proof of the Lemma**

Consider $x_m' = \sup_{n \ge m} x_{n}$, the sequence $x_m'$ is never increasing, it has to decrease, this is obvious because $x_n$ where $n > m$ is always a subsequence of the sequence $x_n$, its supremum is going to be smaller. Hence: 
$$
\begin{aligned}
    x'_1 \ge x'_2 \ge x'_3 \ge \cdots, 
\end{aligned}
$$
for this sequence, there are 2 things: 
1. either it stops decreasing at value of indices (More on this case later), 
2. or, it has the chance to strictly decrease indefinitely. In this case let's isolate the sequence of $x'_{n_k}$ such that it's strictly decreasing, giving us the subsequence: 
    $$
        x'_{n_1} > x'_{n_2} > \cdots > x'_{n_k} > \cdots
    $$
    then we choose another sequence, say $n'_k$ such that $x_{n'_k} = x'_{n_k}$, this is possible because the $\sup$ has to be attained at some value between $x_{n_{k}}, x_{n_{k - 1}}$. And this forms a monotone increasing subsequence. 

In the first case, it has to be the case that the sequence $x'_i$ stopped decreasing after some value index, Let $N$ be the smallest value such that the sequence $x'$ stopped decreasing. 
$$
\begin{align*}
   x'_{1} \ge \cdots \ge x'_{N} = x'_{N + 1} = \cdots 
\end{align*}
$$

Then the previous way of choosing a monotone subsequence won't be viable here because the monotone subsequence seems to be finite when this happens. 

Consider that $x_{N + 1}$ bounded from above $\sup_{n \ge N}x_n = x'_{N}$ but it has supremum of value $x_{N}$, hence there exists $n_1$ such that $x_{n_1} \ge x_{N + 1}$, similarity, there exists $n_2$ such that $x_{n_2} \ge x_{n_1}$, because the sequence $x_{N + k}$ for $k \ge 1$ has to attain the value $x'_N$ infinitely many time, this produce another monotone subsequence that is increasing. Under both cases, we attain a montone subsequence of $x_n$ such that it's monotone. 


---
### **Proof of the Theorem**

Given a sequence, $x_n$, it must contains a monotone subsequence, and in the case when $x_n \in C$, $C$ being a bounded set, we know that $\sup_{n\in \N}{x_n}$ or $\inf_{n\in \N}x_n$ must exist (bounded montone sequence theorem) and by the fact that the sequence is monotone, it must converge to one of those point, and when the set $C$ is closed, we know that $\sup_{n\in \N}x_n, \inf_{n\in \N}x_n$ must also be a member of $C$. This comples the proof. 


---
### **Corollary| Higher Dimensions**

> Bozano Weierstrass's theorem can also be applied to $\R^n$. 

**Proof**: 

This is true because we can extract out a convergence subsquence that only converges on the first coordinate, and then we repeat the same process on the subsequence and extract out a subsequence that converges on the second coordinate and so on. Then in the end, the sequence is going to converge to a point in $\R$. 


---
### **Alternative Proof for $\R$ using Nested Interval**

We skip this one for now. #UNFINISHED 
