# debian-10-for-cpp-common

Docker with preinstalled libcurl4, mysql client library, python, python-pip and etc...

If need you can expand this list, I will not be against.

For release you can must use symmentric docker image:

https://github.com/freehackquest/debian-10-cpp-build

## Example dockerfile usage

```
# stage 0: build binary
FROM freehackquest/debian-10-for-cpp-build:latest
LABEL "maintainer"="Your Name <email@email.com>"
LABEL "repository"="https://github.com/name/repository"

COPY ./your-project /root/sources
WORKDIR /root/sources
RUN ./clean.sh && ./build_simple.sh

# stage 1: release
FROM freehackquest/debian-10-for-cpp-common:latest
LABEL "maintainer"="Your Name <email@email.com>"
LABEL "repository"="https://github.com/name/repository"

COPY --from=0 /root/sources/your-project.bin /usr/bin/your-project.bin
COPY ./your-project-data /usr/share/your-project-data

EXPOSE 4444
CMD ["your-project.bin","start"]

```