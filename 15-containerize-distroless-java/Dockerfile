FROM centos:8 as builder
RUN yum -y install yum-utils
RUN mkdir /newcontainer
RUN mkdir /download
WORKDIR /download/
RUN yumdownloader tzdata-java java-11-openjdk-headless java-11-openjdk-devel glibc zlib libstdc++ libgcc
WORKDIR /newcontainer/
RUN for i in ../download/*.rpm; do rpm2cpio $i | cpio -idmv; done;

FROM scratch
COPY --from=builder /newcontainer /
COPY bin /bin/
#ENV LD_DEBUG=all
ENTRYPOINT ["/usr/lib/jvm/java-11-openjdk-11.0.7.10-1.el8_1.x86_64/bin/java"]
ENTRYPOINT ["/usr/lib/jvm/java-11-openjdk-11.0.7.10-1.el8_1.x86_64/bin/jshell"]
ENTRYPOINT ["/bin/sh"]
