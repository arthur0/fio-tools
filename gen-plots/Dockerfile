# TODO(arthur0): Change image to alpine
FROM python:3

LABEL mantainer=arthur.souzamiranda@gmail.com

COPY . /app
WORKDIR /app

RUN pip install pipenv

RUN pipenv install --system --deploy

ENV MPLBACKEND="agg"

ENTRYPOINT ["python", "app.py"]

