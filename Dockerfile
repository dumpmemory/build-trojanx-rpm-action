FROM fedora:36

RUN dnf install -y rpmdevtools

RUN rpmdev-setuptree

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
