[[CPP MultiStage Compilation]]
Here, we will keep doing that part, but we will dig a little more deeper into the usage of linux make. 

Linux Make Tutorial Website: [link](https://makefiletutorial.com/), link should work. 

---
### **Basic Syntax**

```

CXX       := c++

OPTS      := -g -O0
LANG      := -std=c++11 
PICKY     := -Wall

CXXFLAGS  := $(LANG) $(OPTS) $(PICKY)

target: dependency1, dependency2
          echo "Example Commands for compiling target using dependncy 1, 2"

dependency1: 
          echo "Compiling dependncy1"

dependency2: 
          echo "Compiling dependcy2, and this is the macros $(LANG)"


```

**Note**: 2 tabs, 2 spaces right after the line of the rule declarations. 

**Note**: A make file is under the default name of: `MakeFile`, when invoking `make` command it will look for that file under the current root directory. 

**Note**: Default Target: 

The Default targte is the targe on the top, or the targets that come after the `all` keyword. 

**Mack Macros**: First is the declartions of the flags and macros, doing this allows us to change the flags for things all at once instead of changing the repeatedly for each of the commands under the rules set.

### **Make Commands**

In general, use `man make` to invoke the help information for the command in the linux command windows. 

Here are some examples: 

`make -f <filename|file directory>`: 

Make file using a specific make file. 

`make -n`

Try to print all the command that is going to be executed if the `make` command is invoked on the default makefile.

`make clean`

Clean all the results for thd compilation, the next compilation will be a recompilation. 

`make -k`

keep compiling if there is some kind of error from the compilation. 

Make a target in the `MakeFile`

`make targetname`$?



---
### **Rules for Compiling CPP Files**

There are several ways to do it, but here we will be using the compiler to link files together, instead of the macros. 

Here is an example: 
```
main.exe: main.o amath583.o
          c++ main.o amath583.o -o main.exe

main.o: main.cpp amath583.hpp  # Note2
          c++ -c main.cpp -o main.o

amath583.o: amath583.cpp
          c++ -c amath583.cpp -o amath583.o
````
`.exe` <-- Object files <-- `.cpp`, `.hpp`

**Note**: `.hpp` files are not explicitly specified when compiling, it doesn't appear in the command for compilation, but the dependency is specified whenever a `.cpp` is using entities declared in the `.hpp` file, follows after the target. OR, you can just incude the `.hpp` file in the `.cpp` file. 

**Note2**: .hpp is not use in the command, but it's needed for the .cpp file that uses declared eneities in the corresponding .hpp file. 

