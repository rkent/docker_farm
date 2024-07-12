FROM alpine
# adapted from https://github.com/alpine-docker/git

RUN apk fix && \
    apk --no-cache --update add git git-lfs gpg less openssh patch perl && \
    git lfs install

