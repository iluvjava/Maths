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

In the case of using a polynomial to introduce non-linearity, we face the problem of large number of computations to achieve that: 

---
### **The Kernel Trick on Linear Regression**



 