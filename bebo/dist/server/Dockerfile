FROM python:3.10

RUN apt-get update && apt-get install -y zip sudo tcpdump

RUN useradd server && useradd userbackup
RUN echo 'server ALL=(userbackup:userbackup) NOPASSWD: ALL' >> /etc/sudoers

WORKDIR /app

RUN mkdir /app/storage && chmod 777 /app/storage

COPY requirements.txt ./
RUN pip install -r requirements.txt


COPY *.py ./

COPY sync.py /sync.py
RUN mkdir /tmp/pcaps
RUN chmod a+w /tmp/pcaps
COPY --chown=root entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
