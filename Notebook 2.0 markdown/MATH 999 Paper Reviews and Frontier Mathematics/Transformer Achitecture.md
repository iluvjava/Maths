Reference Resources: 

[link](https://towardsdatascience.com/transformers-explained-visually-part-3-multi-head-attention-deep-dive-1c1ff1024853)

Medium Article: 
[Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/)

Youtube Video:
[Transformer](https://www.youtube.com/watch?v=XSSTuhyAmnI)

---
### **Intro**

This is widely used in a lot of places. It's originally designed for NLP tasks, but it's used everywhere. 

For NLP, it's used in GPT the generative model, and BERT, a sequence to sequence model. 


**Motivations** 

* A long range dependency that can remember sentence in the input article. 
* For long sequences, we want to parallize the training procedures. 


**There are 2 parts to the model**

* The encoder
* The decoder

![transformer architecture](../transformer%20architecture.png)

Original Paper: [**Atetntion is All You Need**](https://arxiv.org/abs/1706.03762)

To understand the model, thorougly, we will need some substantial efforts. 

Vocab: 
* "Word" and "Symbol" are used interchangbly, they are basically the entities in the sequence of stuff that we are modeling on. 
* 

---
### **Self-Attention**

> The self attention module takes in sequences of word embeding vectors, outputing a matrix with the number of rows equals to the length of the sentence, and the number of columns equal to the length of the vector embedding the word. 
> Each word embedding gives a dimension, so will the number of symbols in the given symbols. 

* Let $d_w$ be the length of the vector for the embedding for each word/symbols in the intput sequence. 
* Let $d_s$ be number of symbols/word in the input sequence. 
* The input is a sequence of vectors. Denoted with $x^{(i)}$. 
* The output vector has the same number of elements as the number of words/symbols in the sequence. 


**A set of $q,k,v$ vectors are associated with each word in the sequence. let's denote with super script** $(i)$ to represent the, the vector is associated with the $i$th word in the sequence. To produce these, $q, k, v$ representations for each word, we need a set of weight matrices for each word. All of which are trainable paramters. 
 
$$
\begin{aligned}
    q^{(i)} &= W^{\langle q \rangle(i)}x^{(i)}  & q\in \mathbb{R}^{d_s}  
    \\
    k^{(i)} &= W^{\langle k \rangle(i)}x^{(i)}  & k\in \mathbb{R}^{d_s}  
    \\
    v^{(i)} &= W^{\langle v \rangle(i)}x^{(i)}  & v\in \mathbb{R}^{d_s}  
\end{aligned}
$$

The $q, k$ vectors are then stacked together to form a matrix. 

$$
\begin{aligned}
    Q = \begin{bmatrix}
        (q^{(1)})^T \\ (q^{(2)})^T \\ \vdots \\ q^({(d_s)})^T
    \end{bmatrix}
    & \hspace{1em}
    K = \begin{bmatrix}
        (k^{(1)})^T \\ (k^{(2)})^T \\ \vdots \\ k^({(d_s)})^T
    \end{bmatrix}
    & \hspace{1em}
    V = \begin{bmatrix}
        (v^{(1)})^T \\ (v^{(2)})^T \\ \vdots \\ v^({(d_s)})^T
    \end{bmatrix}
    \\
    Q \in \mathbb{R}^{d_s\times d_s}
    & \hspace{1em}
    K \in \mathbb{R}^{d_s\times d_s}
    & \hspace{1em}
    V \in \mathbb{R}^{d_s\times d_s}
\end{aligned}
$$

**The attention for each word in the sequence**

This quantity is a vector. 

It represents the association of each word in relations to other words in that sequence. 

This is the operations: 

$$
\text{softmax} \left(
    \frac{q^{(i)}K^T}{\sqrt{d_s}}
\right)v^{(i)}
$$

This outputs a vector representing the attention of a given word. It's telling us the closeness of the given word to words in the rest of the sentence. 


**Vectorizing for All Words in the Sequence**

The $Q, K$ matrices are associated with each, one, single, attention module. They are containers for the set of trainable parameters for each or the word, a way of vectorizing everything. 

The whole process can be vectorized for each word into one expression: 

$$
Z = 
\begin{aligned}
    \text{softmax}\left(
        \frac{QK^T}{\sqrt{d_s}}, \text{dims} = 2
    \right) V
\end{aligned}
$$

**Softmax**: The function is boardcasted on each row of the input matrix, and for each row it outputs a vector with the same length. Therefore the intput dimension equals the output dimension after the softmax function. (**This is assumed by me after observing the illustrated materials**)

The division is made with the intented to magnify the effects of derivative when the sequence is very long. 

The matrix $V$ is weighting the output and summing them. This is like a weighted average of the softmax output. Not sure why. 

The output dimension of a single attention module is a matrix that is $d_s\times d_w$.


This part is cross referenced using both materials listed on the header, and [Illustrated Attention](https://towardsdatascience.com/illustrated-self-attention-2d627e33b20a)

Remaining Question: 

> How do we interpret the attention module? 


---
### **Multi-Head attention**




---
### **Residual Normalization**



---
### **Positional Encoding**


---
### **Masking**

