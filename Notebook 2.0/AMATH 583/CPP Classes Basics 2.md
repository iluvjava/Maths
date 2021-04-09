[[CPP Classes Basics]] 
Here we will continue looking at CPP and classes, and we are more interested in using the Matrix class as an example for this. 

And introducing some mathematical abstraction into the C++ code. 

Today's Content: 
1. Classes, Vectors, const, overloading.
2. Tour of Computer architecture.
3. Class Matrix.
4. Matrix Matrix product.

---
### **Intro**

Last time, we were at this interface for the vector class, in a header file. 

```cpp
class Vector {

    public: 
        Vector(size_t M): num_rows_(M), storate(num_rows_){}; // Constructor
        double& operator()(size_t i){return storage[i];}
        const double& operator[](size_t i){return storage[i];}
        size_t num_rows() const {return num2_rows_;} 

    private: 
        size_t              num_rows_;
        std::vector<double> storage_;

}
```

This time we will be interested in: 

1. Bring a vector into being "constructors".
2. Function for getting vector data. 
3. Function for setting vector data. 

---
### **The idea of a Constructor**

The compiler don't know what a vector is, we have to start making it. 

Constructor, allocate know amount of space. 

Constructor is a contract. 

`vector x;` evoke the **default constructor**, it has no argument. 

Constructor can take in argument. 

Variable should **always** be initialized. 

```cpp
class Vector {
    public:
        Vector(size_t M): num_rows_(M), storage(num_rows_){};
        // Observe how the constructor calls the constructor of the private field. 
        double& operator()(size_t i){return storage[i];}
        const double& operator[](size_t i){return storage[i];}
        size_t num_rows() const {return num2_rows_;} 

    private: 
        size_t              num_rows_;
        std::vector<double> storage_;
}
```

The 2 initializer that comes before the function body of the constructor is called the **Primordial**. 

**Question: Where is the default constructor**?

It exists if there is no declared constructor of the type, then C++ defined it, and it will evoke the default constructor for the types in the field recursively. 

If there is existing constructor, that part of the contract is cancelled. 

`Vector x;` will not be valid anymore. 


