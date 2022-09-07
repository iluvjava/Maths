Continuing on [Feature Extraction and Data](Feature%20Extraction%20and%20Data.md)

This time we are going to focus on text data. 

---
### **Intro**

There are a lot of ways to do NLP. 

But most of them centered around the idea of dimensaionality reduction. 

And we can also augment some of the ideas in NLP into sequential Data features extraction. 

Time series analysis and stuff like that. 

---
### **World 2 Vec**

I call this a classification approach: 

Let's suppose that we have all the English words. 

Let's suppose that we were also given English Corpus for training. In the form of sentences of words. 

Let the data be $\{x_i, y_i\}_i$ denoting the occurrence of words $x_i$ and the word next to $x_i$, which is $y_i$. 

The embedding is obtained by using the latent space of some deep Neural Network. 

The input of the Neural Network is a Canonical Basis vector $e_j$ representing a world in the dictionary. And the output is the next word $y_i$, trained under regression loss would be ok. The embedding is the latent space of the Neural Network, choose whatever you want but make sure it's smaller than the input space of $x_i$. 

Train Deep Neural Net $f, g$ such that: 

$$
\min_{f, g} \sum_{i = 1}^{N}\Vert y_i - f(g(x_i))\Vert_2^2
$$

Then the embedding are $y = g(x_i)$. 

Using this embedding, one can predict the probability of a word $x_i$ being close to $x_j$ using: 

$$
\text{softmax}\left(
    g(x_i)^Tg(x_j)
\right)
$$

This is why I call this a classification approach. 

But the embedding is useful by itself.

---
### **LDA and NMF**

**NMF: Non-Negative Matrix Factorization**

These methods are used for topics identification over topic labels for each document. 

Here we assume that a distribution of certain words in the dictionary represents a topic. 

Let the matrix $X$ be the data matrix where each row represent each document and the content of each row is the distribution of dictionary words. 

$$
X[i, j] = \frac{\#\text{time word } x_j \text{ appeared in doc } d_i}{\text{Total words in }d_i}
$$

Consider the following matrix decomposition that minimizes the squared errors on the given data matrix. 

$$
\arg\min_{W\ge\mathbf{0},H\ge\mathbf{0}} \Vert X - WH^T\Vert_2^2
$$

The problem is to look for a factorization of matrix $X$ by 2 positive matrices, $W$, representing the weight of each topics, and columns in $H$ representing a topic for all the documents. 

Using the otter product interpretation, the columns of $W$ is used to span the columns of matrix $X$, and the column of Matrix X represents the distribution of a particular word or different documents. 

**My Best Interpretation**:

$X[i,:] = W[i,:]H^T$ or $X[i, :]^T = HW[:,i]$ reconstructs words distribution of a particular document in the sample. The $i$ th row of the $W$ matrix represent a linear combinations of the rows of $H$, which is a typical word distribution of a given topic. 

Note, The problem becomes equivalent to k-mean cluster if $HH^T = I$ constraints are added. [^1]


**LDA: Latent Dirichlet Association** 

I cannot understand it. Skip. 



---
### **BERT**

This is the neural architecture behind GPT and involves multi-head attention modules. 

**BERT: Bidirectional Encoder Representation from Transformer**. 





---
### **Makov Property and Time Dependent Data**

$$
x_{t + 1} = f(x_{t}, h_t)
$$

Hay this is like a dynamical system. 

The next state of the system is predicted by the previous state and a latent state of the system from the previous state. 

This idea is tightly linked to the idea of hidden markov chain. 

A simple RNN has the following form: 


---
### **LSTM**



---
### **Some Resources**

RNN from [Dive into Deep Learning](http://d2l.ai/chapter_recurrent-neural-networks/rnn.html)



[^1]: This is from [wiki](https://www.wikiwand.com/en/Non-negative_matrix_factorization)