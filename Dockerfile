FROM python:2 as downloader

RUN git clone https://github.com/ArtiomL/tls-scan.git

FROM python:2-slim

COPY --from=downloader tls-scan tls-scan

WORKDIR tls-scan

RUN pip install -r requirements.txt

CMD ./tls_scan.py --help