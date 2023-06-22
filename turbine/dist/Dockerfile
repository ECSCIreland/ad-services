FROM ubuntu:20.04 as builder
RUN apt-get update && apt-get install --yes --no-install-recommends cmake gfortran make

RUN mkdir /src /build

COPY src /src
RUN cd /src/deps/fortran-unix && \
    make clean linux
RUN cd /build && \
    cmake /src -DFORTRAN_UNIX_DIR=/src/deps/fortran-unix && \
    make

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y tcpdump python3 sudo iproute2
COPY sync.py /sync.py
COPY cleanup-cron /etc/cron.d/cleanup-cron
RUN mkdir /tmp/pcaps
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
        cron \
        libgfortran5 \
        socat && \
    useradd service && \
    chmod u+s /usr/sbin/cron && \
    crontab -u service /etc/cron.d/cleanup-cron && \
    mkdir -p /data && \
    chown service:service /data

RUN chmod a+w /tmp/pcaps
COPY --chown=root entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY --from=builder /build/winds_of_the_past /service

ENTRYPOINT ["/entrypoint.sh"]
