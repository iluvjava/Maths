[[CPP Basics 1]]
Here we will talk about some more details about the main function in the cpp programming language. 

---

### **Intro**

The main function in the `.cpp` source file can accept and return arguments. And it's linked with its usage on the linux command line. 

The shell programming follows the following paradigms when doing executions: 

**REPL**: Read, Execute, Print, Loop

---
### **Returned Arguments inside Main**

The return argument can be accessed by involking the executable like: 

`./hello.exe`

And then to see the returned value, use: 

`$?`

This will print the returned value, and if the returned value is `-1` then the actual value will be `127`, hence, the return type is view as a byte. 

In general, the symbol `$?` can be used to get the output of any command when exeucting commands in the shell. 

### **Taking In Arguments in Main**

```cpp
#include <iostream>
# This  file read the parameters passed in the shell and repeat each blocks of string on for each line on the shell. 
int main(int argc, char *argv[]) {
  for (size_t i = 0; i < argc; ++i) {
    std::cout << "argv[" << i << "]: " << argv[i] << std::endl;
  }

  return 0;
}
```

And this is how to take argument. 

`argc`: This is the number of argument passed in via the shell. 

`char* argv[]` is a pointer to the first character in the string that is followed by the command. 

**Note**: Char pointer can be used interchangably with the `std::string` pointer. 

### **Parsing Inputs from the Command Line**

One of the useful tools in the library is the `getopt`function in the `std`, or, you can use [this one](https://github.com/docopt/docopt.cpp). For parsing command line input and interfacing with the command line.  