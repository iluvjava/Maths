- [Convolution Layer](Convolution%20Layer.md)
- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)


---
### **Intro**

Region proposal network (RPN), gives bounding boxes for objects in a picture. 
See [Faster RCNN](https://arxiv.org/abs/1506.01497)) the paper for where it's used. 
See  the paper for where it's used. 
The RPN module is implemented as part of torch vision. 
See [here](https://github.com/pytorch/vision/blob/main/torchvision/models/detection/rpn.py) for the implementation in python source code. 
Just note that we fix our attention on commit `3c312e2`, the RPN module of this commit is [linked here](https://github.com/pytorch/vision/tree/5181a854d8b127cf465cd22a67c1b5aaf6ccae05/torchvision/models/detection). 

Read [This Blog Post](https://www.neuralception.com/objectdetection-fasterrcnn/) for a overall view of the Neural Architecture of RCNN. 
See [RPN](RPN.canvas) for visualizations of the modules. 

#### **High Level Summarizations**
> The RPN takes input from *<mark style="background: #FFB86CA6;">convolutional feature map</mark>* and propose rectangular back in the original images that may contain objects of intersts. 
> It consists of a small network (referred as *mini network*) that slides through the convolution featuer map to produce output. 
> In paper, the mini network takes in a $3\times 3$ tensor from the convolutional feature map as the input. 
> The output at each location is fed into two components, one for *<mark style="background: #FFB86CA6;">box regression</mark>*, and the other one for *<mark style="background: #FFB86CA6;">box classifications</mark>*. 
> The feature maps are low dimensional laten features produced by any generic vision networks. 

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

**Remark**

The source code of this component is [line 15 here](https://github.com/pytorch/vision/blob/5181a854d8b127cf465cd22a67c1b5aaf6ccae05/torchvision/models/detection/rpn.py#L15)

#### **Anchor**
> An anchor is a point in the original image, inside the perception field of each of the mini network every time when they does an inference on the feature map. 
> The anchor is associated with the outputs of the mini network. 
> The mini network focuses on 2 type of outputs. 
> Let $k$ be the total number of region proposal over the feature map. 
> 1. The output for the bounding box are 4 of the cooredinate related to the center of the anchor. 
> 2. An anchor is in the input image, framing the object of interests and the parameters are the relevant coordinate. 

**Remarks**

The type of anchors are fixed. 
The mini network only predict predetermined type of anchor window. 

#### **Multi-Scales of Anchors**
> The mininetwork prposes fixed sized regression boxes around the anchor in the reception field of the input image. 
