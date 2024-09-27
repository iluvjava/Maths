- [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)
- [A Better Proof for FISTA Convergence](A%20Better%20Proof%20for%20FISTA%20Convergence.md)

---
### **Intro**

To understand this file, we must first read [PPM AG Preludes](PPM%20AG%20Preludes.md). 
In this file: 
1. Introduce a (Proximal Point Method) PPM interpretation of (Accelerated Proximal Gradient) APG
2. Show that several of real world algorithms can be fit into this form by changing specific parameters on the definition. 


---
### **Generic Forms**

To list out the generic representation different type of algorithms, we list the following assumption sets. 

#### **Assumptions set 1**
> 1. $h = f + g$. 
> 2. $f, g$ are convex and $f$ is $L$-Lipschitz smooth. 
> 3. 