This is purely my idea. 
[[Newton Method]]

---
### **Intro**

I want a hybrid method using Newton's Iterations and Gradient Descend. **I want to avoid saddle point by taking suggestion from the gradient**: 

The idea is to use Newton's method when the gradient agrees with Newton's direction. My hope is that: 

> The gradient will overshoot the newton's predictions if we are closeing into a saddle point. We want to choose step size in such a way that $x^{(i + 1)} - x^{(i)}$ is going to be the same each time. 

Let $\nabla^2[f], \nabla[f]$ be the Hessian and Gradient of the function $f$, then my idea is: 

1. Initialize with $x^{(n)} = x^{(0)}$, $x^{(n - 1)} = \infty$.
2. While $|x^{(n)} - x^{(n - 1)} |\ge \epsilon$
   1. Use newton's method to get get $x^{(n + 1)}$, let $\beta^{(n + 1)} = x^{(n + 1)} - x^{(n)}$
   2. Use gradient method to get $x^{(n + 1)}$, with a learning rate that is large enough to overstep $x^{(n + 2)}$, predicted by the Newton's meethod. 
   3. Let $\alpha^{(n + 1)} = \tilde{x}^{(n + 1)} - x^{(n)}$
   4. START
      1. if $\alpha^{(n + 1)T}\beta^{(n + 1)} \ge 0$, then don't do anything. 
      2. else $x^{(n + 1)} := \tilde{x}^{(n + 1)}$
   5. END
   6. $n:= n  + 1$


**A more detailed algorithm**

Parameters needed: Hessian, Gradient, $\eta$ learning rate, $x^{(0)}$ initial point. 

1. $x^{(n)} = x^{(0)}$
2. $x^{(n - 1)} = \infty$
3. While $|x^{(n)} - x^{(n - 1)}| \ge \epsilon$
   1. $x^{(n + 1)}:= x^{(n)} - \nabla^{2}[f]^{-1}(x^{(n)})\nabla[f](x^{(n)})$
   2. $\beta^{(n + 1)} := x^{(n + 1)} - x^{(n)}$ 
   3. $v := x^{(n + 1)} + \beta^{(n + 1)}$
   4. $x^{(n + 2)}:= v - \nabla^{2}[f]^{-1}(v)\nabla[f](v)$
   5. START
      1. if $(x^{(n + 2)} - v)^T (-\nabla[f](x^{(n + 2)})) \ge 0$ :
      2. Do nothing
      3. else
      4. $x^{(n + 1)} := x^{(n)} - \eta\nabla[f](x^{(n)})$
   6. END
   7. $n:= n + 1$

**Explanation:** 
1. $\beta^{(n + 1)}$, direction suggested by Newton. 
2. $v$, step again using the same direction made by Newton for $x^{(n + 1)}$.
3. Base on $v$ step again and test of gradient and newton's method agree if agree, we follow newton's method, if not, we take suggestion from the gradient. 

**This is a terrible idea because:**

> That is a terrible idea, becaues newton's will overshoot just around the point when the gradient direction and the newton's direction aligns, because at that point it's the maximum of the derivative. 


---
**After some experiments, I think this is better**: 

1. Use newton's and gradient algorithm choose whoever's objective value is higher. 
2. If it's converging to an optimal, get the maximal eigenvalue of the hessian, then, randomly choose points around the radius. (Radius is the largest eigenvalue multiplied the difference between current point, and the point it started to descend.) 
   1. Need to keep track of all the points before to estimate the range of the convex region. 
   2. Need to sample smartly to get out of the valley, or hole. 
3. Clear memory on all previous descned direction and then try find another minimal again. 

**How to do random search?**

Open up a cone at the tip of the descned direction, and then sample from that cone. 

**How to test of we are trapped?**

The gradient is too small, and the accelerated gradient not accelerating. 


