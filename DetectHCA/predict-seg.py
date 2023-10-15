import numpy as np
import matplotlib.pyplot as plt
import math
import cv2
import torch
from torchvision import transforms
from PIL import Image

#loaded_array = np.load("D:\\Downloads\\train0.npy")

img=cv2.imread("D:\simhawk\Task2-20231012T072306Z-001\Task2\image_hc_104.jpg",cv2.IMREAD_GRAYSCALE)

#-------------------
# Load your saved model
#model = torch.load('D:\\Downloads\\vgg16-transfer-4.pt')  # Replace 'vgg16-transfer-4.pt' with the path to your model file
#model.eval()  # Set the model to evaluation mode
#---------------------


#img
plt.figure()
plt.imshow(img,cmap='gray')
plt.title('img')

#canny
contour = cv2.Canny(img, 80, 160)
plt.figure()
plt.imshow(contour,cmap='gray')
plt.title('contour canny')

#dilate
# Define the kernel (structuring element) for dilation
kernel = np.ones((7, 7), np.uint8)  # You can adjust the kernel size as needed
# Perform dilation
dilated_image = cv2.dilate(contour, kernel, iterations=1)
plt.figure()
plt.imshow(dilated_image,cmap='gray')
plt.title('image countour')


#countour
contours, hierarchy = cv2.findContours(dilated_image, mode=cv2.RETR_EXTERNAL, method=cv2.CHAIN_APPROX_NONE)
#max_contour = [1]

#for i in range(len(contours)):
#        if len(contours[i])>len(max_contour):
#            max_contour = contours[i]

# draw detected contour # -1:all the contours are drawn; Color; Thickness of lines
image = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
#cv2.drawContours(image,max_contour, -1, (0, 255, 0), 4)

#=================
# Draw all the detected contours on the original image

cv2.drawContours(image, contours, -1, (0, 255, 0), 2)  # -1: draw all contours

#--------------------

plt.figure()
plt.imshow(image,cmap='gray')
plt.title('image countour')


plt.show()
print('Thats All Folks')
