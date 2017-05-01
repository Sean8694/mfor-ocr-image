FROM python:3.6.1
MAINTAINER Sean <sean8694@gmail.com>
RUN apt-get update \
  && apt-get install -y build-essential cmake pkg-config libjpeg62-turbo-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran unzip \
  && rm -rf /var/lib/apt/lists/*
RUN pip install numpy tensorflow keras pillow h5py scipy
RUN curl https://codeload.github.com/opencv/opencv/zip/3.2.0 -O /root/opencv-3.2.0.zip \
  && cd /root \
  && unzip opencv-3.2.0.zip \
  && cd opencv-3.2.0 \
  && mkdir build \
  && cd build \
  && cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D PYTHON_EXECUTABLE=/usr/local/bin/python \
    -D BUILD_EXAMPLES=ON .. \
  && make install \
  && cd / \
  && rm -rf /root/*
