- [Maximal Likelihood Estimator](Maximal%20Likelihood%20Estimator.md), 
- [Sufficient Statistics](Sufficient%20Statistics.md)


---
### **Intro**

We follow chapter 4 of the "Statistics for Mathematicians: A First Course". We discuss the full context for hypothesis testing with knowledge from MLE, and then we introduce the Naymen Pearson Frameworks for hypothesis testing followed by concrete ways of constructing the crition for statistics and ways for looking for the best test functions for those statistics. 


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
| $\delta=0$  |  Correct |  Type II |
|  $\delta=1$ |  Type I | Power  |

Where Type I error is the probability of test results being $1$, suggesting $H_1$ when in fact, $H_0$ is true. In this case, the test function is being paranoid. Otherwise it's type II error where test result is $0$ and the actual truth is $H_1$, in this case, the test function is being insensitive. 

#### **Def | Type I, Type II Error**
> Type I error is $\mathbb P(\delta(\vec X) = 1 | \theta \in \Theta_0)$, and type II error is $\mathbb P(\delta(\vec X) = 0 | \theta \in \Theta_1)$. 

**Observation**

Observe that $\delta(\vec X)$ is a Bernoulli variable hence $\mathbb P(\delta(\vec X) | \theta) = \mathbb E[\delta(\vec x) | \theta]$. 

**Remarks**

The sum of Type I, Type II error is not $1$. The column sum of the confusion matrix is $1$ instead. 
The statistics set $T(\vec X)$ could be just a subset of $\mathbb R$. 

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



