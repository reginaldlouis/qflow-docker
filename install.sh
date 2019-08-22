export DEBIAN_FRONTEND=noninteractive

sudo apt update \
&& sudo apt -y install \
build-essential clang bison flex libreadline-dev gawk \
tcl-dev libffi-dev git graphviz xdot pkg-config python3 autoconf gperf \
cmake libgsl0-dev libx11-dev tk-dev python3-tk \
libglu1-mesa-dev freeglut3-dev mesa-common-dev libcairo2-dev csh tcsh

mkdir -p ~/workspace/iverilog \
&& cd ~/workspace/iverilog  \
&& git clone https://github.com/steveicarus/iverilog.git . \
&& git checkout tags/v10_3 \
&& autoconf \
&& ./configure \
&& make \
&& make check \
&& make install

mkdir -p ~/workspace/yosys \
&& cd ~/workspace/yosys \
&& git clone https://github.com/YosysHQ/yosys.git . \
&& git checkout tags/yosys-0.8 \
&& make config-clang \
&& make \
&& sudo make install

mkdir -p ~/workspace/graywolf \
&& cd ~/workspace/graywolf \
&& git clone https://github.com/rubund/graywolf.git . \
&& git checkout tags/0.1.6 \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make \
&& sudo make install 

mkdir -p ~/workspace/qrouter \
&& cd ~/workspace/qrouter \
&& git clone git://opencircuitdesign.com/qrouter . \
&& git checkout tags/1.4.9 \
&& ./configure \
&& sed 's/CFLAGS += -g -O2/CFLAGS += -g -O2 -I\/usr\/include\/tcl8.6/' < Makefile > Makefile.fixed \
&& make -f Makefile.fixed \
&& sudo make install

mkdir -p ~/workspace/magic \
&& cd ~/workspace/magic \
&& git clone git://opencircuitdesign.com/magic . \
&& git checkout tags/8.2.102 \
&& ./configure \
&& make \
&& sudo make install

mkdir -p ~/workspace/netgen \
&& cd ~/workspace/netgen \
&& git clone git://opencircuitdesign.com/netgen . \
&& git checkout tags/1.5.118 \
&& ./configure \
&& make \
&& sudo make install

mkdir -p ~/workspace/qflow \
&& cd ~/workspace/qflow \
&& git clone git://opencircuitdesign.com/qflow . \
&& git checkout qflow-1.3 \
&& ./configure \
&& make \
&& sudo make install
