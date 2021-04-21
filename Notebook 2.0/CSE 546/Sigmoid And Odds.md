[[Classification (Statistics Theory)]]
[[Bayes Theorem]]

Reference Recourse: [Logistic Regression And Bayes](https://www.countbayesie.com/blog/2019/6/12/logistic-regression-from-bayes-theorem)

---

### **Intro**

In the derivation of a Bayes Classifier, we were able to derive model, but we dind't explain why the Sigmoid function were chosen.  

And why a linear model is chosen too.

Here we will start with the basics and derive from the ground up to get to the model we obtained earlier.

---
### **Bayes Theorem**

Let's start with Bayes and then build up to Sigmoid.

Now, suppose that we want to investigate how the event $D$ implies $H$. For example, let's say that $D$ is a set of symptoms (Asumme this to be a vector in $\mathbb{R}^n$) for cancer, and $H$ is actually having a cancer. 

This is a very serious matter, so we are going to use math. 

$$
\mathbb{P}\left(H|D\right) = 
\frac{
    \mathbb{P}\left(D|H\right)P(H)
}{\mathbb{P}\left(D\right)}
$$

This is the portion of people who have cancer and have the specific set of symptoms $D$ over all the people who have cancer. This Produces the probability of given the set of symptoms the person ends up having the cancer.  

**Ok, the problem is**: It's very unlikely that this very specific set of symptoms occurred in our data set, because the symptoms covers a wide variety and span a very huge space. 

Hence, we can't setimate it using Bayes Theorem alone. 


----
### **The Oddds**

Let's consider the odds of having cancer. 

The odds: The ratio between something being true over that thing being false. 

Mathematically it's: 

$$
\frac{\mathbb{P}\left(H|D\right)}{
    \mathbb{P}\left(\neg H|D\right)
}
$$

Using Bayes theorem on the numerator and the denominator of this thing, we have: 

$$
\frac{\mathbb{P}\left(H|D\right)}{
    \mathbb{P}\left(\neg H|D\right)
}
=
\frac{
    \mathbb{P}(D|H)\mathbb{P}(H) \frac{1}{\mathbb{P}(D)}
}{
    \mathbb{P}(D|\neg H)\mathbb{P}(\neg H)\frac{1}{\mathbb{P}(D)}
}
=
\frac{
    \mathbb{P}(D|H)\mathbb{P}(H)
}{
    \mathbb{P}(D|\neg H)\mathbb{P}(\neg H)
}
$$

Boom, we had it. 

The term $\mathbb{P}(D)$ is now out of the picture. 

Now, let's denote the odds using the symbol $\mathbb{O}$, well then in that case the above formula is going to be: 

$$
\mathbb{O}(H|D) = 
\frac{
    \mathbb{P}\left(D|H\right)
}{
    \mathbb{P}\left(D|\neg H\right)
}
\mathbb{O}(H)
$$

Let's introduce the linearity into the picture by taking the log on both side which will give us: 

$$
\log(\mathbb{O}(H|D))
=
\log\left(
    \frac{
        \mathbb{P}\left(D|H\right)
    }{
        \mathbb{P}\left(D|\neg H\right)
    }
\right)
+ 
\log\left(\mathbb{O}(H)\right)
=
w^Tx + b
\tag{1}
$$

And notice that, the variable $x$ in the linear model is the odds of observing the list of symptoms for the cancer. 

Now, let's see an additional property about the odds: 

$$
\mathbb{O}(H)
=
\frac{\mathbb{P}\left(H\right)}{1 - \mathbb{P}\left(H\right)}
\underset{\text{non trivial math}}{\iff}
\frac{\mathbb{O}(H)}{1 + \mathbb{O}(H)} = \mathbb{P}\left(H\right)
\tag{2}
$$

Simply the ratio of the times when something is true over the times when that thing is false. 

---
### **The Birth of the Sigmoid**

The odds with hypothesis: 

$$
\log(\mathbb{O}(H|D))
=
w^Tx + b
$$

$$
\mathbb{O}(H|D) = w^Tx + b
$$


We can convert the conditinal oddds into probability which will be: 

$$
\mathbb{P}\left(H|D\right)
=
\frac{\mathbb{O}(H|D)}{1 + \mathbb{O}(H|D)}
=
\frac{\exp(w^Tx + b)}{1 + \exp(w^Tx + b)}
\tag{2}
\underset{\text{non-trivial math}}{=}
\frac{1}{1 + \exp(w^Tx + b)}
$$

This is the linear model together with the sigmoid function derived. 

