[CPP Basics 1](CPP%20Basics%201.md), [CPP Classes Basics 2](CPP%20Classes%20Basics%202.md)

Let's go through an example class we made to demonstrate some of the ideas about `c++` and writing code in `c++`. 

---
### **Intro**

This the vector header class we defined: 

```cpp
#include <vector>

class Vector {
    public:
    // Constructor, no default constructor. 
    Vector(size_t M) : num_rows_(M), storage_(num_rows_) {}

    // operator() that support assignment and const access of data. 
          double& operator()(size_t i)       { return storage_[i]; }
    // For the add operator. 
    const double& operator()(size_t i) const { return storage_[i]; }

    size_t num_rows() const { return num_rows_; }

    private:
    size_t num_rows_;
    std::vector<double> storage_;
};
```

Here aer some of it's features: 
1. Private, public encapsulation for abstraction. 
2. Const keywords. 
3. Usage of operator functions.

**The Primodial of the Constructor**
1. Instantiate field `num_rows_` with input parameters `M` using the constructor provided by `size_t`. 
2. Instantiate `std::veector<double>`, which has the size of `num_rows_`. 

---
### **Client Code and Interactions**

Let's take a look at some of the client code that we can use to interact with the class we defined above. 

```cpp
Vector x(10);
double y = x(3);
x(4) = 2.0;
```

We are able to access element in the vector using offset index, and then assign values to the element as well, both are accomplished by different overload options of the `operator()`, the function call operator of the instance. 

method without Const Ref is able to be set as an `Lvalue`, and method that uses the Const Ref both in body and return type, is able to be `rvalue` of an expression. 

**Question**: 

What if we only have the implementation of the operator `()` such that it can only returns the **value** to the double that is in the class field? 

**Answer**: 
A value can only be a `rvalue`, hence it cannot be a `lvalue`, which means that 

```cpp
Vector x(1);
x(0) = 3;
```

is invalid because `()` operator returned is used as a `lvalue`, the `()` operator cannot be an assignment operator. 

On the other hand, if the `()` returns a reference, then it can be a `lvalue` and `rvalue`. When it's used as a `rvalue`, depending the declaration, it will be dereferenced. [^1]


---
### **Customizing the Operator Plus**

Let's consider the following implementation of the plus operator defined near the scope of the client code: 

```cpp
Vector operator+(const Vector& x, const Vector& y) {
  Vector z(x.num_rows());
  for (size_t i = 0; i < z.num_rows(); ++i) {
    z(i) = x(i) + y(i);
  }
  return z;
}
```

Function takes in Const Ref of both vectors and return a new vector, a copy of it. 

However, this action will require that: 

> The operator `()` for the class cannot modify the instance, `x, y`. This is the case because `x,y` are const references. 

To overcome this, it's required that the operator `()` implements with the following headers: 

```cpp
const double& opertor()(size_t) const {}
```

**Take note** that this function can take objects that is const ref, and it will return the double value that is indexed via this `()` operator. 

**Take Note** This function that has `const` before the definition body is able to get overload with the none `const` version. 



[^1]: not sure how correct this is please investigate in the future. 