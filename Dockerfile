FROM centos:7

RUN yum update -y

RUN yum groupinstall -y 'Development Tools' && \
    yum install -y zlib-devel && \
    yum clean all 

RUN cd /tmp && \
    curl ftp://ftp.gnu.org/gnu/swbis/swbis-1.13.1.tar.gz > swbis-1.13.1.tar.gz && \
    tar -xvf swbis-1.13.1.tar.gz && \
    cd swbis-1.13.1 && \
    ./configure && \
    make && \
    make check && \
    make install && \
    swpackage --version && \
    cd .. && \
    rm -r /tmp/swbis-1.13.1 swbis-1.13.1.tar.gz && \
    mkdir /build

WORKDIR "/build"

