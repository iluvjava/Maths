- [Mordukhovich Limiting Subdifferential](../Non-Smooth%20Calculus/Limiting%20Subgradient.md)
- [Kurdyka Lojasiewicz Inequality](Kurdyka%20Lojasiewicz%20Inequality.md)
- [Ekeland Variational Principle](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Ekeland%20Variational%20Principle.md)

---
### **Intro**

File extends results from Morducovich Metric space based PPM to functions with Analytical features with KL error bound conditions. 


**Recall**
1. Regular subdifferential of $f$. 
2. Limiting subdifferential of $f$. 

#### **Assumptions/Quantities**: 
> 1. Function $f: \R^n \rightarrow \overline \R$ and let it be lsc. 
> 2. The set $\text{crit}\; f$ is the set of limiting-critical point of $f$, i.e: $\text{crit}\;f = \{x\; | \mathbf 0 \in \partial f(x)\}$. 

The set $\overline \R$ is considered closed. 
The set $\text{crit}\; f$ is considered to be a super set of the set of minimizers. 
This is due to the fact that limiting subdifferential is not enough to characterize local minimizer without assistance from Dini-Hadamard subderivative/regular subgradient. 
When $f$ is convex, the set of critical point is the minimizer. 



#### **Def| Proximal Point Method**

> For any $x_k \in \R^n$, recursively define the sequence $\lambda_k > 0$ be such that there exists $\overline \lambda, \underline \lambda$ such that it has $0 < \underline \lambda < \lambda_k < \overline \lambda < \infty$ for all $k \in \N$ and the sequence $(x_k)_{k \ge0}$ has: 
> $$
> \begin{aligned}
>     x_{k + 1} \in \argmin{x}\left\lbrace
>         f(x) + \frac{1}{2\lambda_k} \Vert x - x_k\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$



**Observations**

For any $x_{k + 1}$ it minimizes $f(\cdot) + \frac{1}{2\lambda_k} \Vert \cdot - x_k\Vert^2$ as a global minimizer (Theorem 10.1 in Rockafellar and Wetts) and it satisfies the sum rule of limiting subgradient (Exercise 10.10) then for all $k \in \N$ there exists $g_{k + 1} \in \partial f(x_{k + 1})$ such that $x_{k + 1} = x_k - \lambda_k g_{k + 1}$. 



**References**:
- On the convergence of the proximal algorithm for nonsmooth functions involving analytic features


---
### **Conditions**

1. **(H1)**. $\inf_{x \in \R^n} f(x)> 0$. 
2. **(H2)**. The function restricted to its domain is a continuous function. I.e: for all sequence $(x_k)_{k \ge 0}$ in $\text{dom}\; f$ such that $x\rightarrow \bar x$, it has $\lim_{k \rightarrow \infty} f(x) = f(\bar x)$. 
3. **(H3)**. For any limiting-critical point $\hat x$ i.e: $\hat x \in \text{crit}\;f(x)$, there exists $C, \epsilon > 0$ and $\theta \in [0, 1)$ such that 
$$
\begin{aligned}
    (\forall x \in \mathbb B_\epsilon(\hat x))( \forall x^* \in \partial f(x)) \quad
    |f(x) - f(\hat x)|^\theta \le C\Vert x^*\Vert. 
\end{aligned}
$$

**(H1)** implies Proximal Point Method (PPM) admits $x_k$, and the prox operator $\prox$ is nonempty because the function is bounded below, and coersive by the presence of the 2-norm from [Existence of a Minimizer](../Background/Existence%20of%20a%20Minimizer.md). 
The set $\prox$ would be compact due the existence of minimizer theorem as well. 

**(H3)** characterizes a much weaker version of the familiar PL error bound conditions. 
PL is achieved by asserting for all $\epsilon > 0$, so it's global, and then let $\theta = 1/2$. 
In the special case when $\theta = 0$, we adopt the conditions $0^0 = 0$ which makes the LHS of the inequality an indicator function (Indicator function as in statistics: $\chi$) for $\{0\}$ where $|f(x) - f(\hat x)|^0 = 0 \iff f(x) = f(\hat x)$. 


---
### **Consequences of (H2), (H1)**

