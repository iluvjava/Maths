[More Linux Make](More%20Linux%20Make.md), [CPP MultiStage Compilation](CPP%20MultiStage%20Compilation.md)

Making a project with many files in cpp. 

---
### **Intro**

When we have a project with multiple files, we will need to cooperate a lot of make files for each sub directory. 

**Before we start:**

> There are other ways of compiling other than linux makefile command, shell script is one way of doing it, or just use IDE or stuff like that. 

**Reference Tutorial Used**

Linux Make [Linux Make File Tutorial](https://makefiletutorial.com/)

Go and read that I won't repeat too much. 

Assuming you already know about basics variables in makefile.

Assuming you are using C++, you can use whatever compiler you want, then [here](https://code.visualstudio.com/docs/cpp/introvideos-cpp) is the tutorial to do C++ dev in vs code. 

---
### **Quick References** 
* `*`: wildcard for file names
* `%`: wildcard for declaring make rule patterns 
* `$@`: make rule target 
* `$?`: new prereqs
* `$^`: all prereqs
* `$(???)`: Get the value for whatever is inside of `$(???)`. 
    * `$(Var)`: Get the value of a defined variable. 
    * `$(wildcard *.c)`: Get a list of all file with that ends with `*.c`, it will not blow up when none of the files matches the pattern. 
* `$(filter %.o,$(obj_files))`: passes 2 arguments to the filter function, the first is the pattern and the second is a list of stuff to filter from. 

---
### **Automatic Variables**

Wildcards for files 

```makefile
thing_wrong := *.o # Don't do this! '*' will not get expanded
thing_right := $(wildcard *.o)
all: one two three four
# Fails, because $(thing_wrong) is the string "*.o"
one: $(thing_wrong)
# Stays as *.o if there are no files that match this pattern :(
two: *.o 
# Works as you would expect! In this case, it does nothing.
three: $(thing_right)
# Same as rule three
four: $(wildcard *.o)
```


Dependecies 

```makefile
hey: one two
    # Outputs "hey", since this is the first target
          echo $@
    # Outputs all prerequisites newer than the target
          echo $?
    # Outputs all prerequisites
          echo $^
    touch hey
one:
          touch one
two:
          touch two
clean:
          rm -f hey one two
```

---
### **Patterns Rules**

Make file allows `%` to represent a pattern of targets and rules, and then, we can use `$@`, `$^` to represents target and prereq. 

```makefile
# usage of static patterns and wildcards
target%: prereq%
		  echo "target is '$@' requires '$^'"

target1: prereq1
prereq1: base1
base1:
		  echo base1 called
```


---
### **Makefile Implicit Rules**

There are rules built into the make file system on linux. 

As such, the important variables used by implicit rules are:

* CXX: Program for compiling C++ programs; default G++
* CC: Program for compiling C programs; default cc
* CFLAGS: Extra flags to give to the C compiler
* CXXFLAGS: Extra flags to give to the C++ compiler
* CPPFLAGS: Extra flags to give to the C preprosessor
* LDFLAGS: Extra flags to give to compilers when they are supposed to invoke the linker

And the makefile automatically manage these variable flags: 

Perhaps the most confusing part of make is the magic rules and variables that are made. Here's a list of implicit rules:

* Compiling a C program: `n.o` is made automatically from `n.c` with a command of the form `$(CC) -c $(CPPFLAGS) $(CFLAGS)`
* Compiling a C++ program: `n.o` is made automatically from `n.cc` or `n.cpp` with a command of the form `$(CXX) -c $(CPPFLAGS) $(CXXFLAGS)`
* Linking a single object file: n is made automatically from n.o by running the command `$(CC) $(LDFLAGS) n.o $(LOADLIBES) $(LDLIBS)`