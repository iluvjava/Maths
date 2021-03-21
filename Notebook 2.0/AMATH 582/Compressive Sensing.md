Reference Lecture Video: [link](https://www.youtube.com/watch?v=rt5mMEmZHfs&feature=youtu.be&ab_channel=NathanKutz)

Looking for sparse representation, and it's application in signal processing. 

---
### Intro

We are interested in reconstructing the signal with some sub-sampling, or deblur, or, denoise the signal. 

The key is to look for a sparse representation of the image/signals under some basis. 

Suppose we sub-sample a signal, and then we are trying to reconstruct the signal using as few frequencies as possible. 

**Step 1**: 

The function is a representation of some known basis, and it's compressible under that basis. 
$$
f = \Psi c
$$ 
Where the basis matrix is $\Psi$ and the $c$ vector are the coefficients, they are going to represent the loading of the basis vector. 

The $c$ vector is sparse, mostly zero, representing the fact that our function is compressible under the basis $\Psi$. 

**Step 2**: 

$$
b = \Phi f
$$

Let $b$ be the sub-sampling vector, by which we mean that, it's a down-sample of the given signal $f$, and the matrix $\Phi$, is a matrix that is mostly zeros, with few ones as its entry. This matrix down-sample the signal f. 

**Step 3**

The down sample vector can be represented as: 

$$
b = \Phi f = \Phi \Psi c = Ac \quad \text{where: } A = \Phi\Psi
$$

This is an basic Linear algebra problem. 


So the question we are answering is: 
* How do I represent the signal using as little basis vector as possible such that if I down sample the signal, I will get what I observed to be (The $b$ vector)? 


**Shannnon Nyquist**: 

We have to sample, at least 2 times more points, for a given frequency signal in order to get it shows up after FFT. 

We have to sample at least 2 times faster than the signal. 

**Wiki Image Demo**: 

![](Orthogonal_Matching_Pursuit.gif)

---
### MATLAB Demo

Scenario
> We were given a sup-sampled signal, random points were queried in the signal, we want to use the idea of compressive sensing to reconstruct the signal. We assume that signal consist just few Fourier Component. 

