FROM ubuntu:jammy

ARG user=rosdoc2
ARG uid=1000

# Setup locale and minimum debian packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y locales curl gnupg

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

# Add ros2 repos, needed for python3-colcon-core
RUN sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update

ENV LANG=en_US.UTF-8 
RUN apt install -y --no-install-recommends doxygen graphviz python3-pip python3-venv
# from stdeb.cfg requirements
RUN apt install -y --no-install-recommends \
  python3-sphinx \
  python3-breathe \
  python3-catkin-pkg \
  python3-exhale \
  python3-jinja2 \
  python3-myst-parser \
  python3-setuptools \
  python3-sphinx-rtd-theme \
  python3-yaml \
  python3-colcon-core

COPY run.sh /usr/local/bin/run_rosdoc2
RUN useradd -u $uid -m $user

WORKDIR /rosdoc2
USER $user
CMD ["run_rosdoc2"]
