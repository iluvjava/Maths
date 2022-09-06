Make sure we already has some knowledge in [[Automatic Differential]]. 

Here, we will be more hands-on 

References and relevant resources

CS 421 from University of Toronto [link](https://www.cs.toronto.edu/~rgrosse/courses/csc421_2019/)

A towards data science post about implementing auto diff in python from scratch: [link](https://towardsdatascience.com/build-your-own-automatic-differentiation-program-6ecd585eec2a)


---
### **Intro** 

Automatic Differentiation is a computer algorithm that compute the differentiation of any graph problem. 

The graph is a DAG. 

To compute the graph forward, we use topological sorting. 

To compute the graph backwards, we get the derivative wrt to all the leaf nodes, which are just the variables. 

The variables could be tensors. 



