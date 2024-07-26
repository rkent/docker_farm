FROM ubuntu:jammy
RUN apt update
# Setup locale
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8 
RUN apt install -y --no-install-recommends doxygen graphviz python3-pip
COPY run.sh /usr/local/bin/run_rosdoc2
WORKDIR /rosdoc2
CMD ["run_rosdoc2"]
