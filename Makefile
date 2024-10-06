.PHONY: pure
pure:
	docker run --init --rm -it \
		--platform linux/amd64 \
		-v .:/home/user/pure \
		pure-macos \
		pure

.PHONY: docker
docker:
# open -a docker
	docker build -t pure-macos .