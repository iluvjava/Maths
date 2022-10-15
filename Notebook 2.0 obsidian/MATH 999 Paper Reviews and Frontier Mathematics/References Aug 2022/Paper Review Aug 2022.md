Major References here: [[Proximal Algorithms in Stats and ML.pdf]]

---
### **Intro**

We are not reading everything in details, but we are going to look at the paper: [[Proximal Algorithms in Stats and ML.pdf]]. The premise for most parts of the paper is: 
$$
\begin{aligned}
    f(x) = l(x) + \phi(x)
\end{aligned},
$$
and we are interested in minimization of $f$, where $l(x)$ is convex with Lipschitz Gradient and $\phi(x)$ is convex, but could be non-smooth with subgradient oracle. For implications and equivalences for function with globally Lipschitz gradient, visit: [[Global Lipschitz Gradient and its weaker Implications, Smoothness]]. This paper focuses on the use of following methods on penalties and composite penalties models (with $\phi(Bx)$ instead of $\phi(x)$): 
* ADMM. Related topics are now in [[Introduction ADMM]], some of them taken from this paper. 
* Proximal Methods .
	* Proximal Methods as a minimum on the majorizing functions.
		* The has been already summarized in [[Introduction, Projected Proximal Gradient via MM]]. 
	* Proximal Methods as a fixed point iteration schemes. 
		* [[Proximal Point Method, Interpretations]]
	* Proximal methods as gradient on the envelope. (Not mentioned?)
		* In [[Proximal Point Method, Interpretations]], we discussed that proximal point method is just gradient descend on the Moreau envelope, where $\alpha$ is the step size. 
	* Proximal methods as ODEs solver for gradient dynamical system. (Definitely ignored in the paper)
		* [[Projected Proximal Gradient, Interpretations]]
* Envelope Method
	* NOT SURE WHAT THE INEQUALITIES ARE ALL ABOUT. 

For the Basics of proximal operators, see [[Moreau Envelope and Proximal Mapping]] for more context. 

Supplementary Papers: 
* the Stanford reference paper introduced in [[Introduction ADMM]]. 
* [this](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf) survey paper about the proximal mapping. 
* Dimitry's class, which contains a lot more theory about the proximal operator, please also take note of the references he is using. 
* Rockafellar, at the start of his book he also talks about prox. 

**Interesting Highlights, Unexpected Comments and Claims**
1. > At 3.4, Nesterov accelerations is applicable to prox gradient algorithm. When $\phi$ is convex, the resulting proximal problem is strongly convex, which leads to better convergence. (cited [Zhan, Saha, Vishwananthan, 2010](https://arxiv.org/abs/1109.6058))
2. > At 3.1, if these conditions are met(refers $l$ being convex and smooth and $\phi$ being convex.), then the proximal gradient method converges at rate $1/t$ with fixed step size $\gamma=1/\gamma_l$. ([Amir Beck andMarc Teboulle](http://www.math.tau.ac.il/~teboulle/papers/gradient_chapter.pdf) 2010)
3. > At 5.0: For instance, ADMM methods will be viewed as the gradient step of the dual FB envelope (No citations, but refers to section 6)
	1. > The method of multipliers was shown to be a special case of the  proximal point algorithm by Rockafellar \[141\]. Gabay \[81\] showed that  ADMM is a special case of a method called Douglas-Rachford split-  ting for monotone operators \[53, 112\], and Eckstein and Bertsekas  \[63\] showed in turn that Douglas-Rachford splitting is a special case  of the proximal point algorithm.
	> 
	> **Source**: \<Distributed Optimization and Statistical  
	Learning via the Alternating Direction  
	Method of Multipliers\>, pg 23. 
	> #INVESTIGATE #URGENT 
	> 
	> This paper: [link](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf), talks about the dynamical system interpretations of some of the methods. 
1. >For example, lasso can be viewed as a simple statistical model with the negative log-likelihood from $y=A x+\varepsilon$, where $\varepsilon$ is a standard normal measurement error, corresponding to the norm $l(x)=\|A x-y\|^2$, and each parameter $x_j$ has independent Laplace priors corresponding to the regularization penalty $\phi(x)=|x|$ (Refers to page 429, 224, machine learning a probabilistic perspective by Kevin P Murphy for more details). 
2. "Mimicking the Froward-Backwards approach, Patric Nost, [Lorenzo And Alberto (2014)](https://arxiv.org/abs/1407.6723) defines the Douglas Rachford (DR) envelope as: ", my question is, what is it mimicking from the Forward Backwards Envelope exactly? 



---
### **Suggested Further Research Directions**






