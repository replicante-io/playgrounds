FROM python:3.7-alpine

ENV FLASK_ENV=development
RUN pip3 install pipenv==2018.11.26

COPY app.py Pipfile Pipfile.lock /code/
WORKDIR /code
RUN pipenv sync
CMD ["pipenv", "run", "flask", "run", "--host", "0.0.0.0"]
