For this class we are making our own vector class that adhere to the vector field's axioms

1. Everything Basics about classes (Not including Polymorphism)
2. The abstractions and the stuff like that
3. The operators and passing in references. 

---
### **Intro**

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
### **The infectious Constness**

This thing, it will be propergating through your code when you compile it. 



