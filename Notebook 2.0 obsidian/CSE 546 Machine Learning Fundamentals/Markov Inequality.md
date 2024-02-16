Tail bound of a random variable, the variable we are interested is the MLE estimator. 


---
### **Intro**

We can bound the probability of observing a MLE from experiment.
And this will be global to all MLE experiments. 
The question we can answer with it is: What is the probability of observing an MLE $\hat{\theta}$ that is $\epsilon$ away from the true MLE? 

$$
\mathbb{P}\left(\left|
    \hat{\theta} - \mathbb{E}\left[\hat{\theta}\right]
    \right|
    \ge \epsilon
    \right)
$$

That equation is the Markov Inequality and it's useful for bounding the error probabilistically for an MLE estimate. 

---
### **Markov Inequality**
Markov inequality gives an upper bound on the probability of observing a non-negative random variable being larger than the distribution mean. 

#### **Thm | The Markov Inequality**
> For any $t\ge 0$ and a non-negative random variable $X$, we have: 
> $$
> \begin{aligned}
>     \mathbb{P}\left(X \ge t\right) 
>     &\le 
>     \frac{\mathbb{E}\left[X\right]}{t}
>     \\
>     1 - \mathbb{P}(X\le t) 
>     &\le \frac{\mathbb{E}\left[X\right]}{t}
> \end{aligned}
> $$


**Observations**

When a random variable may not be non-negative, one can consider the bound. 
$$
\mathbb{P}\left(X^2 \ge t\right) \le \frac{\mathbb{E}\left[X^2\right]}{t}
$$
Next, observe that the error of the estimated MLE from the theoretical mean now has representation 

$$
\begin{aligned}
    \mathbb{P}\left( \left|
            \hat \theta - \mathbb{E}\left[\hat \theta\right] 
        \right|
        \ge \epsilon
    \right)
    \le 
    \frac{
        \mathbb{E}
        \left[
            \left|\hat \theta - \mathbb{E}\left[\hat \theta\right] \right|
        \right]
        }{\epsilon}
\end{aligned}
$$

