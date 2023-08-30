- [Maximal Likelihood Estimator](Maximal%20Likelihood%20Estimator.md), 
- [Sufficient Statistics](Sufficient%20Statistics.md)


---
### **Intro**

We follow chapter 4 of the "Statistics for Mathematicians: A First Course". We discuss the full context for hypothesis testing with knowledge from MLE, and then we introduce the Naymen Pearson Frameworks for hypothesis testing followed by concrete ways of constructing the crition for statistics and ways for looking for the best test functions for those statistics. 

**Overview**
1. What is hypothesis testing
2. Type of error
3. Nayman Pearson Frameworks
4. The likelihood ratio test


---
### **Define Hypothesis Testing**

Hypothesis testing is just a way of answering a specific type of questions in statistical inferences about an unknown parameter. To start, assume that $\{X_i\}_{i = 1}^n$ are generated as i.i.d sequence as realizations from a pdf/pmf function with a single parameter $\theta$. For short, we denote the sequence of random variable with $\vec X$, and $\vec x$ to be a specific sample from the realizations. 

#### **Problem | Hypothesis Testing**
> It's been suggested with 2 competing hypothesis $H_0: \theta\in \Theta_0, H_1: \theta \in \Theta_1$. We are currently believing in hypothesis $H_0$. Assuming that $\Theta_1 \sqcup \Theta_2 = \Theta$, they are the partition of the parameter space. Then, the question is, upon observing some sample of $\{x_i\}_{i = 1}^n$ to, should we reject $H_0$ in favor of $H_1$? 

**The Philosophy** 

To find the best hypothesis, we avoid the type of mistakes we made. Suppose that we have statistics $T(\vec X): \mathcal X^n \mapsto \mathbb R$, and a test function $\delta(\vec X) = \mathbf 1\{T(\vec X)\in C\}$, where $C$ is something waiting to be determined. Our decision about the hypothesis is made upon the value of $\delta (\vec X)$, it follows: 
1. If $\delta(\vec x) = 1$, then we reject $H_0$ and believe in $H_1$. 
2. If $\delta (\vec x) = 0$, then we preserve $H_0$ and declare inconclusive for hypothesis $H_1$ based on the belief of $H_0$. 

Consequently, such a decision creates potential error in our decision. We write the type I, II function in the table below. 

|   | $H_0$  | $H_1$  |
|---|---|---|
| $\delta(\vec x)=0$  |  Correct |  Type II, $\beta$ |
|  $\delta(\vec x)=1$|  Type I, $\alpha$ | Power  |

Where Type I error is the probability of test results being $1$, suggesting $H_1$ when in fact, $H_0$ is true. In this case, the test function is being paranoid. Otherwise it's type II error where test result is $0$ and the actual truth is $H_1$, in this case, the test function is being insensitive. The values $\alpha, \beta$ are used in hypothesis testing, they are the threshold limiting the subjective tolerance for the test. 

#### **Def | Type I, Type II Error**
> Type I error is $\mathbb P(\delta(\vec X) = 1 | \theta \in \Theta_0)$, and type II error is $\mathbb P(\delta(\vec X) = 0 | \theta \in \Theta_1)$. 

**Observation**

Observe that $\delta(\vec X)$ is a Bernoulli variable hence $\mathbb P(\delta(\vec X) | \theta) = \mathbb E[\delta(\vec x) | \theta]$. 

**Remarks**

The sum of Type I, Type II error is not $1$. The column sum of the confusion matrix is $1$ instead. 
The statistics set $T(\vec X)$ could be just a subset of $\mathbb R$. 

**Exercise**

Show that, the MSE of the test function's relation to the Type I, II error. 

---
### **Optimal Test Function**

Based on the philosophy, we claim that it's impossible to decrease type I, Type II function at the same time, and therefore, motivating the Feyman-Pearson Hypothesis Testing framework. To motivate, let $C\subseteq \mathbb R$ be our current decision set. 

