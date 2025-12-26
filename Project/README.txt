Material from project: Pedestrian Detection and Gender Recognition from Non-Intrusive Camera Videos using Convolutional Networks
March 06, 2017
Author: Federico Zanetti
federico.zanetti@studenti.unitn.it

Content: 

change_format.py : script used to change format of images in structure used by gender_recognition_federico_jpg.py
gender_recognition_federico_jpg.py : python code for training and testing of images.
gender_recognition_federico_jpg_savepeople3.py : python code for training and testing and computation of confusion matrix and test errors.
test_gpu.py : script to check correct functioning of GPU
Test-1: weights of CNN of Test-1
Test-2: weights of CNN of Test-2
main_manual_people_crop.m : matlab script for manual pedestrian patches extraction
main_manual_people_crop_faster : similar to previous just made to speed up the process
extend_dataset_fede.m : matlab script that introduces noise to the images in order to increase the dataset
PeopleDetector_fede2. : used for pedestrian detection, also contains tunable parameters.

NOTES:
>>The parameters used for training, testing and other CNN analysis are set and explained at the beginning of gender_recognition_federico_jpg.py and gender_recognition_federico_jpg_savepeople3.py 
>>The acc. value on the weights name, is the accuracy obtained from a validation set different from the testing set used to evaluate the final results in the report.
>>The Matlab code for pedestrian detetion used the Matlab Computer Vision Toolbox (https://www.mathworks.com/products/computer-vision.html).

To follow is a description step by step of the installation of the Theano-Lasagne environment.

The installation of the components has been performed on a 64-bit Linux machine. The operating system was Ubuntu 14.04. 32-bit architectures are not well-tested and should not be preferred for a Theano installation. In order to install it, a list of libraries and software packages had to be installed. Ubuntu in this installation uses the Python 2.7.10 but Python 3 is supported as well past the 3.3 release. 
The development package (python-dev or python-devel on most Linux distributions) was recommended and has ben installed with the terminal command: 
$ sudo apt-get install python-dev
An installation of g++ was performed.  Although g++ is technically required it is highly recommended by the installation instructions in order to compile generated C code. Theano can fall back on a NumPy-based Python execution model, but a C compiler allows for vastly faster execution. g++ >= 4.2 was recommended and eventually selected for the installation.
$ sudo apt-get install g++
A Basic Linear Algebra Subprograms (BLAS) installation was necessary. It is a tool that prescribes a set of low-level routines for performing common linear algebra operations such as vector addition, scalar multiplication, dot products, linear combinations, and matrix multiplication. 
$ sudo apt-get install libblas-dev
Matplotlib is a plotting library for the Python programming language provides an object-oriented API for embedding plots. IPython is a command shell for python programming language. For these two the following comman line has been used:
$ sudo apt-get install python-matplotlib ipython ipython-notebook
Other required installations:
$ sudo apt-get install python-pandas python-sympy python-nose
It is required also to install NumPy, at least version 1.7.1 or newer. Earlier versions could work, but have not been tested. The same goes with SciPy, at least version 0.11 is necessary.
$ sudo pip install numpy
$ sudo pip install scipy
$ sudo pip-install scikit-image scikit-learn (or: pip install –U scikit-image)
To install pip simply run the get-pip.py script with Python.
NumPy is an extension to the Python programming language which adds support for large, multi-dimensional arrays and matrices and functions to operate on these arrays. SciPy is another open source Python library used for  scientific computing and technical computing. At this point everything is ready for the Theano installation:
$ pip install Theano 
Lasagne requires numpy of version 1.6.2 or above, and Theano also requires scipy 0.11 or above, which have already been installed. The versions of Lasagne 0.1 requires to run the following command:
$ pip install -r https://raw.githubusercontent.com/Lasagne/Lasagne/v0.1/requirements.txt
Or: $ sudo pip install Lasagne==0.1
Other models built in Lasagne can be found at: https://github.com/Lasagne/Recipes.
It has been also installed the nolearn library, which is a wrapper for lasagne that cointains some machine learning utility modules:
$ pip install -r https://raw.githubusercontent.com/dnouri/nolearn/master/requirements.txt
$ pip install git+https://github.com/dnouri/nolearn.git@master#egg=nolearn==0.7.git
Or, to install the release from PyPI:
$ pip install nolearn
For last, the pydotplus package was installed for minor functionalities:
$ pip install pydotplus
To verify the correct installation of all modules:
$ pip list .
