FROM centos:7

MAINTAINER Al West <al@tsew.net>

RUN yum -y update && \
    curl https://copr.fedorainfracloud.org/coprs/vbatts/bazel/repo/epel-7/vbatts-bazel-epel-7.repo -o /etc/yum.repos.d/vbatts-bazel-epel-7.repo && \
    yum -y install bazel git @"Development tools" && \
    git clone https://gerrit.googlesource.com/plugins/delete-project && \
    cd delete-project/ && \
    git checkout -b stable-2.14 origin/stable-2.14 && \
    bazel build delete-project

VOLUME /root
