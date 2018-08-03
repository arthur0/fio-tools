# TODO(arthur0): Change image to alpine
FROM python:3.6

LABEL mantainer=arthur.souzamiranda@gmail.com

EXPOSE 8000

RUN mkdir -p /server/benchmarks
RUN mkdir -p /server/plots

CMD ["python3", "-m", "http.server", "8000"]