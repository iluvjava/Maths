[[Distributed Computing]] Is the context for this file. 

Open MPI Documentation: [here](https://www.open-mpi.org/doc/)


---
### **Intro**

Different processes or computer posses the same program solving the same problem. 

Each communicate using MPI, about their assigned ID and passing information to each other. 

Let's repeat this: 

**SPMD** Single Program Multiple Data. Each process has the same program but the data they are dealing with is different. 

**Node**: A single Computing Unit, could be a process, or a computer. 

**DRPDDD**: Distinguished replicated process, distributed data. 

MPI ID distinguishes the process, data are distributed via MPI, and one of the programs, that one that distributed the data and collect and combine the data must identify itself and do the job accordingly. 

MPI is using a network interface to pass messages between different process. We cant put data directly into the memory of another process.

---
### **MPI Example**

Here we use the example of evaluating: $\int_{0}^{1}\frac{4}{x^2 + 1}dx$

```cpp
int main(int argc, char* argv[]) 
{
    size_t intervals = 1024 * 1024;
    // MPI declare current thread as a member. 
    MPI::Init();
    
    int myrank = MPI::COMM_WORLD.Get_rank();
    int mysize = MPI::COMM_WORLD.Get_size();
    
    //Thread 0 get input from user. 
    if (0 == myrank) 
    {
        if (argc >= 2) intervals = std::atol(argv[1]);
    }
    
    // Broadcast a variable
    MPI::COMM_WORLD.Bcast(&intervals, 1, MPI::UNSIGNED_LONG, 0);
    
    // Assign tasks 
    size_t blocksize = intervals / mysize;
    size_t begin = blocksize * myrank;
    size_t end = blocksize * (myrank + 1);

    double h = 1.0 / ((double)intervals);
    double pi = 0.0;

    for (size_t i = begin; i < end; ++i) 
    {
        pi += 4.0 / (1.0 + (i * h * i * h));
    }

    // MPI storage reduce on a variable. 
    MPI::COMM_WORLD.Reduce(&mypi, &pi, 1, MPI::DOUBLE, MPI::SUM, 0);
    
    if (0 == myrank) 
    {
        std::cout << "pi is approximately " << pi << std::endl;
    }
    
    MPI::Finalize();
    
    return 0;
}
```

`include<mpi.h>` is needed for the program. 

`MPI::COMM_WORLD` defines a communicator that exists after the declaration of `MPI::Init()`. 
    * This must be declared for all processes that is using MPI. 

`MPI::COMM_WORLD.Get_rank()` returns a number that can be used to uniquely identify the current running process. 

`MPI:COMM_WORLD.Get_size()` returns a number that is the total number of running process invoked by MPI at the start. 

`MPI:COMM_WORLD.Bcast()` Take a reference on a variable and set all the variables in different programs to be the same. 

> All processes reaches the Bcast function and they pass a reference of `interval` and then the variable got modified by MPI. Root of the communicator controls what value is set, in the above example, the last parameter is `0` which indicates that communcators for this MIP Bcast. See [documentation here](https://www.open-mpi.org/doc/v3.1/man3/MPI_Bcast.3.php) for more on `Bcast`. 

`MPI::COMM_WORLD.Reduce`: This is a send buffer from all the node other than the root note. 

> When called, the last parameter of the function notifies it which node the results should be reducing to, in this case it's process 0. See [here](https://www.open-mpi.org/doc/v4.0/man3/MPI_Reduce.3.php) for more details about the parameters for the function. 

`MPI::COMM_WORLD.Allreduce`: Reduce a variable and then sync to all processes. 

> If, somehow the reduced results need to be used for computations, we will definitely use this for computations. 



**MPI Sends and Receives**

Let's see an example that makes use of `MPI::COMM_WORLD.Send` and `.Recv`. It's called a pingpong because 2 processes are exchanging some kind of trivial information. 

```cpp
int main() 
{
    // we are using MPI
    MPI::Init();
    
    // setup
    int myrank = MPI::COMM_WORLD.Get_rank();
    int mysize = MPI::COMM_WORLD.Get_size();
    int ballsent = 42, ballreceived = 0;
    
    MPI::COMM_WORLD.Send(&ballsent, 1, MPI::INT, 1, 321);//(1)
    MPI::COMM_WORLD.Recv(&ballsent, 1, MPI::INT, 0, 321); //(2)
    MPI::COMM_WORLD.Send(&ballreceived, 1, MPI::INT, 0, 321);//(3)
    MPI::COMM_WORLD.Recv(&ballreceived, 1, MPI::INT, 1, 321);//(4)
    
    std::cout << "Received " << ballreceived << std::endl;
    MPI::Finalize();
    
    return 0;
}
```

**There is a big mistake here**, There are 2 running processes executing the program, and both of them are sending and receiving. Both tries to execute `(1), (3)` in this case. 

Process 1 will send and Process 2 will send, and then both will try to receive. 

**Question**: In the previous one, we used `Bcast`, how does that one work? 

`Bcast` is not specifying sender and receiveers because itself is syncing and all the processes will make a function call on `Bcast`. The last argument in the function call for `Bcast` sepcifies where the root of the data is comming from. Usually process node with a rank of 0. 

A working Send and receive between 2 processes: 

```cpp
main() {
    MPI::Init();
    int myrank = MPI::COMM_WORLD.Get_rank();
    int mysize = MPI::COMM_WORLD.Get_size();
    int ballsent = 42, ballreceived = 0;

    // send the ball only if we are compute node 0    
    if (0 == myrank) 
    {
        MPI::COMM_WORLD.Send(&ballsent, 1, MPI::INT, 1, 321);
        MPI::COMM_WORLD.Recv(&ballreceived, 1, MPI::INT, 1, 321);
        std::cout << "Received " << ballreceived << std::endl;
    }
    
    // Receive from compute node 1 and send it back. 
    if (1 == myrank) 
    {
        MPI::COMM_WORLD.Recv(&ballreceived, 1, MPI::INT, 0, 321);
        MPI::COMM_WORLD.Send(&ballsent, 1, MPI::INT, 0, 321);
    }
    
    MPI::Finalize();
    return 0;
}
```

This version works. 

**Question**: 

`send, recv` are just library functions, what is the state of the program when the call of the function returns????? What does it mean that the process of sending a buffer has ended? 

**Answers**: 

In the case of `COMM_WORLD.Send`, returned meaning that **the buffer is safe to reuse**. For small message, this might block, or not. **We don't know**. 

"Safe to re-reuse": This means that the data has been buffered into some place, or it's during transit and we can modify that without worrying about potential problems. 

In the case of `COMM_WORLD.Recv`, Blocked until the message is receive. We must get the data before advancing from this function call. 


---
### **Compiling and Running**

We need MPI to wrap the compiling and execution of C++ when running the code. 

```cpp
$ mpic++ hello.cpp
$ mpirun -np 4 ./a.out
```

We need the MPI to compile and invoke the system, we can't just compile and run it directly using C++. 


---
### **MPI Deadlock**

Process 1 has  o `send, receive` and Process 2 has `send, receive`

They send and receive from each other. 

MPI has ambiguity. 

When `MPI::COMM_WORLD.send` blocks when we can use the buffer. However, it's possible that the send will halt until the message is received by the receiver. 

Here is how it goes:

Process 1 sends and halt until thread 2 recieve, process 2 sends and halt until Process 1 receive, so both of them are waiting for each other to receive while and halt on the send method. This is a ceadlock. 

For large message, MPI will synchronize sync, and it's buffering when the data are exchanged between each of the process. 

**Question:** 

Why no buffering when we had small messages? 

**Answer:**

It saves system resources 

**Question:**

Ok, why not just send and receive on process 1 and then receive and send on process 2? This can prevent deadlock

**Answer:**

This is good and doable, but to some extend, it it's not following the paradigm of SPMD. In a sense that we need to more ways to distinguish the order of sending and receiving for each of the process, and that means more complex code and serilization between the message exchange. Impacting the speed of the algorithms. 

---
### **Exchanging Message in a Smart Way**

There are non-blocking send and receive in MPI: 

```cpp
Request Comm::Isend(cost void* buf, int count, const Datatype& datatype, int dest, int tag) const

Request Comm::Irecv(void* buf, int count, const Datatype& datatype, int source, int tag) const
```

The request is then returned, the entity is similar to what we had for promise in javascript, and to wait for the request, we use wait_all, see [wait all](https://www.open-mpi.org/doc/v4.0/man3/MPI_Waitall.3.php) in open MPI documentation. 

Give it an array of request. 

**Scatter**

```cpp
int MPI_Scatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
    void *recvbuf, int recvcount, MPI_Datatype recvtype, int root,
    MPI_Comm comm)
```

Process `root ` scatters its data to all other processes. `sendbuf` provided by `root`, `recvbuf` provided by none `root`. `sendbuf` is conserved, because of `const`. 


**Simultaneous Send and Receive**

```cpp
int MPI_Sendrecv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
    int dest, int sendtag, void *recvbuf, int recvcount,
    MPI_Datatype recvtype, int source, int recvtag,
    MPI_Comm comm, MPI_Status *status)
```



---
### **MISC: All About MPI**

MPI Constants: see [here](https://www.mpi-forum.org/docs/mpi-2.2/mpi22-report/node375.htm) on the forum. It's for MPI 2.2
