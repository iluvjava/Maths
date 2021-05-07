Here we will be highlighting some of the inner structure of kenel machines and the idea behind it. 

Here are some other things in the vault that uses the idea of kernel. 
[[Kernel PCA]], [[SVM]], [[SVM and Kernels]]

Here are some good resource for explanation of Kernel Trick using the classic Linear regression model: [here](https://www.cs.cornell.edu/courses/cs4780/2018fa/lectures/lecturenote14.html)


---

### **Intro**

Kernels provides a fast way of computing high dimensional features. 

Kernels provides a way to compute implicit features mapping, like the case with the radial Gaussian Basis for SVMs. 

A kernel is a function that can take the inner product given 2 instance of samples from the data: 

Let $K: \mathbb{R}^{d}\times \mathbb{R}^{d} \mapsto \mathbb{R}$, then the function $K$ will be a kernel function when: 

$$
K(x_1, x_2) = \langle \phi(x) \phi(x_2)\rangle
$$

Where the function $\phi(x)$ is a mapping from the lower dimensional feature space to a higher dimensional feature space.

---
### **Direct Expansion on Linear Features**

In the case of using a polynomial to introduce non-linearity, we face the problem of large number of computations to achieve that. 

Suppose that there are 2 features, and I want 3 degree polynomials, then there will be 4 of them in total. Basically this is a [[Stars And Bars]] problem, all 
$x_1^ax_2^b$ where $a + b = p$ and $a, b$ are integers are a valid high dimensional features. 

And this grows very quickly. 

Therefore it's not good to computing that, but if we only need to compute the inner product, then we can just do $(y_1 + y_2)^p(x_1 + x_2)^p$ where $x, y$ are 2 of the samples drawn. 

**And this is one of the motivation behind Kernel Machine**

**Well Defined Kernels**: 




---
### **The Kernel Trick on Linear Regression**



 