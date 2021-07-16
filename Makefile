
default:
	echo pass

NAME=phlummox/gsd5
TAG=rev-2021-07-b78b55ea


docker-build:
	docker build -t  $(NAME):$(TAG) .

docker-run:
	docker -D run --rm  -it \
			--env PORT=8080 -p 8080:8080  \
			-v $$PWD:/var/lib/tiddlywiki	\
			--name gsd5-tiddlywiki \
	    $(NAME):$(TAG)


