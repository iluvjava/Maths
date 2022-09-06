This part we are going to see some of the theories that are behind the computational method used for ICA. 

Reference Lecture video: [Lecture Link](https://www.youtube.com/watch?v=olKgmOuAvrc&feature=youtu.be&ab_channel=NathanKutz)

[[Independent Component Analysis]]

---
### Recap 

We have $s_1$, $s_2$ to be the original signal that we are trying to separate. And $x_1, x_2$ are the channels of signals that we are getting receiving from the sensor. 

$$
x = As
$$

And the the we are trying to reverse the affect of $A$, the mixing matrix. 

Let's say that: 

$$
A = U\Sigma V^T
$$

By understanding the SVD, we are going to figure out how to reverse it. 

1. $V^T$ This is a rotation matrix, it's going to take the signal, projecting it to the basis. 
2. $\Sigma$ is the matrix that stretches things
3. $U$ is the matrix that rotates in the domain of the principal components. 

Somehow, we need to undo the whole process with some help from variances. 

Intuitively: 
1. We pick up the vector (A subspace) with the most amount of **variances**, and that will be the effect of the stretching down by the principal component. (Unwrapping $U$ and principal $\sigma$)
2. That vector we pick will help use rotated back the whole data set. 
3. We minimize the **kurtosis** of the distributions, reversing the effect of $V^T$ matrix (Approximately). 

Notice that, we made the assumption that $A$ is likely to be some kind of random matrix. Because that is the way that, the matrix $A$ can have these kind of principal structure to it, $\sigma$ is not all equal, and the transformation is not special. 


---
### SVD 

Assuming that the signal is not correlated, then it can be said that: 
$$
P(s_1\cap s_2) = P(s_1)P(s_2)
$$

They have joint probability, this is assumed from the signals we are receiving. 

#### **Principal Axis Reversal**

Calculate the variance as a function of the projection ont the a vector, in 2D with angle $\theta$. 

$$
\text{var}(\theta) :=
\sum_{j = 1}^{N}\left(
    \begin{bmatrix}
        \cos(\theta) \\ \sin(\theta)
    \end{bmatrix}^T
    \begin{bmatrix}
        x_1(j) \\ x_2(j)
    \end{bmatrix}
\right)^2 = \sum_{j=1}^{N}\left(
    x_1^2\cos^2(\theta) + 2x_1 x_2 \sin(\theta)\cos(\theta) + x_2^2 \sin^2(\theta)
\right)
$$

The variance is computed by projecting the information onto a principal axis in 2D, and it's just simple vector $[\cos(\theta) \sin(\theta)]$

Objective: 

Finding the $\theta$ that gives the maximal variance. And notice that, we know that the 2 of the principal axis is orthogonal, that means we have $\theta$ for the major principal axis and $\theta - \pi/2$ for the minor principal axis. Notice that, it doesn't matter wether we find the max or min. in 2D, it's always gonna be one of the major/minor principal axis. 

Taking the derivative we have: 

$$
\frac{d}{d\theta} \text{var}(\theta)
=
\sum_{j = 1}^{N}\left(
    (x_2^2(j) - x_1^2(j))\sin(2\theta) + 2x_1(j)x_2(j)\cos(2\theta)
\right) = \Vert x_1 - x_2\Vert^2\sin(2\theta) + 2(x_1x_2)\cos(2\theta)
$$

And notice that: 

$$
\frac{d}{d\theta} \text{var}(\theta) = 0 \implies 
\tan(2\theta) = \frac{-2(x_1x_2)}{\Vert x_1 - x_2\Vert^2}
$$

And notice that the angle for the major/minor principal axis is going to be like: 

$$
\theta^+ := \frac{1}{2}\arctan 
\left(
    \frac{-2(x_1x_2)}{\Vert x_1 - x_2\Vert^2}
\right)
$$
Notice that, The dot product is like the covariance, and the second component here is like the variance between the difference between the signal. 

Ok, now we have decoded the effect of $U$ using the principal components of the transformation, the rotation matrix now can be summarized to be: 

$$
U = \begin{bmatrix}
    \cos(\theta^+) & -\sin(\theta^+) \\[0.5em]
    \sin(\theta^+) & \cos(\theta^+)
\end{bmatrix}
$$

And it's not hard to see that that transpose of the thing is going to be $U^T$ which is just the inverse transformation. 

Now, we have: 

$$
U^T x = \Sigma V^T s
$$


#### **Singular Value Reversal**

Now, we need to undo the stretching created by the stretching of the singular values of the matrix. 

$$
\Sigma = \begin{bmatrix}
 \sigma_1 & 0 \\ 0 & \sigma_2
\end{bmatrix}
$$

And the inverse is trivial. **What actually sits there is the variance of the signal square rooted**. 

This means that: 

$$
\Sigma = \begin{bmatrix}
    \sqrt{
    \sum_{j = 1}^{N}\left(
            \begin{bmatrix}
                \cos(\theta^+) \\ \sin(\theta^+)
            \end{bmatrix}^T
            \begin{bmatrix}
            x_1 \\ x_2
            \end{bmatrix}
        \right)^2
    } & 0 \\[1.1em]
    0 & 
    \sqrt{
    \sum_{j = 1}^{N}\left(
            \begin{bmatrix}
                -\sin(\theta^+) \\ \cos(\theta^+)
            \end{bmatrix}^T
            \begin{bmatrix}
            x_1 \\ x_2
            \end{bmatrix}
        \right)^2
    }
\end{bmatrix}
$$

And that inverse computations is kinda trivial. 

#### **Undo The Unitary Transformation**

Under the framework made with the matrix $U$, the effect signal is not statistically independent. 

Let's define that transformed signal from the previous 2 step to be: 

$$
\begin{bmatrix}
    \widetilde{x}_1\\\widetilde{x}_2
\end{bmatrix}
=
U^T\Sigma^{-1}\begin{bmatrix}
    x_1 \\ x_2
\end{bmatrix}
$$

What is Krutosis: 

This is a statistical measure on the peakness of a given probability distribution. 

Kurtosis: 

$$
\text{kurt}(\phi) = \sum_{j = 1}^{N}\left(
        \frac{
            \left(
                \begin{bmatrix}
                    (\widetilde{x}_1)_i \\ (\widetilde{x}_2)_j
                \end{bmatrix}^T
                \begin{bmatrix}
                \cos{\phi} \\ \sin\phi
                \end{bmatrix}
            \right)^4
        }{
            (\widetilde{x}_1)_j^2 + (\widetilde{x}_2)_j^2
        }
    \right)
$$

And, we make the assumption that, under the alternative basis that describes the signal, the kurtosis is maximized (VERY VERY PEAK). 

What is the intuition here? How is the signal represented in the 2D space and what kind of geometry does it went through? 

1. For each $(\widetilde{x}_{1, i}, \tilde{x}_{2, i})$  in space, we are projecting into another space, and measuring the kurtosis of the projected space. 
2. The signal has the shape of a square, center at the origin
3. But the square has underwent a unitary transformation. 
4. We need to find the axis to project onto such that, kurtosis is maximized. And that is the diagonal of the square. 

And then we take the derivative as usual and then solve for it when it's set to zero. Which is not easy. 

But it's the Prof Kutz book, data modeling page 422, 423. The results however, it's beautiful and can be summarized in polar coordinate too:

In vector form: 
$$
\phi^+ = \frac{1}{4}\arctan 
\left(
    -\sum_{j = 1}^{N}\left(
        \frac{
            2 \widetilde{x}_{1,j}^3 - 2\widetilde{x}_{2, j} - 2 \widetilde{x}_{1, j} \widetilde{x}_{2, j}^3
        }{
            \sum_{j = 1}^{N}\left(
                    3 \widetilde{x}_{1, j}^2 \widetilde{x}_{2, j}^2 - 
                    \widetilde{x}_{1, j}^4/2 - \widetilde{x}_{2, j}^4/2
                \right)
        }
        \right)
\right)
$$

And it happends to be: 

$$
\phi^+ := \frac{1}{4} \arctan \left(
    \frac{
        \sum_{j = 1}^{N}\left(r_j^2 \sin(4\varphi_j)\right)
    }{
        \sum_{j = 1}^{N}\left(r_j^2 \cos(4\varphi_j)\right)
    }
\right)
$$

And this is the code that is going to be in matlab, so that matlab can find it for us. 

Or you know, use the optimization package, it's a scalar optimization problem, shouldn't be too bad to solve it that way too. 