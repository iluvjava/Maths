This shit can be pretty complicated

Here are some of the reference sources used for the discussion: 

MIT Lecture Notes: [link](http://www.math.iit.edu/~fass/478578_Chapter_3.pdf)

Topics Involved: Runge Kutta, Butcher Tableaux, Heun's Method, Gauss Runge Kutta, Gauss Legendre method, Collocation Methods

---

Here is the derivation of the 2nd order Runge Kutta method by hand: 
![Runge Kutta 2nd Derivation 1](Runge%20Kutta%202nd%20Derivation%201.jpg)
![Runge Kutta 2nd Derivation 2](Runge%20Kutta%202nd%20Derivation%202.jpg)

### **2nd Degree Runge Kutta** 

The second degree Runge Kutta is just evaluating at 2 points and try to average the change in the spacial dimension out a bit
> $$y_{n + 1} = y_n + \frac{h}{2} f(t, y_n) + \frac{h}{2} f(t + h, y_n + hf(t, y_n)) + \mathcal{O}(h^3)$$
> RK(2)

It has other names: Heun's Method, improved euler method. It's also the leap frog method, where the term $y_n + hf(t, y_n)$ can be viewed as a forward prediction for the trapzoid rule (Predictor corrector method).

### **5th Degree Runge Kutta**

The 5th degree Runge Kutta involves a lot of evaluations on the both the spatial dimension and the time dimension. 

> $$y_{n + 1} = y_n + \frac{h}{6}(f_1 + 2f_2 + 2f_3 + f_4) + \mathcal{O}(h^5)$$
> RK(4)

Where each of the terms denotes an evaluations on some points, and here is the full picture: 

$$f_1 = f(t_n, y_n)$$

$$f_2 = f(t_n + \frac{h}{2}, y_n + \frac{h}{2}f_1)$$

$$f_3 = f(t_n + \frac{h}{2}, y_n + \frac{h}{2}f_2)$$

$$f_4 = f(t_n + h, y_n + hf_3)$$

The global of both scheme is gonna be one degree higher, and here is a pretty cool table: 

---

### **A General Approach**

Here, we make a template from the 2nd Runge Kutta and then use it to frame a family of second order time-stepping schemes. 

[Generalized 2nd Order Taylor Scheme](Generalized%202nd%20Order%20Taylor%20Scheme.md)
