[[CPP Basics 1]], [[CPP Classes Basics 2]]


---
### **Intro**

This the vector header class we defined: 

```cpp
#include <vector>

class Vector {
    public:
    // Constructor, no default constructor. 
    Vector(size_t M) : num_rows_(M), storage_(num_rows_) {}

    // operator() that support assignment and const access of data. 
          double& operator()(size_t i)       { return storage_[i]; }
    const double& operator()(size_t i) const { return storage_[i]; }

    size_t num_rows() const { return num_rows_; }

    private:
    size_t num_rows_;
    std::vector<double> storage_;
};
```

Here aer some of it's features: 
1. Private, public encapsulation for abstraction. 
2. Const keywords. 
3. Usage of operator functions.

