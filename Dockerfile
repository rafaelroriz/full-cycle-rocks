FROM golang:latest AS builder

WORKDIR /src
COPY main.go .
RUN go build -o fullcycle main.go 

FROM scratch
COPY --from=builder /src .
ENTRYPOINT [ "./fullcycle" ]