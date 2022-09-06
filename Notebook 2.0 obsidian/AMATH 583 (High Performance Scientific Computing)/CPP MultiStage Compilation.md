Here we learn about how the multi-stage compilation works in CPP, we would need this to compiles files for us.
[[CPP Basics 1]]

[Here](https://www.youtube.com/watch?v=aw9wHbFTnAQ) is a good video that teaches people about it.

---

### **Intro**

Scenario: 

We have a root file that we want to invoke: `main.cpp`, and then we have the header files it requires for: `amath583.hpp`, which has definition in `amath583.cpp`. 

And then to compile this, we will need the following commands: 

```cpp
c++ -c main.cpp -o main.o
c++ -c amath583.cpp -o amath583.o
c++ main.o amath583.o -o main.exe
```

So then this till compile the object files for each of file, and then compile the object files together to get the main executable for the program. 


---
### **Recompilation**

For any node on the dependency tree, we don't have to recompile all of them. We just need to update the files that are on the path, or the files that depends on the files that we need to recompile. 

---
### **Linux Make**

There is a tool that is build into the Linux Operating system: `make`. 

What we need to do is, figure out the topological ordering of the object files and the header files, and then we write down the rules inside of a `makefile`, and then we are invoking the `make` command to do the multi-stable compilations. 

Here is the content of the make file: 

```bash
main.exe: main.o amath583.o
    c++ main.o amath583.o -o main.exe
main.o: main.cpp amath583.hpp
    c++ -c main.cpp -o main.o
amath583.o: amath583.cpp
    c++ -c amath583.cpp -o amath583.o
```

Basically, we are telling the make command that, here is the list of dependency between the object files and the root files we need to compile the source codes, and the line indented are the command to compile the files with dependency. 

Now, make the project for me, and update the files accordingly. 

The format for announcing a compilation rule is: 

```
target: dependency
    command to compile the target given the dependencies. 
```

This is convenient because we don't have to draw graphs ourselves and input the command by hand to compile/recompile the project files anymore. 

**Things to Note**

By default, it will try to compile the first target, the first line. 

**Question**: 

What is an object file? Each object file is an intermediate compilation file. For each `cpp` file, there is an object file that is associated with it, and the `cpp` file is the dependency for the object file. 

So it's like: `executable -> object files -> cpp source file`, where the arrows `->`means: "requires".

