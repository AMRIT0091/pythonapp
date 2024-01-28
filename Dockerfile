FROM python:3.8
WORKDIR /app
COPY . /app
RUN pip install Flask
RUN FLASK_ENV=development flask run
EXPOSE 80
CMD ["python", "./main.py"]
