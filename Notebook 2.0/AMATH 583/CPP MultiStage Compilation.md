Here we learn about how the multi-stage compilation works in CPP, we would need this to compiles files for us. 

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

