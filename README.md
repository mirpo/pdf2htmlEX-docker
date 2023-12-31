### pdf2htmlEX docker image for MacBooks wirh M1, M2, M3

I was trying to find working Docker image for my MacBook Air 13 with M2
and ended up with creating own image.

## Requirements
- Docker[https://docs.docker.com/get-docker/]

## Build locally
```sh
docker buildx build --platform=linux/amd64 -t my-pdf2htmlex .
```

where:
- `my-pdf2htmlex` is your tag

## Run locally
```sh
docker run --platform linux/amd64 -ti --rm -v ~/Downloads:/pdf -w /pdf my-pdf2htmlex pdf2htmlEX 1.pdf 1.html
```

where:
- `~/Downloads` - folder where PDF file is located
- `my-pdf2htmlex` is your tag
- `1.pdf` - input PDF
- `1.html` - output HTML file