#### **Claim | It's impossible to Decrease Both Error at the Same time**
> For all decision sets $C$ for statistics $T(\vec X)$ that defines test function $\delta = \mathbf 1\{T(\vec X) \in C\}$, it's impossible to decrease type I, Type II function both at the same time. 

**Demonstration**

Events $\{\delta(\vec X) = 1\} = \{T(\vec X) \in C\}$, to decrease $\mathbb P(\delta(\vec X) | \theta \in \Theta_0)$, type I error, we decrease the measure of set $C$. Let $C^*\subset C$, a set with strictly smaller measure then it's complement has $(C^*)^C \supseteq C^C$. Recall that type II error event $\{\delta(\vec X) = 0\} = \{T(\vec X) \in C^C\}$, exchange $C^C$ with $(C^*)^C$ yields a set with greater measure, resulting in higher probability, hence larger type II error. 

**Remarks**

Therefore, the new approach is to restrict the type I error to some threshold that we are comfortable with, and then decrease the probability of a type II error. 

#### **Def | Optimal Test Function in The Neymand Pearson Framework**
> Let $D_\alpha$ be the set of test function respectful of Type I error level $\alpha$, it's: 
> $$
>   \mathcal D_\alpha := \left\{\delta: \mathcal X^n \mapsto \{0, 1\}: \sup_{\theta \in \Theta_0}\mathbb P(\delta(\vec X) = 1 | \theta) \le \alpha\right\}, 
> $$
> it characterizes all test function that has type I error lower than $\alpha$ for all $\theta \in \Theta_0$. Then $\delta \in \mathcal D_\alpha$ is optimal if it minimizes type II error while respecting $\alpha$-level. 

**Obervations**

More specifically, the optimal $\delta\in \mathcal D_\alpha$ solves $\sup_{\theta \in \Theta_0} \mathbb P(\delta(\vec X) = 0 | \theta)$, but $P(\delta(\vec X) = 0 | \theta) = 1 - P(\delta(\vec X) = 1 | \theta)$ for all $\theta \in \Theta_1$, hence, it also maximizes the power of the test among $\mathcal D_\alpha$. 

**Remarks**

Such a test function might exist, or it might not. It really depends on the distributions and the hypothesis for the problem. 



---
### **Nayman-Pearson Hypothesis Testing**

We introduce a classification for different type of hypothesis, because they determine different test method for those hypothesis. Then we introduce the likelihood ratio methods for hypothesis testing for 2 of the scenarios. 

**Type of Hypothesis**
1. Simple vs simple, with $H_1: \theta = \theta_1$, $H_0: \theta = \theta_0$ with $\theta_0\neq \theta_1$. 
2. Unilateral vs Unilateral, $H_0: \theta \le \theta_0$, $H_1: \theta > \theta_0$, and swapping $H_1, H_0$ gives the symmetric case for unilateral and uniteral hypothesis testing. 
3. Simple vs Bilateral, $H_0: \theta = \theta_0$, $H_1: \theta \neq \theta_0$. 

Each types of these hypothesis gives a different way of doing hypothesis testing. We now introduce the hypothesis testing for the first case.

#### **Thm | Likelihood Ratio Test, Simple vs Simple**
> Let $\vec X$ be an i.i.d variable representing realizations from distribution with parameter $\theta$, let $f_{\vec X}$ to be the pdf/pmf function for the realization r.v. Suppose that $H_0 : \theta = \theta_0$ and $H_1: \theta = \theta_1$ with $\theta_1 \neq \theta_0$. Suppose that the test has threshold $\alpha$-level in $(0, 1)$. Lets define the likelihood ratio random varaible 
> $$
> \begin{aligned}
>   \Lambda(\vec X) &= \frac{f_{\vec X}(\vec X | \theta_1)}{f_{\vec X}(\vec X | \theta_0)} = \frac{\mathcal L(\theta_1)}{\mathcal L (\theta_0)}, 
> \end{aligned}
> $$
> is such that there exists $Q > 0$ satisfying $\mathbb P(\Lambda(\vec X) > Q) = \alpha$, then the optimal test function for the alpha level can be defined to be $\delta(\vec X) = \{\Lambda(\vec X) > Q\}$, provided that such a value of $Q$ exists. 

