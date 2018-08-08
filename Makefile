.PHONY: build clean
IMG_NAME=iamthegeek/oauth2_proxy

build:
	docker build -t $(IMG_NAME) .

clean:
	docker rmi $(IMG_NAME)

test:
	./tests/run_test.sh
