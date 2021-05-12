This is a tool that added parallelism features for codes in the pre-processing unit of a programming language.
[[Tasks Async, and Concurrency in CPP]]

---
### **Intro**

Some of the parallelization feature at a programming level is added to the compiler, and it can be achieved via meta-programming, and in this case, we will be using the Open_MP and c++ pre-processing to achieve it. 

Here is a an high level overview of the Open_MP APIs: 

* Compiler Directives: no code change 
* Runtime Library Routines: Some code change 
* Environmental Variables: no code change

And, this OPEN model is very limited, it wont just figure out the best computations if you give is a DAG computation graphs. 

It uses a Fork and Join approach for parallelism. So it's there, and it works, somewhat efficiently. 

![[Pasted image 20210512124351.png]]


---
### **Example Usage**

So here, we will be showing some of the example of using some of the pre-processing features from the Open-MP: 


```cpp
double Integral = 0;
for (size_t = 0; size_t < intervals; ++i)
{
    Integral += (h*4.0)/(1.0 + i*i*h*h);
}
```

And this a simple for loop that compute the value of pi. or $\pi$. 

To parallelise this whole for-loop onto different thread, we can do: 

```cpp
double Integral = 0;
#pragma omp parallel
for (size_t = 0; size_t < intervals; ++i)
{
    Integral += (h*4.0)/(1.0 + i*i*h*h);
}
```

Then this whole loop will be **partitioned and executed by different threads**, and all the results will be added together to $Integral$, in this case, it should produce $\pi$, but in reality, **a race conditions is created on the summation**, hence, all results turns into Jibberish. BUT, they will all be multiple of $\pi/n$, because each thread **will work on a partition of the for loop**. 


Let's take a look at another way of parallizing the individual operations, where each operations inside of the forloop is parallelized: 

```cpp
double Integral = 0;
#pragma omp parallel for
for (size_t = 0; size_t < intervals; ++i)
{
    Integral += (h*4.0)/(1.0 + i*i*h*h);
}
```

By adding a `for`, we have divided each the whole thing into **each individual operations inside of the forloop**. 

And in this case, we will get pretty arbitrary results where it **depends on the size of $\Delta x$**, case we are now summing up each individual $\Delta x$, and **there is still an Race Condition on the accumulator**. 

To avoid this, we need to specifically tells the OpenMP to reduce onto that accumulator, in this way: 


```cpp
double Integral = 0;
#pragma omp parallel reduction(+:Integral)
for (size_t = 0; size_t < intervals; ++i)
{
    Integral += (h*4.0)/(1.0 + i*i*h*h);
}
```

And in this case, we have avoided the race conditions on the variable. And whichever way the task is parallelized is up to OpenMP now. 



