FROM ubuntu:jammy

ARG user=distro_clone
ARG uid=1000

# Setup locale and minimum debian packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8 

# Add ros2 repos, needed for python3-colcon-core
# RUN apt install -y software-properties-common curl
# RUN add-apt-repository universe
# RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
# RUN apt update

RUN apt install -y --no-install-recommends python3-pip python3-venv
# from stdeb.cfg requirements
RUN apt install -y --no-install-recommends \
  python3-catkin-pkg \
  python3-setuptools \
  python3-yaml \
  git

COPY run_distroclone.sh /usr/local/bin/run_distroclone
RUN useradd -u $uid -m $user

WORKDIR /workspace
USER $user