**Intuition**

The higher the ratio of the likelihood, the better it looks for $H_1$, and worse for $H_1$.


**Proof**

We prove that the propsed test function $\delta(\vec X)$ is indeed an optimal function. Observe that by definition $\delta\in \mathcal D_\alpha$. Let's characterize $\vec x \in \{\Lambda(\vec X) > Q\}$, a significant observation, and $\vec x' \in \{\Lambda(\vec X) < Q\}$. Observe that these events are equivalent to $\delta(\vec x) = 1$ and $\delta(\vec x) = 0$. Focusing on $\vec x$ then we have 
$$
\begin{aligned}
    \delta(\vec x) = 1 \iff
    \Lambda(\vec X) > Q \iff \frac{\mathcal L(\theta_1)}{\mathcal L(\theta_0)} 
    &> Q
    \\
    \frac{f_{\vec X}(\vec x | \theta_1)}{f_{\vec X}(\vec x | \theta_0)} &\ge Q
    \\
    f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0)
    &\ge 0, 
\end{aligned}
$$

similarly, when we have $\delta(\vec x') = 0$, replacing $<$ for the above inequality to get another identity. We now consider any $\vec x \in \mathcal X^n$, we may claim a new inequality

$$
\begin{aligned}
    \delta (\vec x)(f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0))
    &\ge 
    f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0), 
\end{aligned}
$$

because when $\delta(\vec x) =1$, equality holds, when $\delta(\vec x) = 0$, then the RHS is less than zero, therefore the inequality is true. Next, suppose another candidate test function $\varphi \in \mathcal D_\alpha$, since it's either $0$ or $1$, we have the inequality: 

$$
\begin{aligned}
    f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0) 
    &\ge \varphi(\vec x)(
    f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0))
    \\
    \implies 
    \delta (\vec x)(f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0))
    &\ge 
    \varphi(\vec x)
    (f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0))
    \\
    \int_{\mathcal X^n}^{} 
        \delta (\vec x)(f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0))
    dV(\vec x)
    & \ge 
    \int_{\mathcal X^n}^{} 
        \varphi (\vec x)(f_{\vec X}(\vec x| \theta_1) - Qf_{\vec X}(\vec x | \theta_0))
    dV(\vec x)
    \\
    \int_{\mathcal X^n}^{} 
        (\delta(\vec x) - \varphi(\vec x))f_{\vec X}(\vec x| \theta_1) 
    dV(\vec x) &\ge 
    Q\int_{\mathcal X^n}^{} 
        (\delta(\vec x) - \varphi(\vec x))f_{\vec x}(\vec x | \theta_0)
    dV(\vec x)
    \\
    \mathbb{E}\left[
    \left.
        \delta(\vec X) - \varphi(\vec X)
    \right| \theta = \theta_1\right] 
    & \ge 
    Q\mathbb{E}\left[
        \left.
        \delta(\vec X) - \varphi(\vec X) \right| \theta = \theta_0
    \right]
    \\
    \mathbb P(\delta(\vec X) | \theta = \theta_1) -
    \mathbb P(\varphi(\vec X) | \theta = \theta_1)
    &\ge 
    \underbrace{Q(\mathbb P(\delta(\vec X) | \theta = \theta_0) - \mathbb P(\varphi(\vec X) | \theta = \theta_0))}_{\le 0}, 
\end{aligned}
$$

