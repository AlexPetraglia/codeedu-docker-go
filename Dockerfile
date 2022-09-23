FROM golang:alpine AS golang-image
WORKDIR /app
COPY . .
RUN go build rocks.go

FROM scratch
WORKDIR /app
COPY --from=golang-image /app/rocks .
ENTRYPOINT ["./rocks"]