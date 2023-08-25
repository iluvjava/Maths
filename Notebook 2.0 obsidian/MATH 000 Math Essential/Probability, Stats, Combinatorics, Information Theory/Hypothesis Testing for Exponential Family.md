[Hypothesis Testing](Hypothesis%20Testing.md)

---
### **Intro**

We generalize the idea of Neyman Pearson hypothesis testing frameworks for the exponential family distributions, with Unilateral vs Unilateral hypothesis types for a single real parameter in the pmf/pdf that we assumed in prior. Our major reference is chapter 5 of "Statistics for Mathematician: A Rigorous First Course". 


#### **The Exponential Family**

We restrict the classes of pmf/pdf in our context. We define it and illustrate it with examples. For more information see [wiki](https://en.wikipedia.org/wiki/Exponential_family) for exponential family. 

#### **Def | Exponential Family for Hypothesis Testing**
> The exponential family has the form 
> $$f(x | \theta) = \exp(\eta(\theta)T(x) - d(\theta) + S(x)) = \frac{\exp(\eta(\theta)T(x))}{\exp(d(\theta))}\exp(s(x)) $$ 
> We assume that the function $\eta(\theta)$ is strictly increasing and continuously differentiable.Here the useful statistics determine test functions is $\mathcal T = \sum_{i = 1}^{n}T(X_i)$. 

**Observations**

The statistics $\mathcal T$ is also the sufficient statistics for the exponential family. See [Sufficient Statistics](Sufficient%20Statistics.md) example for more information. 

---
### **The Design of the Tests**

There are 2 cases that we are going to distinguish for the type of Unilateral hypothesis made about the parameters: 

1. $H_0: \theta \le \theta_0$, $H_1 : \theta > H_0$, this shit should be higher. CASE I
2. $H_1: \theta \le \theta_0$, $H_0 : \theta > H_0$, this shit should be lower. CASE II

Then under the assumption for the exponetial function, we have optimal test functions: 

1. Let $\alpha$ be our significant level then $\delta = \mathbf \{\mathcal T> q_{1 - \alpha}\}$ would be uniformly most powerful, with $\mathbb P(\mathcal T < q_{1-\alpha}| \theta_0) = 1 - \alpha$. This is for CASE I when $\eta(\cdot)$ strict monotone increasing, else this os for CASE II. 
2. Let $\alpha$ be our significant level then the test function $\delta = \{\mathcal T < q_\alpha\}$ is uniformly most powerful when $q_\alpha = \mathbb P(\mathcal T < q_\alpha) = \alpha$. This is for CASE II if $\eta (\cdot)$ strictly increasing, else this is for CASE I.    


**Observations**

Observe that the strict monotone increasing $\eta(\theta)$ suggests that larger statistics $\mathcal T$, larger likelihood for parameter $\theta$. This would justify the heuristic since to reject $H_0$, we are testing for extreme statistics that happens with very low probability. In CASE I the low probability events that classify for a rejection is $\mathcal T$ being too big as to measured by probability $\mathbb P(\mathcal T > q_{1 - \alpha})$. 


**Proof**

See page 110 of the textbook reference. 

---
### **The Gaussian Distribution Hypothesis Testing**

---
### **The Exponential Hypothesis Testing**

---
### **The Poisson Hypothesis Testing**

