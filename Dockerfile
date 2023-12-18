FROM golang:1.9.6 as build

WORKDIR /aplicacao

COPY main.go .

RUN go build -o app main.go


FROM scratch

COPY --from=build /aplicacao/app ./app

ENTRYPOINT [ "./app" ]
