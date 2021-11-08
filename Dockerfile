# FROM golang:1.16
# WORKDIR /go/src/
#
# COPY pylon/core/tools/minio/minio_madmin.go .
# RUN set -x \
#   && go get -d -v github.com/minio/minio/pkg/madmin \
#   && go build -o minio_madmin.so -buildmode=c-shared minio_madmin.go

FROM python:3.8
WORKDIR /usr/src/app

COPY ./ ./
# COPY --from=0 /go/src/minio_madmin.so pylon/core/tools/minio/

RUN set -x \
  && pip install --no-cache-dir .

CMD [ "python", "-m", "pylon.main" ]
