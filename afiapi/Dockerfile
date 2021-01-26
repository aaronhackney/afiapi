FROM python:3.9
RUN mkdir -p /afiapi
RUN mkdir -p /afiapi/log
COPY . /afiapi
WORKDIR /afiapi
# RUN pip3 install -r requirements.txt
RUN pip3 install .
EXPOSE 8080
WORKDIR /afiapi/afiapi
CMD ["gunicorn", "-w", "3", "-b", "0.0.0.0:8080", "--access-logfile", "/afiapi/log/access", "--error-logfile", \
    "/afiapi/log/error", "wsgi:app"]
# CMD ["gunicorn", "-w", "3", "-b", "0.0.0.0:8080", "wsgi:app"]
