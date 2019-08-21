FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt -y install \
        build-essential clang bison flex libreadline-dev gawk \
        tcl-dev libffi-dev git graphviz xdot pkg-config python3 autoconf gperf \
        cmake libgsl0-dev libx11-dev tk-dev

# Install IVerilog
WORKDIR /workspace/iverilog
RUN git clone https://github.com/steveicarus/iverilog.git . \
    && git checkout tags/v10_3 \
    && autoconf \
    && ./configure \
    && make \
    && make check \
    && make install

# Install Yosys
WORKDIR /workspace/yosys
RUN git clone https://github.com/YosysHQ/yosys.git . \
    && git checkout tags/yosys-0.8 \
    && make config-clang \
    && time make \
    && make test \
    && make install

# Install graywolf
WORKDIR /workspace/graywolf
RUN git clone https://github.com/rubund/graywolf.git . \
    && git checkout tags/0.1.6 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install 

# Install qrouter
WORKDIR /workspace/qrouter
RUN git clone git://opencircuitdesign.com/qrouter . \
    && git checkout tags/1.4.9 \
    && ./configure \
    && sed 's/CFLAGS += -g -O2/CFLAGS += -g -O2 -I\/usr\/include\/tcl8.6/' < Makefile > Makefile.fixed \
    && make -f Makefile.fixed \
    && make install

# Install magic

# Install netgen

# Install Qflow
# WORKDIR /workspace/qflow
# RUN git clone git://opencircuitdesign.com/qflow . \
#     && git checkout qflow-1.3 



ENTRYPOINT [ "qflow" ]