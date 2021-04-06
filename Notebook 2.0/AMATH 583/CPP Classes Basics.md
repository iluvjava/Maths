For this class we are making our own vector class that adhere to the vector field's axioms

1. Everything Basics about classes (Not including Polymorphism)
2. The abstractions and the stuff like that
3. The operators and passing in references. 

---
### **Intro**

The axioms set of the vector fields is like: 

* Additive Operations: 
  * x + y = y + x, Commutative. 
  * (x + y) + z = x + (y + z), Associative
  * 0 + x = x + 0 = x, Exists Identity Member: 0
  * (-x) + x = x + (-x) = 0, Additive Inverse and the Identity member. 
* Multiplicative Operations: 
  * 0x = 0, Addictive identity multiply by any member gives itself. 
  * 1x = x, There exists a multiplicative identity member. 
  * (cd)x = c(dx), Multiplication is associative. 
* Distributive Axioms: 
  * c(x + y) = cx + cy 
  * (c+ d)x = cx + dx

**Note**: Operations between scalar and vectors is not defined above yet. 

The basis for storing our mathematical Vector will be an array under the hood.

The CPP has N-Tuple Types, but we don't have enough operations for it. 

In CPP, we are going to build a type that does the vector operations. 

1. Abstraction
2. Hiding implementations
3. Opening up interfaces
4. Polymorphism that allows to seperate containers and types.


```cpp 
class Vector {
    size_t M; 
    std::vector<double> storage;
}
```
Associated the vector class with our class. 

In actual implementation, we are going hiding some of the fields from users. 

The special members: 

1. **Operators functions**, we will be overriding the operators for the given types. 

Do notice about how the object acts on each other, in the case of the `operator+` function, these expressions are equivalent.  

`x + y` is the same as `x.operator+(y)`, where, the operands on the rhs is invoked on the member function of the left operand using the right operands as the input of the function. 

Let's see an implementation of the vector classes: 

```cpp
class Vector {
    public: 
        Vector operator+(const Vector& y);
    private: 
        size_t num_rows_;
        std::vector<double> storage_;
}
```

Do note the convention here, private field is having the `_` at the end. 

Let's take a look at the indexing function, or the function operator, that is the `operator()`, which is the function name. 

We can use this to emulate the matlab behavior.

So then we will be doing this: 

```cpp
class Vector {
    public: 
        double operator()(size_t i);
    private: 
        size_t num_rows_;
        std::vector<double> storage_;
}
```

Boom, we can now do this: `x = y(1)` to access the element in the vector. 

But, notice that, this is illegal: `y(1) = 3`, because, the `operator()` is only possible for rvalue in c++. 

Huh.... ok, what if we are returning the reference of the object instead of the copy of the value???? 

Then, the expression can be a `lvalue`! 

Let's take a look at the implementation: 


```cpp
class Vector {
    public:
        double& operator()(size_t i);
    private: 
        size_t num_rows_;
        std::vector<double> storage_;
}
```

Boom! Ok, this is what we need for the situation.  

---
### **The Vector Class We have So far**


```cpp

public: 
    Vector(size_t M): num_rows_(M), storate(num_rows_){}; // Constructor
    double& operator()(size_t i){return storage[i];}
    const double& operator(size_t i){return storage[i];}
    size_t num_rows() const {return num2_rows_;} 

private: 
    size_t num_rows_;
    std::vector<double> storage_;

```

Things to note: 

1. For the member function `num_rows`, there is a `const`, which is indicating to the compiler (signing up a contract during compile time), this function will not modify the state of the object. 

2. For the member function `opertor()(size_t i)`, it's returning a reference to the field member `storage[i]`, which is a value of a type `vector<double>`. And hence, (it's very likely that, `operator[]` of the member `vecotor<double>` is also returning a reference of temmplate type `<double>`) it can be put as a `rvalue` for an expression. 


---
### **The infectious Constness**

This thing, it will be propagating through your code when you compile it. 



