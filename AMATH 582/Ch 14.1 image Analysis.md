What happens with higher dimensional data and how we can use some of the math ideas to handle these problems. 
Biomedical Images cares a lot of about these stuff. 
[Lecture Reference](https://www.youtube.com/watch?v=m79oWRIDopo&feature=youtu.be&ab_channel=NathanKutz)

---

### Intro

Let's take a look at some of the examples of the data that we are going to deal with: 
1. Ultrasound 
2. Infrared/thermal
3. Thermography
4. MRI 
5. Radar 
6. Computer Graphics. 

Let's take a look at some of the things we want to do with the images. 

#### Image Contrast Enhancement
1. Detecting Edge
2. Built-in with a lot of photos software
3. Image Denoising
4. Deblurring

$$
u_0 = u + n
$$
Where the first part is the perfect image: $u$, and the $n$ is some kind of **Gaussian Noise**. 

$$
u_0 = (1 - s(x))u(x) + s(x)c(x)
$$
**Salt Pepper Noise**. When $s(x)$ is present, then the color is going to be a black, or white pixels. (Sparse occuring white and black pixels)

**Deblurring**: Causes by camera shake, out of focus. 
1. Just apply the average filter across each image of the pixels. 

**Segmentation, Edge Detection**
Having an outline that is clear. All we need is the edge information. 

---
### Five Key Mathematical Methods
1. Morphological Approach
	* 2D objects are sets or domains of the 2D plane. 
	* Edge detection, sets and domain as the minimal representations of the problem.

2.  Fourier Analysis
	* Frequency Content (Clustering and high energy content), throwing out the unimportant parts and get the sparse Fourier Representations of the image. 
	* Jpeg compression (8 x 8 DCT quantization, and zigzag huffman coding)

3. Wavelets
	* Wavelet, square wave creates board frequencies contents.** The edges in the images are like step function**, which they are going to create a board frequencies contents after the FFT. 
	* Signal projections onto a **Wavelet Basis**
	* With **Wavelet Basis**, we will be able to use much much less frequencies coefficients to represents the image. 

4. Denoising --> Diffusion
	* $u_t = u_{xx}$, treat the image like a heat distributions. 

---
### MATLAB Demo Code
Reading images as tensors, and then transforming it to gray scale and then put it through FFT. 

```matlab
A = imread('photo', 'tiff')   	% Read image as a 3 depth tensor, uint8 types
image(A)        			  	% Plot the image
size(A)  					  	% 600, 800
noise = randn(600, 800, 3); 
An    = double(A) + noise;		% With noise
A2    = uint8(An);
subplot(2,2,2), image(A2)       % Plotting noisy image
Abw = rgb2gray(A)               % to gray scale with a very specific weighted average 
subplot(2, 2, 3), imageshow(Abw)
size(Ab2)                       % 600 x 800 

figure(2); 
B = double(Ab2);
Bt = abs(fftshift(fft2(B)))
subplot(2, 2, 1); pcolor(B) shading interp; colormap(hot); 
subplot(2, 2, ,2), pcolor(log(Bt)), shading interp, colormap(hot);
```

---
### Extra Comments

When dealing with images, keep track of the RGB, keep track of the type, is it uint8, double in range of (0, 255), or is it double normalized from the color space. 

* `imgshow`: double in range `0., 255`. 
* `pcolor`: bottom left cornered to be `(0. 0)` for normalized double representation of the image. Should be used with `shading interp` command. 