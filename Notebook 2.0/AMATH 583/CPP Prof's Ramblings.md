Ramblings from the prof regarding C++


---

### **Intro**

He rambles a lot, I will record it. 

### **Ramblings**

Please make the namespace for variables explicit, that is better. 

Code is for human, not for the computer, please always express the intents in your code when programming. 

#### **Organizing your Programs**

Boeing got plane crashes when the code is not well organized. 

* Thinks about group of things as one thing, keep things modular (Abstraction!). 
    * If we do engineering things to software, we should be able to manage software and solve the software crisis. 
    * That is the idea of creating software components. 

* Here are 2 types of major abstractions: 
  * Procedures
  * Data Types

---
### **Procedural Abstraction**

Let's take the example of a function that looks for the square root of a number using the newton's iterations, and it will look like this: 

* `auto`: This will associated type information automatically at the compiler level. We can use this. 



```cpp
#include <iostream>
#include <cmath>

auto sqrt583(double y){
    double x = 1.0; 
    for (size_t i = 0; i < 32; ++i)
    {
        double dx = - (x*x - y)/(2.0*x); 
        x -= dx;  
        if(abs(x) < 1.e-9) break;
    }
    return x; 
}

int main()
{
    std::out << sqrt582(2) << std::endl; 
    std::out << sqrt582(3) << std::endl; 
    return 0;
}
```

**Note**: The type  `int`, `long` are different depending which computer it's in. However, the type  `size_t` is the maximal counter in the given computer system, it can count to as big as possible, and the limit depends on the system we are working on. 

**Note**: The curly braces will define the code block and the scope of the variables. 

---
### **References in C++ Function Parameters**

consider function header `f(double& x)`. Telling compiler that under function scope `x` will be a reference to a value (**Alias of another variable**). When taking the reference of something, that new reference IS literally that thing that it's referring to. 

Note: This efficient in a sense that it's not copying the values referred by the variable when passing it into a function. 

**Question**: What if I invoke with `f(2.0)` <-- Like, this is not a variable, this is a literal. 

**Answer**: It doesn't make sense to change a literal define at the compile time, this is not viable. A compiler error will be given: "Expect lvalue".  

**Question**: Can we pass literal as a reference to the function? If so, how? 

**Answer**: Use `const double& x` in the header of the function. Now this is amazing, because it means that expression that is `rvalue` is possible to be passed in, for example, the expression `a + b` is possible to pass in for a function with the header: `f(const double& x)`.

**Wisdom:** Pass by values if the input is small, else pass by reference. 

**lvalue**: Some that can be on the left hand side of an assignment operator. 
**rvalue**: something that appears on the RHS of a assignment operator. (Compound expression, or a literal, a constant)

---
### **Compile and Function Usage**

We want to use the function (say `sqrtamath583`), and we want to use it somewhere else in some other programs, how do we do that? 

To call any function under the program, it has to be declared/define before that place where it's call. 

Consider the following codes: 

File: "main.cpp"
```cpp
#include <iostream>

auto sqrtamath583(double); // Function declaration 

int main()
{
    std::cout<< sqrtamath(3) << std:endl; 
    return 0;
}
```

File: "sqrtamath583.cpp"
```cpp
auto sqrt583(double y){
    double x = 1.0; 
    for (size_t i = 0; i < 32; ++i)
    {
        double dx = - (x*x - y)/(2.0*x); 
        x -= dx;  
        if(abs(x) < 1.e-9) break;
    }
    return x; 
}
```

To compile the program where "main.cpp" can be correctly executed, we need the command: `c++ main.cpp sqrtamath583.cpp`, where function declaration comes before the function definition. 

Then, the program compiles both parts of the program together. 

---
### **Multi-stage Compilation**
We are going to compile them separately, saves sometimes. Compile things to object files first, and then we put them together with the main function later, so we don't have to recompile the same things all the time when experimenting with things. 

Connect the files into a DAG, and then use dependencies rules to compile. 

The program that make it works is called: `makefile`. 








