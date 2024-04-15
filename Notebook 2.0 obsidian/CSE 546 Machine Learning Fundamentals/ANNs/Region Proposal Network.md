- [Convolution Layer](Convolution%20Layer.md)
- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)


---
### **Intro**

Region proposal network (RPN), gives bounding boxes for objects in a picture. 
See [Faster RCNN](https://arxiv.org/abs/1506.01497)) the paper for where it's used. 
See  the paper for where it's used. 
The RPN module is implemented as part of torch vision. 
See [here](https://github.com/pytorch/vision/blob/main/torchvision/models/detection/rpn.py) for the implementation in python source code. 
Just note that we fix our attention on commit `3c312e2`, the RPN module of this commit is [linked here](https://github.com/pytorch/visioon/tree/5181a854d8b127cf465cd22a67c1b5aaf6ccae05/torchvision/models/detection). 

Read [This Blog Post](https://www.neuralception.com/objectdetection-fasterrcnn/) for a overall view of the Neural Architecture of RCNN. 
See [RPN](RPN.canvas) for visualizations of the modules. 

#### **High Level Summarizations**
> The RPN takes input from *<mark style="background: #FFB86CA6;">convolutional feature map</mark>* and propose rectangular back in the original images that may contain objects of interests. 
> It consists of a small network (referred as *mini network*) that slides through the convolution feature map to produce output. 
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
> In the paper, It takes in a $n\times n$ region from the feature map, pass it through several layers of convolutional network, branch into two $1\times 1$ convolution layer before. 
> They are then flattened into a vector and feed into two dense stacked linear neural networks. These two dense networks are classifications, and regression network. 

**Remark**

The source code of this component is [line 15 here](https://github.com/pytorch/vision/blob/5181a854d8b127cf465cd22a67c1b5aaf6ccae05/torchvision/models/detection/rpn.py#L15). 
We will talk more about it when it comes to training the RPN using a loss function. 

#### **Anchor Boxes**
> Let a tensor $X$ of shape $(H, W, C)$ be the feature map resulted from a single input sample.
> The mini network takes in $X_{[i-1:i+1, j-1:j+1, :]}$, from the feature map and it produces *anchor boxes* and classifications scores for each box. 
> These anchors boxes represent regions with a fixed set of ratios and sizes, corresponding to a region in the original image (it will be used by other components inside of RCNN neural network) centered at the center of the reception field of $X_{[i, j, :]}$. 


**Remarks**

The type of anchors are fixed. 
The mini network only predict predetermined type of anchor window.
We state the following facts associated with the anchor boxes.  
1. The output for the bounding box are 4 of the coordinate related to the center of the anchor. 
2. An anchor is in the input image, framing the object of interests and the parameters are the relevant coordinate. 

#### **Multi-Scales of Anchors Boxes**
> The mini network processes fixed sized regression boxes around the anchor in the reception field of the input image. 


---
#### **Loss Functions and Training**


