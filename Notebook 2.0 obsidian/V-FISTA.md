[Proximal Gradient with Momentum Accelerations](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20with%20Momentum%20Accelerations.md)


---
### **Intro**

The method of V-FISTA is a modified version of FISTA for strongly convex function. The original FISTA algorithm may not attain linear convergence under strong convexity. This is already shown back in Nesterov Original Lectures on convex analysis, for smooth functions only. As a results, fixing the momentum constant for the FISTA algorithm to attain linear converge for strongly convex function (And later, it's shown that for PL and Quasi-Strong Convex function). This method V-FISTA, is a variant for the sum of smooth and non-smooth function with a fixed momentum term. It's described in 19.7.7 in Amir's Beck's First method method, and it attains a rate of linear convergence. 

