FROM python:3.8
WORKDIR /src
COPY . /src
RUN pip install flask
RUN pip install flask_restful
EXPOSE 8087
ENTRYPOINT ["python"]
CMD ["./src/main.py"]
