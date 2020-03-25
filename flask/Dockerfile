FROM ossobv/uwsgi-python
COPY flaskapp.py  /opt/flaskapp.py
COPY wsgi.py /opt/wsgi.py
COPY myapp.ini /opt/myapp.ini
WORKDIR /opt/
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN chmod +x /opt/flaskapp.py
RUN chmod +x /opt/wsgi.py
RUN rm -rf /tmp/requirements.txt
CMD ["uwsgi", "--ini", "./myapp.ini"]
#CMD ["/opt/flaskapp.py"]
