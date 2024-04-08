- [Convolution Layer](Convolution%20Layer.md)
- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)


---
### **Intro**

Region proposal network (RPN), gives bounding boxes for objects in a picture. 
See [Faster RCNN](10.48550/arXiv.1506.01497) the paper for where it's used. 
The RPN module is implemented as part of torch vision. 
See [here](https://github.com/pytorch/vision/blob/main/torchvision/models/detection/rpn.py) for the implementation in python source code. 
See [RPN](RPN.canvas) for visualizations of the modules. 

#### **High Level Summarizations**
> Nest several layers of convolutional layers over an image to create a *<mark style="background: #FFB86CA6;">convolutional feature map</mark>*. 
> Another small network (referred as *mini network*) slide through the feature layer to produce output. 
> In paper they had a $3\times 3$  window size. 
> The output is fed into two components, one for *<mark style="background: #FFB86CA6;">box regression</mark>*, and the other one for *<mark style="background: #FFB86CA6;">box classifications</mark>*. 
> 
> Generically speaking, the network the produces the feature maps can be any kind of vision network that is suitable for the specific applications. 

**Remark**

Using a $3\times 3$ region on the feature map corresponds to a much larger area on the original image. 
It's usually huge and it depends on what components are used to aggregate the image into feature maps. 
The region in the input image the correlates to any $3\times 3$ features maps are referred to as the *<mark style="background: #FFB86CA6;">reception field</mark>*. 
We emphasize the the mini network are the same hence it's shared over multiple reception field. 

**Neural Network Invariant**

The region proposal network is translational invariant wrt to the bounding boxes of an object of interests. 
Because we are sliding over the same shared mini network of the feature map. If an object is somewhere, it will be detected. 

#### **The Mini Network | RPN Head**
> It's a simple convolutional network and a 1x1 convolution layer with multiple channel, branching for box regression and classification regression. 

#### **Anchor**
> Region proposal are made by the mini network over feature map. 
> The mini network focuses on 2 type of outputs. 
> Let $k$ be the total number of region proposal over the feature map. 
> The output for the bounding box are 4 of the cooredinate related to the center of the anchor. 
> An anchor is in the input image, framing the object of interests and the parameters are the relevant coordinate. 

**Remarks**

The type of anchors are fixed. 
The mini network only predict predetermined type of anchor window. 

#### **Multi-Scales of Anchors**
> 
