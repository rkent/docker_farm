ARG ROS_DISTRO=rolling
FROM ros:${ROS_DISTRO}

ARG user=rosdoc2
ARG uid=1000

# Setup locale and minimum debian packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
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
  git

RUN echo "GIT_COMMIT=$(git rev-parse HEAD)"
COPY run_rosdoc2.sh /usr/local/bin/run_rosdoc2
RUN if [ "$(id -u ubuntu 2>/dev/null || true)" = "$uid" ]; then \
      usermod -l "$user" -d "/home/$user" -m ubuntu; \
    else \
      useradd -u "$uid" -m "$user"; \
    fi

WORKDIR /workspace
USER $user
