FROM arm64v8/golang:alpine as stage1
WORKDIR /app
COPY . .
RUN go mod init cursodocker
RUN go build -o app

FROM scratch
WORKDIR /app
COPY --from=stage1 /app/app .

ENTRYPOINT [ "./app" ]