With just **(H2)**, continuity of the function on its domain, and the fact that it's bounded below, we can gather some powerful results about the behavior of the sequence produce by the PPM. 
The proposition below gives major results of this section. 

#### **Proposition 1 | The PPM sequence**
> Let the sequence $(x_k)_{k \ge0}$ complies with the Definition of PPM. 
> Let $\omega(x_0)$ denotes the cluster point of the sequence. 
> Then
> - (i): The sequence $f(x_k)$ is non-increasing. 
> - (ii): $\sum_{i = 1}^{\infty} \Vert x_{i + 1} - x_i\Vert^2$ is bounded. 
> - (iii): If $f$ satisfies **(H2)**, then $\omega(x_0)\subseteq \text{crit}\; f$. 
> 
> If in addition, the sequence is bounded then it has 
> - (iv): $\omega(x_0)$ is a non-empty, compact, and connected set and the sequence admits $d(x_k, \omega(x_0))\rightarrow 0$ as $k \rightarrow \infty$. 
> - (v): If $f$ satisfies **(H2)**, then it is finite and constant on $\omega(x_0)$. 

**Proof**

On a high level, this is the constituents of the proof. 
1. **(i), (ii)** are direct consequences of PPM and **(H1)**. 
2. **(iii)** Requires the definition of limiting subgradient and PPM, they have unique chemistry with **(H3)**. 
3. **(iv)** requires using [Cluster Points of an Eventual Stationary Sequence](../Background/Cluster%20Points%20of%20an%20Eventual%20Stationary%20Sequence.md) and theorem of bounded sequences. 
4. **(v)** uses (iii) in Lemma 1. 



**(i)**. 
The sequence is non-increasing because the proximal point algorithm gives: 

$$
\begin{aligned}
    f(x_{k}) &\ge 
    f(x_{k + 1}) + \frac{1}{2\lambda_k}\Vert x_{k + 1} - x_k\Vert^2
    \ge f(x_{k + 1}). 
\end{aligned}
$$

**(ii)**. 
The squared of the successive error sequence is bounded because from previous results we perform telescoping sum: 

$$
\begin{aligned}
    f(x_k) - f(x_{k + 1}) &\ge \frac{1}{2\lambda_k}
    \Vert x_{k + 1} - x_k\Vert^2
    \\
    \iff 
    2\lambda_k(f(x_k) - f(x_{k + 1}))
    &\ge 
    \Vert x_{k + 1} - x_k\Vert^2
    \\
    \iff 
    \sum_{i = 0}^{k} \Vert x_{k + 1} - x_k\Vert^2
    &\le 
    2\sum_{i = 0}^{k} \lambda_i\left(
        f(x_i) - f(x_{i + 1})
    \right)
    \\
    &\le 
    2 \overline{\lambda} \sum_{i = 0}^{k}
    f(x_i) - f(x_{i+ 1})
    \\
    &\le 
    2 \overline{\lambda}
    (f(x_0) - f(x_{k + 1}))
    \\
    &\le 
    2 \overline{\lambda}
    \left(f(x_0) - \inf_{x\in \R^n} f(x)
    \right). 
\end{aligned}
$$

By the assumption **(H1)**, we have the boundedness of the squared successive difference. 

**(iii)**. 
Limit point $\bar x \in \omega(x_0)$ of the function has $\lim_{n\rightarrow \infty} f(x_n) \ge f(\bar x)$ because of l.s.c. 
Continuity on its domain strengthens it into $\liminf_{n\rightarrow \infty} f(x_n) = f(\bar x)$. 
This constructs a sequence $x_n\rightarrow \bar x$ and $f(x_n)\rightarrow f(\bar x)$. 
From PPM definition we have $\lambda_k g_k = x_{k} - x_{k + 1} \in \lambda_k \partial f(x_{k + 1})$. 
The convergence of $x_{k} - x_{k + 1} \rightarrow \mathbf 0$ transfers to $g_k \rightarrow \mathbf 0$. 
The convergence in function value and $g_k \in \partial f(x_{k + 1})$ fits the definition of Limiting Subgradient and hence $\mathbf 0 \in \partial f(\bar x)$. 

