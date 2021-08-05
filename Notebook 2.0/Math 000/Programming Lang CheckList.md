### **Intro**

> **We assume you had learn some programming languages already.** 
> This is a list of things to learn for any general purpose programming language

Here we assume orthodox, multi-paradigm programming languages. 

This file contains a list of topics that are great to start learning a new programming languages, but with existing knowledge about programming language. 

---
### **Typing** 

* Defining a type
* Instantiating a type
* Methods with a type
* Types Relations

**Defining a type**
1. How to define a type?
2. How to add field?
3. How to instantiate a type?
4. Are there any operators and default functions associated with the type? 
5. How to make the type **Mutable and Immutable**? 
6. Does the typing system have hiearchy? 
7. Does the type support Polymorphism? 
8. Does the type support parametric type (Generic)?
9. Does the type support bounding on the Generic parameter? 
10. Does the type suppport Multiple Inheritance? 
11. Do we have special types like: 
    1.  The Object type that can be referred by any? 
    2.  A final type that cannot join Polymorphism? 
    3.  A abstract type that is half way between an interface and a class? 
    4.  An interface type?
    5.  A struct? 
    6.  An Enum?

**Instantiating a type**
1. Constructor
2. Primodial 
3. Factory Methods

**Method With a Type**
1. Static member
2. Polymorphism method, abstract, virtual, final, overriding... etc
3. Friendship (a c++ feature)? 

**TypeRelations** 
1. Subtyping,  what types are subtype of each other and how are they related to polymorphism
2. Is Generic a: Convariant, Invariant, Cotravariant, or None of these operations. 
3. How to bound the generic type (type with paramaterized type)? 
4. Are there type promotions in functional parameters or Operators? 
5. How does Generic Types, Types Hint (in function and generic classes) interact with each other via either, subtyping or casting. 
6. Type Conversion 
7. Type Equality

**Note**: Lifetime of an object is considered quiet important in programming language that that doesn't support Garbage Collector, for example c++. 


---
### **Methods/Functions/Variables**
* Functions parameters 
* The nature of a Functions 
* Dispatching Function  
* Scopes 

**Function Parameters**
  1. How is the parameters passed? By copy or reference or it depends. 
  2. Does it do type promotions for the input parameters? 
  3. Does changing the reference change the linked parameters?
  4. Default parameter? 
  5. Optional Parameters? 
  6.  Kargs, vargs (multiple parameters)?

**The nature of Functions**
  1. Can it be treated as an object? 
  2. How does it define a scope? 
  3. Are inline function, anonymous function, and lambda expression supported? 
  4. How does it interact with the scope it's in? (Variable Capturing?)
  5. Does it support Async? 
     1. Is there a ID that is associated with it when it's treated as async? 
  6. Static and non static methods, how do they behave? 
  7. What access modifiers do they have? 

**Dispatching Function**
  1. Function override
  2. Function overload 
  3. Static member function that only stick with static reference of the instance. 
  4. Pure static function that is not associated with any instance. 

**Function Scopes**
  1. Shadowing of variable inside the function
  2. How to modify variable outside of the scope of the function 
  3. How to capture variable for inline/lambda function? How do they capture it? 
  4. If nested functions are possible, how do variables in nested functions interacts? 

---
### **Control Flows**
* Iterations
  * Standard Forlops 
  * While Looops 
  * Iterate through different data structure. 
    * Is there an Iterable interface for objects? 
    * Can we implement that interface? 
    * How do we write forloops to iterate through it. 
    * Parallel Forloops? (c#)
    * Lambdas Based Forloops? (Javascript)
  * Weird Constrol structure
    * Inner functions? (python)
    * Breaking out Nested loop? (Java Labels)
    * Goto? (Julia Macros)
    * Nested Inline Forloops? (Julia)
    * For Except? (Python)
    * SQL-Like Control float? (Java Stream, C# linq)

* If statements and Logics 
  * If else, elsif
  * Switch and cases
  * Ternary Operator
  * Nullable
    * Checking Nullable using special operator? (C#, javascript)
  * Short Circuit and None Short circuit if statement? 
  * Is null Falsy? What values are falsy? 

* Exceptions handling
  * Type of exception
  * RuntimeException, IO, Error,
  * Try, Catch, Finally
    * Exception Hierarchy and fall through order? 
  * Callback? 
  * Warning?
  * Exit Code? 


---
### **System/File IOs**
* File reading 
* Command Line Argument
* User inputs 
* Sockets and Networks


---
### **Basic Types**
* String
* Basic Native Datastructures 

---
### **Mega Code Structure**
* Compilation and build system
* Meta-Programming 
* Multiple Files Executable
* Modules and Loading
* Libraries and referencing

---
### **Misc**
* Parallel Programming 
* Threads/Task/joing-fork
* Interfacing with OS
* CPU Intrinsics and SIMD
* Tools associated with the programming language. 

---
### **Governing Paradigm**
Link [here](http://www.cs.ucf.edu/~leavens/ComS541Fall97/hw-pages/paradigms/major.html)

Paradigms and canonical programming language. 

* OOP: java 1.7
* Imperative: Matlab
* Functional: Haskell
* Multi-Paradigm: Python, c++
* Event Driven: Javascript
* Declarative: SQL
* ARRAY: J

