[CPP Basics 1](CPP%20Basics%201.md): Just for the basic of CPP to understand it. 

[Tasks Async, and Concurrency in CPP](Tasks%20Async,%20and%20Concurrency%20in%20CPP.md), here we introduce the idea of passing a function handle into the constructor for an async instance. 


---
### **Intro**

We are going to learn about some functional features in c++!!! 

Object that has a `operator()()`, implemented is consider to be a function object. 


---
### **Function Objects**


```cpp
int bank_balance = 300;

class transaction {
public:
  transaction(int _sign, int& _balance) :
    sign(_sign), balance(_balance) {}

  void operator()(int amount) {
    std::lock_guard<std::mutex> tr_lock(tr_mutex);
    balance += sign*amount;
  }
  // Overload operator() to be "noisy"
  void operator()(const std::string& msg, int amount) {
    std::lock_guard<std::mutex> tr_lock(tr_mutex);
    std::cout << msg << ": " << sign*amount;
    std::cout << " -- Balance: " << balance << std::endl;
    balance += sign*amount;
  }

private:
  int sign;
  int &balance;
  static std::mutex tr_mutex;     // Note static!
};
std::mutex transaction::tr_mutex; // construct static member
```

An object `transection` has been created and it implemebted the `()` operator. 

The function lock the thread and performs a ctritical task in the body section of the function. 

And the function is also overloaded. 

To use the function object, the following code is used for it: 

```cpp
int main() {
  transaction withdraw(-1, balance);

  withdraw(100);

  return 0;
}
```

Boom, this is what we refer to as the `callable`, this is an object that can also be passed into the thread or the async class as parameter, and here is the usage of it under multi-threading context: 

```cpp
int bank_balance = 300;

int main() {
  transaction deposit ( 1, balance);  // define an object named deposit
  transaction withdraw(-1, balance);  // define an object named withdraw

  cout << "Starting balance is " << bank_balance << endl;

  thread bonnie(withdraw, "Bonnie", 100); // Pass in the callable object 
  thread clyde(deposit, "Clyde", 100);  // Pass in the callable object 

  bonnie.join();
  clyde.join();

  cout << "Final bank balance is " << bank_balance << endl;

  return 0;
}
```

---
### **Lambda**

Let's take a look at a basic lamabda function and the format: 

```cpp
[ captures ] ( params ) trailing-return-type { body }
```

Boom, nice easy, and the capture types is capturing a variable that you wish to use that is outside of the scope of the lambda function. And the parameter are the real parameter we want to pass in. 

In this case, the passed parameter is not shared between different lambdas, but the captured parameters will be shared between different lambdas expression. 

And, if we were to use the lambda expression for an async implementations of the matrix vector product, then the code will look like this: 


```cpp
void matvec(const Matrix& A, const Vector& x, Vector& y) {
  std::vector<std::future <double> > futs(A.numRows());
  for (int i = 0; i < A.numRows(); ++i) 
  {
    futs[i] = std::async(
    [&A, &x, i]() -> double  // capture ref of A, x and value of i. 
    {
      double sum = 0.0;
      for (size_t j = 0; j < A.numCols(); ++j) 
      {
        sum += A(i, j) * x(j);
      }
      return sum;
    });
  }
  for (int i = 0; i < A.numRows(); ++i) 
  {
    y(i) += futs[i].get();
  }
}
```





