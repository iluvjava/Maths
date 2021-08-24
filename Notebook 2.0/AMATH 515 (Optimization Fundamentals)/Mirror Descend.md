Reference: [Stanford University](http://www.princeton.edu/~yc5/ele522_optimization/lectures/mirror_descent.pdf)
[[Gradient Descend 1]],[[Gradient Descend 2]]

TODO: Finish up Mirror Descend

---
### **Intro**

> Mirror Descend: Adjust gradient updates to fit problem geometry
> 
>       - Nemiovski & Yudin 1983

There are a lot of involvement for different types of distance metrics. But they all fall under one category of metric called 
**Bregman Divergence** [wiki link](https://en.wikipedia.org/wiki/Bregman_divergence). 

**Note**

The word distance metric will be used with cautions, because it has more axioms to satisfy than the word Divergence, which is much more generalized compare to the word distance metric. 

**Fact**

> Euclidean Distance is one of the Bregman Divergences. 

**Bregman Divergence** 

It's parameterized by a function $F$, and it takes 2 points and measures their divergence with function $F$. Lets denote $D_f(x, y)$ be the Bregman divergence for 2 points $x, y$. Here is a list of things about it: 

* Non-negative if $F$ is convex. 
* Convex in the first argument $p$. 
* Linearity 
$$D_{F1 + \lambda F_2}(p, q) = D_{F1}(p, q) + \lambda D_{F2}(p, q)$$ 
* Duality, the function $F$ is has a convex conjugate function, then: 
$$
D_{F\star}(\nabla F(p), \nabla F(q)) = D_F(p, q)
$$




---
### **Bregman Divergence, Smooth Gradient**


---
### **Examples of Bregman Divergence**


