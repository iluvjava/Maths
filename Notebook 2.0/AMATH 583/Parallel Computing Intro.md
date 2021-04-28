[[CPU Intrinsics Extension]]


---
### **Flynn Taxonomy**

SIMD: Single instruction multiple data. 

Here we will be interested in **MIMD**, multiple instructions multiple data. 

First, we are going to assume that each cores are sharing memories with each other. 

And then we will try to understand what a process is and how the OS interact with programs.

---
### **Strategies for Dividing Works**
1. On demand. 
2. Pre-divide
3. Break up each "work" into multiple tasks

Analogy:
Imagine you are a bunch of TAs. 
Then: Exams are data. 
Grading each question is: Task
Execution Units: TA. 

---
### **Single Core**

There is no such a thing as running the programs at the same time. 

Concurrently: running at the same time. 

---
### Pre-Emptive Multi-Threading

This is  what the OS is doing. 

When program is running a program, it has to switch to another task, like, the OS. 

---
### **Process Abstraction**
Here is a list of information the abstraction is going to keep track of: 
* Registers 
* Program Counter
* Program Status word
* Stack pointer
* Process state
* Priority 
* Scheduling parameters 
* Process ID 
* Parent Process
* Process group 
* Signals
*  Time when process started 
*  CPU time used 
*  Children's CPU time
*  Time of the next alarm

These information are all stored in the memory. 

The abstraction allows the CPU to jumps between different process. 

The process has its own virtual memory, that is it's own **address space**

When swapping, the actual bits in the physical memory is disjoint, but the memory view by the program will be continuous. 

---
### **Process Life Time**

1. Ready (IO finished, ready to go)
2. Running
3. Waiting (Reading files, system calls, IO calls)
4. New
5. Terminated

The OS control all these states of the process. 

The process can request the OS to manage. That is a system call. The OS then decide what to do with the process. 

There is also a timer! That is associated with the process, it's about 100Hz. 

---
### **Context Switch**

We want to provides an illusion for the user that things are happening at the same time. 

We want to balance out the overhead of context switch and the illusion of responsiveness. 

The switching is about 60 Hz. 

---
### **Fork**

Fork: Process creation in UNIX

It's called once, and it will return TWICE. 

The `fork()` will make a child process of the current process. 

Everything that comes after the `fork()` will be executed in the parent process, and the child process. 

It will return zero if the current process successfully created the child process. 

Let's take a look at what we call a `Fork Bomb`: 

```cpp
int main() {
    int pids[20]; 
    for (int i = 0; i < 20; ++i)
    {
        pids[i] = fork();
    }
    return 0;
}
```

And, this will spawn 2 on the first process, each child process then go ahead and spawn 2 again. 

The total number of spawned process is like: 

$$
\sum_{n = 0}^{20}
    2^{n}
$$

To spawn 20 processes properly, we should ues this: 

```cpp
int main(){
    pid_t pids[20]; 
    for (int i = 0; i < 20; ++i)
    { 
        pids[i] = fork();
        if (pids[i] == 0) 
        {break;}
    }
}
```

This is saying that, if the current process we looking at, already spanwed its parent, then we are quiting the forloop all together. 

---
### **MultiTasking**









