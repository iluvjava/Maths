Bayes Theorem
[[PDFs, PMFs]], 
Here are some reference in use: 

[Explain Bayes like I am Five](https://towardsdatascience.com/all-about-naive-bayes-8e13cef044cf)

---

### **Intro**

It's used everywhere and it's connecting related to conditional probability. Here is the statement of the theorem: 

$$
\mathbb{P}\left(A|B\right)
=
\frac{\mathbb{P}\left(B|A\right)
    \mathbb{P}\left(A\right)
}{\mathbb{P}\left(B\right)}
$$

Symmetric Form: 

$$
\mathbb{P}\left(A|B\right)\mathbb{P}\left(B\right)
=
\mathbb{P}\left(B|A\right)\mathbb{P}\left(A\right)
$$

Which is just $\mathbb{P}\left(A\cap B\right)$

**Interpretations** 

Let's say A means: 
1. Someone has a rare disease. 

Let's say that B means: 
1. He got tested to have that rare disease. 

Then, let's see what this formula is trying to do: 

$$
\mathbb{P}\left(A|B\right)
$$

Probability of having that rare disease given that he got tested positive on that disease. 

$$
\mathbb{P}\left(A|B\right)
$$

Given that someone has a rare disease, the probability of he got tested to have that disease. This quantity depends on the accuracy of the test.  

$$
\frac{\mathbb{P}\left(B|A\right)
    \mathbb{P}\left(A\right)
}{\mathbb{P}\left(B\right)}
$$

People who actually have that disease and they actually got tested positive on that disease divides the totally number of people who have that rare disease. 

---
### **Naive Bayes**

However, it might be better to also consider the more general context. 

Ok, if you see something that is red, and you want to classify it, then you should have an idea of all the things that is red in your head. 

> It's unlikely water is red, because it's never observed, and it's highly likely that ripe apple is red, because that is observed a lot. This is Naive Bayes. The Naive part is the assumption that attributes are independent from each other. 

Assume 3 attributes are observed for classifying fruits: 
1. Length: $L$
2. Taste:  $T$ 
3. Color: $C$

Given that a fruit is long sweet and yellow, what is the probability that it's a banana? 

Written in math it's: 

$$
\mathbb{P}\left(F = \text{banana}
|
L = \text{long}\wedge T = \text{sweet} \wedge C = \text{Yellow}
\right)
\tag{1}
$$

That is the same thing as saying that, among all fruits that I have seen where it's long, sweet and yellow, what portion of them are bananas? 

Here, we assume that each observations on the random variable $L, T, C$ are independent random variables, hence, the probability of observing them at the same time it's just all of them multiplied together. 

And then the probability of (1) will be given by: 

$$
(1) :=
\frac{
    \mathbb{P}(L=\text{Long} \wedge T=\text{Sweet} \wedge C= \text{Yellow}|F=\text{Banana})
}{
    \mathbb{P}\left(L = \text{Long}\right)
    \mathbb{P}\left(T=\text{Sweet}\right)
    \mathbb{P}\left(C=\text{Yellow}\right)
}
$$

Numerator: Among all the bananas, how many of them are long, sweet and yellow. 
Denominator: How many of fruits are long, sweet, and Yellow? 

---
### **Multi-Labels Classifications**
