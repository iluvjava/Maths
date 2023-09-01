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
> We assume that the function $\eta(\theta)$ is strictly increasing and continuously differentiable.Here the useful statistics determine test functions is $\mathcal T = \sum_{i = 1}^{n}T(X_i)$. Take note that, if we don't care about the representation of the parameter of the distribution, the minima representation is described throuth $\phi$ (It's called the natural parameter), where $\phi \in \Phi$ an open subset of $\mathbb R$. In that way we have
> $$
>   f(x| \phi) = \exp(\phi T(x) - \gamma(\phi) + S(x)). 
> $$
> being the minmal representation using the natural parameter. 

**Obervations**

We match the 2 forms with $\eta(\theta) = \phi, d(\theta) = \gamma\circ \phi = \gamma\circ \eta(\theta)$. 

#### **Def | Exponential Family, K Parameters**
> The k-parameter exponential family models the exponential family distribution with multiple parameters. Denote $\vec \phi$ to be some function of the parmeter then the family has form: 
> $$
>   f(x | \vec\phi) = \exp\left(\vec \phi^T T(x) - \gamma (\vec \phi) - S(x)\right),  
> $$
> Here we assume $x \in \mathcal X^n$, a subset of $\mathbb R^n$, and $T: \mathbb R^n \mapsto \mathbb R$, and $\gamma: \mathbb R^n\mapsto \mathbb R$ as well. 

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
4. Bernoulli, Categorical
5. Dirichlet, Beta
6. Geometric
7. Chi-Square

Since there are a lot of distributions, it's not a great idea to work through then. For the purpose of the notes, I will list the parameters without derivations for some of these distributions, see [Examples of Exponential Family](Examples%20of%20Exponential%20Family.md) for more information. 


---
### **Hypothesis Testing on the Exponential Family**

See [Hypothesis Testing](Hypothesis%20Testing.md) for more info. 

