This is a simple golang application that spits our static weather information.

## Building
Since we don't rely on any third-party deps, we can just build the application as-is
```bash
go build main.go -o weather
```
### With docker
```
docker build -t weather:latest .
```


## Running
To run the application, you must specify two environment variables, `PORT` and `BASE_URL`. `PORT` is the port for the web server to listen on, and `BASE_URL` is the base url that the application will serve requests from.

```bash
export PORT=8080
export BASE_URL=localhost:8080
./weather
```
### With docker
```
docker run -e PORT=8080 -e BASE_URL=localhost:8080 -p 8080:8080 weather
```

## Notes
* Normally, CI would lint, build and push the image to the docker hub. Skipped due to time.
