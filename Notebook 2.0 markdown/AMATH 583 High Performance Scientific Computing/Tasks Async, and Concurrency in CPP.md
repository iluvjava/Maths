[Parallel Computing Intro](Parallel%20Computing%20Intro.md) 
So we need to understand the basics of the parallel programming first before learning about the other details of things. 

---
### **Intro**

Threads were first introduce to handle the clients requests in a server. 

And one of the questions is, can we have multiple threads for just one core? 

And yes. 

And on multiple cores, the threads can run at the same time. 

---
### **Parallelization Strategies**

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
std::mutex pi_mutex; 

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
std::mutex pi_mutex; // This is an object on its own, system level implementation.

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


```cpp
double pi = 0.0;
std::mutex pi_mutex; // This is an object on its own, system level implementation.

void pi_helper (int begin, int end, double h)
{
    double Sum = 0
    for (int 1 = being; i < end; ++i)
    {
        Sum += (h*4.0)/(1.0 + (i*i*h*h));
    }
    {
        // Destructor call when this item goes out of scope. 
        std::lock_guard<std::mutex> pi_guard(pi_mutex); 
        pi +=pi_i;

    }
}

```

---
### **Using Async**

Async is another, application level approach to parallelism. Here is the code for that: 

```cpp
int main(int argc, char* argv[])
{
    unsigned long intervals = 1024*1024; 
    unsigned long num_blocks = 1; 
    double h = 1.0/(double)intervals; 
    unsigned long blocksize = intervals/num_blocks;
    std::vector<std::future<double>> partial_sums;
    for (unsigned long k = 0; k < num_blocks; ++k)
    {
        partial_sums.push_back
        (
            std::async
             (
                std::launch::async,  // Eager eval, this is parallelism
                partial_pi,         // function that runs the task
                k*blocksize,        // parameters for `partial_pi` function, pass in std::ref(?) if a reference is intended as the function parameter. 
                (k + 1)*blocksize, 
                h
            )
        );
    } 
    for (unsigned long k = 0; k < num_blocks; ++k)
    {
        pi += h*partial_sums[k].get();
    }
    std::cout << "pi is approximately: " << std:: endl;
    return 0; 
}
```

The async, like java script, returns a promise to the future returned value by the task. It takes in a launch parameter, like deferred, or eager `std::launch::async`, or `stud::launch::deferred`, etc. 

Then, the results are taken out from the promise object. 


**What about Atomic Types**? 

This is limited to certain data types, not all data types, therefore, it's better to use it whenever it's suitable, and, avoid direct assignment operator, because they don't support atomic operations, unfortunately. 


---
### **What is the Mutex**

A thread owns a mutex. 

To own a mutex safely following the RAII protocol, a `std::lock_guard` will have to be used for it. 

The compiler will manage the ownership of the mutex automatically when it's used with the `std::lock_gard` block. 


---
### **COMMON MISTAKES**

Suppose that we were given a function that takes in the vector and a partition to compute on, and we want to use parallelism on the vector. 

There is some problem with the **COPY CONSTRUCTOR** when we use the async and pass it as parameters. 

Suppose this is the function that do the partition vector norm: 


```cpp 
double norm_worker(const Vector& x, int start, int end);
double norm(const Vector& x, int p = 2, int nthreads = 1)
{
    double Results = 0;
    std::vector<std::future<double>> Promises(nthreads); 
    size_t PartitionSize = x.num_rows()/nthreads;
    for (size_t WorkerID = 0; WorkerID < nthreads; ++WorkerID)
    {
        size_t start = WorkerID*PartitionSize;
        size_t end = (WorkerID + 1)*PartitionSize;
        end = WorkerID == nthreads - 1? x.num_rows() - 1: end;
        Promises[WorkerID] = std::async
        (
            std::launch::async, 
            norm_worker, 
            std::cref(x), // REMEMBER TO DO THIS!
            start, 
            end
        );
    }
    for (size_t WorkerID = 0; WorkerID < nthreads; ++WorkerID)
    {
        Results += Promises[WorkerID].get();
    }
}
```

Remember when passing in parameters into some of the meta function like `async` we will have to pass in an reference, to notify the higher order function (what I call meta function) to pass that parameter that I gave to the sub-function as a reference, and don't, freaking... copy that parameter I gave you please. 

Yeah that is the story. 

