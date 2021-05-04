[[Coordinate Descend]]
We continue the sage for gradient descend, and here, we will be looking at another popular gradient descend algorithm used for machine learning. 

---
### **Intro**

We can't compute the loss easily, because we need to sum up the loss for all the samples in the training set. 

This is too huge to compute in the general sense. For just one gradient update on the parameters of the models. 

Similar to the spirit of Coordinate descend, where we only focus on one parameter at a time, instead of doing full gradient on all data, we are going to just draw one sample. 

And then, we update the gradient using just that one sample. 

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

To be one step of gradient update for the next gradient, for the sample $I_t$ and letting the gradient taking at the point $w_t$. 

Then if the initial $w_0$ and optimal $W_*$ is bounded by $R$, which is: 

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

Where, $T$ is the number of ierations that we already went over the for each sample in the training set. 

And, $\bar{w}$ is the average of all the parameter we have iterated through during the iteration process. 

**Note**: 
Because it's stochastic, we can't really look at the last update, we need to analyze the average of all the parameters, and that will be bounded. 

In practice, people will use the last one, or the average of some iterations of parameters for the end of the iterations. 

---
### **Proof of Bounded Convergence**

Skipped because midterm I am busy, do this later whenever I have time. 


---
### **Jensen's Inequaltiy**

It's statistics mixed with convex analysis. 

for any random $Z\in\mathbb{R}^d$, and convex function $\phi: \mathbb{R}^d \mapsto \mathbb{R}$ we have: $\phi(\mathbb{E}[Z])\le \mathbb{E}[\phi(Z)]$. 

The function value is always less than the line/hyperplane that interpolate points on the domain. 

This inequality is used to help to proove this inequality: 

$$
\mathbb{E}\left[
        l(\bar{w}) - l(w_*)
    \right]
\le 
\frac{1}{T}\sum_{t = 1}^{T}
    \mathbb{E}\left[l(w_t) - l(w_*)\right]
$$

The intuition bethind the Jensen's inequality is simple, take a look at the convex defintion of a function: 

$$
f(tX_1 + (1 -t)X_2)\le f(X_1) + (1 - t)f(X_2)
$$

And if we just let the variable $X_1, X_2$ be drawn from the domain of the function and randomly dran, then: 

$$
\phi(\mathbb{E}\left[X\right])
\le 
\mathbb{E}\left[\phi(X)\right]
$$

---
### **Mini-Batch SGD**

Instead of optimizing on each sample, in practice, will update on batches. This will produce smaller variance on the model. At the same time, the process is highly parallelizable. 



