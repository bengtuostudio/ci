FROM centos:6
MAINTAINER <kuiseng.zhb>
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | bash
RUN yum -y groupinstall "Development Tools"
RUN yum -y install screen zlib-dev openssl-devel sqlite-devel bzip2-devel xz-libs
RUN yum -y install centos-release-SCL
RUN yum install -y epel-release
RUN yes|yum -y install python27 python27-python-devel python27-python-setuptools python27-python-tools npm
RUN yum -y install gitlab-ci-multi-runner vim
RUN scl enable python27 bash
RUN yum -y install tomcat nginx
RUN yum -y install fabric
RUM npm install bower 
RUN mkdir -p /home/admin/tools
ADD .  /home/admin/tools/
WORKDIR  /home/admin
RUN cd /home/admin/tools/ && fab init
RUN chmod 400 /root/.ssh/id_rsa
EXPOSE 80

