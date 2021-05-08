[[Parallel Computing Intro]]
So we need to understand the basics of the parallel programming first before learning about the other details of things. 

---
### **Intro**

Threads were first introduce to handle the clients requests in a server. 

And one of the questions is, can we have multiple threads for just one core? 

And yes. 

And on multiple cores, the threads can run at the same time. 

---
### **Parallelization Strageties**

Split by tasks.

Split by data.

Suppose we want to compute: 

$$
\pi = \int_{0}^{1} 
    \frac{4}{1 + x^2}
dx
$$

And we just split the integral, into several different interval. They are independent from each other. Like: $[0, 1/4], [1/4, 1/2], [1/2, 3/4], [3/4, 1]$. 

Then each of them will be their own computations, with different parameters. 

---
### **Threads**

Threads run tasks.

And they can share the same memory, they have their own stacks, but they can access all virtual memory address space, given the pointer. 

And one of the **major problem we want to prevent** is: 

2 of the same threads entering the critical sections and creates race conditions for the shared memory. 

Usually happens when the threads try to check for a predicate on some shared memory and then perform the tasks on that piece of memory. 


**Introducing**: **C++ Mutex**

```cpp
double pi = 0.0;
std::mutex; 

void pi_helper (int begin, int end, double h)
{
    for (int 1 = being; i < end; ++i)
    {
        pi_mutex.lock();
        pi += (h*4.0)/(1.0 + (i*i*h*h));
        pi_mutex.unlock();
    }
}

```

The `pi_mutex` will be locking critical section there. 

This is done at a system and OS level. 

However this code is **REALLY** slow... 

It's slow because we are always waiting for the resources to be shared, locked, released... which is very very slow. Mutex Synchronization is very very slow. 

We need to lock it and unlock it outside of the forloop then. 

```cpp
double pi = 0.0;
std::mutex; 

void pi_helper (int begin, int end, double h)
{
    pi_mutex.lock();
    for (int 1 = being; i < end; ++i)
    {
        pi += (h*4.0)/(1.0 + (i*i*h*h));
    }
    pi_mutex.unlock();
}

```

the output turns out to be $2\pi$. Instead of $\pi$, when we divides the intervals in to a billions pieces. 

Notice that, the int has 32 bit. That is about $2^{32}$. 


```cpp
double pi = 0.0;
std::mutex; 

void pi_helper (int begin, int end, double h)
{
    double Sum = 0
    for (int 1 = being; i < end; ++i)
    {
        Sum += (h*4.0)/(1.0 + (i*i*h*h));
    }
    pi_mutex.lock();
    pi += Sum;
    pi_mutex.unlock();
}

```

Boom, now the computations can be carried out at the same time, and then we don't have to add all the running total to the same thing anymore. It's summing up to the internal variable for the thread. 



