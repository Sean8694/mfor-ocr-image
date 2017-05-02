FROM python:3.6.1
MAINTAINER Sean <sean8694@gmail.com>
RUN apt-get update \
  && apt-get install -y build-essential cmake pkg-config libjpeg62-turbo-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran unzip \
  && rm -rf /var/lib/apt/lists/*
RUN pip install numpy tensorflow keras pillow h5py scipy
RUN cd /root
RUN curl https://github.com/opencv/opencv/archive/3.2.0.zip -O opencv-3.2.0.zip
RUN unzip opencv-3.2.0.zip
RUN cd opencv-3.2.0
RUN mkdir build
RUN cd build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE
    -D CMAKE_INSTALL_PREFIX=/usr/local
    -D BUILD_opencv_python2=OFF
    -D BUILD_opencv_python3=ON
    -D INSTALL_PYTHON_EXAMPLES=ON
    -D INSTALL_C_EXAMPLES=OFF
    -D PYTHON_EXECUTABLE=/usr/local/bin/python
    -D BUILD_EXAMPLES=ON ..
RUN make install
RUN cd /
RUN rm -rf /root/*
