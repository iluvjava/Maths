We are going to look at some of the examples of a function having multiple bifurcations marks, and how to deal with them. 
Prereq: [[Bifurcation 1D]]

---

### Intro
Most of the time for a given system, there will be multiple bifurcations happening, and to handle the stability part of the analysis, we don't really need to test the stability everywhere, we just need to determine one of it and them everything will follow through with the continuity assumption made on the RHS function of the system. 

### Example 1 
> $$x' =- rx + x^4 - x^5 = x(r + x^2 - x^4)$$

Firstly 
* $x = 0$ is a fixed point. 

Secondly, solving the equation we have: 
$$
x^2 = \frac{1 \pm \sqrt{1 + 4r}}{2}
$$

And the conditions for have 2 unique solution is: 
$$
1 + 4r > 0 \implies r > \frac{-1}{4}
$$