**(iv)**. 
The sequence is bounded therefore $\omega(x_0) \neq \emptyset$. 
The set of cluster points forms a closed set and hence it's now compact. 
It's connected by the eventual stationary properties of the sequence which also makes $d(x_k, \omega(x_0)) \rightarrow 0$ as well. 

**(v)**. 
For a proof, see Lemma 1. 



---
### **Consequences of (H3)**

The error bound conditions of (H3) allows us to give some generalized local error bound conditions around the limiting points from the set $\text{crit}\; f$. 

#### **Fact 1 | Locally constant function on a connected set**
> A locally constant function on a connected set is a constant function on the entire connected set. 

**Proof**

Read discussion from [Math Stack Exchange](https://math.stackexchange.com/questions/44850/locally-constant-functions-on-connected-spaces-are-constant). 


#### **Lemma 1 | Sequence generated by the PPM**
> Assume $f$ satisfies **(H3)**. Choose any $\hat x \in \text{crit}\; f$. 
> - (i) If $K$ is a connected subset of $\text{crit}\;f$, then $f$ is constant on $K$. 
> - (ii) If in addition $K$ is compact, then there exists $C, \epsilon > 0$ and $\theta \in [0, 1)$ such that 
>
> $$
> \begin{aligned}
>     (\forall x \in \R^n: d(K, x) < \epsilon )(\forall x^* \in \partial f(x)): 
>     |f(x) - f(\hat x)|^\theta \le C \Vert x^*\Vert. 
> \end{aligned}
> $$

**Proof**

The proof consists of following key steps. 
Consider any $\hat x\in \text{crit} \;f$, we do: 

1. **(STEP I)**: $K\subseteq \text{crit}\; f$ has a finite covering of balls $\mathbb B_{\epsilon_i}(x_i)$ for $i = 1, \ldots, p$. 
2. **(STEP II)**: $\forall x \in \mathbb B_{\epsilon_i}(x_i)$, **(H3)** with some $\theta_i, C_i$. 
3. **(STEP III)**: For all $x \in K$, there exists $i\in \{1, \ldots, p\}$ such that $\forall x \in \mathbb B_{\epsilon_i}(x_i), x^* \in \partial f(x)$ there exists $C_i, \theta_i \in [0, 1)$ satisfying $|f(x) - f(\hat x)|^{\theta_i} \le C_i\Vert x^*\Vert$. Now, choose $\theta = \min_{i = 1, \ldots, p} \theta_i, C_i = \max_{i = 1, \ldots, p} \theta_i$, then there exists $\epsilon > 0$ such that $|f(x) - f(\hat x)|^\theta \le C \Vert x^*\Vert$ all $x: d(K, x) < \epsilon$, $x^* \in \partial f(x)$. At this point (ii) is proved. 
4. **(STEP IV)**: (i) is direct from Fact 1 and **(H3)**. It requires to show that **(H3)** forces $f$ to be a constant on $\mathbb B_\epsilon(x)\cap K$. 


**(STEP I)**. 
Define $\epsilon(x)> 0$ to be a function such that it makes **(H3)** true i.e: there exists $\epsilon(x), C, \theta\in [0, 1)$ such that for all $x \in \mathbb B_{\epsilon(x)}(x), x^* \in \partial f(x)$ it has 

$$
\begin{aligned}
    |f(x) - f(\hat x)|^\theta &\le 
    C\Vert x^*\Vert. 
\end{aligned}
$$

For the open cover $\bigcup_{x \in K} \mathbb B_{\epsilon(x)}(x) \supseteq K$ has finite subcover $\bigcup_{i = 1}^p \mathbb B_{\epsilon(x_i)}(x_i)$ because $K$ is compact. 

**(Step II)**. 
For all $i = 1, \ldots, p$, it has $x_i$ with $\epsilon_i = \epsilon(x_i) > 0$. 
Since $K \subset \text{crit}\; f$, we use **(H3)** locally around $x_i$, and it has: 
$$
\begin{aligned}
    & (\exists C_i, \theta_i\in [0, 1))
    (\forall x \in \mathbb B_{\epsilon_i}(x_i))
    (\forall x^* \in \partial f(x)): 
    \\
    & \qquad
    |f(x) - f(\hat x)|^{\theta_i} \le C_i\Vert x^*\Vert. 
\end{aligned}
$$


**(Step III)**. 
For any $x \in K$, there exists $i \in \{1, \ldots, p\}$ such that $x \in \mathbb B_{\epsilon_i}(x_i)$ by the fact that it's a finite cover of $K$. 
Observe that if $\theta \le \theta'$ it has $|x|^\theta \ge |x|^{\theta'}$. 
So we choose $\theta = \max_{i = 1, \ldots, p} \theta_i$ and $C = \max_{i= 1, \ldots, p} C_i$ then the results from (**STEP II**) has for all $i \in \{1, \ldots, p\}$: 

