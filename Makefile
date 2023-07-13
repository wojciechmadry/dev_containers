USER_NAME?=unknown
help:
	@echo "--- Help ---"
	@echo "make arch USER_NAME:={USER_NAME} - build Arch linux image"
	@echo "------------"

arch:
	docker build --build-arg USER_NAME=${USER_NAME} -t dev_arch -f Dockerfile.arch .
