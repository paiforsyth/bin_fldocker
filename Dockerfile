FROM nvidia/cuda:10.0-devel-ubuntu18.04
RUN apt-get update && apt-get install -y software-properties-common && \
    apt-get install -y --no-install-recommends \
        build-essential \
        clinfo \
        cmake \
        git \
        libboost-all-dev \
        libfftw3-dev \
        libfontconfig1-dev \
        libfreeimage-dev \
        liblapack-dev \
        liblapacke-dev \
        libopenblas-dev \
        ocl-icd-opencl-dev \
        opencl-headers \
        wget \
        xorg-dev && \
rm -rf /var/lib/apt/lists/*

RUN wget https://arrayfire.s3.amazonaws.com/3.6.2/ArrayFire-no-gl-v3.6.2_Linux_x86_64.sh && chmod +x ArrayFire-no-gl-v3.6.2_Linux_x86_64.sh && echo "y" | ./ArrayFire-no-gl-v3.6.2_Linux_x86_64.sh --include-subdir --prefix=/opt && mv /opt/arrayfire-no-gl /opt/arrayfire && echo /opt/arrayfire/lib > /etc/ld.so.conf.d/arrayfire.conf && ldconfig && rm ArrayFire-no-gl-v3.6.2_Linux_x86_64.sh