The rhs of the last line is less than zero because, $\mathbb P(\delta(\vec X) | \theta = \theta_0) = \alpha$, but since $\varphi \in \mathcal D_\alpha$, by definition this test function also respect $\alpha$-level, then $\mathbb P_{\theta_0}(\delta(\vec X) = 1) \ge \mathbb P_{\theta_0}(\varphi(\vec X) = 1)$, therefore, the LHS is greater than zero, meaning that $\mathbb P_{\theta_0}(\delta(\vec X)) \ge \mathbb P_{\theta_0}(\varphi(\vec X))$, therefore, the test function $\delta$ has more power than any $\varphi\in \mathcal D_\alpha$. By the way, $dV(\vec x)$ is $dx_1\cdots dx_n$ for taking the volume integral. 

**Remarks**

For any arbitrary value of $\alpha$, the existence of $Q$ for discrete random varaible usually doesn't exit for the equality of $\mathbb P(\Lambda(\vec X) > Q) = \alpha$. 


#### **Thm | Likelihood Ratio Tests for Sets of Parameters**
> Change the hypothesis from the previous theorem to be $H_1: \theta \in \Theta_1$ and $H_0: \theta \in \Theta_0$, then defining the likelihood ratio to be
> $$
> \begin{aligned}
>   \Lambda(\vec X) &= \frac{\sup_{\theta \in \Theta_1} \mathcal L(\theta_1)}{\sup_{\theta\in \Theta_0}\mathcal L (\theta_0)}. 
> \end{aligned}
> $$
> Define $\delta(\vec X) = \mathbf 1\{\Lambda(\vec X) \ge Q\}$ If there exists $Q$ such that $\mathbb P(\Lambda(\vec X) \ge Q) = \alpha$, then test function $\delta$ is optimal. 

**Proof**

It's not clarified in the proof, but after I go over the proof, I realized it's impossible to reuse the proof for the Simple vs Simple case if, the maximizer for $\sup_{\theta_1} \mathcal L(\theta_1), \sup_{\theta_0} \mathcal L(\theta_0)$ both exists and they are $\theta_0^*, \theta_1^*$. If this is the case, then the same inequality from the previous proof still holds but instead of $\theta_1, \theta_0$ we have $\theta_0^*, \theta_1^*$, then the same proof can be reused. 

**Remarks**

The existence of the minimizer implies the existence of some type of MLE among the set of parameter space $\Theta_0, \Theta_1$. 

#### **Corollary | Bilateral Likelihood Ratio Tests**
> Suppose that hypothesis for $H_0: \theta = \theta_0$ and $H_1 : \theta \neq \theta_1$, assume that $\mathcal L$ the likelihood function is also a continuous function, then the likelihood ratio random variable has $\mathcal L(\hat \theta)/\mathcal L(\theta)$, where $\hat \theta$ is the MLE. 

**Proof**

Observe that $\sup_{\Theta_1} \mathcal L(\theta) = \hat \theta$ , this is true by the continuity of the function $\mathcal L$, the set $\Theta_1 = \Theta_1 = \mathbb R \setminus \{\theta_0\}$, which is just missing a singleton. 

**Remarks**

The MLE needs to be unqiue and it exists. That is an implicity assumptions for our case. 


---
### **Hypothesis Testing on the Exponential Family**

There are 2 cases that we are going to distinguish for the type of Unilateral hypothesis made about the parameters: 

1. $H_0: \theta \le \theta_0$, $H_1 : \theta > H_0$, this shit should be higher. CASE I
2. $H_1: \theta \le \theta_0$, $H_0 : \theta > H_0$, this shit should be lower. CASE II

Then under the assumption for the exponential function, we have optimal test functions: 

1. Let $\alpha$ be our significant level then $\delta = \mathbf \{\mathcal T> q_{1 - \alpha}\}$ would be uniformly most powerful, with $\mathbb P(\mathcal T < q_{1-\alpha}| \theta_0) = 1 - \alpha$. This is for CASE I when $\eta(\cdot)$ strict monotone increasing, else this os for CASE II. 
2. Let $\alpha$ be our significant level then the test function $\delta = \{\mathcal T < q_\alpha\}$ is uniformly most powerful when $q_\alpha = \mathbb P(\mathcal T < q_\alpha) = \alpha$. This is for CASE II if $\eta (\cdot)$ strictly increasing, else this is for CASE I.    


