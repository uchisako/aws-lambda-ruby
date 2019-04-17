FROM amazonlinux

RUN yum install -y git

ENV RBENV_ROOT=/opt/rbenv
ENV PATH $RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH
RUN export PATH="${RBEVN_ROOT}/bin:$PATH"
RUN git clone https://github.com/rbenv/rbenv.git /opt/rbenv && \
    mkdir /opt/rbenv/plugins && \
    git clone https://github.com/rbenv/ruby-build.git /opt/rbenv/plugins/ruby-build
RUN yum install -y bzip2 tar make gcc openssl-devel readline-devel zlib-devel
RUN rbenv install 2.5.3 && rbenv global 2.5.3 && gem update --system && rbenv rehash
