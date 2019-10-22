
FROM debian:10
LABEL "maintainer"="FreeHackQuest Team <freehackquest@gmail.com>"
LABEL "repository"="https://github.com/freehackquest/debian-10-cpp-common"

RUN apt-get -y update
RUN apt-get install -y \
    libcurl4 \
    zlibc \
    zlib1g \
    libpng16-16 \
    libmariadb3 \
    libpthread-stubs0-dev \
    libssl-dev \
    python \
    python-pip \
    python3 \
    python3-pip \
    && pip install requests \
    && pip3 install requests

# COPY --from=0 /root/your-project/your-project.bin /usr/bin/your-project.bin

# EXPOSE 8080
# CMD ["your-project.bin","start"]