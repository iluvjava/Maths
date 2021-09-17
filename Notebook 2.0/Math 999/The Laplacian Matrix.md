[[Hermitian Adjoint]]

---
### **Intro**

This matrix is used for graph related stuff, however, the name came from the Laplacian as $\partial_x^2 +  \partial_y^2$, the differential operator. This is the case because these to things are related. 

Not only that, this matrix has its application in deep learning, especially for graph related NeuroNet. 

Consider a graph $G = (V, E)$. The graph is undirected. Here we use the notation that $\deg{v_i}$ denotes the set of vertices which are the neighbours of vertex $v_i$. 

**Laplacian Matrix**

$$
(L)_{i, j} = 
\begin{cases}
    1 & v_{i} \in \delta(v_{j}) 
    \\
    -\text{deg}(v_i) & i = j
    \\
    0 & \text{else}
\end{cases} = (A - D)_{i, j}
$$

The dialgonal element of matrix $L$ is the degree of the vertex, and the non digonal ements are the weights/$\{-1, 1\}$, indicating the connections of the vertices in the graph. $D$ is $\text{diag} \leftarrow \text{deg}(V)$, a diagonal matrix of all the vertices's degree in the graph. 

**Consequences**

* The properties of Hermtian Matrices applies here. 

* The matrix is also positive-semi-definite, because $CC^T = L$ where $C$ is the incidence matrix. 

* The matrix is singular because: $L\mathbf{1}= \mathbf{0}$. All other eigenvector's components will have to sum up to $0$ because of this. 

---
### **Graph Fourier Transform**

The graph Fourier Transform make use of the Eigenspace of the matrix $L$. It's applied on any function mapping $V\mapsto \mathbb{R}$, and transform the function mapping $\{\lambda_l\}_{l = 1}^{|V|}$. These 2 sets have the same cardinality. 

Assuming that $\{\lambda_1, \lambda_2, \cdots \lambda_N\}$ are the set of eigenvalues for the matrix $L$, assuming that $u_l$ are the corresponding eigen vectors for $\lambda_l$, and assuming that they are ordered like $\lambda_1 < \lambda_2 < \cdots < \lambda_N$ and $N = |V|$. 

> **Definition**
> 
> $$
> \mathcal{GF}[f](\lambda_l) = \langle f,  u_l\rangle
> $$
> It's just a projection of the discrete functions onto that particular subspace. 


**Problem of Speed**

This is not easy to compte because solving for $U$, the eigenspace of the matrix $L$ would require about $\mathcal{O}(N^3)$. 

The idea of making a faster way to approximate has been invetigated in a paper titled [Wavelents on Graph Via Spectral Graph theory](https://arxiv.org/pdf/0912.3848.pdf), which is cited on multiple Deep learning papers on graph Neuro Networks. Here is the abstract (for easy indexing): 

> We propose a novel method for constructing wavelet transforms of functions defined on the vertices of an arbitrary finite weighted graph. Our approach is based on defining scaling using the the graph analogue of the Fourier domain, namely the spectral decomposition of the discrete graph Laplacian L. Given a wavelet generating kernel g and a scale parameter t, we define the scaled wavelet operator Ttg = g(tL). The spectral graph wavelets are then formed by localizing this operator by applying it to an indicator function. Subject to an admissibility condition on g , this procedure defines an invertible transform. We explore the localization properties of the wavelets in the limit of fine scales. Additionally, we present a fast Chebyshev polynomial approximation algorithm for computing the transform that avoids the need for diagonalizing L. We highlight potential applications of the transform through examples of wavelets on graphs corresponding to a variety of different problem domains.


---
### **Normalized Laplacian**

The Laplacian matrix is restricted in ways so it has a better spectrum to work with when we take the power of the matrix. There are 2 types of normalization usually apply to the matrix: 

* Symmetric Normalization
* Random Walks Normalization

**Symmetric**

$$
\begin{aligned}
    \widetilde{L} &= D^{-\frac{1}{2}}LD^{-\frac{1}{2}}
    \\
    (\widetilde{L})_{i, j} &= \begin{cases}
        -1 & i = j
        \\
        L_{i, j}\frac{1}{\sqrt{\text{deg}(v_i)\text{deg}(v_j)}}
        & \text{else}
    \end{cases}
\end{aligned}
$$

This aims to normalize the diagonal elements to 1 first, and for all the non-dialgonal elements, it normalize by the square root of the degree of connecting vertices. 

**Random Walks** 

$$
(L)_{i, j} = 
\begin{cases}
    1 & i = j \wedge \text{deg}(v_i) \neq 0 
    \\
    -\frac{1}{\text{deg}(v_i)} & v_i \in \delta(v_j) \wedge i \neq j 
    \\
    0 & \text{else}
\end{cases}
$$

