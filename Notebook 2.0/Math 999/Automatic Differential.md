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
f(x) := w_1 + w_2
$$

$$
w_1 := f_1(w_3)
$$

$$
w_2 := w_4w_5 
$$

$$
w_3 := f_2(x)x 
$$

$$
w_4 := f_3(x)
$$

$$
w_5 := f_4(w_6)
$$

$$
w_6 := f_5(x)
$$

And, this is a DAG graph, which is what a lot of computer science is exploiting. 


**Forward Pass**: 

Starting with the biggest model and recur downwards until it reach each of the individual variables (They are called "Seeds").

So taking the derivative will be like: 

$$f'(x) = w_1' + w_2'$$

$$ w_1' = f_1'(w_3)w_3'$$

$$
w_3' = f_2(x) + xf_2'(x)
$$

$$
w_2' = w_4'w_5 + w_4w_5'
$$

$$
w_4' = f_3'(x)
$$

$$
w_5' = f_4(w_6)w_6'
$$

$$
w_6' = f_5(x)
$$


Question: Is this always a DAG? 

Yes, because all derivative should ends somewhere with base case if we are taking the derivative correctly. And when we are taking the derivative, we are traveling in the computational graph from the outputs of the function to the inputs. 

---
**Backwards Pass**: 

Start with one of the individual variable (seed) and then build up the differential until we reach the top module.

---

### **Why is this cool**

Because it's implemented in deep learning tool box, and it can also take derivate wrt to functions involving conditional.   

[Here](https://pytorch.org/tutorials/beginner/blitz/autograd_tutorial.html), the functionality is implemented in pytorch as `torch.autograd`

And for Tensor Flow API, see [here](https://www.tensorflow.org/guide/advanced_autodiff). 

And for tutorial from tensor flow, check [here](https://www.tensorflow.org/guide/autodiff) for more. 