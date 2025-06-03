- [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Convex Parametric Minimization and Strong Duality](../Duality/Convex%20Parametric%20Minimization%20and%20Strong%20Duality.md)

---
### **Intro**

The proximal point method applied to the KKT conditions of a convex programming problem has a ergotic convergene rate. 
This file will follow discussion from
> D. Applegate, O. Hinder, H. Lu, and M. Lubin, “Faster first-order primal-dual methods for linear programming using restarts and sharpness,” Math. Program., vol. 201, no. 1, pp. 133–184, Sep. 2023, doi: 10.1007/s10107-022-01901-9.

In the introductory part, they provided a unified view of all primal dual method leveraging the KKT conditions. 
This what we will do here, but only for the method of proximal point. 