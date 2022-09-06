[[Coordinate Descend]]
We continue the saga for gradient descend, and here, we will be looking at another popular gradient descend algorithm used for machine learning. 

---
### **Intro**

We can't compute the loss easily, because we need to sum up the loss for all the samples in the training set. This is too huge to compute in the general sense. For just one gradient update on the parameters of the models. Similar to the spirit of Coordinate descend, where we only focus on one parameter at a time, instead of doing full gradient on all data, we are going to just draw one sample. And then, we update the gradient using just that one sample. 

---
### **Stochastic Gradient Descend**

$$
\mathbb{E}\left[\nabla_L(w)\right]
=
\sum_{i = 1}^{N}
    \mathbb{P}\left(I_t = i\right)\nabla l_i(w)
=
\frac{1}{n}\sum_{i = 1}^{N}
    \nabla l_i(w)
$$

---
### **Bounded Convergence**

Let: 

$$
w_{t+1} = w_{t}-\eta \nabla_wl_{I_t}(w)|_{w = w_t}
$$

To be one step of gradient update for the next gradient, for the sample $I_t$ and letting the gradient taking at the point $w_t$. Then if the initial $w_0$ and optimal $W_*$ is bounded by $R$, which is: 

$$
\Vert w_0 - w_*\Vert_2^2 \le R
$$

And for the loss of each sample, it's also bounded in the sense that: 

$$
\sup_w\max_i \left\lbrace
    \Vert \nabla l_i(w)\Vert_2^2
\right\rbrace\le G
$$

Then the deviance of the average of all the update made to the optimal parameter can be bounded in this way: 

$$
\mathbb{E}\left[l(\bar{w}) - l(w_*)\right]
\le \frac{R}{2T\eta} + 
\frac{\eta G}{2}
\le 
w\sqrt{\frac{RG}{T}}
$$

Where, $T$ is the number of iterations that we already went over the for each sample in the training set. And, $\bar{w}$ is the average of all the parameter we have iterated through during the iteration process. 

**Remarks**: 
Because it's stochastic, we can't really look at the last update, we need to analyze the average of all the parameters, and that will be bounded. In practice, people will use the last one, or the average of some iterations of parameters for the end of the iterations. 

---
### **Proof of Bounded Convergence**

Skipped because midterm I am busy, do this later whenever I have time. 

$$
\mathbb{E}\left[
    \Vert w_{t + 1}- w_*\Vert_2^2
    \right]
=
\mathbb{E}\left[
        \Vert 
            w_t - \eta \nabla l_{I_t}(w_t) - w_*
        \Vert_2^2
    \right]
\tag{1}
$$

$$
= 
\mathbb{E}\left[
        \Vert w_t - w_*\Vert_2^2
    \right] -
    2\eta 
    \mathbb{E}\left[
            \nabla l_{I_t}(w_t)^T(w_t - w_*)
        \right]
+ 
\eta^2 \mathbb{E}\left[
        \Vert\nabla_{I_t}(w_t) \Vert_2^2
    \right]
\tag{2}
$$

The third term is bounded by the constant $G$, which is in the hypothesis of the theorem. Let's take a closer look at the second term. The expected value of loss on one of the sample is the expected value on all the sample, therefore: 

$$
\mathbb{E}\left[\nabla l_{I_t}(w_t)(w_t - w_*)\right] = 
\mathbb{E}\left[\nabla l(w)^T(w_t - w_*)\right]
\tag{3}
$$

Now, we can apply the Jensen's Inequality, so we **assume** that the loss function is convex for the SGD, then: 

$$
\sim=
\mathbb{E}\left[\nabla l(w)^T(w_t - w_*)\right]
\ge 
\mathbb{E}\left[l(w_t) - l(w_*)\right]
\tag{4}
$$

Using expression (4), and substituting it back to expression (2), we will have: 


$$
\mathbb{E}\left[
        \Vert w_t - w_*\Vert_2^2
    \right] -
    2\eta 
    \underbrace{\mathbb{E}\left[
            \nabla l_{I_t}(w_t)^T(w_t - w_*)
        \right]}_{\ge\mathbb{E}\left[l(w_t) - l(w_*)\right]}
+ 
\eta^2 \mathbb{E}\left[
        \Vert\nabla_{I_t}(w_t) \Vert_2^2
    \right]
\tag{5}
$$

Subtracting a smaller quantity made it bigger. 

$$
\underset{(1)}{\sim} \le
\mathbb{E}\left[
        \Vert w_t - w_*\Vert_2^2
    \right] 
-
    2\eta \mathbb{E}\left[l(w_t) - l(w_*)\right]
+ 
\eta^2 \mathbb{E}\left[
        \Vert\nabla_{I_t}(w_t) \Vert_2^2
    \right]
\tag{6}
$$

