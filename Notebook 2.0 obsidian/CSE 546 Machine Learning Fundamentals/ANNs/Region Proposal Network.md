- [Convolution Layer](Convolution%20Layer.md)
- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)


---
### **Intro**

Region proposal network (RPN), gives bounding boxes for objects in a picture. 
See [Faster RCNN](10.48550/arXiv.1506.01497) the paper for where it's used. 
The RPN module is implemented as part of torch vision. 
See [here](https://github.com/pytorch/vision/blob/main/torchvision/models/detection/rpn.py) for the implementation in python source code. 

#### **High Level Summarizations**
> Nest several layers of convolutional layers over an image to create a *<mark style="background: #FFB86CA6;">convolutional feature map</mark>*. 
> Another small network (referred as *mini network*) slide through the feature layer to produce output. 
> In paper they had a $3\times 3$  window size. 
> The output is fed into two components, one for *<mark style="background: #FFB86CA6;">box regression</mark>*, and the other one for *<mark style="background: #FFB86CA6;">box classifications</mark>*. 

**Remark**

Using a $3\times 3$ region on the feature map corresponds to a much larger area on the original image. 
It's usually huge and it depends on what components are used to aggregate the image into feature maps. 
The region in the input image the correlates to any $3\times 3$ features maps are referred to as the *<mark style="background: #FFB86CA6;">reception field</mark>*. 
We emphasize the the mini network are the same hence it's shared over multiple reception field. 

Next, we go into each of the module one by one

#### **Anchor**
> 



