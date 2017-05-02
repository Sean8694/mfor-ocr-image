FROM python:3.6.1
MAINTAINER Sean <sean8694@gmail.com>
RUN apt-get update \
  && apt-get install -y build-essential cmake pkg-config libjpeg62-turbo-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran unzip \
  && rm -rf /var/lib/apt/lists/*
RUN pip install numpy scipy protobuf tensorflow keras pillow h5py django
RUN cd /root \
  && wget https://github.com/opencv/opencv/archive/3.2.0.zip -O opencv-3.2.0.zip \
  && wget https://github.com/opencv/opencv_contrib/archive/3.2.0.zip -O opencv_contrib-3.2.0.zip \
  && unzip opencv-3.2.0.zip \
  && unzip opencv_contrib-3.2.0.zip \
  && cd opencv-3.2.0 \
  && mkdir build \
  && cd build \
  && cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=/root/opencv_contrib-3.2.0/modules \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D PYTHON_EXECUTABLE=/usr/local/bin/python \
    -D BUILD_EXAMPLES=ON .. \
  && make install \
  && cd / \
  && rm -rf /root/*
