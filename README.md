## How to run from docker?
## Build image
```
docker build -t fetch .
```
## Run container
```
docker run -it fetch
./fetch https://google.com
./fetch -m https://autify.com
```