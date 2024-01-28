FROM python:3.8
WORKDIR /app
COPY . /app
RUN pip install Flask
EXPOSE 80
CMD ["python", "./main.py"]
