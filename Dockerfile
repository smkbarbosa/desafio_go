FROM golang:1.14.6-alpine3.12 as build

WORKDIR $GOPATH/go/src/app

COPY fullcycle.go .

RUN CGO_ENABLE=0 go build -o /app fullcycle.go

FROM scratch

COPY --from=build /app /app

CMD ["/app"]