Automatic Differential is an algorithmic approach to taking derivative of functions. 

This made the process of taking derivative on the Neural Network easier. 

For some similar concepts like this, check out: [[Back Propagation]]

---
### **Intro**

What are some of the traditional ways of taking derivatives? 
1. Implicit Differential 
2. Symbolic Differential 
3. Finite Differences (Numerical Approach)

Now, let's introduce: "**Automatic Differential**". 

**What is the key idea here**? 

We treat function as modular building blocks, together, they made up a very complex composite function. At each level, we only focus on one atomic operations on the modules. 

Let's give a top -> down view on a somewhat complicated function: 

Let's consider a function in the form of: 

$$
f(x) = f_1(f_2(x)x) + f_3(x)f_4(f_5(x))
$$

From top to bottom, we will have: 

$$
w_1 + w_2\quad w_1 := f_1(w_3) \quad w_2 := w_4w_5
$$


**Forward Pass**: 

Starting with the biggest model and recur downwards until it reach each of the individual variables (They are called "Seeds").

**Backwards Pass**: 

Start with one of the individual variable (seed) and then build up the differential until we reach the top module.

