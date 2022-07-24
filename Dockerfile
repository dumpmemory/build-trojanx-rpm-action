FROM fedora:36

RUN dnf install -y rpmdevtools

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
