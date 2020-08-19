FROM golang:1.15.0-buster as builder

WORKDIR /app
COPY main.go /app
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://proxy.golang.org go build -o app ./main.go

FROM alpine:3.12.0

WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]