**Observations**

Observe that the strict monotone increasing $\eta(\theta)$ suggests that larger statistics $\mathcal T$, larger likelihood for parameter $\theta$. This would justify the heuristic since to reject $H_0$, we are testing for extreme statistics that happens with very low probability. In CASE I the low probability events that classify for a rejection is $\mathcal T$ being too big as to measured by probability $\mathbb P(\mathcal T > q_{1 - \alpha})$. 

#### **Claim | Simple VS Simple Hypothesis Testing on the Exponential Family**

> Suppose that function $f(x | \theta) = \exp(\eta(\theta)T(x) - d(\theta) - S(x))$, a form of the exponential family with $\eta$ being strictly increaseing, then under the Neyman Pearson suggestion with hypothesis $H_0: \theta = \theta_0, H_1 = \theta_1 = \theta_1$, a simple hypothesis with $\theta_0 < \theta_1$, has optimal test function $\delta = \mathbf 1 \{\mathcal T > q\}$, where, $\mathbb P(T > q | \theta_0) = \alpha$, where $\mathcal T = \sum_{i = 1}^{n}X_i$, the sufficient statistics. 

**Context**

The theorem demonsrate the Neyman Pearson ratio tests applies to the exponential family will yield test function that only uses the sufficient statistics $\mathcal T$ and a lower/upper threshold for $\mathcal T$. 

**Proof**

Directly using the Naymen pearson frameworks with likelihood ratio test, the test function for the exponential family is 

$$
\begin{aligned}
    \delta &= \mathbf 1 \left\lbrace
       \frac{\mathcal L(\theta_1)}{\mathcal L(\theta_0)}
       > Q
    \right\rbrace
    \\
    &= 
    \mathbf 1 \left\lbrace
       \ln \mathcal L(\theta_0) - \ln \mathcal L(\theta_1) > \ln Q
    \right\rbrace, 
\end{aligned}
$$

Recall that $\mathcal L(\theta) = \eta(\theta)T(x) - d(\theta) + S(x)$, then we have 

$$
\begin{aligned}
    \delta &= 
    \mathbf 1 \left\lbrace
        \sum_{ i =1}^{n} \eta(\theta_1)T(X_i) - \eta(\theta_0)T(X_i) - 
        d(\theta_1) + d(\theta_0) > \ln Q
    \right\rbrace
    \\
    &= \mathbf 1
    \left\lbrace
        \underbrace{(\eta(\theta_1) - \eta(\theta_0))}_{> 0, \text{by $\eta$ monotne}}
        \sum_{ i =1}^{n} T(X_i)
        + 
        n(d(\theta_0) - d(\theta_1)) > \ln Q
    \right\rbrace
    \\
    &= \mathbf 1 
    \left\lbrace
        \sum_{ i =1}^{n} T(X_i)
         > 
        \underbrace{\frac{\ln Q - n(d(\theta_0) - d(\theta_1))}{\eta(\theta_1) - \eta(\theta_0)}}_
        {=:q}
    \right\rbrace, 
\end{aligned}
$$

and that big fraction there, it lower bounds the sufficient statistis of the distribution. and hence, if we can find the event $\{\mathcal T > q\}$ where the probability of observing $\mathcal T$ assuming $\theta = \theta_0$ is less than $\alpha$, the significant level, then the likelihood ratio will corresond to an event of type I error below or at $\alpha$-level. And that $q$ can be characterized by $\mathbb P(\mathcal T > q| \theta = \theta_0) < \alpha$. And by the Neyman Pearson Likelihood test, this is also the optimal test for this hypothesis. 
