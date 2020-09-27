FROM golang:1.14-alpine as builder
ENV BASE_URL=localhost:8080
ENV PORT=8080
WORKDIR /build
COPY . /build

RUN go build -o weather

FROM alpine:latest
ENV BASE_URL=localhost:8080
ENV PORT=8080
COPY --from=builder /build/weather /bin/weather
RUN groupadd -r weather && useradd -r -g weather weather
USER weather
CMD ["weather"]
