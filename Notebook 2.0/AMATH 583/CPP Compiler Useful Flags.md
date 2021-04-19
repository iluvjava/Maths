[[CPP MultiStage Compilation]]
Here, we will be talking about compiler Optimization. This is a flag that people can use to improve the performance of the code. The clang compiler is able to use architectural advantage to speed up the execution of the code. 

Here, we need to summarize some of the good flags we learned from class, about the clang compiler, and cross reference them to learn the most out of it. 

---

### **Speed Optimization**

There are 3 flags for this: 

```bash
c++ target.cpp -g O1
c++ target.cpp -g O2
c++ target.cpp -g O3
c++ target.cpp -g Ofast
```

Here is a [Link](https://amath583.github.io/sp21/_static/pdf/L8.pdf) to the lecture on opitmizing matrix multiplications, using different methods. 

---
### **Debug Macro and Assertion**

`-DNDBUG`: Compiler flags to use the assert keywords inside of the source code. The corresponding macros for doing it is: 

```cpp
#include <cassert>
#include <cstddef>

assert(false)  // make assertion one some kind conditions like this. 
```

---
### **Code Compilation Pickness**

Flags: 
* `-Wall`
* `-Wextra`
* `-pedantic`

This enables the pickiness of the clang compiler. There should be no warning when the flag is `-wall`

