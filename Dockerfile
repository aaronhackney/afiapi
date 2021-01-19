FROM python:3.9
RUN mkdir -p /afiapi
RUN mkdir -p /afiapi/run
RUN mkdir -p /afiapi/log
COPY . /afiapi
WORKDIR /afiapi/afiapi
RUN pip3 install -r /afiapi/requirements.txt
EXPOSE 8080
CMD ["gunicorn", "-w", "3", "-b", "0.0.0.0:8080", "--access-logfile", "/afiapi/log/access", "--error-logfile", "/afiapi/log/error", "wsgi:app"]