Expression (1) is less than the above quantity. Therefore, we have: 

$$
2\eta \mathbb{E}\left[l(w_t) - l(w_*)\right] 
\le
\mathbb{E}\left[
        \Vert w_t - w_*\Vert_2^2
    \right] 
+ 
\eta^2 \mathbb{E}\left[
        \Vert\nabla_{I_t}(w_t) \Vert_2^2
    \right]
- 
\mathbb{E}\left[\Vert w_{t + 1} - w_*\Vert_2^2\right]
$$


$$
\mathbb{E}\left[l(w_t) - l(w_*)\right] 
\le \frac{1}{2\eta}
\left(
    \mathbb{E}\left[
            \Vert w_t - w_*\Vert_2^2
        \right] 
    + 
    \eta^2 \underbrace{\mathbb{E}\left[
            \Vert\nabla_{I_t}(w_t) \Vert_2^2
        \right]}_{\le G}
    - 
    \mathbb{E}\left[\Vert w_{t + 1} - w_*\Vert_2^2\right]
\right)
$$

And now this is getting better, the next step is to take the average on the loss of all the parameters gotten during the SGD. So the quantity we are interested in is: 

$$
\sum_{t = 1}^{T}
        l(w_t) - l(w_*)
\le
\frac{1}{2\eta} 
\left(
        \Vert w_1  - w_*\Vert_2^2
        -
        \Vert w_2  - w_*\Vert_2^2
        + 
        \Vert w_2  - w_*\Vert_2^2
        - 
        \Vert w_3  - w_*\Vert_2^2
        \cdots 
        - 
        \Vert w_{T + 1} - w_*\Vert_2^2
\right) + \cdots
$$

We are purposefully ignoring the expectation operator, because you know the drill. You see, some of the terms on the rhs of the inequality has a circular cancelation patterns, therefore we can confidently say that: 

$$
\sum_{t = 1}^{T} \mathbb{E}\left[
        l(w_t) - l(w_*)
    \right]
\le
\frac{1}{2\eta}
\left(
    \underbrace{\mathbb{E}\left[
            \Vert w_1 - w_*\Vert_2^2
        \right] 
    -
    \mathbb{E}\left[\Vert w_{t + 1} - w_*\Vert_2^2\right]}_{< R}
    + 
    T\eta^2 G
\right)
$$

Ok, why $\le R$? Here we make the assumption that $\Vert w_1 - w_*\Vert_2^2 \le R$, then it can be said that: 

$$
\Vert w_1 - w_*\Vert_2^2 - \Vert w_{t+1} - w_*\Vert_2^2 \le \Vert w_1 - w_*\Vert_2^2 \le R
$$

Therefore, the same can be applied to the expectation value of these things, and in the end, we will be having: 

$$
\sum_{t = 1}^{T} \mathbb{E}\left[
        l(w_t) - l(w_*)
    \right]
\le
\frac{1}{2\eta}
\left(
    R
    + 
    T\eta^2 G
\right) \le \frac{R}{2\eta} + \frac{T\eta G}{2}
$$

And, there is an optimal value of $\eta$ we can find by taking the derivative, and then, we can find the minimum value that can bound the gradient descent. However, there is one missing piece here, the theorem stated the boundedness of the average of all the parameters, but here, the average cannot be seen. More importantly, we cannot just take out the expected operator in this case, because $w_{t+ 1}$ very much depends on what the value for $w_t$ is. And that is when we use the convexity assumption of the loss function and the **Jensen's Inequality** to get there. 

---
### **Jensen's Inequality**

For any random $Z\in\mathbb{R}^d$, and convex function $\phi: \mathbb{R}^d \mapsto \mathbb{R}$ we have: $\phi(\mathbb{E}[Z])\le \mathbb{E}[\phi(Z)]$. The function value is always less than the line/hyperplane that interpolate points on the domain. 
This inequality is used to help to prove this inequality: 

$$
\mathbb{E}\left[
        l(\bar{w}) - l(w_*)
    \right]
\le 
\frac{1}{T}\sum_{t = 1}^{T}
    \mathbb{E}\left[l(w_t) - l(w_*)\right]
$$

Which appeared in the previous analysis on the boundedness of the Stochastic Gradient Descend Algorithm. The intuition behind the Jensen's inequality is simple, take a look at the convex definition of a function: 

$$
f(tX_1 + (1 -t)X_2)\le f(X_1) + (1 - t)f(X_2)
$$

And if we just let the variable $X_1, X_2$ be drawn from the domain of the function and randomly drawn, then: 

$$
\phi(\mathbb{E}\left[X\right])
\le 
\mathbb{E}\left[\phi(X)\right]
$$

---
### **Mini-Batch SGD**

Instead of optimizing on each sample, in practice, will update on batches. This will produce smaller variance on the model. At the same time, the process is highly parallelizable. 



