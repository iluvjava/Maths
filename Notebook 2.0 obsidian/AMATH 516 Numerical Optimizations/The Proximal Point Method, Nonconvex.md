- [Proximal Point Method, Interpretations](Proximal%20Methods/Proximal%20Point%20Method,%20Interpretations.md)
- [Bregman Proximal Mapping](Bregman%20Proximal%20Mapping.md)


---
### **Intro**

The proximal point method is a framework of understanding optimization algorithm in general. 
It was proposed By Rockafellar back in 1970. [^1]
The algorithm simply apply the proximal operator repeatedly. 
This is expected to converge to the minimal when the function is convex because of its backward Euler Interpretation from the dynamical system point of view, the gradient descent on the Moreau Envelope interpretation. 
However, it's referred to as a theoretical framework because solving the proximal operator for a given function is just as hard as minimizing the function itself. 
As a results, proximal point method used a theoretical tool, and in practice, people look for ways to estimate the proximal point method under different context and assumptions. 

---
### **The Convergence of the Proximal Point Method**

The literature we are referencing here is Attouch, Bolte[^2]. 




[^1]:R. T. Rockafellar, “Monotone Operators and the Proximal Point Algorithm,” _SIAM J. Control Optim._, vol. 14, no. 5, pp. 877–898, Aug. 1976, doi: [10.1137/0314056](https://doi.org/10.1137/0314056).
[^2]: H. Attouch and J. Bolte, “On the convergence of the proximal algorithm for nonsmooth functions involving analytic features,” Math. Program., vol. 116, no. 1, pp. 5–16, Jan. 2009, doi: 10.1007/s10107-007-0133-5.

