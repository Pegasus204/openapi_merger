# OpenapiMerger

![](https://github.com/Pegasus204/openapi_merger/workflows/Test/badge.svg) 

Merge divided OpenAPI documents to one OpenAPI document

## Installation

You can install OpenapiMerger from [DockerHub](https://hub.docker.com/r/pegasus204/openapi_merger).  
Execute this command to install from [DockerHub](https://hub.docker.com/r/pegasus204/openapi_merger).

```shell
$ docker pull pegasus204/openapi_merger
```

## Usage
### Recommend usage

Recommend usage is use with OpenAPI renderer on Docker Compose.

Here is docker-compose.yml example.

```docker
version: '3'
services:
  redoc:
    image: redocly/redoc:latest
    depends_on:
      - openapi_merger
    environment:
      SPEC_URL: openapi.json
    ports:
      - 8080:80
    volumes:
      - ./docs/swagger.json:/usr/share/nginx/html/swagger.json
  openapi_merger:
    image: pegasus204/openapi_merger
    environment:
      INPUT_FILE: ./src/index.yml
      OUTPUT_FILE: ./docs/openapi.json
    volumes:
      - ./src:/app/src
      - ./docs:/app/docs
```

You have to provide two environment variables and mount host directory to container directory.  

- INPUT_FILE means path to input OpenAPI file.
- OUTPUT_FILE means path to output OpenAPI file.
- Volumes are path to input/output directory or both.

Volumes should be placed on relational path from `/app` on container.

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/Pegasus204/openapi_merger).  
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Pegasus204/openapi_merger/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenapiMerger project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Pegasus204/openapi_merger/blob/master/CODE_OF_CONDUCT.md).
