Let's talk about namespaces in c++


---
### **Intro**

The namespace where a variable is in always prepends the variable. 

Let's take a look

```cpp
#include <isotream> // compiles this first

namespace amath583{
    double pi = 3.14;
}

using amath583::pi; // bring in the variable in namespace, new ref: pi

int main(){
    std::cout << "The registered value of pi is:";
    std::cout << pi << std::end;
}
```

Let's take a loop at another example where we were able to access the variable in a particular namespace. 

```cpp
#include <iostream>

namespace amath483 {
    double pi = 3.14159;
};

namespace amath583 {
    double pi = 3.14;
}

using namespace amath583;  // pi ref to pi in amath 583, to access amath 483 it's amath483::pi instead. 

int main(){
    std::cout << "The registered value of pi is:";
    std::cout << pi << std::end;
}
```

What happen if have ambiguity when using the namespaces? (Spoiler: Compilation Error)

```cpp

namespace amath483 {double pi = 3.1415;}

namespace amath583 {double pi = 3.14;}

double pi = 3.1415926;
using namespace amath483; 
using namespace amath 583;

int main()
{
    std::cout << "The value of pi is: "; 
    std::cout << pi << std::endl;
    return 0; 
}
```

ERROR from the compiler because it's ambiguous, there overlapping variable. 

Now, finally, to refer to the global namespace, just use: `::` access the variable under the global namespace. 

