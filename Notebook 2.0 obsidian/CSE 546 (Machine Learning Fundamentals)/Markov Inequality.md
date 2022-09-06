Tail bound of a random variable, the variable we are interested is the MLE estimator. 


---
### **Intro**

We can bound the probability of observing a MLE from experiment. And this will be global to all MLE experiments. 

The question we can answer with it is: 

What is the probability of observing an MLE $\hat{\theta}$ that is $\epsilon$ away from the true MLE? 

$$
\mathbb{P}\left(\left|
    \hat{\theta} - \mathbb{E}\left[\hat{\theta}\right]
    \right|
    \ge \epsilon
    \right)
$$

That. 

---
### **Markov Inequality**

For any $t\ge 0$ and **non-negative** random variable $X$, we have: 

$$
\mathbb{P}\left(X \ge t\right) \le 
    \frac{\mathbb{E}\left[X\right]}{t}
$$

Which is equivalent to: 

$$
1 - \mathbb{P}(X\le t) \le \frac{\mathbb{E}\left[X\right]}{t}
$$

And this inequality can be used to bound the MLE. 

This is saying that, using the expected value of a random variable, the probability of observing random variable above some threshold is bounded by the Expected value of the random variable. 

Question: What if one of the random variable is not always positive? 
Then we consider: 

$$
\mathbb{P}\left(X^2 \ge t\right) \le 
\frac{\mathbb{E}\left[X^2\right]}{t}
$$

And, we will need to take care of it by knowing the PDF/PMF for the random variable $X^2$ before using the Markov Inequality. 

