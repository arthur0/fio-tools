# TODO(arthur0): Change image to alpine
FROM python:3.6

LABEL mantainer=arthur.souzamiranda@gmail.com

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV MPLBACKEND="agg"

RUN pip install pipenv

COPY Pipfile* /usr/src/app/
RUN pipenv install --system --deploy

COPY main.py /usr/src/app

RUN mkdir -p /benchmarks
RUN mkdir -p /plots

ENTRYPOINT ["python3", "main.py"]
