FROM funes1899/bin_af362_ub18 
#add flashlight
RUN git clone https://github.com/facebookresearch/flashlight.git 
WORKDIR flashlight
RUN mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DFLASHLIGHT_BACKEND=CUDA -DFL_BUILD_DISTRIBUTED=OFF -DFL_BUILD_TESTS=OFF -DFL_BUILD_EXAMPLES=OFF  && make -j4 && make install
ARG DEBIAN_FRONTEND=noninteractive  
RUN apt-get update && apt-get -y install vim-nox cmake-curses-gui
