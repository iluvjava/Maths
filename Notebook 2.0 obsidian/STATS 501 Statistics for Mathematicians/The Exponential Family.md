- [PDFs, PMFs](PDFs,%20PMFs.md)

---
### **Intro**

We apply various statistical inference method using the exponential family of distributions. Our major reference are 
1. "Statistics for Mathematician: A Rigorous First Course". 
2. UCB coverage on the exponential family: [here](https://people.eecs.berkeley.edu/~jordan/courses/260-spring10/other-readings/chapter8.pdf)


#### **The Exponential Family**

We restrict the classes of pmf/pdf in our context. We define it and illustrate it with examples. For more information see [wiki](https://en.wikipedia.org/wiki/Exponential_family) for exponential family. 

#### **Def | Exponential Family, Single Parameters**
> The exponential family has the form 
> $$
> f(x | \theta) = \exp(\eta(\theta)T(x) - d(\theta) + S(x)) = \frac{\exp(\eta(\theta)T(x))}{\exp(d(\theta))}\exp(s(x)). 
> $$ 
> We assume that the function $\eta(\theta)$ is strictly increasing and continuously differentiable.Here the useful statistics determine test functions is $\mathcal T = \sum_{i = 1}^{n}T(X_i)$. Take note that, if we don't care about the representation of the parameter of the distribution, the above formula in fact admit minimal representation by making a function (It's called the natural parameter) $\Phi(\theta): \Theta \mapsto \mathbb R$ so then it can be simplified into
> $$
> f(x| \Phi) = \exp(\Phi T(x) - \gamma(\Phi) + S(x)). 
> $$

**Obervations**

We match the 2 forms with $\eta(\theta) = \Phi(\theta), d(\theta) = \gamma\circ \Phi(\theta)$. 

#### **Def | Exponential Family, K Parameters**
> The k-parameter exponential family models the exponential family distribution with multiple parameters. Denote $\vec \Phi$ to be some function of the parmeter then the family has form: 
> $$
>   f(x | \vec\Phi) = \exp\left(\vec \Phi^T T(x) - \gamma (\Phi) + S(x)\right). 
> $$
> Here we assume $x \in \mathcal X$, a simple type of space for the parameter. 

**Facts and Observations**

1. The statistics $\mathcal T$ is also the sufficient statistics for the exponential family. See [Sufficient Statistics](Sufficient%20Statistics.md) example for more information. The fact that this family of distribution is useful is because it separates the distribution function into the product of three parts, containing information for $\theta, x$, and a combination of both at the same time. 



---
### **MLE of the Exponential Family**

There is a lot to this part. For more information about the properties of the MLE, and sufficient statistics for exponential family, see [MLE, Sufficient Statistics of the Exponential Family](MLE,%20Sufficient%20Statistics%20of%20the%20Exponential%20Family.md) for more info. 

---
### **Examples of the Exponential Family**

Refers to section 1.3 of the textbook reference (1.). All of the following distribution is a case of the exponential family: 
1. Exponential 
2. Poisson, Gamma
3. Gaussian
4. Bernoulli, Catagorical
5. Dirichlet, Beta
6. Geometric
7. Chi-Square

Since there are a lot of distributions, it's not a great idea to work through then. For the purpose of the notes, I will list the parameters without derivations for some of these distributions, see [Examples of Exponential Family](Examples%20of%20Exponential%20Family.md) for more information. 

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


**Proof**

See page 110 of the textbook reference. 