$$
\begin{aligned}
    & (\forall x \in \mathbb B_{\epsilon_i}(x_i))(\forall x^* \in \partial f(x))
    \\
    & \quad 
    |f(x) - f(\hat x)|^\theta \le |f(x) - f(\hat x)|^{\theta_i} 
    \le C_i \Vert x^*\Vert \le C \Vert x^*\Vert. 
\end{aligned}
$$

The inequality decouples from $i$ which implies that for all $x\in K \subseteq \bigcup_{i = 1}^p\mathbb B_{\epsilon_i}(x_i)$ it has 

$$
\begin{aligned}
    \forall x^* \in \partial f(x): 
    |f(x) - f(\hat x)|^\theta \le 
    C \Vert x^*\Vert. 
\end{aligned}
$$

Since the set $K$ is closed, and the balls are open sets then there exists some $\epsilon > 0$ such that

$$
\begin{aligned}
    d(x, K) < \epsilon \implies x \in \bigcup_{i = 1}^p \mathbb B_{\epsilon_i}(x_i). 
\end{aligned}
$$

And hence, we can replace the quantifier with the new set and at the end it has for all $x$ such that $d(K, x) < \epsilon$, for all $x^* \in \partial f(x)$: 

$$
\begin{aligned}
    |f(x) - f(\hat x)|^\theta &\le C \Vert x^*\Vert. 
\end{aligned}
$$

**(STEP IV)**. 
Choose any $x \in K\subseteq \text{crit}\; f$. Using **(H3)**, there exists $C, \epsilon > 0$ and $\theta \in [0, 1)$ such that for all $x \in \mathbb B_\epsilon(x)$, $x^* \in f(x)$ it satisfies: 

$$
\begin{aligned}
    |f(x) - f(\hat x)|^\theta &\le C \Vert x^*\Vert. 
\end{aligned}
$$

Now, choose any $x' \in \mathbb B_\epsilon(x)\cap K$ if there is any then it has $x \in \text{crit}\; f$ as well, which means that $\mathbf 0 \in \partial f(x')$ which sets $|f(x') - f(\hat x)| = 0$ hence $f(x') = f(\hat x)$. 
This shows that the function is a constant on the set $\mathbb B_\epsilon(x)\cap K$. 
Using Fact 1 because $K$ is connected, we can conclude that $f$ is a constant on $K$. 



**Remarks**

It generalizes point wise KL error bound conditions to a compact set, or a connected set. 
This is Lemma 1 in the paper. 

<mark style="background: #FF5582A6;">We are unable to understand the original paper on their proof of item (i).</mark>
The original paper stated that (i) is a consequence of (ii), which it may refer to using the compactness of Epsilon ball and then use it to invoke **(H3)** with Fact 1. 


---
### **Convergence results**

Under Assumptions **(H1), (H2), (H3)** the trajectories of sequences generated by the proximal point method converges, and we can derive the convergence rate via the KL exponents $\theta$. 

#### **Theorem 1 | Finite length trajectories**
> Suppose that $f$ satisfies **(H1), (H2), (H3)** and $(x_n)_{n \in \N}$ is a sequence generated by the proximal point method. 
> If the sequence is bounded then it has 
> $$
> \begin{aligned}
>     \sum_{k = 0}^{\infty} \Vert x_{k + 1} - x_k\Vert < \infty, 
> \end{aligned}
> $$
> and the sequence converges to some critical point of $f$. 