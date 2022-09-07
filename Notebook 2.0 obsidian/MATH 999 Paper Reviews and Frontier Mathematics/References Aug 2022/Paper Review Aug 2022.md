Major References here: [[Proximal Algorithms in Stats and ML.pdf]], Bibtex

---
### **Intro**

We are not reading everything in details, but we are going to look at the paper: [[Proximal Algorithms in Stats and ML.pdf]]. The premise for most parts of the paper is: 
$$
\begin{aligned}
    f(x) = l(x) + \phi(x)
\end{aligned},
$$
and we are interested in minimization of $f$, where $l(x)$ is convex with Lipschitz Gradient and $\phi(x)$ is convex, but could be non-smooth with subgradient oracle. For implications and equivalences for function with globally Lipschitz gradient, visit: [[Global Lipschitz Gradient and its weaker Implications]]. This paper focuses on the use of following methods on penalties and composite penalties models (with $\phi(Bx)$ instead of $\phi(x)$): 
* ADMM. Related topics are now in [[ADMM]], some of them taken from this paper. 
* Proximal Methods .
	* Proximal Methods as a minimum on the majorizing functions.
	* Proximal Methods as a fixed point iteration schemes.
	* Proximal methods as gradient on the envelope. (Not mentioned?)
	* Proximal methods an operator splitting methods for solve gradient dynamical system. (Definitely ignored in the paper)
* Proximal interpretation for Envelope based methods.
	* 

For the Basics of proximal operators, see [[Moreau Envelope and Proximal Mapping]] for more context. 

**Interesting Highlights, Unexpected Comments and Claims**
1. > At 3.4, Nesterov accelerations is applicable to prox gradient algorithm. When $\phi$ is convex, the resulting proximal problem is strongly convex, which leads to better convergence. (cited [Zhan, Saha, Vishwananthan, 2010](https://arxiv.org/abs/1109.6058))
2. > At 3.1, if these conditions are met(refers $l$ being convex and smooth and $\phi$ being convex.), then the proximal gradient method converges at rate $1/t$ with fixed step size $\gamma=1/\gamma_l$. ([Amir Beck andMarc Teboulle](http://www.math.tau.ac.il/~teboulle/papers/gradient_chapter.pdf) 2010)
3. 

**Suggested Further Research Directions**






