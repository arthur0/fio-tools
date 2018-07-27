FROM ubuntu

LABEL mantainer=arthur.souzamiranda@gmail.com

RUN apt-get update && apt-get install -y \
    fio

COPY . /app
WORKDIR /app

#     # TODO(arthur0): Add WORKDIR
# COPY ./run.sh /
# COPY ./job-templates /
# RUN chmod +x /run.sh

ENTRYPOINT ["bash", "/app/run.sh"]
