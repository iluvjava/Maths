A bunch of computers working together to do computation. 

We are going to ues different processes for parallelism. Unlike threads, they are not going to share the same memory space. 

---
### **Intro**

This is about distributed memory computation. 

The problem is, we can't just keep all the data for each of the computing node, all of them, the same. 

Computing Node: The CPU

Now, we would need to share the memory across different nodes in this case. 

---
### **SPMD**

Single Program Multiple Data. 

There is a single program, the program data is the same. 

Each node has the same program that is executing. 

But for each node the data is not the same. 

---
### **Tony Hoare**

Tony Hoare: The person behind the quick sort algorithm. 

An Axiomatic Basis for Computer Programming

Communicating Sequential Process: CSP

Characterize the computation as having separate processes, and they have disjoint data that they have to access, and the data is communicated. 

---
### **Separate Process**

In the case of parallel processing, we make use of threads for parallel computing. 

Now, we will be using different processes, multiple instances of `main()` will be invoked for each instance of the program. 

And ultimately these processes are going to communicate. 

Steps: 
1. Copy the values to each of the proccess. 
2. Everyone does the job
3. If current process is having ID 0, then it collects the results from every other processes and then submit it. 

---
### **MPI**

MPI: Message Passing Interface

```cpp


```





