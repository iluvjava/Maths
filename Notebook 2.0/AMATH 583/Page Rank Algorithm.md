Currently, there are no references related to this in this MD database. 

But we will make use of [[Optimizing for Sparse Matrix Product]]

---
### **Intro**

The algorithm prioritize more important pages, and it will create such a ranking for pages and such. 

Consider a graph, where each node is the website and each arrow is the link from one page to the other page. 

Model the actions of users surfing the web, and we want to model is as a markov chain process, at the most basic level. 

The surfer will goes to any of the outgoing pages with some amount of probability, depending on where the surfer is currently looking at. 

There will be a steady state solution, for the markov path. 

The important sites will be visited more often than the other websites. 

**It's just a modeling a Markov process of web surfers on the internet, and then rank the pages using the steady state solutions of such a process**. 


---
### **Vector Representation**

For each link, create a vector $p$ that contains the probability of going from node $i$ to all other nodes. 

It's going to be mostly zeros. 

This is a stochastic vector, and the sum will add up to one, for all the nodes in the graph. 

Stack all the stochastic vectors in the the columns of the matrix, then, we have the transition matrix for the Markov Process. 

$$
x_{k + 1} = Px_{k}
$$

Where all the column sum of the matrix $P$ is one, and the sum of the vectors, including $x_0$ the initial vector is one.

**Math Theorems**

* All eigenvalues are in or on a circle of radius one for a markov transition matrix. 

* There is a unique eigenvalue at the spetral radius (There is exactly one eigenvector with 1 as its eigenvalues for this system of matrix vector equation). 

* The left eigenvector is the same as the right eigenvectors. 

**Computational Solution**

On wait, this is easy we can just use the power algorithm because the vector with the largest eigenvalues is unique, and it's the one we are looking for right? 

Yep!

To get the answer, we will do repeated matrix vector product instead of taking the power of the $p$ matrix, in addition, because the matrix $P$ is very sparse, this just make thing very simple. 

This is essentially a graph algorithm but using the idea of sparse matrix vector multiplications. 